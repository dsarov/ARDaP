#!/bin/bash



## This script is designed to run over a SPANDx output and graph read coverage over the reference genome
# The advantage of this script over the standard bedcoverage output is that duplications can be observed as well as deletions.



usage()
{
echo -e  "\nUSAGE: Coverage_graph.sh -r <ReferenceGenome> -y [Max y axis height(optional)]\n"
echo -e "Note if you use -y and the specified cutoff is below the maximum coverage\n"
echo -e "sections of the genome with great than y coverage will be invisible\n"
echo -e "by default y will scale to maximum coverage of the genome being assessed"

}
help()
{
echo -e "\nThanks for using SPANDx!!\n"
usage
echo -e "This script is designed to run over a SPANDx output and graph read coverage over the reference genome\n"

}




if  [ $# -lt 1 ]
    then
	    usage
		exit 1
fi


source "$SCRIPTPATH"/ARDaP.config 
source "$SCRIPTPATH"/scheduler.config

OPTSTRING="hr:y:"

declare SWITCH
ref=$1


while getopts "$OPTSTRING" SWITCH; do 
		case $SWITCH in
		
		 r) ref="$OPTARG"
		    echo "Reference strain is $ref"
			;;
			
		 y) maxy="$OPTARG"
			echo "maxy (or graph height) is $maxy"
			;;
			
		\?) help
		    exit 1
		    ;;
		
		h) help
		   exit 1
		   ;;
		   
		*) echo "script error: un-handled argument"
           help
		   exit 1
		   ;;
		   
		
	esac
done



if [ ! $PBS_O_WORKDIR ]
    then
        PBS_O_WORKDIR="$PWD"
fi

cd $PBS_O_WORKDIR

echo -e "Script is running in $PBS_O_WORKDIR\n"

if [ ! -s ${ref}.fasta ]; then
  echo -e "Error: script could not find the specified ${ref}.fasta file\n"
  exit 1
fi

##need to create bed file from faidx file

## should include check for file presence

cat $ref.fasta.fai | sed 's/ /\t/g' | awk '{ print $1,1,$2 }' | sed 's/ /\t/g' > $ref.coverage.bed


sequences_tmp=(`find $PBS_O_WORKDIR/*_1_sequence.fastq.gz -printf "%f "`)
sequences=("${sequences_tmp[@]/_1_sequence.fastq.gz/}")
n=${#sequences[@]}
	
	
if [ ! -d "tmp" ]; then
	mkdir $seq_directory/tmp
fi	

if [ ! -d "${PBS_O_WORKDIR}/Outputs/Coverage_graphs" ]; then
    mkdir ${PBS_O_WORKDIR}/Outputs/Coverage_graphs
fi

#create scripts
cat > Coverage.pbs << 'EOF'
#!/bin/bash
#PBS -S /bin/sh
#$ -S /bin/bash
#$ -cwd

#source variables
source /home/dsarovich/bin/SPANDx_v2.7/SPANDx.config
source /home/dsarovich/bin/SPANDx_v2.7/GATK.config

LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/home/dsarovich/.linuxbrew/lib/


if [ ! $PBS_O_WORKDIR ]
    then
        PBS_O_WORKDIR="$seq_path"
fi

cd $PBS_O_WORKDIR



log_eval()
{
  cd $1
  echo -e "\nIn $1\n"
  echo "Running: $2"
  eval "$2"
  status=$?

  if [ ! $status == 0 ]; then
    echo "Previous command returned error: $status"
    exit 1
  fi
}

echo -e "checking file version"

log_eval $PBS_O_WORKDIR "$BEDTOOLS coverage -abam $PBS_O_WORKDIR/$seq/unique/$seq.realigned.bam -b $PBS_O_WORKDIR/${ref}.coverage.bed -d > $PBS_O_WORKDIR/$seq/unique/${seq}_coverage.txt"

echo -e "finished coverage histogram creation\n"

##determine value for maxy

  echo "setting maxy"
  maxy=`awk '{print $5 }' $PBS_O_WORKDIR/$seq/unique/${seq}_coverage.txt | sort -nr | head -n1`


echo -e "maxy value has been set to $maxy\n"

log_eval $PBS_O_WORKDIR "$PBS_O_WORKDIR/DrawCoverage.R --no-save --no-restore --args coveragefile=$PBS_O_WORKDIR/$seq/unique/${seq}_coverage.txt maxy=$maxy outputimage=$PBS_O_WORKDIR/Outputs/Coverage_graphs/$seq.pdf"


exit 0


EOF

cat > DrawCoverage.R << 'EOF'
#!/home/dsarovich2/.linuxbrew/bin/Rscript

##DrawCoverage.R requires args coveragefile, maxy and outputimage
getArgs <- function(verbose=FALSE, defaults=NULL) {
  myargs <- gsub("^--","",commandArgs(TRUE))
  setopts <- !grepl("=",myargs)
  if(any(setopts))
    myargs[setopts] <- paste(myargs[setopts],"=notset",sep="")
  myargs.list <- strsplit(myargs,"=")
  myargs <- lapply(myargs.list,"[[",2 )
  names(myargs) <- lapply(myargs.list, "[[", 1)

  ## logicals
  if(any(setopts))
    myargs[setopts] <- TRUE

  ## defaults
  if(!is.null(defaults)) {
    defs.needed <- setdiff(names(defaults), names(myargs))
    if(length(defs.needed)) {
      myargs[ defs.needed ] <- defaults[ defs.needed ]
    }
  }

  ## verbage
  if(verbose) {
    cat("read",length(myargs),"named args:\n")
    print(myargs)
  }
  myargs
}

args <- getArgs()
## Default setting when no arguments passed
coveragefile <- args$coveragefile
maxy <- args$maxy
outputimage <- args$outputimage



#print(coveragefile)
#print(maxy)
#print(outputimage)


require(ggplot2)
slidingwindowplot <- function(windowsize, inputseq) {
  starts <- seq(1, length(inputseq)-windowsize, by = windowsize)
  n <- length(starts)
  chunkbps <- numeric(n)
  chunkstats<- numeric(n)
  for (i in 1:n) {
    chunk <- inputseq[starts[i]:(starts[i]+windowsize-1)] 
    chunkmean <- mean(chunk)
    chunkstdv<-sd(chunk)
    chunkbps[i] <- chunkmean
    chunkstats[i]<-chunkstdv
   }
   return (list(starts,chunkbps,chunkstats))
}
binSize<-250

column.types <- c("character", "numeric", "numeric")

all.data <- read.csv(coveragefile, header=FALSE, sep="\t", colClasses=column.types)

myvector_all<-as.vector(as.matrix(all.data[5]))

windowAll<-slidingwindowplot(binSize,myvector_all)

df<-data.frame(windowAll[[1]],windowAll[[2]],windowAll[[3]])

colname<-c("x","mean","sd")

colnames(df)<-colname


eb <- aes(ymax = mean + sd, ymin = mean - sd) 



##summary(maxy)

numeric_maxy=as.numeric(maxy)

pdf(outputimage)



ggplot(data = df, aes(x = x, y = mean)) + geom_line(colour="#0066CC",size=0.25) + geom_ribbon(eb, alpha=.5, colour=NA,fill="#0066CC")+theme_bw()+xlab("Reference Start Position")+ylab("coverage")+scale_x_continuous(expand = c(0,0))+scale_y_continuous(limits = c(0, numeric_maxy))+ggtitle("Coverage Across Reference")

dev.off()



EOF

chmod +x ./DrawCoverage.R

#check for script creation
if [ ! -s Coverage.pbs ]; then
  echo -e "Couldn't find Coverage.pbs. Please check and re-run\n"
  exit 1
fi
if [ ! -s DrawCoverage.R ]; then
  echo -e "Couldn't find DrawCoverage.R. Please check and re-run\n"
  exit 1
fi


if [ $maxy ]; then
  for (( i=0; i<n; i++ )); do
    if [ ! -s ${PBS_O_WORKDIR}/Outputs/Coverage_graphs/${sequences[$i]}_cov.png ]; then
		echo -e "Submitting qsub job for coverage assessment for ${sequences[$i]}\n"
        var="seq=${sequences[$i]},ref=$ref,SCRIPTPATH=$SCRIPTPATH,maxy=$maxy"
		qsub_array_id=`qsub -N coverage_${sequences[$i]} -j $ERROR_OUTPUT -m $MAIL -M $ADDRESS -l ncpus=1,walltime=$WALL_T -v "$var" ./Coverage.pbs`
        echo -e "aln_${sequences[$i]}\t$qsub_array_id" >> qsub_array_ids.txt
	fi
  done
else
  for (( i=0; i<n; i++ )); do
    if [ ! -s ${PBS_O_WORKDIR}/Outputs/Coverage_graphs/${sequences[$i]}_cov.png ]; then
		echo -e "Submitting qsub job for coverage assessment for ${sequences[$i]}\n"
        var="seq=${sequences[$i]},ref=$ref,SCRIPTPATH=$SCRIPTPATH"
		qsub_array_id=`qsub -N coverage_${sequences[$i]} -j $ERROR_OUTPUT -m $MAIL -M $ADDRESS -l ncpus=1,walltime=$WALL_T -v "$var" ./Coverage.pbs`
        echo -e "aln_${sequences[$i]}\t$qsub_array_id" >> qsub_array_ids.txt
	fi
  done
fi  
