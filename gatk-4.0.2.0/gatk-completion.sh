
####################
# Tab completion file to allow for easy use of this tool with the command-line using Bash.
####################


####################################################################################################

# High-level caller/dispatch script information:

CALLER_SCRIPT_NAME="gatk"

# A description of these variables is below in the main completion function (_masterCompletionFunction)
CS_PREFIX_OPTIONS_ALL_LEGAL_ARGUMENTS=(--help --list --dry-run --java-options FixCallSetSampleOrdering ClippingRankSumTest CleanSam BedToIntervalList CreateSomaticPanelOfNormals GatherVcfsCloud FlagStat ParallelCopyGCSDirectoryIntoHDFSSpark CompareSAMs PairedReadFilter StrandBiasBySample SecondOfPairReadFilter DetermineGermlineContigPloidy MeanQualityByCycleSpark PileupSpark HaplotypeCaller GatherBamFiles EstimateLibraryComplexity LiftoverVcf MergeVcfs ASEReadCounter ValidAlignmentEndReadFilter FindBadGenomicKmersSpark SortVcf ReferenceBases ClusterCrosscheckMetrics AnnotateVcfWithBamDepth AS_BaseQualityRankSumTest CreateReadCountPanelOfNormals AS_InbreedingCoeff CollectInsertSizeMetricsSpark MappingQuality ReadLengthReadFilter CollectMultipleMetricsSpark MergeSamFiles CountFalsePositives PrintVariantsSpark MarkDuplicatesSpark AccumulateVariantCallingMetrics FilterVcf FisherStrand ChromosomeCounts QualityScoreDistributionSpark GatherVcfs MatchingBasesAndQualsReadFilter PathSeqBwaSpark RenameSampleInVcf CountVariants DownsampleSam CollectHiSeqXPfFailMetrics RMSMappingQuality MappingQualityReadFilter MappingQualityZero IntervalListToBed CollectJumpingLibraryMetrics ExtractSequences ReadLengthEqualsCigarLengthReadFilter FirstOfPairReadFilter ReplaceSamHeader Mutect2 CollectQualityYieldMetricsSpark Concordance AS_FisherStrand ScatterIntervalsByNs AS_ReadPosRankSumTest MergeBamAlignment SamToFastq AddCommentsToBam CreateSequenceDictionary WellformedReadFilter CollectIlluminaBasecallingMetrics ReadStrandFilter SampleReadFilter MateDifferentStrandReadFilter ApplyBQSR AnnotatePairOrientation FilterLongReadAlignmentsSAMSpark RevertBaseQualityScores ViewSam CollectFragmentCounts IlluminaBasecallsToSam CombineSegmentBreakpoints DiscoverVariantsFromContigAlignmentsSAMSpark AS_MappingQualityRankSumTest NonNFastaSize LikelihoodRankSumTest MappedReadFilter SplitNCigarReads SvDiscoverFromLocalAssemblyContigAlignmentsSpark QualByDepth MappingQualityRankSumTest BaitDesigner CollectIndependentReplicateMetrics ReadPosRankSumTest ReadsPipelineSpark AnnotateVcfWithExpectedAlleleFraction ExcessHet ReadGroupReadFilter TandemRepeat ModelSegments CallCopyRatioSegments SetNmMdAndUqTags CountReadsSpark CollectQualityYieldMetrics AllowAllReadsReadFilter AnnotateIntervals CollectInsertSizeMetrics LibraryReadFilter FifoBuffer UpdateVcfSequenceDictionary IntervalListTools PossibleDeNovo CollectWgsMetricsWithNonZeroCoverage GermlineCNVCaller AS_StrandOddsRatio CollectVariantCallingMetrics CountBasesSpark ConvertHeaderlessHadoopBamShardToBam FastqToSam MarkIlluminaAdapters CollectIlluminaLaneMetrics GenotypeGVCFs HaplotypeCallerSpark SimpleMarkDuplicatesWithMateCigar UnmarkDuplicates CountVariantsSpark DepthPerSampleHC MappingQualityNotZeroReadFilter FindMendelianViolations SamFormatConverter SplitSamByLibrary CompareMetrics CollectSequencingArtifactMetrics MarkDuplicates SampleList CollectMultipleMetrics ExtractSVEvidenceSpark NotDuplicateReadFilter IlluminaBasecallsToFastq ReadPosition IndexFeatureFile AS_QualByDepth FixVcfHeader StrandArtifact Coverage ReadNameReadFilter PathSeqFilterSpark BwaSpark FilterSamReads EstimateLibraryComplexityGATK PositionBasedDownsampleSam SeqIsStoredReadFilter CollectAlignmentSummaryMetrics CollectWgsMetrics BamToBfq CheckIlluminaDirectory NotSecondaryAlignmentReadFilter CigarContainsNoNOperator CheckFingerprint AddOrReplaceReadGroups VcfToIntervalList CalculateMixingFractions Pileup SplitReads ApplyVQSR PlotDenoisedCopyRatios ReorderSam MarkDuplicatesGATK PathSeqScoreSpark ProperlyPairedReadFilter ConvertSequencingArtifactToOxoG FixMateInformation DenoiseReadCounts GenomicsDBImport CheckPileup UmiAwareMarkDuplicatesWithMateCigar ClipReads ReadGroupBlackListReadFilter GetPileupSummaries BuildBamIndex AlignmentAgreesWithHeaderReadFilter NotSupplementaryAlignmentReadFilter ExtractOriginalAlignmentRecordsByNameSpark AS_RMSMappingQuality BQSRPipelineSpark UpdateVCFSequenceDictionary BaseRecalibratorSpark CollectRawWgsMetrics DepthPerAlleleBySample SelectVariants AnalyzeCovariates PathSeqBuildReferenceTaxonomy PrintReads CalculateReadGroupChecksum CollectRnaSeqMetrics GetSampleName CompareBaseQualities BamIndexStats CollectOxoGMetrics MarkDuplicatesWithMateCigar BaseRecalibratorSparkSharded GatherBQSRReports GenotypeConcordance CompareDuplicatesSpark BaseQualityRankSumTest MateOnSameContigOrNoMappedMateReadFilter BaseRecalibrator PlatformUnitReadFilter SortSamSpark SetNmAndUqTags OxoGReadCounts VariantRecalibrator ValidateBasicSomaticShortMutations OverclippedReadFilter FragmentLength CountBases PlatformReadFilter LiftOverIntervalList PassesVendorQualityCheckReadFilter PrimaryLineReadFilter CollectBaseDistributionByCycle PrintReadsSpark PathSeqBuildKmers VariantFiltration InbreedingCoeff MetricsReadFilter RevertSam CountReads UniqueAltReadCount MeanQualityByCycle VcfFormatConverter FilterByOrientationBias VariantsToTable CollectRrbsMetrics CheckTerminatorBlock GatherTranches QualityScoreDistribution FlagStatSpark NormalizeFasta ValidAlignmentStartReadFilter HasReadGroupReadFilter MakeSitesOnlyVcf BaseQuality SplitSamByNumberOfReads ExtractIlluminaBarcodes FindBreakpointEvidenceSpark CalculateContamination CombineGVCFs FixMisencodedBaseQualityReads RevertOriginalBaseQualitiesAndAddMateCigar BwaAndMarkDuplicatesPipelineSpark Funcotator MappingQualityAvailableReadFilter PathSeqPipelineSpark CollectHsMetrics ValidateVariants FilterMutectCalls CrosscheckFingerprints SplitIntervals FragmentLengthReadFilter AmbiguousBaseReadFilter ApplyBQSRSpark CalcMetadataSpark SortSam StructuralVariationDiscoveryPipelineSpark NonZeroReferenceLengthAlignmentReadFilter ValidateSamFile CollectGcBiasMetrics SplitVcfs LeftAlignIndels CreateHadoopBamSplittingIndex CrosscheckReadGroupFingerprints CollectBaseDistributionByCycleSpark CalculateGenotypePosteriors NonZeroFragmentLengthReadFilter GenotypeSummaries CollectTargetedPcrMetrics CollectAllelicCounts StrandOddsRatio BwaMemIndexImageCreator PlotModeledSegments RemoveNearbyIndels PreprocessIntervals GoodCigarReadFilter )
CS_PREFIX_OPTIONS_NORMAL_COMPLETION_ARGUMENTS=(--help --list --dry-run --java-options FixCallSetSampleOrdering ClippingRankSumTest CleanSam BedToIntervalList CreateSomaticPanelOfNormals GatherVcfsCloud FlagStat ParallelCopyGCSDirectoryIntoHDFSSpark CompareSAMs PairedReadFilter StrandBiasBySample SecondOfPairReadFilter DetermineGermlineContigPloidy MeanQualityByCycleSpark PileupSpark HaplotypeCaller GatherBamFiles EstimateLibraryComplexity LiftoverVcf MergeVcfs ASEReadCounter ValidAlignmentEndReadFilter FindBadGenomicKmersSpark SortVcf ReferenceBases ClusterCrosscheckMetrics AnnotateVcfWithBamDepth AS_BaseQualityRankSumTest CreateReadCountPanelOfNormals AS_InbreedingCoeff CollectInsertSizeMetricsSpark MappingQuality ReadLengthReadFilter CollectMultipleMetricsSpark MergeSamFiles CountFalsePositives PrintVariantsSpark MarkDuplicatesSpark AccumulateVariantCallingMetrics FilterVcf FisherStrand ChromosomeCounts QualityScoreDistributionSpark GatherVcfs MatchingBasesAndQualsReadFilter PathSeqBwaSpark RenameSampleInVcf CountVariants DownsampleSam CollectHiSeqXPfFailMetrics RMSMappingQuality MappingQualityReadFilter MappingQualityZero IntervalListToBed CollectJumpingLibraryMetrics ExtractSequences ReadLengthEqualsCigarLengthReadFilter FirstOfPairReadFilter ReplaceSamHeader Mutect2 CollectQualityYieldMetricsSpark Concordance AS_FisherStrand ScatterIntervalsByNs AS_ReadPosRankSumTest MergeBamAlignment SamToFastq AddCommentsToBam CreateSequenceDictionary WellformedReadFilter CollectIlluminaBasecallingMetrics ReadStrandFilter SampleReadFilter MateDifferentStrandReadFilter ApplyBQSR AnnotatePairOrientation FilterLongReadAlignmentsSAMSpark RevertBaseQualityScores ViewSam CollectFragmentCounts IlluminaBasecallsToSam CombineSegmentBreakpoints DiscoverVariantsFromContigAlignmentsSAMSpark AS_MappingQualityRankSumTest NonNFastaSize LikelihoodRankSumTest MappedReadFilter SplitNCigarReads SvDiscoverFromLocalAssemblyContigAlignmentsSpark QualByDepth MappingQualityRankSumTest BaitDesigner CollectIndependentReplicateMetrics ReadPosRankSumTest ReadsPipelineSpark AnnotateVcfWithExpectedAlleleFraction ExcessHet ReadGroupReadFilter TandemRepeat ModelSegments CallCopyRatioSegments SetNmMdAndUqTags CountReadsSpark CollectQualityYieldMetrics AllowAllReadsReadFilter AnnotateIntervals CollectInsertSizeMetrics LibraryReadFilter FifoBuffer UpdateVcfSequenceDictionary IntervalListTools PossibleDeNovo CollectWgsMetricsWithNonZeroCoverage GermlineCNVCaller AS_StrandOddsRatio CollectVariantCallingMetrics CountBasesSpark ConvertHeaderlessHadoopBamShardToBam FastqToSam MarkIlluminaAdapters CollectIlluminaLaneMetrics GenotypeGVCFs HaplotypeCallerSpark SimpleMarkDuplicatesWithMateCigar UnmarkDuplicates CountVariantsSpark DepthPerSampleHC MappingQualityNotZeroReadFilter FindMendelianViolations SamFormatConverter SplitSamByLibrary CompareMetrics CollectSequencingArtifactMetrics MarkDuplicates SampleList CollectMultipleMetrics ExtractSVEvidenceSpark NotDuplicateReadFilter IlluminaBasecallsToFastq ReadPosition IndexFeatureFile AS_QualByDepth FixVcfHeader StrandArtifact Coverage ReadNameReadFilter PathSeqFilterSpark BwaSpark FilterSamReads EstimateLibraryComplexityGATK PositionBasedDownsampleSam SeqIsStoredReadFilter CollectAlignmentSummaryMetrics CollectWgsMetrics BamToBfq CheckIlluminaDirectory NotSecondaryAlignmentReadFilter CigarContainsNoNOperator CheckFingerprint AddOrReplaceReadGroups VcfToIntervalList CalculateMixingFractions Pileup SplitReads ApplyVQSR PlotDenoisedCopyRatios ReorderSam MarkDuplicatesGATK PathSeqScoreSpark ProperlyPairedReadFilter ConvertSequencingArtifactToOxoG FixMateInformation DenoiseReadCounts GenomicsDBImport CheckPileup UmiAwareMarkDuplicatesWithMateCigar ClipReads ReadGroupBlackListReadFilter GetPileupSummaries BuildBamIndex AlignmentAgreesWithHeaderReadFilter NotSupplementaryAlignmentReadFilter ExtractOriginalAlignmentRecordsByNameSpark AS_RMSMappingQuality BQSRPipelineSpark UpdateVCFSequenceDictionary BaseRecalibratorSpark CollectRawWgsMetrics DepthPerAlleleBySample SelectVariants AnalyzeCovariates PathSeqBuildReferenceTaxonomy PrintReads CalculateReadGroupChecksum CollectRnaSeqMetrics GetSampleName CompareBaseQualities BamIndexStats CollectOxoGMetrics MarkDuplicatesWithMateCigar BaseRecalibratorSparkSharded GatherBQSRReports GenotypeConcordance CompareDuplicatesSpark BaseQualityRankSumTest MateOnSameContigOrNoMappedMateReadFilter BaseRecalibrator PlatformUnitReadFilter SortSamSpark SetNmAndUqTags OxoGReadCounts VariantRecalibrator ValidateBasicSomaticShortMutations OverclippedReadFilter FragmentLength CountBases PlatformReadFilter LiftOverIntervalList PassesVendorQualityCheckReadFilter PrimaryLineReadFilter CollectBaseDistributionByCycle PrintReadsSpark PathSeqBuildKmers VariantFiltration InbreedingCoeff MetricsReadFilter RevertSam CountReads UniqueAltReadCount MeanQualityByCycle VcfFormatConverter FilterByOrientationBias VariantsToTable CollectRrbsMetrics CheckTerminatorBlock GatherTranches QualityScoreDistribution FlagStatSpark NormalizeFasta ValidAlignmentStartReadFilter HasReadGroupReadFilter MakeSitesOnlyVcf BaseQuality SplitSamByNumberOfReads ExtractIlluminaBarcodes FindBreakpointEvidenceSpark CalculateContamination CombineGVCFs FixMisencodedBaseQualityReads RevertOriginalBaseQualitiesAndAddMateCigar BwaAndMarkDuplicatesPipelineSpark Funcotator MappingQualityAvailableReadFilter PathSeqPipelineSpark CollectHsMetrics ValidateVariants FilterMutectCalls CrosscheckFingerprints SplitIntervals FragmentLengthReadFilter AmbiguousBaseReadFilter ApplyBQSRSpark CalcMetadataSpark SortSam StructuralVariationDiscoveryPipelineSpark NonZeroReferenceLengthAlignmentReadFilter ValidateSamFile CollectGcBiasMetrics SplitVcfs LeftAlignIndels CreateHadoopBamSplittingIndex CrosscheckReadGroupFingerprints CollectBaseDistributionByCycleSpark CalculateGenotypePosteriors NonZeroFragmentLengthReadFilter GenotypeSummaries CollectTargetedPcrMetrics CollectAllelicCounts StrandOddsRatio BwaMemIndexImageCreator PlotModeledSegments RemoveNearbyIndels PreprocessIntervals GoodCigarReadFilter )
CS_PREFIX_OPTIONS_ALL_ARGUMENT_VALUE_TYPES=("null" "null" "null" "String" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" "null" )
CS_PREFIX_OPTIONS_MUTUALLY_EXCLUSIVE_ARGS=("--help;list,dry-run,java-options" "--list;help,dry-run,java-options")
CS_PREFIX_OPTIONS_SYNONYMOUS_ARGS=("--help;-h")
CS_PREFIX_OPTIONS_MIN_OCCURRENCES=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 )
CS_PREFIX_OPTIONS_MAX_OCCURRENCES=(1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 )

CS_POSTFIX_OPTIONS_ALL_LEGAL_ARGUMENTS=(--spark-runner --spark-master --cluster --dry-run --java-options --conf --driver-memory --driver-cores --executor-memory --executor-cores --num-executors)
CS_POSTFIX_OPTIONS_NORMAL_COMPLETION_ARGUMENTS=(--spark-runner --spark-master --cluster --dry-run --java-options --conf --driver-memory --driver-cores --executor-memory --executor-cores --num-executors)
CS_POSTFIX_OPTIONS_ALL_ARGUMENT_VALUE_TYPES=("String" "String" "String" "null" "String" "file" "int" "int" "int" "int" "int")
CS_POSTFIX_OPTIONS_MUTUALLY_EXCLUSIVE_ARGS=("")
CS_POSTFIX_OPTIONS_SYNONYMOUS_ARGS=("")
CS_POSTFIX_OPTIONS_MIN_OCCURRENCES=(0 0 0 0 0 0 0 0 0 0)
CS_POSTFIX_OPTIONS_MAX_OCCURRENCES=(1 1 1 1 1 1 1 1 1 1)

# Whether we have to worry about these extra script options at all.
HAS_POSTFIX_OPTIONS="true"

# All the tool names we are able to complete:
ALL_TOOLS=(FixCallSetSampleOrdering ClippingRankSumTest CleanSam BedToIntervalList CreateSomaticPanelOfNormals GatherVcfsCloud FlagStat ParallelCopyGCSDirectoryIntoHDFSSpark CompareSAMs PairedReadFilter StrandBiasBySample SecondOfPairReadFilter DetermineGermlineContigPloidy MeanQualityByCycleSpark PileupSpark HaplotypeCaller GatherBamFiles EstimateLibraryComplexity LiftoverVcf MergeVcfs ASEReadCounter ValidAlignmentEndReadFilter FindBadGenomicKmersSpark SortVcf ReferenceBases ClusterCrosscheckMetrics AnnotateVcfWithBamDepth AS_BaseQualityRankSumTest CreateReadCountPanelOfNormals AS_InbreedingCoeff CollectInsertSizeMetricsSpark MappingQuality ReadLengthReadFilter CollectMultipleMetricsSpark MergeSamFiles CountFalsePositives PrintVariantsSpark MarkDuplicatesSpark AccumulateVariantCallingMetrics FilterVcf FisherStrand ChromosomeCounts QualityScoreDistributionSpark GatherVcfs MatchingBasesAndQualsReadFilter PathSeqBwaSpark RenameSampleInVcf CountVariants DownsampleSam CollectHiSeqXPfFailMetrics RMSMappingQuality MappingQualityReadFilter MappingQualityZero IntervalListToBed CollectJumpingLibraryMetrics ExtractSequences ReadLengthEqualsCigarLengthReadFilter FirstOfPairReadFilter ReplaceSamHeader Mutect2 CollectQualityYieldMetricsSpark Concordance AS_FisherStrand ScatterIntervalsByNs AS_ReadPosRankSumTest MergeBamAlignment SamToFastq AddCommentsToBam CreateSequenceDictionary WellformedReadFilter CollectIlluminaBasecallingMetrics ReadStrandFilter SampleReadFilter MateDifferentStrandReadFilter ApplyBQSR AnnotatePairOrientation FilterLongReadAlignmentsSAMSpark RevertBaseQualityScores ViewSam CollectFragmentCounts IlluminaBasecallsToSam CombineSegmentBreakpoints DiscoverVariantsFromContigAlignmentsSAMSpark AS_MappingQualityRankSumTest NonNFastaSize LikelihoodRankSumTest MappedReadFilter SplitNCigarReads SvDiscoverFromLocalAssemblyContigAlignmentsSpark QualByDepth MappingQualityRankSumTest BaitDesigner CollectIndependentReplicateMetrics ReadPosRankSumTest ReadsPipelineSpark AnnotateVcfWithExpectedAlleleFraction ExcessHet ReadGroupReadFilter TandemRepeat ModelSegments CallCopyRatioSegments SetNmMdAndUqTags CountReadsSpark CollectQualityYieldMetrics AllowAllReadsReadFilter AnnotateIntervals CollectInsertSizeMetrics LibraryReadFilter FifoBuffer UpdateVcfSequenceDictionary IntervalListTools PossibleDeNovo CollectWgsMetricsWithNonZeroCoverage GermlineCNVCaller AS_StrandOddsRatio CollectVariantCallingMetrics CountBasesSpark ConvertHeaderlessHadoopBamShardToBam FastqToSam MarkIlluminaAdapters CollectIlluminaLaneMetrics GenotypeGVCFs HaplotypeCallerSpark SimpleMarkDuplicatesWithMateCigar UnmarkDuplicates CountVariantsSpark DepthPerSampleHC MappingQualityNotZeroReadFilter FindMendelianViolations SamFormatConverter SplitSamByLibrary CompareMetrics CollectSequencingArtifactMetrics MarkDuplicates SampleList CollectMultipleMetrics ExtractSVEvidenceSpark NotDuplicateReadFilter IlluminaBasecallsToFastq ReadPosition IndexFeatureFile AS_QualByDepth FixVcfHeader StrandArtifact Coverage ReadNameReadFilter PathSeqFilterSpark BwaSpark FilterSamReads EstimateLibraryComplexityGATK PositionBasedDownsampleSam SeqIsStoredReadFilter CollectAlignmentSummaryMetrics CollectWgsMetrics BamToBfq CheckIlluminaDirectory NotSecondaryAlignmentReadFilter CigarContainsNoNOperator CheckFingerprint AddOrReplaceReadGroups VcfToIntervalList CalculateMixingFractions Pileup SplitReads ApplyVQSR PlotDenoisedCopyRatios ReorderSam MarkDuplicatesGATK PathSeqScoreSpark ProperlyPairedReadFilter ConvertSequencingArtifactToOxoG FixMateInformation DenoiseReadCounts GenomicsDBImport CheckPileup UmiAwareMarkDuplicatesWithMateCigar ClipReads ReadGroupBlackListReadFilter GetPileupSummaries BuildBamIndex AlignmentAgreesWithHeaderReadFilter NotSupplementaryAlignmentReadFilter ExtractOriginalAlignmentRecordsByNameSpark AS_RMSMappingQuality BQSRPipelineSpark UpdateVCFSequenceDictionary BaseRecalibratorSpark CollectRawWgsMetrics DepthPerAlleleBySample SelectVariants AnalyzeCovariates PathSeqBuildReferenceTaxonomy PrintReads CalculateReadGroupChecksum CollectRnaSeqMetrics GetSampleName CompareBaseQualities BamIndexStats CollectOxoGMetrics MarkDuplicatesWithMateCigar BaseRecalibratorSparkSharded GatherBQSRReports GenotypeConcordance CompareDuplicatesSpark BaseQualityRankSumTest MateOnSameContigOrNoMappedMateReadFilter BaseRecalibrator PlatformUnitReadFilter SortSamSpark SetNmAndUqTags OxoGReadCounts VariantRecalibrator ValidateBasicSomaticShortMutations OverclippedReadFilter FragmentLength CountBases PlatformReadFilter LiftOverIntervalList PassesVendorQualityCheckReadFilter PrimaryLineReadFilter CollectBaseDistributionByCycle PrintReadsSpark PathSeqBuildKmers VariantFiltration InbreedingCoeff MetricsReadFilter RevertSam CountReads UniqueAltReadCount MeanQualityByCycle VcfFormatConverter FilterByOrientationBias VariantsToTable CollectRrbsMetrics CheckTerminatorBlock GatherTranches QualityScoreDistribution FlagStatSpark NormalizeFasta ValidAlignmentStartReadFilter HasReadGroupReadFilter MakeSitesOnlyVcf BaseQuality SplitSamByNumberOfReads ExtractIlluminaBarcodes FindBreakpointEvidenceSpark CalculateContamination CombineGVCFs FixMisencodedBaseQualityReads RevertOriginalBaseQualitiesAndAddMateCigar BwaAndMarkDuplicatesPipelineSpark Funcotator MappingQualityAvailableReadFilter PathSeqPipelineSpark CollectHsMetrics ValidateVariants FilterMutectCalls CrosscheckFingerprints SplitIntervals FragmentLengthReadFilter AmbiguousBaseReadFilter ApplyBQSRSpark CalcMetadataSpark SortSam StructuralVariationDiscoveryPipelineSpark NonZeroReferenceLengthAlignmentReadFilter ValidateSamFile CollectGcBiasMetrics SplitVcfs LeftAlignIndels CreateHadoopBamSplittingIndex CrosscheckReadGroupFingerprints CollectBaseDistributionByCycleSpark CalculateGenotypePosteriors NonZeroFragmentLengthReadFilter GenotypeSummaries CollectTargetedPcrMetrics CollectAllelicCounts StrandOddsRatio BwaMemIndexImageCreator PlotModeledSegments RemoveNearbyIndels PreprocessIntervals GoodCigarReadFilter )

####################################################################################################

# Get the name of the tool that we're currently trying to call
_gatk_getToolName()
{
    # Naively go through each word in the line until we find one that is in our list of tools:
    for word in ${COMP_WORDS[@]} ; do
        if ( echo " ${ALL_TOOLS[@]} " | grep -q " ${word} " ) ; then
            echo "${word}"
            break
        fi
    done
}

# Get the index of the toolname inside COMP_WORDS
_gatk_getToolNameIndex()
{
    # Naively go through each word in the line until we find one that is in our list of tools:
    local ctr=0
    for word in ${COMP_WORDS[@]} ; do
        if ( echo " ${ALL_TOOLS[@]} " | grep -q " ${word} " ) ; then
            echo $ctr
            break
        fi
        let ctr=$ctr+1
    done
}

# Get all possible tool names for the current command line if the current command is a
# complete command on its own already.
# If there is no complete command yet, then this prints nothing.
_gatk_getAllPossibleToolNames()
{
# We want to return a list of possible tool names if and only if
# the current word is a valid complete tool name
# AND
# the current word is also a substring in more than one tool name

    local tool count matches toolList

    let count=0
    matches=false
    toolList=()

    # Go through tool names and get what matches and partial matches we have:
    for tool in ${ALL_TOOLS[@]} ; do
        if [[ "${COMP_WORDS[COMP_CWORD]}" == "${tool}" ]] ; then
            matches=true
            let count=$count+1
            toolList+=($tool)
        elif [[ "${tool}" == "${COMP_WORDS[COMP_CWORD]}"* ]] ; then
            toolList+=($tool)
        fi
    done

    # If we have a complete match, then we print out our partial matches as a space separated string.
    # That way we have a list of all possible full completions for this match.
    # For instance, if there was a tool named "read" and another named "readBetter" this would get both.
    if $matches ; then
        echo "${toolList[@]}"
    fi
}

# Gets how many dependent arguments we have left to fill
_gatk_getDependentArgumentCount()
{
    local depArgCount=0

    for word in ${COMP_LINE} ; do
        for depArg in ${DEPENDENT_ARGUMENTS[@]} ; do
            if [[ "${word}" == "${depArg}" ]] ; then
                $((depArgCount++))
            fi
        done
    done

    echo $depArgCount
}

# Resolves the given argument name to its long (normal) name
_gatk_resolveVarName()
{
    local argName=$1
    if [[ "${SYNONYMOUS_ARGS[@]}" == *"${argName}"* ]] ; then
        echo "${SYNONYMOUS_ARGS[@]}" | sed -e "s#.* \\([a-zA-Z0-9;,_\\-]*${argName}[a-zA-Z0-9,;_\\-]*\\).*#\\1#g" -e 's#;.*##g'
    else
        echo "${argName}"
    fi
}

# Checks if we need to complete the VALUE for an argument.
# Prints the index in the given argument list of the corresponding argument whose value we must complete.
# Takes as input 1 positional argument: the name of the last argument given to this script
# Otherwise prints -1
_gatk_needToCompleteArgValue()
{
    if [[ "${prev}" != "--" ]] ; then
        local resolved=$( _gatk_resolveVarName ${prev} )

        for (( i=0 ; i < ${#ALL_LEGAL_ARGUMENTS[@]} ; i++ )) ; do
            if [[ "${resolved}" == "${ALL_LEGAL_ARGUMENTS[i]}" ]] ; then

                # Make sure the argument isn't one that takes no additional value
                # such as a flag.
                if [[ "${ALL_ARGUMENT_VALUE_TYPES[i]}" != "null" ]] ; then
                    echo "$i"
                else
                    echo "-1"
                fi
                return 0
            fi
        done
    fi

    echo "-1"
}

# Get the completion word list for the given argument type.
# Prints the completion string to the screen
_gatk_getCompletionWordList()
{
    # Normalize the type string so it's easier to deal with:
    local argType=$( echo $1 | tr '[A-Z]' '[a-z]')

    local isNumeric=false
    local isFloating=false

    local completionType=""

    [[ "${argType}" == *"file"* ]]      && completionType='-A file'
    [[ "${argType}" == *"folder"* ]]    && completionType='-A directory'
    [[ "${argType}" == *"directory"* ]] && completionType='-A directory'
    [[ "${argType}" == *"boolean"* ]]   && completionType='-W true false'

    [[ "${argType}" == "int" ]]         && completionType='-W 0 1 2 3 4 5 6 7 8 9'   && isNumeric=true
    [[ "${argType}" == *"[int]"* ]]     && completionType='-W 0 1 2 3 4 5 6 7 8 9'   && isNumeric=true
    [[ "${argType}" == "long" ]]        && completionType='-W 0 1 2 3 4 5 6 7 8 9'   && isNumeric=true
    [[ "${argType}" == *"[long]"* ]]    && completionType='-W 0 1 2 3 4 5 6 7 8 9'   && isNumeric=true

    [[ "${argType}" == "double" ]]      && completionType='-W . 0 1 2 3 4 5 6 7 8 9' && isNumeric=true && isFloating=true
    [[ "${argType}" == *"[double]"* ]]  && completionType='-W . 0 1 2 3 4 5 6 7 8 9' && isNumeric=true && isFloating=true
    [[ "${argType}" == "float" ]]       && completionType='-W . 0 1 2 3 4 5 6 7 8 9' && isNumeric=true && isFloating=true
    [[ "${argType}" == *"[float]"* ]]   && completionType='-W . 0 1 2 3 4 5 6 7 8 9' && isNumeric=true && isFloating=true

    # If we have a number, we need to prepend the current completion to it so that we can continue to tab complete:
    if $isNumeric ; then
        completionType=$( echo ${completionType} | sed -e "s#\([0-9]\)#$cur\1#g" )

        # If we're floating point, we need to make sure we don't complete a `.` character
        # if one already exists in our number:
        if $isFloating ; then
            echo "$cur" | grep -o '\.' &> /dev/null
            local r=$?

            [[ $r -eq 0 ]] && completionType=$( echo ${completionType} | awk '{$2="" ; print}' )
        fi
    fi

    echo "${completionType}"
}

# Function to handle the completion tasks once we have populated our arg variables
# When passed an argument handles the case for the caller script.
_gatk_handleArgs()
{
    # Argument offset index is used in the special case where we are past the " -- " delimiter.
    local argOffsetIndex=0

    # We handle the beginning differently if this function was called with an argument
    if [[ $# -eq 0 ]] ; then
        # Get the number of arguments we have input so far:
        local toolNameIndex=$(_gatk_getToolNameIndex)
        local numArgs=$((COMP_CWORD-toolNameIndex-1))

        # Now we check to see what kind of argument we are on right now
        # We handle each type separately by order of precedence:
        if [[ ${numArgs} -lt ${NUM_POSITIONAL_ARGUMENTS} ]] ; then
            # We must complete a positional argument.
            # Assume that positional arguments are all FILES:
            COMPREPLY=( $(compgen -A file -- $cur) )
            return 0
        fi

        # Dependent arguments must come right after positional arguments
        # We must check to see how many dependent arguments we've gotten so far:
        local numDepArgs=$( _gatk_getDependentArgumentCount )

        if [[ $numDepArgs -lt ${#DEPENDENT_ARGUMENTS[@]} ]] ; then
            # We must complete a dependent argument next.
            COMPREPLY=( $(compgen -W '${DEPENDENT_ARGUMENTS[@]}' -- $cur) )
            return 0
        fi
    elif [[ "${1}" == "POSTFIX_OPTIONS" ]] ; then
        # Get the index of the special delimiter.
        # we ignore everything up to and including it.
        for (( i=0; i < COMP_CWORD ; i++ )) ; do
            if [[ "${COMP_WORDS[i]}" == "--" ]] ; then
                let argOffsetIndex=$i+1
            fi
        done
    fi
    # NOTE: We don't need to worry about the prefix options case.
    #       The caller will specify it and it skips the two special cases above.

    # First we must resolve all arguments to their full names
    # This is necessary to save time later because of short argument names / synonyms
    local resolvedArgList=()
    for (( i=argOffsetIndex ; i < COMP_CWORD ; i++ )) ; do
        prevArg=${COMP_WORDS[i]}

        # Skip the current word to be completed:
        [[ "${prevArg}" == "${cur}" ]] && continue

        # Check if this has synonyms:
        if [[ "${SYNONYMOUS_ARGS[@]}" == *"${prevArg}"* ]] ; then

            local resolvedArg=$( _gatk_resolveVarName "${prevArg}" )
            resolvedArgList+=($resolvedArg)

        # Make sure this is an argument:
        elif [[ "${ALL_LEGAL_ARGUMENTS[@]}" == *"${prevArg}"* ]] ; then
            resolvedArgList+=($prevArg)
        fi
    done

    # Check to see if the last thing we typed was a complete argument.
    # If so, we must complete the VALUE for the argument, not the
    # argument itself:
    # Note: This is shorthand for last element in the array:
    local argToComplete=$( _gatk_needToCompleteArgValue )

    if [[ $argToComplete -ne -1 ]] ; then
        # We must complete the VALUE for an argument.

        # Get the argument type.
        local valueType=${ALL_ARGUMENT_VALUE_TYPES[argToComplete]}

        # Get the correct completion string for the type:
        local completionString=$( _gatk_getCompletionWordList "${valueType}" )

        if [[ ${#completionString} -eq 0 ]] ; then
            # We don't have any information on the type to complete.
            # We use the default SHELL behavior:
            COMPREPLY=()
        else
            # We have a completion option.  Let's plug it in:
            local compOperator=$( echo "${completionString}" | awk '{print $1}' )
            local compOptions=$( echo "${completionString}" | awk '{$1="" ; print}' )

            case ${compOperator} in
                -A) COMPREPLY=( $(compgen -A ${compOptions} -- $cur) ) ;;
                -W) COMPREPLY=( $(compgen -W '${compOptions}' -- $cur) ) ;;
                 *) COMPREPLY=() ;;
            esac

        fi
        return 0
    fi

    # We must create a list of the valid remaining arguments:

    # Create a list of all arguments that are
    # mutually exclusive with arguments we have already specified
    local mutex_list=""
    for prevArg in ${resolvedArgList[@]} ; do
        if [[ "${MUTUALLY_EXCLUSIVE_ARGS[@]}" == *"${prevArg};"* ]] ; then
            local mutexArgs=$( echo "${MUTUALLY_EXCLUSIVE_ARGS[@]}" | sed -e "s#.*${prevArg};\([a-zA-Z0-9_,\-]*\) .*#\1#g" -e "s#,# --#g" -e "s#^#--#g" )
            mutex_list="${mutex_list}${mutexArgs}"
        fi
    done

    local remaining_legal_arguments=()
    for (( i=0; i < ${#NORMAL_COMPLETION_ARGUMENTS[@]} ; i++ )) ; do
        local legalArg=${NORMAL_COMPLETION_ARGUMENTS[i]}
        local okToAdd=true

        # Get the number of times this has occurred in the arguments already:
        local numPrevOccurred=$( grep -o -- "${legalArg}" <<< "${resolvedArgList[@]}" | wc -l | awk '{print $1}' )

        if [[ $numPrevOccurred -lt "${MAX_OCCURRENCES[i]}" ]] ; then

            # Make sure this arg isn't mutually exclusive to another argument that we've already had:
            if [[ "${mutex_list}" ==    "${legalArg} "* ]] ||
               [[ "${mutex_list}" ==  *" ${legalArg} "* ]] ||
               [[ "${mutex_list}" ==  *" ${legalArg}"  ]] ; then
                okToAdd=false
            fi

            # Check if we're still good to add in the argument:
            if $okToAdd ; then
                # Add in the argument:
                remaining_legal_arguments+=($legalArg)

                # Add in the synonyms of the argument:
                if [[ "${SYNONYMOUS_ARGS[@]}" == *"${legalArg}"* ]] ; then
                    local synonymString=$( echo "${SYNONYMOUS_ARGS[@]}" | sed -e "s#.*${legalArg};\([a-zA-Z0-9_,\-]*\).*#\1#g" -e "s#,# #g"  )
                    remaining_legal_arguments+=($synonymString)
                fi
            fi
        fi

    done

    # Add in the special option "--" which separates tool options from meta-options if they're necessary:
    if $HAS_POSTFIX_OPTIONS ; then
        if [[ $# -eq 0 ]] || [[ "${1}" == "PREFIX_OPTIONS"  ]] ; then
            remaining_legal_arguments+=("--")
        fi
    fi

    COMPREPLY=( $(compgen -W '${remaining_legal_arguments[@]}' -- $cur) )
    return 0
}

####################################################################################################

_gatk_masterCompletionFunction()
{
    # Set up global variables for the functions that do completion:
    prev=${COMP_WORDS[COMP_CWORD-1]}
    cur=${COMP_WORDS[COMP_CWORD]}

    # How many positional arguments a tool will have.
    # These positional arguments must come directly after a tool name.
    NUM_POSITIONAL_ARGUMENTS=0

    # The types of the positional arguments, in the order in which they must be specified
    # on the command-line.
    POSITIONAL_ARGUMENT_TYPE=()

    # The set of legal arguments that aren't dependent arguments.
    # (A dependent argument is an argument that must occur immediately after
    # all positional arguments.)
    NORMAL_COMPLETION_ARGUMENTS=()

    # The set of ALL legal arguments
    # Corresponds by index to the type of those arguments in ALL_ARGUMENT_VALUE_TYPES
    ALL_LEGAL_ARGUMENTS=()

    # The types of ALL legal arguments
    # Corresponds by index to the names of those arguments in ALL_LEGAL_ARGUMENTS
    ALL_ARGUMENT_VALUE_TYPES=()

    # Arguments that are mutually exclusive.
    # These are listed here as arguments concatenated together with delimiters:
    # <Main argument>;<Mutex Argument 1>[,<Mutex Argument 2>,...]
    MUTUALLY_EXCLUSIVE_ARGS=()

    # Alternate names of arguments.
    # These are listed here as arguments concatenated together with delimiters.
    # <Main argument>;<Synonym Argument 1>[,<Synonym Argument 2>,...]
    SYNONYMOUS_ARGS=()

    # The minimum number of times an argument can occur.
    MIN_OCCURRENCES=()

    # The maximum number of times an argument can occur.
    MAX_OCCURRENCES=()

    # Set up locals for this function:
    local toolName=$( _gatk_getToolName )

    # Get possible tool matches:
    local possibleToolMatches=$( _gatk_getAllPossibleToolNames )

    # Check if we have postfix options
    # and if we now need to go through them:
    if $HAS_POSTFIX_OPTIONS && [[ "${COMP_WORDS[@]}" == *" -- "* ]] ; then
        NUM_POSITIONAL_ARGUMENTS=0
        POSITIONAL_ARGUMENT_TYPE=()
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=("${CS_POSTFIX_OPTIONS_NORMAL_COMPLETION_ARGUMENTS[@]}")
        MUTUALLY_EXCLUSIVE_ARGS=("${CS_POSTFIX_OPTIONS_MUTUALLY_EXCLUSIVE_ARGS[@]}")
        SYNONYMOUS_ARGS=("${CS_POSTFIX_OPTIONS_SYNONYMOUS_ARGS[@]}")
        MIN_OCCURRENCES=("${CS_POSTFIX_OPTIONS_MIN_OCCURRENCES[@]}")
        MAX_OCCURRENCES=("${CS_POSTFIX_OPTIONS_MAX_OCCURRENCES[@]}")
        ALL_LEGAL_ARGUMENTS=("${CS_POSTFIX_OPTIONS_ALL_LEGAL_ARGUMENTS[@]}")
        ALL_ARGUMENT_VALUE_TYPES=("${CS_POSTFIX_OPTIONS_ALL_ARGUMENT_VALUE_TYPES[@]}")

        # Complete the arguments for the base script:
        # Strictly speaking, what the argument to this function is doesn't matter.
        _gatk_handleArgs POSTFIX_OPTIONS

    # Check if we have a complete tool match that may match more than one tool:
    elif [[ ${#possibleToolMatches} -ne 0 ]] ; then

        # Set our reply as a list of the possible tool matches:
        COMPREPLY=( $(compgen -W '${possibleToolMatches[@]}' -- $cur) )

    elif [[ ${toolName} == "FixCallSetSampleOrdering" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--batch-size --output --reader-threads --sample-name-map --variant --add-output-sam-program-record --add-output-vcf-command-line --create-output-bam-index --create-output-bam-md5 --create-output-variant-index --create-output-variant-md5 --disable-read-filter --disable-sequence-dictionary-validation --disable-tool-default-read-filters --exclude-intervals --gatk-config-file --input --interval-exclusion-padding --interval-padding --interval-set-rule --lenient --QUIET --read-filter --read-index --read-validation-stringency --seconds-between-progress-updates --sequence-dictionary --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --arguments_file --cloud-index-prefetch-buffer --cloud-prefetch-buffer --disable-bam-index-caching --gcs-max-retries --gvcf-to-header-sample-map-file --help --interval-merging-rule --intervals --reference --skipPrompt --version --showHidden )
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=("--output;-O" "--variant;-V" "--add-output-sam-program-record;-add-output-sam-program-record" "--add-output-vcf-command-line;-add-output-vcf-command-line" "--create-output-bam-index;-OBI" "--create-output-bam-md5;-OBM" "--create-output-variant-index;-OVI" "--create-output-variant-md5;-OVM" "--disable-read-filter;-DF" "--disable-sequence-dictionary-validation;-disable-sequence-dictionary-validation" "--disable-tool-default-read-filters;-disable-tool-default-read-filters" "--exclude-intervals;-XL" "--input;-I" "--interval-exclusion-padding;-ixp" "--interval-padding;-ip" "--interval-set-rule;-isr" "--lenient;-LE" "--read-filter;-RF" "--read-index;-read-index" "--read-validation-stringency;-VS" "--seconds-between-progress-updates;-seconds-between-progress-updates" "--sequence-dictionary;-sequence-dictionary" "--use-jdk-deflater;-jdk-deflater" "--use-jdk-inflater;-jdk-inflater" "--verbosity;-verbosity" "--cloud-index-prefetch-buffer;-CIPB" "--cloud-prefetch-buffer;-CPB" "--disable-bam-index-caching;-DBIC" "--gcs-max-retries;-gcs-retries" "--help;-h" "--interval-merging-rule;-imr" "--intervals;-L" "--reference;-R" "--skipPrompt;-Y" "--showHidden;-showHidden" )
        MIN_OCCURRENCES=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--batch-size --output --reader-threads --sample-name-map --variant --add-output-sam-program-record --add-output-vcf-command-line --create-output-bam-index --create-output-bam-md5 --create-output-variant-index --create-output-variant-md5 --disable-read-filter --disable-sequence-dictionary-validation --disable-tool-default-read-filters --exclude-intervals --gatk-config-file --input --interval-exclusion-padding --interval-padding --interval-set-rule --lenient --QUIET --read-filter --read-index --read-validation-stringency --seconds-between-progress-updates --sequence-dictionary --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --arguments_file --cloud-index-prefetch-buffer --cloud-prefetch-buffer --disable-bam-index-caching --gcs-max-retries --gvcf-to-header-sample-map-file --help --interval-merging-rule --intervals --reference --skipPrompt --version --showHidden )
        ALL_ARGUMENT_VALUE_TYPES=("Integer" "File" "Integer" "String" "String" "boolean" "boolean" "boolean" "boolean" "boolean" "boolean" "List[String]" "boolean" "boolean" "List[String]" "String" "List[String]" "int" "int" "IntervalSetRule" "boolean" "Boolean" "List[String]" "List[String]" "ValidationStringency" "double" "String" "List[File]" "boolean" "boolean" "LogLevel" "List[File]" "int" "int" "boolean" "int" "String" "boolean" "IntervalMergingRule" "List[String]" "String" "boolean" "boolean" "boolean" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "ClippingRankSumTest" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=()
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=()
        MIN_OCCURRENCES=()
        MAX_OCCURRENCES=()
        ALL_LEGAL_ARGUMENTS=()
        ALL_ARGUMENT_VALUE_TYPES=()

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "CleanSam" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--INPUT --OUTPUT --COMPRESSION_LEVEL --CREATE_INDEX --CREATE_MD5_FILE --GA4GH_CLIENT_SECRETS --MAX_RECORDS_IN_RAM --QUIET --REFERENCE_SEQUENCE --TMP_DIR --USE_JDK_DEFLATER --USE_JDK_INFLATER --VALIDATION_STRINGENCY --VERBOSITY --arguments_file --help --version --showHidden )
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=("--INPUT;-I" "--OUTPUT;-O" "--REFERENCE_SEQUENCE;-R" "--USE_JDK_DEFLATER;-use_jdk_deflater" "--USE_JDK_INFLATER;-use_jdk_inflater" "--help;-h" "--showHidden;-showHidden" )
        MIN_OCCURRENCES=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--INPUT --OUTPUT --COMPRESSION_LEVEL --CREATE_INDEX --CREATE_MD5_FILE --GA4GH_CLIENT_SECRETS --MAX_RECORDS_IN_RAM --QUIET --REFERENCE_SEQUENCE --TMP_DIR --USE_JDK_DEFLATER --USE_JDK_INFLATER --VALIDATION_STRINGENCY --VERBOSITY --arguments_file --help --version --showHidden )
        ALL_ARGUMENT_VALUE_TYPES=("File" "File" "int" "Boolean" "boolean" "String" "Integer" "Boolean" "File" "List[File]" "Boolean" "Boolean" "ValidationStringency" "LogLevel" "List[File]" "boolean" "boolean" "boolean" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "BedToIntervalList" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--INPUT --OUTPUT --SEQUENCE_DICTIONARY --COMPRESSION_LEVEL --CREATE_INDEX --CREATE_MD5_FILE --GA4GH_CLIENT_SECRETS --MAX_RECORDS_IN_RAM --QUIET --REFERENCE_SEQUENCE --TMP_DIR --USE_JDK_DEFLATER --USE_JDK_INFLATER --VALIDATION_STRINGENCY --VERBOSITY --arguments_file --help --SORT --UNIQUE --version --showHidden )
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=("--INPUT;-I" "--OUTPUT;-O" "--SEQUENCE_DICTIONARY;-SD" "--REFERENCE_SEQUENCE;-R" "--USE_JDK_DEFLATER;-use_jdk_deflater" "--USE_JDK_INFLATER;-use_jdk_inflater" "--help;-h" "--showHidden;-showHidden" )
        MIN_OCCURRENCES=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--INPUT --OUTPUT --SEQUENCE_DICTIONARY --COMPRESSION_LEVEL --CREATE_INDEX --CREATE_MD5_FILE --GA4GH_CLIENT_SECRETS --MAX_RECORDS_IN_RAM --QUIET --REFERENCE_SEQUENCE --TMP_DIR --USE_JDK_DEFLATER --USE_JDK_INFLATER --VALIDATION_STRINGENCY --VERBOSITY --arguments_file --help --SORT --UNIQUE --version --showHidden )
        ALL_ARGUMENT_VALUE_TYPES=("File" "File" "File" "int" "Boolean" "boolean" "String" "Integer" "Boolean" "File" "List[File]" "Boolean" "Boolean" "ValidationStringency" "LogLevel" "List[File]" "boolean" "boolean" "boolean" "boolean" "boolean" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "CreateSomaticPanelOfNormals" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--output --vcfs --gatk-config-file --QUIET --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --arguments_file --duplicate-sample-strategy --gcs-max-retries --help --version --showHidden )
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=("--output;-O" "--vcfs;-vcfs" "--use-jdk-deflater;-jdk-deflater" "--use-jdk-inflater;-jdk-inflater" "--verbosity;-verbosity" "--gcs-max-retries;-gcs-retries" "--help;-h" "--showHidden;-showHidden" )
        MIN_OCCURRENCES=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--output --vcfs --gatk-config-file --QUIET --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --arguments_file --duplicate-sample-strategy --gcs-max-retries --help --version --showHidden )
        ALL_ARGUMENT_VALUE_TYPES=("File" "Set[File]" "String" "Boolean" "List[File]" "boolean" "boolean" "LogLevel" "List[File]" "DuplicateSampleStrategy" "int" "boolean" "boolean" "boolean" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "GatherVcfsCloud" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--input --output --gatk-config-file --QUIET --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --arguments_file --cloud-prefetch-buffer --create-output-variant-index --gather-type --gcs-max-retries --help --version --disable-contig-ordering-check --ignore-safety-checks --showHidden )
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=("--input;-I" "--output;-O" "--use-jdk-deflater;-jdk-deflater" "--use-jdk-inflater;-jdk-inflater" "--verbosity;-verbosity" "--cloud-prefetch-buffer;-CPB" "--create-output-variant-index;-OVI" "--gcs-max-retries;-gcs-retries" "--help;-h" "--showHidden;-showHidden" )
        MIN_OCCURRENCES=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--input --output --gatk-config-file --QUIET --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --arguments_file --cloud-prefetch-buffer --create-output-variant-index --gather-type --gcs-max-retries --help --version --disable-contig-ordering-check --ignore-safety-checks --showHidden )
        ALL_ARGUMENT_VALUE_TYPES=("List[String]" "File" "String" "Boolean" "List[File]" "boolean" "boolean" "LogLevel" "List[File]" "int" "boolean" "GatherType" "int" "boolean" "boolean" "boolean" "boolean" "boolean" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "FlagStat" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--input --add-output-sam-program-record --add-output-vcf-command-line --create-output-bam-index --create-output-bam-md5 --create-output-variant-index --create-output-variant-md5 --disable-read-filter --disable-sequence-dictionary-validation --disable-tool-default-read-filters --exclude-intervals --gatk-config-file --interval-exclusion-padding --interval-padding --interval-set-rule --lenient --QUIET --read-filter --read-index --read-validation-stringency --seconds-between-progress-updates --sequence-dictionary --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --arguments_file --cloud-index-prefetch-buffer --cloud-prefetch-buffer --disable-bam-index-caching --gcs-max-retries --help --interval-merging-rule --intervals --reference --version --showHidden )
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=("--input;-I" "--add-output-sam-program-record;-add-output-sam-program-record" "--add-output-vcf-command-line;-add-output-vcf-command-line" "--create-output-bam-index;-OBI" "--create-output-bam-md5;-OBM" "--create-output-variant-index;-OVI" "--create-output-variant-md5;-OVM" "--disable-read-filter;-DF" "--disable-sequence-dictionary-validation;-disable-sequence-dictionary-validation" "--disable-tool-default-read-filters;-disable-tool-default-read-filters" "--exclude-intervals;-XL" "--interval-exclusion-padding;-ixp" "--interval-padding;-ip" "--interval-set-rule;-isr" "--lenient;-LE" "--read-filter;-RF" "--read-index;-read-index" "--read-validation-stringency;-VS" "--seconds-between-progress-updates;-seconds-between-progress-updates" "--sequence-dictionary;-sequence-dictionary" "--use-jdk-deflater;-jdk-deflater" "--use-jdk-inflater;-jdk-inflater" "--verbosity;-verbosity" "--cloud-index-prefetch-buffer;-CIPB" "--cloud-prefetch-buffer;-CPB" "--disable-bam-index-caching;-DBIC" "--gcs-max-retries;-gcs-retries" "--help;-h" "--interval-merging-rule;-imr" "--intervals;-L" "--reference;-R" "--showHidden;-showHidden" )
        MIN_OCCURRENCES=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--input --add-output-sam-program-record --add-output-vcf-command-line --create-output-bam-index --create-output-bam-md5 --create-output-variant-index --create-output-variant-md5 --disable-read-filter --disable-sequence-dictionary-validation --disable-tool-default-read-filters --exclude-intervals --gatk-config-file --interval-exclusion-padding --interval-padding --interval-set-rule --lenient --QUIET --read-filter --read-index --read-validation-stringency --seconds-between-progress-updates --sequence-dictionary --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --arguments_file --cloud-index-prefetch-buffer --cloud-prefetch-buffer --disable-bam-index-caching --gcs-max-retries --help --interval-merging-rule --intervals --reference --version --showHidden )
        ALL_ARGUMENT_VALUE_TYPES=("List[String]" "boolean" "boolean" "boolean" "boolean" "boolean" "boolean" "List[String]" "boolean" "boolean" "List[String]" "String" "int" "int" "IntervalSetRule" "boolean" "Boolean" "List[String]" "List[String]" "ValidationStringency" "double" "String" "List[File]" "boolean" "boolean" "LogLevel" "List[File]" "int" "int" "boolean" "int" "boolean" "IntervalMergingRule" "List[String]" "String" "boolean" "boolean" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "ParallelCopyGCSDirectoryIntoHDFSSpark" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--input-gcs-path --output-hdfs-directory --disable-read-filter --disable-tool-default-read-filters --exclude-intervals --gatk-config-file --input --interval-exclusion-padding --interval-padding --interval-set-rule --QUIET --read-filter --read-index --read-validation-stringency --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --arguments_file --bam-partition-size --conf --disable-sequence-dictionary-validation --gcs-max-retries --help --interval-merging-rule --intervals --num-reducers --program-name --reference --sharded-output --spark-master --version --showHidden )
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=("--disable-read-filter;-DF" "--disable-tool-default-read-filters;-disable-tool-default-read-filters" "--exclude-intervals;-XL" "--input;-I" "--interval-exclusion-padding;-ixp" "--interval-padding;-ip" "--interval-set-rule;-isr" "--read-filter;-RF" "--read-index;-read-index" "--read-validation-stringency;-VS" "--use-jdk-deflater;-jdk-deflater" "--use-jdk-inflater;-jdk-inflater" "--verbosity;-verbosity" "--conf;-conf" "--disable-sequence-dictionary-validation;-disable-sequence-dictionary-validation" "--gcs-max-retries;-gcs-retries" "--help;-h" "--interval-merging-rule;-imr" "--intervals;-L" "--reference;-R" "--showHidden;-showHidden" )
        MIN_OCCURRENCES=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--input-gcs-path --output-hdfs-directory --disable-read-filter --disable-tool-default-read-filters --exclude-intervals --gatk-config-file --input --interval-exclusion-padding --interval-padding --interval-set-rule --QUIET --read-filter --read-index --read-validation-stringency --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --arguments_file --bam-partition-size --conf --disable-sequence-dictionary-validation --gcs-max-retries --help --interval-merging-rule --intervals --num-reducers --program-name --reference --sharded-output --spark-master --version --showHidden )
        ALL_ARGUMENT_VALUE_TYPES=("String" "String" "List[String]" "boolean" "List[String]" "String" "List[String]" "int" "int" "IntervalSetRule" "Boolean" "List[String]" "List[String]" "ValidationStringency" "List[File]" "boolean" "boolean" "LogLevel" "List[File]" "long" "List[String]" "boolean" "int" "boolean" "IntervalMergingRule" "List[String]" "int" "String" "String" "boolean" "String" "boolean" "boolean" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "CompareSAMs" ]] ; then

        # Set up the completion information for this tool:
        NUM_POSITIONAL_ARGUMENTS=2
        POSITIONAL_ARGUMENT_TYPE=("List[File]")
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--COMPRESSION_LEVEL --CREATE_INDEX --CREATE_MD5_FILE --GA4GH_CLIENT_SECRETS --MAX_RECORDS_IN_RAM --QUIET --REFERENCE_SEQUENCE --TMP_DIR --USE_JDK_DEFLATER --USE_JDK_INFLATER --VALIDATION_STRINGENCY --VERBOSITY --arguments_file --help --version --showHidden )
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=("--REFERENCE_SEQUENCE;-R" "--USE_JDK_DEFLATER;-use_jdk_deflater" "--USE_JDK_INFLATER;-use_jdk_inflater" "--help;-h" "--showHidden;-showHidden" )
        MIN_OCCURRENCES=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--COMPRESSION_LEVEL --CREATE_INDEX --CREATE_MD5_FILE --GA4GH_CLIENT_SECRETS --MAX_RECORDS_IN_RAM --QUIET --REFERENCE_SEQUENCE --TMP_DIR --USE_JDK_DEFLATER --USE_JDK_INFLATER --VALIDATION_STRINGENCY --VERBOSITY --arguments_file --help --version --showHidden )
        ALL_ARGUMENT_VALUE_TYPES=("int" "Boolean" "boolean" "String" "Integer" "Boolean" "File" "List[File]" "Boolean" "Boolean" "ValidationStringency" "LogLevel" "List[File]" "boolean" "boolean" "boolean" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "PairedReadFilter" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=()
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=()
        MIN_OCCURRENCES=()
        MAX_OCCURRENCES=()
        ALL_LEGAL_ARGUMENTS=()
        ALL_ARGUMENT_VALUE_TYPES=()

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "StrandBiasBySample" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=()
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=()
        MIN_OCCURRENCES=()
        MAX_OCCURRENCES=()
        ALL_LEGAL_ARGUMENTS=()
        ALL_ARGUMENT_VALUE_TYPES=()

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "SecondOfPairReadFilter" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=()
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=()
        MIN_OCCURRENCES=()
        MAX_OCCURRENCES=()
        ALL_LEGAL_ARGUMENTS=()
        ALL_ARGUMENT_VALUE_TYPES=()

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "DetermineGermlineContigPloidy" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--input --output --output-prefix --gatk-config-file --QUIET --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --adamax-beta-1 --adamax-beta-2 --arguments_file --caller-admixing-rate --caller-update-convergence-threshold --contig-ploidy-priors --convergence-snr-averaging-window --convergence-snr-countdown-window --convergence-snr-trigger-threshold --disable-annealing --disable-caller --disable-sampler --gcs-max-retries --global-psi-scale --help --initial-temperature --learning-rate --log-emission-samples-per-round --log-emission-sampling-median-rel-error --log-emission-sampling-rounds --mapping-error-rate --max-advi-iter-first-epoch --max-advi-iter-subsequent-epochs --max-calling-iters --max-training-epochs --mean-bias-standard-deviation --min-training-epochs --model --num-thermal-epochs --sample-psi-scale --version --showHidden )
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=("--use-jdk-deflater;-jdk-deflater" "--use-jdk-inflater;-jdk-inflater" "--verbosity;-verbosity" "--gcs-max-retries;-gcs-retries" "--help;-h" "--showHidden;-showHidden" )
        MIN_OCCURRENCES=(1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--input --output --output-prefix --gatk-config-file --QUIET --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --adamax-beta-1 --adamax-beta-2 --arguments_file --caller-admixing-rate --caller-update-convergence-threshold --contig-ploidy-priors --convergence-snr-averaging-window --convergence-snr-countdown-window --convergence-snr-trigger-threshold --disable-annealing --disable-caller --disable-sampler --gcs-max-retries --global-psi-scale --help --initial-temperature --learning-rate --log-emission-samples-per-round --log-emission-sampling-median-rel-error --log-emission-sampling-rounds --mapping-error-rate --max-advi-iter-first-epoch --max-advi-iter-subsequent-epochs --max-calling-iters --max-training-epochs --mean-bias-standard-deviation --min-training-epochs --model --num-thermal-epochs --sample-psi-scale --version --showHidden )
        ALL_ARGUMENT_VALUE_TYPES=("List[File]" "String" "String" "String" "Boolean" "List[File]" "boolean" "boolean" "LogLevel" "double" "double" "List[File]" "double" "double" "File" "int" "int" "double" "boolean" "boolean" "boolean" "int" "double" "boolean" "double" "double" "int" "double" "int" "double" "int" "int" "int" "int" "double" "int" "String" "int" "double" "boolean" "boolean" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "MeanQualityByCycleSpark" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--disable-read-filter --disable-tool-default-read-filters --exclude-intervals --gatk-config-file --input --interval-exclusion-padding --interval-padding --interval-set-rule --QUIET --read-filter --read-index --read-validation-stringency --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --alignedReadsOnly --arguments_file --bam-partition-size --chart --conf --disable-sequence-dictionary-validation --gcs-max-retries --help --interval-merging-rule --intervals --num-reducers --output --pfReadsOnly --program-name --reference --sharded-output --spark-master --version --showHidden )
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=("--disable-read-filter;-DF" "--disable-tool-default-read-filters;-disable-tool-default-read-filters" "--exclude-intervals;-XL" "--input;-I" "--interval-exclusion-padding;-ixp" "--interval-padding;-ip" "--interval-set-rule;-isr" "--read-filter;-RF" "--read-index;-read-index" "--read-validation-stringency;-VS" "--use-jdk-deflater;-jdk-deflater" "--use-jdk-inflater;-jdk-inflater" "--verbosity;-verbosity" "--alignedReadsOnly;-A" "--chart;-C" "--conf;-conf" "--disable-sequence-dictionary-validation;-disable-sequence-dictionary-validation" "--gcs-max-retries;-gcs-retries" "--help;-h" "--interval-merging-rule;-imr" "--intervals;-L" "--output;-O" "--pfReadsOnly;-F" "--reference;-R" "--showHidden;-showHidden" )
        MIN_OCCURRENCES=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--disable-read-filter --disable-tool-default-read-filters --exclude-intervals --gatk-config-file --input --interval-exclusion-padding --interval-padding --interval-set-rule --QUIET --read-filter --read-index --read-validation-stringency --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --alignedReadsOnly --arguments_file --bam-partition-size --chart --conf --disable-sequence-dictionary-validation --gcs-max-retries --help --interval-merging-rule --intervals --num-reducers --output --pfReadsOnly --program-name --reference --sharded-output --spark-master --version --showHidden )
        ALL_ARGUMENT_VALUE_TYPES=("List[String]" "boolean" "List[String]" "String" "List[String]" "int" "int" "IntervalSetRule" "Boolean" "List[String]" "List[String]" "ValidationStringency" "List[File]" "boolean" "boolean" "LogLevel" "boolean" "List[File]" "long" "File" "List[String]" "boolean" "int" "boolean" "IntervalMergingRule" "List[String]" "int" "String" "boolean" "String" "String" "boolean" "String" "boolean" "boolean" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "PileupSpark" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--input --output --disable-read-filter --disable-tool-default-read-filters --exclude-intervals --gatk-config-file --interval-exclusion-padding --interval-padding --interval-set-rule --QUIET --read-filter --read-index --read-validation-stringency --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --arguments_file --bam-partition-size --conf --disable-sequence-dictionary-validation --gcs-max-retries --help --interval-merging-rule --intervals --maxDepthPerSample --metadata --num-reducers --output-insert-length --program-name --readShardPadding --readShardSize --reference --sharded-output --show-verbose --shuffle --spark-master --version --showHidden )
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=("--input;-I" "--output;-O" "--disable-read-filter;-DF" "--disable-tool-default-read-filters;-disable-tool-default-read-filters" "--exclude-intervals;-XL" "--interval-exclusion-padding;-ixp" "--interval-padding;-ip" "--interval-set-rule;-isr" "--read-filter;-RF" "--read-index;-read-index" "--read-validation-stringency;-VS" "--use-jdk-deflater;-jdk-deflater" "--use-jdk-inflater;-jdk-inflater" "--verbosity;-verbosity" "--conf;-conf" "--disable-sequence-dictionary-validation;-disable-sequence-dictionary-validation" "--gcs-max-retries;-gcs-retries" "--help;-h" "--interval-merging-rule;-imr" "--intervals;-L" "--maxDepthPerSample;-maxDepthPerSample" "--metadata;-metadata" "--output-insert-length;-output-insert-length" "--readShardPadding;-readShardPadding" "--readShardSize;-readShardSize" "--reference;-R" "--show-verbose;-verbose" "--shuffle;-shuffle" "--showHidden;-showHidden" )
        MIN_OCCURRENCES=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--input --output --disable-read-filter --disable-tool-default-read-filters --exclude-intervals --gatk-config-file --interval-exclusion-padding --interval-padding --interval-set-rule --QUIET --read-filter --read-index --read-validation-stringency --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --arguments_file --bam-partition-size --conf --disable-sequence-dictionary-validation --gcs-max-retries --help --interval-merging-rule --intervals --maxDepthPerSample --metadata --num-reducers --output-insert-length --program-name --readShardPadding --readShardSize --reference --sharded-output --show-verbose --shuffle --spark-master --version --showHidden )
        ALL_ARGUMENT_VALUE_TYPES=("List[String]" "String" "List[String]" "boolean" "List[String]" "String" "int" "int" "IntervalSetRule" "Boolean" "List[String]" "List[String]" "ValidationStringency" "List[File]" "boolean" "boolean" "LogLevel" "List[File]" "long" "List[String]" "boolean" "int" "boolean" "IntervalMergingRule" "List[String]" "int" "List[FeatureInput[Feature]]" "int" "boolean" "String" "int" "int" "String" "boolean" "boolean" "boolean" "String" "boolean" "boolean" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "HaplotypeCaller" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--input --output --reference --add-output-sam-program-record --add-output-vcf-command-line --create-output-bam-index --create-output-bam-md5 --create-output-variant-index --create-output-variant-md5 --disable-read-filter --disable-sequence-dictionary-validation --disable-tool-default-read-filters --exclude-intervals --gatk-config-file --interval-exclusion-padding --interval-padding --interval-set-rule --lenient --QUIET --read-filter --read-index --read-validation-stringency --seconds-between-progress-updates --sequence-dictionary --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --activity-profile-out --alleles --annotate-with-num-discovered-alleles --annotation --annotation-group --annotations-to-exclude --arguments_file --assembly-region-out --base-quality-score-threshold --cloud-index-prefetch-buffer --cloud-prefetch-buffer --contamination-fraction-to-filter --dbsnp --disable-bam-index-caching --disable-tool-default-annotations --gcs-max-retries --genotyping-mode --graph-output --help --heterozygosity --heterozygosity-stdev --indel-heterozygosity --interval-merging-rule --intervals --max-reads-per-alignment-start --min-base-quality-score --native-pair-hmm-threads --native-pair-hmm-use-double-precision --output-mode --sample-name --sample-ploidy --standard-min-confidence-threshold-for-calling --use-new-qual-calculator --version --active-probability-threshold --allow-non-unique-kmers-in-ref --all-site-pls --assembly-region-padding --bam-output --bam-writer-type --comp --consensus --contamination-fraction-per-sample-file --debug --disable-optimizations --do-not-run-physical-phasing --dont-increase-kmer-sizes-for-cycles --dont-trim-active-regions --dont-use-soft-clipped-bases --emit-ref-confidence --gvcf-gq-bands --indel-size-to-eliminate-in-ref-model --input-prior --kmer-size --max-alternate-alleles --max-assembly-region-size --max-genotype-count --max-num-haplotypes-in-population --max-prob-propagation-distance --min-assembly-region-size --min-dangling-branch-length --min-pruning --num-pruning-samples --pair-hmm-gap-continuation-penalty --pcr-indel-model --phred-scaled-global-read-mismapping-rate --showHidden --smith-waterman --use-alleles-trigger --use-filtered-reads-for-annotations --recover-dangling-heads )
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=("--input;-I" "--output;-O" "--reference;-R" "--add-output-sam-program-record;-add-output-sam-program-record" "--add-output-vcf-command-line;-add-output-vcf-command-line" "--create-output-bam-index;-OBI" "--create-output-bam-md5;-OBM" "--create-output-variant-index;-OVI" "--create-output-variant-md5;-OVM" "--disable-read-filter;-DF" "--disable-sequence-dictionary-validation;-disable-sequence-dictionary-validation" "--disable-tool-default-read-filters;-disable-tool-default-read-filters" "--exclude-intervals;-XL" "--interval-exclusion-padding;-ixp" "--interval-padding;-ip" "--interval-set-rule;-isr" "--lenient;-LE" "--read-filter;-RF" "--read-index;-read-index" "--read-validation-stringency;-VS" "--seconds-between-progress-updates;-seconds-between-progress-updates" "--sequence-dictionary;-sequence-dictionary" "--use-jdk-deflater;-jdk-deflater" "--use-jdk-inflater;-jdk-inflater" "--verbosity;-verbosity" "--annotation;-A" "--annotation-group;-G" "--annotations-to-exclude;-AX" "--cloud-index-prefetch-buffer;-CIPB" "--cloud-prefetch-buffer;-CPB" "--contamination-fraction-to-filter;-contamination" "--dbsnp;-D" "--disable-bam-index-caching;-DBIC" "--disable-tool-default-annotations;-disable-tool-default-annotations" "--gcs-max-retries;-gcs-retries" "--graph-output;-graph" "--help;-h" "--interval-merging-rule;-imr" "--intervals;-L" "--min-base-quality-score;-mbq" "--sample-name;-ALIAS" "--sample-ploidy;-ploidy" "--standard-min-confidence-threshold-for-calling;-stand-call-conf" "--use-new-qual-calculator;-new-qual" "--bam-output;-bamout" "--comp;-comp" "--contamination-fraction-per-sample-file;-contamination-file" "--debug;-debug" "--emit-ref-confidence;-ERC" "--gvcf-gq-bands;-GQB" "--showHidden;-showHidden" )
        MIN_OCCURRENCES=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--input --output --reference --add-output-sam-program-record --add-output-vcf-command-line --create-output-bam-index --create-output-bam-md5 --create-output-variant-index --create-output-variant-md5 --disable-read-filter --disable-sequence-dictionary-validation --disable-tool-default-read-filters --exclude-intervals --gatk-config-file --interval-exclusion-padding --interval-padding --interval-set-rule --lenient --QUIET --read-filter --read-index --read-validation-stringency --seconds-between-progress-updates --sequence-dictionary --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --activity-profile-out --alleles --annotate-with-num-discovered-alleles --annotation --annotation-group --annotations-to-exclude --arguments_file --assembly-region-out --base-quality-score-threshold --cloud-index-prefetch-buffer --cloud-prefetch-buffer --contamination-fraction-to-filter --dbsnp --disable-bam-index-caching --disable-tool-default-annotations --gcs-max-retries --genotyping-mode --graph-output --help --heterozygosity --heterozygosity-stdev --indel-heterozygosity --interval-merging-rule --intervals --max-reads-per-alignment-start --min-base-quality-score --native-pair-hmm-threads --native-pair-hmm-use-double-precision --output-mode --sample-name --sample-ploidy --standard-min-confidence-threshold-for-calling --use-new-qual-calculator --version --active-probability-threshold --allow-non-unique-kmers-in-ref --all-site-pls --assembly-region-padding --bam-output --bam-writer-type --comp --consensus --contamination-fraction-per-sample-file --debug --disable-optimizations --do-not-run-physical-phasing --dont-increase-kmer-sizes-for-cycles --dont-trim-active-regions --dont-use-soft-clipped-bases --emit-ref-confidence --gvcf-gq-bands --indel-size-to-eliminate-in-ref-model --input-prior --kmer-size --max-alternate-alleles --max-assembly-region-size --max-genotype-count --max-num-haplotypes-in-population --max-prob-propagation-distance --min-assembly-region-size --min-dangling-branch-length --min-pruning --num-pruning-samples --pair-hmm-gap-continuation-penalty --pcr-indel-model --phred-scaled-global-read-mismapping-rate --showHidden --smith-waterman --use-alleles-trigger --use-filtered-reads-for-annotations --recover-dangling-heads )
        ALL_ARGUMENT_VALUE_TYPES=("List[String]" "String" "String" "boolean" "boolean" "boolean" "boolean" "boolean" "boolean" "List[String]" "boolean" "boolean" "List[String]" "String" "int" "int" "IntervalSetRule" "boolean" "Boolean" "List[String]" "List[String]" "ValidationStringency" "double" "String" "List[File]" "boolean" "boolean" "LogLevel" "String" "FeatureInput[VariantContext]" "boolean" "List[String]" "List[String]" "List[String]" "List[File]" "String" "byte" "int" "int" "double" "FeatureInput[VariantContext]" "boolean" "boolean" "int" "GenotypingOutputMode" "String" "boolean" "Double" "double" "double" "IntervalMergingRule" "List[String]" "int" "byte" "int" "boolean" "OutputMode" "String" "int" "double" "boolean" "boolean" "double" "boolean" "boolean" "int" "String" "WriterType" "List[FeatureInput[VariantContext]]" "boolean" "File" "boolean" "boolean" "boolean" "boolean" "boolean" "boolean" "ReferenceConfidenceMode" "List[Integer]" "int" "List[Double]" "List[Integer]" "int" "int" "int" "int" "int" "int" "int" "int" "int" "int" "PCRErrorModel" "int" "boolean" "Implementation" "boolean" "boolean" "boolean" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "GatherBamFiles" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--INPUT --OUTPUT --COMPRESSION_LEVEL --CREATE_INDEX --CREATE_MD5_FILE --GA4GH_CLIENT_SECRETS --MAX_RECORDS_IN_RAM --QUIET --REFERENCE_SEQUENCE --TMP_DIR --USE_JDK_DEFLATER --USE_JDK_INFLATER --VALIDATION_STRINGENCY --VERBOSITY --arguments_file --help --version --showHidden )
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=("--INPUT;-I" "--OUTPUT;-O" "--REFERENCE_SEQUENCE;-R" "--USE_JDK_DEFLATER;-use_jdk_deflater" "--USE_JDK_INFLATER;-use_jdk_inflater" "--help;-h" "--showHidden;-showHidden" )
        MIN_OCCURRENCES=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--INPUT --OUTPUT --COMPRESSION_LEVEL --CREATE_INDEX --CREATE_MD5_FILE --GA4GH_CLIENT_SECRETS --MAX_RECORDS_IN_RAM --QUIET --REFERENCE_SEQUENCE --TMP_DIR --USE_JDK_DEFLATER --USE_JDK_INFLATER --VALIDATION_STRINGENCY --VERBOSITY --arguments_file --help --version --showHidden )
        ALL_ARGUMENT_VALUE_TYPES=("List[File]" "File" "int" "Boolean" "boolean" "String" "Integer" "Boolean" "File" "List[File]" "Boolean" "Boolean" "ValidationStringency" "LogLevel" "List[File]" "boolean" "boolean" "boolean" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "EstimateLibraryComplexity" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--INPUT --OUTPUT --COMPRESSION_LEVEL --CREATE_INDEX --CREATE_MD5_FILE --GA4GH_CLIENT_SECRETS --MAX_RECORDS_IN_RAM --QUIET --REFERENCE_SEQUENCE --TMP_DIR --USE_JDK_DEFLATER --USE_JDK_INFLATER --VALIDATION_STRINGENCY --VERBOSITY --arguments_file --BARCODE_TAG --help --MAX_DIFF_RATE --MAX_GROUP_RATIO --MAX_OPTICAL_DUPLICATE_SET_SIZE --MAX_READ_LENGTH --MIN_GROUP_COUNT --MIN_IDENTICAL_BASES --MIN_MEAN_QUALITY --OPTICAL_DUPLICATE_PIXEL_DISTANCE --READ_NAME_REGEX --READ_ONE_BARCODE_TAG --READ_TWO_BARCODE_TAG --version --showHidden )
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=("--INPUT;-I" "--OUTPUT;-O" "--REFERENCE_SEQUENCE;-R" "--USE_JDK_DEFLATER;-use_jdk_deflater" "--USE_JDK_INFLATER;-use_jdk_inflater" "--help;-h" "--showHidden;-showHidden" )
        MIN_OCCURRENCES=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--INPUT --OUTPUT --COMPRESSION_LEVEL --CREATE_INDEX --CREATE_MD5_FILE --GA4GH_CLIENT_SECRETS --MAX_RECORDS_IN_RAM --QUIET --REFERENCE_SEQUENCE --TMP_DIR --USE_JDK_DEFLATER --USE_JDK_INFLATER --VALIDATION_STRINGENCY --VERBOSITY --arguments_file --BARCODE_TAG --help --MAX_DIFF_RATE --MAX_GROUP_RATIO --MAX_OPTICAL_DUPLICATE_SET_SIZE --MAX_READ_LENGTH --MIN_GROUP_COUNT --MIN_IDENTICAL_BASES --MIN_MEAN_QUALITY --OPTICAL_DUPLICATE_PIXEL_DISTANCE --READ_NAME_REGEX --READ_ONE_BARCODE_TAG --READ_TWO_BARCODE_TAG --version --showHidden )
        ALL_ARGUMENT_VALUE_TYPES=("List[File]" "File" "int" "Boolean" "boolean" "String" "Integer" "Boolean" "File" "List[File]" "Boolean" "Boolean" "ValidationStringency" "LogLevel" "List[File]" "String" "boolean" "double" "int" "long" "int" "int" "int" "int" "int" "String" "String" "String" "boolean" "boolean" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "LiftoverVcf" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--CHAIN --INPUT --OUTPUT --REFERENCE_SEQUENCE --REJECT --COMPRESSION_LEVEL --CREATE_INDEX --CREATE_MD5_FILE --GA4GH_CLIENT_SECRETS --MAX_RECORDS_IN_RAM --QUIET --TMP_DIR --USE_JDK_DEFLATER --USE_JDK_INFLATER --VALIDATION_STRINGENCY --VERBOSITY --ALLOW_MISSING_FIELDS_IN_HEADER --arguments_file --help --LIFTOVER_MIN_MATCH --TAGS_TO_DROP --TAGS_TO_REVERSE --version --WARN_ON_MISSING_CONTIG --WRITE_ORIGINAL_POSITION --showHidden )
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=("--CHAIN;-C" "--INPUT;-I" "--OUTPUT;-O" "--REFERENCE_SEQUENCE;-R" "--USE_JDK_DEFLATER;-use_jdk_deflater" "--USE_JDK_INFLATER;-use_jdk_inflater" "--help;-h" "--WARN_ON_MISSING_CONTIG;-WMC" "--showHidden;-showHidden" )
        MIN_OCCURRENCES=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--CHAIN --INPUT --OUTPUT --REFERENCE_SEQUENCE --REJECT --COMPRESSION_LEVEL --CREATE_INDEX --CREATE_MD5_FILE --GA4GH_CLIENT_SECRETS --MAX_RECORDS_IN_RAM --QUIET --TMP_DIR --USE_JDK_DEFLATER --USE_JDK_INFLATER --VALIDATION_STRINGENCY --VERBOSITY --ALLOW_MISSING_FIELDS_IN_HEADER --arguments_file --help --LIFTOVER_MIN_MATCH --TAGS_TO_DROP --TAGS_TO_REVERSE --version --WARN_ON_MISSING_CONTIG --WRITE_ORIGINAL_POSITION --showHidden )
        ALL_ARGUMENT_VALUE_TYPES=("File" "File" "File" "File" "File" "int" "Boolean" "boolean" "String" "Integer" "Boolean" "List[File]" "Boolean" "Boolean" "ValidationStringency" "LogLevel" "boolean" "List[File]" "boolean" "double" "Collection[String]" "Collection[String]" "boolean" "boolean" "boolean" "boolean" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "MergeVcfs" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--INPUT --OUTPUT --COMPRESSION_LEVEL --CREATE_INDEX --CREATE_MD5_FILE --GA4GH_CLIENT_SECRETS --MAX_RECORDS_IN_RAM --QUIET --REFERENCE_SEQUENCE --TMP_DIR --USE_JDK_DEFLATER --USE_JDK_INFLATER --VALIDATION_STRINGENCY --VERBOSITY --arguments_file --help --SEQUENCE_DICTIONARY --version --showHidden )
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=("--INPUT;-I" "--OUTPUT;-O" "--REFERENCE_SEQUENCE;-R" "--USE_JDK_DEFLATER;-use_jdk_deflater" "--USE_JDK_INFLATER;-use_jdk_inflater" "--help;-h" "--SEQUENCE_DICTIONARY;-D" "--showHidden;-showHidden" )
        MIN_OCCURRENCES=(1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--INPUT --OUTPUT --COMPRESSION_LEVEL --CREATE_INDEX --CREATE_MD5_FILE --GA4GH_CLIENT_SECRETS --MAX_RECORDS_IN_RAM --QUIET --REFERENCE_SEQUENCE --TMP_DIR --USE_JDK_DEFLATER --USE_JDK_INFLATER --VALIDATION_STRINGENCY --VERBOSITY --arguments_file --help --SEQUENCE_DICTIONARY --version --showHidden )
        ALL_ARGUMENT_VALUE_TYPES=("List[File]" "File" "int" "Boolean" "boolean" "String" "Integer" "Boolean" "File" "List[File]" "Boolean" "Boolean" "ValidationStringency" "LogLevel" "List[File]" "boolean" "File" "boolean" "boolean" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "ASEReadCounter" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--input --variant --add-output-sam-program-record --add-output-vcf-command-line --create-output-bam-index --create-output-bam-md5 --create-output-variant-index --create-output-variant-md5 --disable-read-filter --disable-sequence-dictionary-validation --disable-tool-default-read-filters --exclude-intervals --gatk-config-file --interval-exclusion-padding --interval-padding --interval-set-rule --lenient --QUIET --read-filter --read-index --read-validation-stringency --seconds-between-progress-updates --sequence-dictionary --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --arguments_file --cloud-index-prefetch-buffer --cloud-prefetch-buffer --count-overlap-reads-handling --disable-bam-index-caching --gcs-max-retries --help --interval-merging-rule --intervals --maxDepthPerSample --min-base-quality --min-depth-of-non-filtered-base --min-mapping-quality --output --output-format --reference --version --showHidden )
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=("--input;-I" "--variant;-V" "--add-output-sam-program-record;-add-output-sam-program-record" "--add-output-vcf-command-line;-add-output-vcf-command-line" "--create-output-bam-index;-OBI" "--create-output-bam-md5;-OBM" "--create-output-variant-index;-OVI" "--create-output-variant-md5;-OVM" "--disable-read-filter;-DF" "--disable-sequence-dictionary-validation;-disable-sequence-dictionary-validation" "--disable-tool-default-read-filters;-disable-tool-default-read-filters" "--exclude-intervals;-XL" "--interval-exclusion-padding;-ixp" "--interval-padding;-ip" "--interval-set-rule;-isr" "--lenient;-LE" "--read-filter;-RF" "--read-index;-read-index" "--read-validation-stringency;-VS" "--seconds-between-progress-updates;-seconds-between-progress-updates" "--sequence-dictionary;-sequence-dictionary" "--use-jdk-deflater;-jdk-deflater" "--use-jdk-inflater;-jdk-inflater" "--verbosity;-verbosity" "--cloud-index-prefetch-buffer;-CIPB" "--cloud-prefetch-buffer;-CPB" "--count-overlap-reads-handling;-overlap" "--disable-bam-index-caching;-DBIC" "--gcs-max-retries;-gcs-retries" "--help;-h" "--interval-merging-rule;-imr" "--intervals;-L" "--maxDepthPerSample;-maxDepthPerSample" "--min-base-quality;-mbq" "--min-depth-of-non-filtered-base;-min-depth" "--min-mapping-quality;-mmq" "--output;-O" "--reference;-R" "--showHidden;-showHidden" )
        MIN_OCCURRENCES=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--input --variant --add-output-sam-program-record --add-output-vcf-command-line --create-output-bam-index --create-output-bam-md5 --create-output-variant-index --create-output-variant-md5 --disable-read-filter --disable-sequence-dictionary-validation --disable-tool-default-read-filters --exclude-intervals --gatk-config-file --interval-exclusion-padding --interval-padding --interval-set-rule --lenient --QUIET --read-filter --read-index --read-validation-stringency --seconds-between-progress-updates --sequence-dictionary --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --arguments_file --cloud-index-prefetch-buffer --cloud-prefetch-buffer --count-overlap-reads-handling --disable-bam-index-caching --gcs-max-retries --help --interval-merging-rule --intervals --maxDepthPerSample --min-base-quality --min-depth-of-non-filtered-base --min-mapping-quality --output --output-format --reference --version --showHidden )
        ALL_ARGUMENT_VALUE_TYPES=("List[String]" "List[FeatureInput[VariantContext]]" "boolean" "boolean" "boolean" "boolean" "boolean" "boolean" "List[String]" "boolean" "boolean" "List[String]" "String" "int" "int" "IntervalSetRule" "boolean" "Boolean" "List[String]" "List[String]" "ValidationStringency" "double" "String" "List[File]" "boolean" "boolean" "LogLevel" "List[File]" "int" "int" "CountPileupType" "boolean" "int" "boolean" "IntervalMergingRule" "List[String]" "int" "byte" "int" "int" "File" "OUTPUT_FORMAT" "String" "boolean" "boolean" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "ValidAlignmentEndReadFilter" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=()
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=()
        MIN_OCCURRENCES=()
        MAX_OCCURRENCES=()
        ALL_LEGAL_ARGUMENTS=()
        ALL_ARGUMENT_VALUE_TYPES=()

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "FindBadGenomicKmersSpark" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--output --reference --disable-read-filter --disable-tool-default-read-filters --exclude-intervals --gatk-config-file --input --interval-exclusion-padding --interval-padding --interval-set-rule --QUIET --read-filter --read-index --read-validation-stringency --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --arguments_file --bam-partition-size --conf --disable-sequence-dictionary-validation --gcs-max-retries --help --high-copy-fasta --interval-merging-rule --intervals --kmer-max-dust-score --k-size --num-reducers --program-name --sharded-output --spark-master --version --showHidden )
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=("--output;-O" "--reference;-R" "--disable-read-filter;-DF" "--disable-tool-default-read-filters;-disable-tool-default-read-filters" "--exclude-intervals;-XL" "--input;-I" "--interval-exclusion-padding;-ixp" "--interval-padding;-ip" "--interval-set-rule;-isr" "--read-filter;-RF" "--read-index;-read-index" "--read-validation-stringency;-VS" "--use-jdk-deflater;-jdk-deflater" "--use-jdk-inflater;-jdk-inflater" "--verbosity;-verbosity" "--conf;-conf" "--disable-sequence-dictionary-validation;-disable-sequence-dictionary-validation" "--gcs-max-retries;-gcs-retries" "--help;-h" "--interval-merging-rule;-imr" "--intervals;-L" "--showHidden;-showHidden" )
        MIN_OCCURRENCES=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--output --reference --disable-read-filter --disable-tool-default-read-filters --exclude-intervals --gatk-config-file --input --interval-exclusion-padding --interval-padding --interval-set-rule --QUIET --read-filter --read-index --read-validation-stringency --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --arguments_file --bam-partition-size --conf --disable-sequence-dictionary-validation --gcs-max-retries --help --high-copy-fasta --interval-merging-rule --intervals --kmer-max-dust-score --k-size --num-reducers --program-name --sharded-output --spark-master --version --showHidden )
        ALL_ARGUMENT_VALUE_TYPES=("String" "String" "List[String]" "boolean" "List[String]" "String" "List[String]" "int" "int" "IntervalSetRule" "Boolean" "List[String]" "List[String]" "ValidationStringency" "List[File]" "boolean" "boolean" "LogLevel" "List[File]" "long" "List[String]" "boolean" "int" "boolean" "String" "IntervalMergingRule" "List[String]" "int" "int" "int" "String" "boolean" "String" "boolean" "boolean" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "SortVcf" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--INPUT --OUTPUT --COMPRESSION_LEVEL --CREATE_INDEX --CREATE_MD5_FILE --GA4GH_CLIENT_SECRETS --MAX_RECORDS_IN_RAM --QUIET --REFERENCE_SEQUENCE --TMP_DIR --USE_JDK_DEFLATER --USE_JDK_INFLATER --VALIDATION_STRINGENCY --VERBOSITY --arguments_file --help --SEQUENCE_DICTIONARY --version --showHidden )
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=("--INPUT;-I" "--OUTPUT;-O" "--REFERENCE_SEQUENCE;-R" "--USE_JDK_DEFLATER;-use_jdk_deflater" "--USE_JDK_INFLATER;-use_jdk_inflater" "--help;-h" "--SEQUENCE_DICTIONARY;-SD" "--showHidden;-showHidden" )
        MIN_OCCURRENCES=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--INPUT --OUTPUT --COMPRESSION_LEVEL --CREATE_INDEX --CREATE_MD5_FILE --GA4GH_CLIENT_SECRETS --MAX_RECORDS_IN_RAM --QUIET --REFERENCE_SEQUENCE --TMP_DIR --USE_JDK_DEFLATER --USE_JDK_INFLATER --VALIDATION_STRINGENCY --VERBOSITY --arguments_file --help --SEQUENCE_DICTIONARY --version --showHidden )
        ALL_ARGUMENT_VALUE_TYPES=("List[File]" "File" "int" "Boolean" "boolean" "String" "Integer" "Boolean" "File" "List[File]" "Boolean" "Boolean" "ValidationStringency" "LogLevel" "List[File]" "boolean" "File" "boolean" "boolean" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "ReferenceBases" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=()
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=()
        MIN_OCCURRENCES=()
        MAX_OCCURRENCES=()
        ALL_LEGAL_ARGUMENTS=()
        ALL_ARGUMENT_VALUE_TYPES=()

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "ClusterCrosscheckMetrics" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--INPUT --COMPRESSION_LEVEL --CREATE_INDEX --CREATE_MD5_FILE --GA4GH_CLIENT_SECRETS --MAX_RECORDS_IN_RAM --QUIET --REFERENCE_SEQUENCE --TMP_DIR --USE_JDK_DEFLATER --USE_JDK_INFLATER --VALIDATION_STRINGENCY --VERBOSITY --arguments_file --help --LOD_THRESHOLD --OUTPUT --version --showHidden )
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=("--INPUT;-I" "--REFERENCE_SEQUENCE;-R" "--USE_JDK_DEFLATER;-use_jdk_deflater" "--USE_JDK_INFLATER;-use_jdk_inflater" "--help;-h" "--LOD_THRESHOLD;-LOD" "--OUTPUT;-O" "--showHidden;-showHidden" )
        MIN_OCCURRENCES=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--INPUT --COMPRESSION_LEVEL --CREATE_INDEX --CREATE_MD5_FILE --GA4GH_CLIENT_SECRETS --MAX_RECORDS_IN_RAM --QUIET --REFERENCE_SEQUENCE --TMP_DIR --USE_JDK_DEFLATER --USE_JDK_INFLATER --VALIDATION_STRINGENCY --VERBOSITY --arguments_file --help --LOD_THRESHOLD --OUTPUT --version --showHidden )
        ALL_ARGUMENT_VALUE_TYPES=("File" "int" "Boolean" "boolean" "String" "Integer" "Boolean" "File" "List[File]" "Boolean" "Boolean" "ValidationStringency" "LogLevel" "List[File]" "boolean" "double" "File" "boolean" "boolean" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "AnnotateVcfWithBamDepth" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--output --variant --add-output-sam-program-record --add-output-vcf-command-line --create-output-bam-index --create-output-bam-md5 --create-output-variant-index --create-output-variant-md5 --disable-read-filter --disable-sequence-dictionary-validation --disable-tool-default-read-filters --exclude-intervals --gatk-config-file --input --interval-exclusion-padding --interval-padding --interval-set-rule --lenient --QUIET --read-filter --read-index --read-validation-stringency --seconds-between-progress-updates --sequence-dictionary --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --arguments_file --cloud-index-prefetch-buffer --cloud-prefetch-buffer --disable-bam-index-caching --gcs-max-retries --help --interval-merging-rule --intervals --reference --version --showHidden )
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=("--output;-O" "--variant;-V" "--add-output-sam-program-record;-add-output-sam-program-record" "--add-output-vcf-command-line;-add-output-vcf-command-line" "--create-output-bam-index;-OBI" "--create-output-bam-md5;-OBM" "--create-output-variant-index;-OVI" "--create-output-variant-md5;-OVM" "--disable-read-filter;-DF" "--disable-sequence-dictionary-validation;-disable-sequence-dictionary-validation" "--disable-tool-default-read-filters;-disable-tool-default-read-filters" "--exclude-intervals;-XL" "--input;-I" "--interval-exclusion-padding;-ixp" "--interval-padding;-ip" "--interval-set-rule;-isr" "--lenient;-LE" "--read-filter;-RF" "--read-index;-read-index" "--read-validation-stringency;-VS" "--seconds-between-progress-updates;-seconds-between-progress-updates" "--sequence-dictionary;-sequence-dictionary" "--use-jdk-deflater;-jdk-deflater" "--use-jdk-inflater;-jdk-inflater" "--verbosity;-verbosity" "--cloud-index-prefetch-buffer;-CIPB" "--cloud-prefetch-buffer;-CPB" "--disable-bam-index-caching;-DBIC" "--gcs-max-retries;-gcs-retries" "--help;-h" "--interval-merging-rule;-imr" "--intervals;-L" "--reference;-R" "--showHidden;-showHidden" )
        MIN_OCCURRENCES=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--output --variant --add-output-sam-program-record --add-output-vcf-command-line --create-output-bam-index --create-output-bam-md5 --create-output-variant-index --create-output-variant-md5 --disable-read-filter --disable-sequence-dictionary-validation --disable-tool-default-read-filters --exclude-intervals --gatk-config-file --input --interval-exclusion-padding --interval-padding --interval-set-rule --lenient --QUIET --read-filter --read-index --read-validation-stringency --seconds-between-progress-updates --sequence-dictionary --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --arguments_file --cloud-index-prefetch-buffer --cloud-prefetch-buffer --disable-bam-index-caching --gcs-max-retries --help --interval-merging-rule --intervals --reference --version --showHidden )
        ALL_ARGUMENT_VALUE_TYPES=("String" "String" "boolean" "boolean" "boolean" "boolean" "boolean" "boolean" "List[String]" "boolean" "boolean" "List[String]" "String" "List[String]" "int" "int" "IntervalSetRule" "boolean" "Boolean" "List[String]" "List[String]" "ValidationStringency" "double" "String" "List[File]" "boolean" "boolean" "LogLevel" "List[File]" "int" "int" "boolean" "int" "boolean" "IntervalMergingRule" "List[String]" "String" "boolean" "boolean" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "AS_BaseQualityRankSumTest" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=()
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=()
        MIN_OCCURRENCES=()
        MAX_OCCURRENCES=()
        ALL_LEGAL_ARGUMENTS=()
        ALL_ARGUMENT_VALUE_TYPES=()

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "CreateReadCountPanelOfNormals" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--input --output --gatk-config-file --QUIET --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --annotated-intervals --arguments_file --conf --do-impute-zeros --extreme-outlier-truncation-percentile --extreme-sample-median-percentile --gcs-max-retries --help --maximum-zeros-in-interval-percentage --maximum-zeros-in-sample-percentage --minimum-interval-median-percentile --number-of-eigensamples --program-name --spark-master --version --showHidden )
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=("--input;-I" "--output;-O" "--use-jdk-deflater;-jdk-deflater" "--use-jdk-inflater;-jdk-inflater" "--verbosity;-verbosity" "--conf;-conf" "--gcs-max-retries;-gcs-retries" "--help;-h" "--showHidden;-showHidden" )
        MIN_OCCURRENCES=(1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--input --output --gatk-config-file --QUIET --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --annotated-intervals --arguments_file --conf --do-impute-zeros --extreme-outlier-truncation-percentile --extreme-sample-median-percentile --gcs-max-retries --help --maximum-zeros-in-interval-percentage --maximum-zeros-in-sample-percentage --minimum-interval-median-percentile --number-of-eigensamples --program-name --spark-master --version --showHidden )
        ALL_ARGUMENT_VALUE_TYPES=("List[File]" "File" "String" "Boolean" "List[File]" "boolean" "boolean" "LogLevel" "File" "List[File]" "List[String]" "boolean" "double" "double" "int" "boolean" "double" "double" "double" "int" "String" "String" "boolean" "boolean" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "AS_InbreedingCoeff" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=()
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=()
        MIN_OCCURRENCES=()
        MAX_OCCURRENCES=()
        ALL_LEGAL_ARGUMENTS=()
        ALL_ARGUMENT_VALUE_TYPES=()

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "CollectInsertSizeMetricsSpark" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--histogram-plot-file --input --output --disable-read-filter --disable-tool-default-read-filters --exclude-intervals --gatk-config-file --interval-exclusion-padding --interval-padding --interval-set-rule --QUIET --read-filter --read-index --read-validation-stringency --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --arguments_file --bam-partition-size --conf --disable-sequence-dictionary-validation --gcs-max-retries --help --histogram-plot-deviations-tolerance --interval-merging-rule --intervals --metric-accumulation-level --min-category-reads-percentage --num-reducers --produce-plot --program-name --reference --sharded-output --spark-master --version --width --showHidden )
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=("--histogram-plot-file;-H" "--input;-I" "--output;-O" "--disable-read-filter;-DF" "--disable-tool-default-read-filters;-disable-tool-default-read-filters" "--exclude-intervals;-XL" "--interval-exclusion-padding;-ixp" "--interval-padding;-ip" "--interval-set-rule;-isr" "--read-filter;-RF" "--read-index;-read-index" "--read-validation-stringency;-VS" "--use-jdk-deflater;-jdk-deflater" "--use-jdk-inflater;-jdk-inflater" "--verbosity;-verbosity" "--conf;-conf" "--disable-sequence-dictionary-validation;-disable-sequence-dictionary-validation" "--gcs-max-retries;-gcs-retries" "--help;-h" "--histogram-plot-deviations-tolerance;-TOL" "--interval-merging-rule;-imr" "--intervals;-L" "--metric-accumulation-level;-LEVEL" "--min-category-reads-percentage;-M" "--reference;-R" "--width;-W" "--showHidden;-showHidden" )
        MIN_OCCURRENCES=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--histogram-plot-file --input --output --disable-read-filter --disable-tool-default-read-filters --exclude-intervals --gatk-config-file --interval-exclusion-padding --interval-padding --interval-set-rule --QUIET --read-filter --read-index --read-validation-stringency --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --arguments_file --bam-partition-size --conf --disable-sequence-dictionary-validation --gcs-max-retries --help --histogram-plot-deviations-tolerance --interval-merging-rule --intervals --metric-accumulation-level --min-category-reads-percentage --num-reducers --produce-plot --program-name --reference --sharded-output --spark-master --version --width --showHidden )
        ALL_ARGUMENT_VALUE_TYPES=("String" "List[String]" "String" "List[String]" "boolean" "List[String]" "String" "int" "int" "IntervalSetRule" "Boolean" "List[String]" "List[String]" "ValidationStringency" "List[File]" "boolean" "boolean" "LogLevel" "List[File]" "long" "List[String]" "boolean" "int" "boolean" "double" "IntervalMergingRule" "List[String]" "Set[MetricAccumulationLevel]" "float" "int" "boolean" "String" "String" "boolean" "String" "boolean" "Integer" "boolean" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "MappingQuality" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=()
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=()
        MIN_OCCURRENCES=()
        MAX_OCCURRENCES=()
        ALL_LEGAL_ARGUMENTS=()
        ALL_ARGUMENT_VALUE_TYPES=()

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "ReadLengthReadFilter" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--max-read-length --min-read-length )
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=()
        MIN_OCCURRENCES=(0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--max-read-length --min-read-length )
        ALL_ARGUMENT_VALUE_TYPES=("Integer" "int" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "CollectMultipleMetricsSpark" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--output --disable-read-filter --disable-tool-default-read-filters --exclude-intervals --gatk-config-file --input --interval-exclusion-padding --interval-padding --interval-set-rule --QUIET --read-filter --read-index --read-validation-stringency --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --arguments_file --assume-sorted --bam-partition-size --collectors --conf --disable-sequence-dictionary-validation --gcs-max-retries --help --interval-merging-rule --intervals --metric-accumulation-level --num-reducers --program-name --reference --sharded-output --spark-master --version --showHidden )
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=("--output;-O" "--disable-read-filter;-DF" "--disable-tool-default-read-filters;-disable-tool-default-read-filters" "--exclude-intervals;-XL" "--input;-I" "--interval-exclusion-padding;-ixp" "--interval-padding;-ip" "--interval-set-rule;-isr" "--read-filter;-RF" "--read-index;-read-index" "--read-validation-stringency;-VS" "--use-jdk-deflater;-jdk-deflater" "--use-jdk-inflater;-jdk-inflater" "--verbosity;-verbosity" "--assume-sorted;-AS" "--conf;-conf" "--disable-sequence-dictionary-validation;-disable-sequence-dictionary-validation" "--gcs-max-retries;-gcs-retries" "--help;-h" "--interval-merging-rule;-imr" "--intervals;-L" "--metric-accumulation-level;-LEVEL" "--reference;-R" "--showHidden;-showHidden" )
        MIN_OCCURRENCES=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--output --disable-read-filter --disable-tool-default-read-filters --exclude-intervals --gatk-config-file --input --interval-exclusion-padding --interval-padding --interval-set-rule --QUIET --read-filter --read-index --read-validation-stringency --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --arguments_file --assume-sorted --bam-partition-size --collectors --conf --disable-sequence-dictionary-validation --gcs-max-retries --help --interval-merging-rule --intervals --metric-accumulation-level --num-reducers --program-name --reference --sharded-output --spark-master --version --showHidden )
        ALL_ARGUMENT_VALUE_TYPES=("String" "List[String]" "boolean" "List[String]" "String" "List[String]" "int" "int" "IntervalSetRule" "Boolean" "List[String]" "List[String]" "ValidationStringency" "List[File]" "boolean" "boolean" "LogLevel" "List[File]" "boolean" "long" "List[SparkCollectors]" "List[String]" "boolean" "int" "boolean" "IntervalMergingRule" "List[String]" "Set[MetricAccumulationLevel]" "int" "String" "String" "boolean" "String" "boolean" "boolean" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "MergeSamFiles" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--INPUT --OUTPUT --COMPRESSION_LEVEL --CREATE_INDEX --CREATE_MD5_FILE --GA4GH_CLIENT_SECRETS --MAX_RECORDS_IN_RAM --QUIET --REFERENCE_SEQUENCE --TMP_DIR --USE_JDK_DEFLATER --USE_JDK_INFLATER --VALIDATION_STRINGENCY --VERBOSITY --arguments_file --ASSUME_SORTED --COMMENT --help --INTERVALS --MERGE_SEQUENCE_DICTIONARIES --SORT_ORDER --USE_THREADING --version --showHidden )
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=("--INPUT;-I" "--OUTPUT;-O" "--REFERENCE_SEQUENCE;-R" "--USE_JDK_DEFLATER;-use_jdk_deflater" "--USE_JDK_INFLATER;-use_jdk_inflater" "--ASSUME_SORTED;-AS" "--COMMENT;-CO" "--help;-h" "--INTERVALS;-RGN" "--MERGE_SEQUENCE_DICTIONARIES;-MSD" "--SORT_ORDER;-SO" "--showHidden;-showHidden" )
        MIN_OCCURRENCES=(1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--INPUT --OUTPUT --COMPRESSION_LEVEL --CREATE_INDEX --CREATE_MD5_FILE --GA4GH_CLIENT_SECRETS --MAX_RECORDS_IN_RAM --QUIET --REFERENCE_SEQUENCE --TMP_DIR --USE_JDK_DEFLATER --USE_JDK_INFLATER --VALIDATION_STRINGENCY --VERBOSITY --arguments_file --ASSUME_SORTED --COMMENT --help --INTERVALS --MERGE_SEQUENCE_DICTIONARIES --SORT_ORDER --USE_THREADING --version --showHidden )
        ALL_ARGUMENT_VALUE_TYPES=("List[File]" "File" "int" "Boolean" "boolean" "String" "Integer" "Boolean" "File" "List[File]" "Boolean" "Boolean" "ValidationStringency" "LogLevel" "List[File]" "boolean" "List[String]" "boolean" "File" "boolean" "SortOrder" "boolean" "boolean" "boolean" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "CountFalsePositives" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--output --variant --add-output-sam-program-record --add-output-vcf-command-line --create-output-bam-index --create-output-bam-md5 --create-output-variant-index --create-output-variant-md5 --disable-read-filter --disable-sequence-dictionary-validation --disable-tool-default-read-filters --exclude-intervals --gatk-config-file --input --interval-exclusion-padding --interval-padding --interval-set-rule --lenient --QUIET --read-filter --read-index --read-validation-stringency --seconds-between-progress-updates --sequence-dictionary --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --arguments_file --cloud-index-prefetch-buffer --cloud-prefetch-buffer --disable-bam-index-caching --gcs-max-retries --help --interval-merging-rule --intervals --reference --version --showHidden )
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=("--output;-O" "--variant;-V" "--add-output-sam-program-record;-add-output-sam-program-record" "--add-output-vcf-command-line;-add-output-vcf-command-line" "--create-output-bam-index;-OBI" "--create-output-bam-md5;-OBM" "--create-output-variant-index;-OVI" "--create-output-variant-md5;-OVM" "--disable-read-filter;-DF" "--disable-sequence-dictionary-validation;-disable-sequence-dictionary-validation" "--disable-tool-default-read-filters;-disable-tool-default-read-filters" "--exclude-intervals;-XL" "--input;-I" "--interval-exclusion-padding;-ixp" "--interval-padding;-ip" "--interval-set-rule;-isr" "--lenient;-LE" "--read-filter;-RF" "--read-index;-read-index" "--read-validation-stringency;-VS" "--seconds-between-progress-updates;-seconds-between-progress-updates" "--sequence-dictionary;-sequence-dictionary" "--use-jdk-deflater;-jdk-deflater" "--use-jdk-inflater;-jdk-inflater" "--verbosity;-verbosity" "--cloud-index-prefetch-buffer;-CIPB" "--cloud-prefetch-buffer;-CPB" "--disable-bam-index-caching;-DBIC" "--gcs-max-retries;-gcs-retries" "--help;-h" "--interval-merging-rule;-imr" "--intervals;-L" "--reference;-R" "--showHidden;-showHidden" )
        MIN_OCCURRENCES=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--output --variant --add-output-sam-program-record --add-output-vcf-command-line --create-output-bam-index --create-output-bam-md5 --create-output-variant-index --create-output-variant-md5 --disable-read-filter --disable-sequence-dictionary-validation --disable-tool-default-read-filters --exclude-intervals --gatk-config-file --input --interval-exclusion-padding --interval-padding --interval-set-rule --lenient --QUIET --read-filter --read-index --read-validation-stringency --seconds-between-progress-updates --sequence-dictionary --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --arguments_file --cloud-index-prefetch-buffer --cloud-prefetch-buffer --disable-bam-index-caching --gcs-max-retries --help --interval-merging-rule --intervals --reference --version --showHidden )
        ALL_ARGUMENT_VALUE_TYPES=("File" "String" "boolean" "boolean" "boolean" "boolean" "boolean" "boolean" "List[String]" "boolean" "boolean" "List[String]" "String" "List[String]" "int" "int" "IntervalSetRule" "boolean" "Boolean" "List[String]" "List[String]" "ValidationStringency" "double" "String" "List[File]" "boolean" "boolean" "LogLevel" "List[File]" "int" "int" "boolean" "int" "boolean" "IntervalMergingRule" "List[String]" "String" "boolean" "boolean" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "PrintVariantsSpark" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--output --variant --disable-read-filter --disable-tool-default-read-filters --exclude-intervals --gatk-config-file --input --interval-exclusion-padding --interval-padding --interval-set-rule --QUIET --read-filter --read-index --read-validation-stringency --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --arguments_file --bam-partition-size --conf --disable-sequence-dictionary-validation --gcs-max-retries --help --interval-merging-rule --intervals --num-reducers --program-name --reference --sharded-output --shuffle --spark-master --variantShardPadding --variantShardSize --version --showHidden )
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=("--output;-O" "--variant;-V" "--disable-read-filter;-DF" "--disable-tool-default-read-filters;-disable-tool-default-read-filters" "--exclude-intervals;-XL" "--input;-I" "--interval-exclusion-padding;-ixp" "--interval-padding;-ip" "--interval-set-rule;-isr" "--read-filter;-RF" "--read-index;-read-index" "--read-validation-stringency;-VS" "--use-jdk-deflater;-jdk-deflater" "--use-jdk-inflater;-jdk-inflater" "--verbosity;-verbosity" "--conf;-conf" "--disable-sequence-dictionary-validation;-disable-sequence-dictionary-validation" "--gcs-max-retries;-gcs-retries" "--help;-h" "--interval-merging-rule;-imr" "--intervals;-L" "--reference;-R" "--shuffle;-shuffle" "--variantShardPadding;-readShardPadding" "--variantShardSize;-variantShardSize" "--showHidden;-showHidden" )
        MIN_OCCURRENCES=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--output --variant --disable-read-filter --disable-tool-default-read-filters --exclude-intervals --gatk-config-file --input --interval-exclusion-padding --interval-padding --interval-set-rule --QUIET --read-filter --read-index --read-validation-stringency --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --arguments_file --bam-partition-size --conf --disable-sequence-dictionary-validation --gcs-max-retries --help --interval-merging-rule --intervals --num-reducers --program-name --reference --sharded-output --shuffle --spark-master --variantShardPadding --variantShardSize --version --showHidden )
        ALL_ARGUMENT_VALUE_TYPES=("String" "String" "List[String]" "boolean" "List[String]" "String" "List[String]" "int" "int" "IntervalSetRule" "Boolean" "List[String]" "List[String]" "ValidationStringency" "List[File]" "boolean" "boolean" "LogLevel" "List[File]" "long" "List[String]" "boolean" "int" "boolean" "IntervalMergingRule" "List[String]" "int" "String" "String" "boolean" "boolean" "String" "int" "int" "boolean" "boolean" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "MarkDuplicatesSpark" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--input --output --disable-read-filter --disable-tool-default-read-filters --exclude-intervals --gatk-config-file --interval-exclusion-padding --interval-padding --interval-set-rule --QUIET --read-filter --read-index --read-validation-stringency --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --arguments_file --bam-partition-size --conf --disable-sequence-dictionary-validation --DUPLICATE_SCORING_STRATEGY --gcs-max-retries --help --interval-merging-rule --intervals --METRICS_FILE --num-reducers --OPTICAL_DUPLICATE_PIXEL_DISTANCE --program-name --READ_NAME_REGEX --reference --sharded-output --spark-master --version --showHidden )
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=("--input;-I" "--output;-O" "--disable-read-filter;-DF" "--disable-tool-default-read-filters;-disable-tool-default-read-filters" "--exclude-intervals;-XL" "--interval-exclusion-padding;-ixp" "--interval-padding;-ip" "--interval-set-rule;-isr" "--read-filter;-RF" "--read-index;-read-index" "--read-validation-stringency;-VS" "--use-jdk-deflater;-jdk-deflater" "--use-jdk-inflater;-jdk-inflater" "--verbosity;-verbosity" "--conf;-conf" "--disable-sequence-dictionary-validation;-disable-sequence-dictionary-validation" "--DUPLICATE_SCORING_STRATEGY;-DS" "--gcs-max-retries;-gcs-retries" "--help;-h" "--interval-merging-rule;-imr" "--intervals;-L" "--METRICS_FILE;-M" "--reference;-R" "--showHidden;-showHidden" )
        MIN_OCCURRENCES=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--input --output --disable-read-filter --disable-tool-default-read-filters --exclude-intervals --gatk-config-file --interval-exclusion-padding --interval-padding --interval-set-rule --QUIET --read-filter --read-index --read-validation-stringency --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --arguments_file --bam-partition-size --conf --disable-sequence-dictionary-validation --DUPLICATE_SCORING_STRATEGY --gcs-max-retries --help --interval-merging-rule --intervals --METRICS_FILE --num-reducers --OPTICAL_DUPLICATE_PIXEL_DISTANCE --program-name --READ_NAME_REGEX --reference --sharded-output --spark-master --version --showHidden )
        ALL_ARGUMENT_VALUE_TYPES=("List[String]" "String" "List[String]" "boolean" "List[String]" "String" "int" "int" "IntervalSetRule" "Boolean" "List[String]" "List[String]" "ValidationStringency" "List[File]" "boolean" "boolean" "LogLevel" "List[File]" "long" "List[String]" "boolean" "MarkDuplicatesScoringStrategy" "int" "boolean" "IntervalMergingRule" "List[String]" "String" "int" "int" "String" "String" "String" "boolean" "String" "boolean" "boolean" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "AccumulateVariantCallingMetrics" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--INPUT --OUTPUT --COMPRESSION_LEVEL --CREATE_INDEX --CREATE_MD5_FILE --GA4GH_CLIENT_SECRETS --MAX_RECORDS_IN_RAM --QUIET --REFERENCE_SEQUENCE --TMP_DIR --USE_JDK_DEFLATER --USE_JDK_INFLATER --VALIDATION_STRINGENCY --VERBOSITY --arguments_file --help --version --showHidden )
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=("--INPUT;-I" "--OUTPUT;-O" "--REFERENCE_SEQUENCE;-R" "--USE_JDK_DEFLATER;-use_jdk_deflater" "--USE_JDK_INFLATER;-use_jdk_inflater" "--help;-h" "--showHidden;-showHidden" )
        MIN_OCCURRENCES=(1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--INPUT --OUTPUT --COMPRESSION_LEVEL --CREATE_INDEX --CREATE_MD5_FILE --GA4GH_CLIENT_SECRETS --MAX_RECORDS_IN_RAM --QUIET --REFERENCE_SEQUENCE --TMP_DIR --USE_JDK_DEFLATER --USE_JDK_INFLATER --VALIDATION_STRINGENCY --VERBOSITY --arguments_file --help --version --showHidden )
        ALL_ARGUMENT_VALUE_TYPES=("List[File]" "File" "int" "Boolean" "boolean" "String" "Integer" "Boolean" "File" "List[File]" "Boolean" "Boolean" "ValidationStringency" "LogLevel" "List[File]" "boolean" "boolean" "boolean" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "FilterVcf" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--INPUT --OUTPUT --COMPRESSION_LEVEL --CREATE_INDEX --CREATE_MD5_FILE --GA4GH_CLIENT_SECRETS --MAX_RECORDS_IN_RAM --QUIET --REFERENCE_SEQUENCE --TMP_DIR --USE_JDK_DEFLATER --USE_JDK_INFLATER --VALIDATION_STRINGENCY --VERBOSITY --arguments_file --help --JAVASCRIPT_FILE --MAX_FS --MIN_AB --MIN_DP --MIN_GQ --MIN_QD --version --showHidden )
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=("--INPUT;-I" "--OUTPUT;-O" "--REFERENCE_SEQUENCE;-R" "--USE_JDK_DEFLATER;-use_jdk_deflater" "--USE_JDK_INFLATER;-use_jdk_inflater" "--help;-h" "--JAVASCRIPT_FILE;-JS" "--showHidden;-showHidden" )
        MIN_OCCURRENCES=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--INPUT --OUTPUT --COMPRESSION_LEVEL --CREATE_INDEX --CREATE_MD5_FILE --GA4GH_CLIENT_SECRETS --MAX_RECORDS_IN_RAM --QUIET --REFERENCE_SEQUENCE --TMP_DIR --USE_JDK_DEFLATER --USE_JDK_INFLATER --VALIDATION_STRINGENCY --VERBOSITY --arguments_file --help --JAVASCRIPT_FILE --MAX_FS --MIN_AB --MIN_DP --MIN_GQ --MIN_QD --version --showHidden )
        ALL_ARGUMENT_VALUE_TYPES=("File" "File" "int" "Boolean" "boolean" "String" "Integer" "Boolean" "File" "List[File]" "Boolean" "Boolean" "ValidationStringency" "LogLevel" "List[File]" "boolean" "File" "double" "double" "int" "int" "double" "boolean" "boolean" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "FisherStrand" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=()
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=()
        MIN_OCCURRENCES=()
        MAX_OCCURRENCES=()
        ALL_LEGAL_ARGUMENTS=()
        ALL_ARGUMENT_VALUE_TYPES=()

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "ChromosomeCounts" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=()
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=()
        MIN_OCCURRENCES=()
        MAX_OCCURRENCES=()
        ALL_LEGAL_ARGUMENTS=()
        ALL_ARGUMENT_VALUE_TYPES=()

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "QualityScoreDistributionSpark" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--disable-read-filter --disable-tool-default-read-filters --exclude-intervals --gatk-config-file --input --interval-exclusion-padding --interval-padding --interval-set-rule --QUIET --read-filter --read-index --read-validation-stringency --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --alignedReadsOnly --arguments_file --bam-partition-size --chart --conf --disable-sequence-dictionary-validation --gcs-max-retries --help --includeNoCalls --interval-merging-rule --intervals --num-reducers --output --pfReadsOnly --program-name --reference --sharded-output --spark-master --version --showHidden )
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=("--disable-read-filter;-DF" "--disable-tool-default-read-filters;-disable-tool-default-read-filters" "--exclude-intervals;-XL" "--input;-I" "--interval-exclusion-padding;-ixp" "--interval-padding;-ip" "--interval-set-rule;-isr" "--read-filter;-RF" "--read-index;-read-index" "--read-validation-stringency;-VS" "--use-jdk-deflater;-jdk-deflater" "--use-jdk-inflater;-jdk-inflater" "--verbosity;-verbosity" "--alignedReadsOnly;-A" "--chart;-C" "--conf;-conf" "--disable-sequence-dictionary-validation;-disable-sequence-dictionary-validation" "--gcs-max-retries;-gcs-retries" "--help;-h" "--includeNoCalls;-NC" "--interval-merging-rule;-imr" "--intervals;-L" "--output;-O" "--pfReadsOnly;-F" "--reference;-R" "--showHidden;-showHidden" )
        MIN_OCCURRENCES=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--disable-read-filter --disable-tool-default-read-filters --exclude-intervals --gatk-config-file --input --interval-exclusion-padding --interval-padding --interval-set-rule --QUIET --read-filter --read-index --read-validation-stringency --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --alignedReadsOnly --arguments_file --bam-partition-size --chart --conf --disable-sequence-dictionary-validation --gcs-max-retries --help --includeNoCalls --interval-merging-rule --intervals --num-reducers --output --pfReadsOnly --program-name --reference --sharded-output --spark-master --version --showHidden )
        ALL_ARGUMENT_VALUE_TYPES=("List[String]" "boolean" "List[String]" "String" "List[String]" "int" "int" "IntervalSetRule" "Boolean" "List[String]" "List[String]" "ValidationStringency" "List[File]" "boolean" "boolean" "LogLevel" "boolean" "List[File]" "long" "File" "List[String]" "boolean" "int" "boolean" "boolean" "IntervalMergingRule" "List[String]" "int" "String" "boolean" "String" "String" "boolean" "String" "boolean" "boolean" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "GatherVcfs" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--INPUT --OUTPUT --COMPRESSION_LEVEL --CREATE_INDEX --CREATE_MD5_FILE --GA4GH_CLIENT_SECRETS --MAX_RECORDS_IN_RAM --QUIET --REFERENCE_SEQUENCE --TMP_DIR --USE_JDK_DEFLATER --USE_JDK_INFLATER --VALIDATION_STRINGENCY --VERBOSITY --arguments_file --help --version --showHidden )
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=("--INPUT;-I" "--OUTPUT;-O" "--REFERENCE_SEQUENCE;-R" "--USE_JDK_DEFLATER;-use_jdk_deflater" "--USE_JDK_INFLATER;-use_jdk_inflater" "--help;-h" "--showHidden;-showHidden" )
        MIN_OCCURRENCES=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--INPUT --OUTPUT --COMPRESSION_LEVEL --CREATE_INDEX --CREATE_MD5_FILE --GA4GH_CLIENT_SECRETS --MAX_RECORDS_IN_RAM --QUIET --REFERENCE_SEQUENCE --TMP_DIR --USE_JDK_DEFLATER --USE_JDK_INFLATER --VALIDATION_STRINGENCY --VERBOSITY --arguments_file --help --version --showHidden )
        ALL_ARGUMENT_VALUE_TYPES=("List[File]" "File" "int" "Boolean" "boolean" "String" "Integer" "Boolean" "File" "List[File]" "Boolean" "Boolean" "ValidationStringency" "LogLevel" "List[File]" "boolean" "boolean" "boolean" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "MatchingBasesAndQualsReadFilter" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=()
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=()
        MIN_OCCURRENCES=()
        MAX_OCCURRENCES=()
        ALL_LEGAL_ARGUMENTS=()
        ALL_ARGUMENT_VALUE_TYPES=()

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "PathSeqBwaSpark" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--microbe-bwa-image --microbe-fasta --disable-read-filter --disable-tool-default-read-filters --exclude-intervals --gatk-config-file --input --interval-exclusion-padding --interval-padding --interval-set-rule --QUIET --read-filter --read-index --read-validation-stringency --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --arguments_file --bam-partition-size --bwa-score-threshold --conf --disable-sequence-dictionary-validation --gcs-max-retries --help --interval-merging-rule --intervals --max-alternate-hits --microbe-min-seed-length --num-reducers --paired-input --paired-output --program-name --reference --sharded-output --spark-master --unpaired-input --unpaired-output --version --showHidden )
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=("--microbe-bwa-image;-MI" "--microbe-fasta;-MF" "--disable-read-filter;-DF" "--disable-tool-default-read-filters;-disable-tool-default-read-filters" "--exclude-intervals;-XL" "--input;-I" "--interval-exclusion-padding;-ixp" "--interval-padding;-ip" "--interval-set-rule;-isr" "--read-filter;-RF" "--read-index;-read-index" "--read-validation-stringency;-VS" "--use-jdk-deflater;-jdk-deflater" "--use-jdk-inflater;-jdk-inflater" "--verbosity;-verbosity" "--bwa-score-threshold;-bwa-score-threshold" "--conf;-conf" "--disable-sequence-dictionary-validation;-disable-sequence-dictionary-validation" "--gcs-max-retries;-gcs-retries" "--help;-h" "--interval-merging-rule;-imr" "--intervals;-L" "--max-alternate-hits;-max-alternate-hits" "--microbe-min-seed-length;-microbe-min-seed-length" "--paired-input;-PI" "--paired-output;-PO" "--reference;-R" "--unpaired-input;-UI" "--unpaired-output;-UO" "--showHidden;-showHidden" )
        MIN_OCCURRENCES=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--microbe-bwa-image --microbe-fasta --disable-read-filter --disable-tool-default-read-filters --exclude-intervals --gatk-config-file --input --interval-exclusion-padding --interval-padding --interval-set-rule --QUIET --read-filter --read-index --read-validation-stringency --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --arguments_file --bam-partition-size --bwa-score-threshold --conf --disable-sequence-dictionary-validation --gcs-max-retries --help --interval-merging-rule --intervals --max-alternate-hits --microbe-min-seed-length --num-reducers --paired-input --paired-output --program-name --reference --sharded-output --spark-master --unpaired-input --unpaired-output --version --showHidden )
        ALL_ARGUMENT_VALUE_TYPES=("String" "String" "List[String]" "boolean" "List[String]" "String" "List[String]" "int" "int" "IntervalSetRule" "Boolean" "List[String]" "List[String]" "ValidationStringency" "List[File]" "boolean" "boolean" "LogLevel" "List[File]" "long" "int" "List[String]" "boolean" "int" "boolean" "IntervalMergingRule" "List[String]" "int" "int" "int" "String" "String" "String" "String" "boolean" "String" "String" "String" "boolean" "boolean" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "RenameSampleInVcf" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--INPUT --NEW_SAMPLE_NAME --OUTPUT --COMPRESSION_LEVEL --CREATE_INDEX --CREATE_MD5_FILE --GA4GH_CLIENT_SECRETS --MAX_RECORDS_IN_RAM --QUIET --REFERENCE_SEQUENCE --TMP_DIR --USE_JDK_DEFLATER --USE_JDK_INFLATER --VALIDATION_STRINGENCY --VERBOSITY --arguments_file --help --OLD_SAMPLE_NAME --version --showHidden )
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=("--INPUT;-I" "--OUTPUT;-O" "--REFERENCE_SEQUENCE;-R" "--USE_JDK_DEFLATER;-use_jdk_deflater" "--USE_JDK_INFLATER;-use_jdk_inflater" "--help;-h" "--showHidden;-showHidden" )
        MIN_OCCURRENCES=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--INPUT --NEW_SAMPLE_NAME --OUTPUT --COMPRESSION_LEVEL --CREATE_INDEX --CREATE_MD5_FILE --GA4GH_CLIENT_SECRETS --MAX_RECORDS_IN_RAM --QUIET --REFERENCE_SEQUENCE --TMP_DIR --USE_JDK_DEFLATER --USE_JDK_INFLATER --VALIDATION_STRINGENCY --VERBOSITY --arguments_file --help --OLD_SAMPLE_NAME --version --showHidden )
        ALL_ARGUMENT_VALUE_TYPES=("File" "String" "File" "int" "Boolean" "boolean" "String" "Integer" "Boolean" "File" "List[File]" "Boolean" "Boolean" "ValidationStringency" "LogLevel" "List[File]" "boolean" "String" "boolean" "boolean" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "CountVariants" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--variant --add-output-sam-program-record --add-output-vcf-command-line --create-output-bam-index --create-output-bam-md5 --create-output-variant-index --create-output-variant-md5 --disable-read-filter --disable-sequence-dictionary-validation --disable-tool-default-read-filters --exclude-intervals --gatk-config-file --input --interval-exclusion-padding --interval-padding --interval-set-rule --lenient --QUIET --read-filter --read-index --read-validation-stringency --seconds-between-progress-updates --sequence-dictionary --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --arguments_file --cloud-index-prefetch-buffer --cloud-prefetch-buffer --disable-bam-index-caching --gcs-max-retries --help --interval-merging-rule --intervals --reference --version --showHidden )
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=("--variant;-V" "--add-output-sam-program-record;-add-output-sam-program-record" "--add-output-vcf-command-line;-add-output-vcf-command-line" "--create-output-bam-index;-OBI" "--create-output-bam-md5;-OBM" "--create-output-variant-index;-OVI" "--create-output-variant-md5;-OVM" "--disable-read-filter;-DF" "--disable-sequence-dictionary-validation;-disable-sequence-dictionary-validation" "--disable-tool-default-read-filters;-disable-tool-default-read-filters" "--exclude-intervals;-XL" "--input;-I" "--interval-exclusion-padding;-ixp" "--interval-padding;-ip" "--interval-set-rule;-isr" "--lenient;-LE" "--read-filter;-RF" "--read-index;-read-index" "--read-validation-stringency;-VS" "--seconds-between-progress-updates;-seconds-between-progress-updates" "--sequence-dictionary;-sequence-dictionary" "--use-jdk-deflater;-jdk-deflater" "--use-jdk-inflater;-jdk-inflater" "--verbosity;-verbosity" "--cloud-index-prefetch-buffer;-CIPB" "--cloud-prefetch-buffer;-CPB" "--disable-bam-index-caching;-DBIC" "--gcs-max-retries;-gcs-retries" "--help;-h" "--interval-merging-rule;-imr" "--intervals;-L" "--reference;-R" "--showHidden;-showHidden" )
        MIN_OCCURRENCES=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--variant --add-output-sam-program-record --add-output-vcf-command-line --create-output-bam-index --create-output-bam-md5 --create-output-variant-index --create-output-variant-md5 --disable-read-filter --disable-sequence-dictionary-validation --disable-tool-default-read-filters --exclude-intervals --gatk-config-file --input --interval-exclusion-padding --interval-padding --interval-set-rule --lenient --QUIET --read-filter --read-index --read-validation-stringency --seconds-between-progress-updates --sequence-dictionary --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --arguments_file --cloud-index-prefetch-buffer --cloud-prefetch-buffer --disable-bam-index-caching --gcs-max-retries --help --interval-merging-rule --intervals --reference --version --showHidden )
        ALL_ARGUMENT_VALUE_TYPES=("String" "boolean" "boolean" "boolean" "boolean" "boolean" "boolean" "List[String]" "boolean" "boolean" "List[String]" "String" "List[String]" "int" "int" "IntervalSetRule" "boolean" "Boolean" "List[String]" "List[String]" "ValidationStringency" "double" "String" "List[File]" "boolean" "boolean" "LogLevel" "List[File]" "int" "int" "boolean" "int" "boolean" "IntervalMergingRule" "List[String]" "String" "boolean" "boolean" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "DownsampleSam" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--INPUT --OUTPUT --COMPRESSION_LEVEL --CREATE_INDEX --CREATE_MD5_FILE --GA4GH_CLIENT_SECRETS --MAX_RECORDS_IN_RAM --QUIET --TMP_DIR --USE_JDK_DEFLATER --USE_JDK_INFLATER --VALIDATION_STRINGENCY --VERBOSITY --ACCURACY --arguments_file --help --METRICS_FILE --PROBABILITY --RANDOM_SEED --REFERENCE_SEQUENCE --STRATEGY --version --showHidden )
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=("--INPUT;-I" "--OUTPUT;-O" "--USE_JDK_DEFLATER;-use_jdk_deflater" "--USE_JDK_INFLATER;-use_jdk_inflater" "--ACCURACY;-A" "--help;-h" "--METRICS_FILE;-M" "--PROBABILITY;-P" "--RANDOM_SEED;-R" "--STRATEGY;-S" "--showHidden;-showHidden" )
        MIN_OCCURRENCES=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--INPUT --OUTPUT --COMPRESSION_LEVEL --CREATE_INDEX --CREATE_MD5_FILE --GA4GH_CLIENT_SECRETS --MAX_RECORDS_IN_RAM --QUIET --TMP_DIR --USE_JDK_DEFLATER --USE_JDK_INFLATER --VALIDATION_STRINGENCY --VERBOSITY --ACCURACY --arguments_file --help --METRICS_FILE --PROBABILITY --RANDOM_SEED --REFERENCE_SEQUENCE --STRATEGY --version --showHidden )
        ALL_ARGUMENT_VALUE_TYPES=("File" "File" "int" "Boolean" "boolean" "String" "Integer" "Boolean" "List[File]" "Boolean" "Boolean" "ValidationStringency" "LogLevel" "double" "List[File]" "boolean" "File" "double" "Integer" "File" "Strategy" "boolean" "boolean" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "CollectHiSeqXPfFailMetrics" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--BASECALLS_DIR --LANE --OUTPUT --COMPRESSION_LEVEL --CREATE_INDEX --CREATE_MD5_FILE --GA4GH_CLIENT_SECRETS --MAX_RECORDS_IN_RAM --QUIET --REFERENCE_SEQUENCE --TMP_DIR --USE_JDK_DEFLATER --USE_JDK_INFLATER --VALIDATION_STRINGENCY --VERBOSITY --arguments_file --help --N_CYCLES --NUM_PROCESSORS --PROB_EXPLICIT_READS --version --showHidden )
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=("--BASECALLS_DIR;-B" "--LANE;-L" "--OUTPUT;-O" "--REFERENCE_SEQUENCE;-R" "--USE_JDK_DEFLATER;-use_jdk_deflater" "--USE_JDK_INFLATER;-use_jdk_inflater" "--help;-h" "--NUM_PROCESSORS;-NP" "--PROB_EXPLICIT_READS;-P" "--showHidden;-showHidden" )
        MIN_OCCURRENCES=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--BASECALLS_DIR --LANE --OUTPUT --COMPRESSION_LEVEL --CREATE_INDEX --CREATE_MD5_FILE --GA4GH_CLIENT_SECRETS --MAX_RECORDS_IN_RAM --QUIET --REFERENCE_SEQUENCE --TMP_DIR --USE_JDK_DEFLATER --USE_JDK_INFLATER --VALIDATION_STRINGENCY --VERBOSITY --arguments_file --help --N_CYCLES --NUM_PROCESSORS --PROB_EXPLICIT_READS --version --showHidden )
        ALL_ARGUMENT_VALUE_TYPES=("File" "Integer" "File" "int" "Boolean" "boolean" "String" "Integer" "Boolean" "File" "List[File]" "Boolean" "Boolean" "ValidationStringency" "LogLevel" "List[File]" "boolean" "int" "int" "double" "boolean" "boolean" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "RMSMappingQuality" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=()
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=()
        MIN_OCCURRENCES=()
        MAX_OCCURRENCES=()
        ALL_LEGAL_ARGUMENTS=()
        ALL_ARGUMENT_VALUE_TYPES=()

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "MappingQualityReadFilter" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--maximum-mapping-quality --minimum-mapping-quality )
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=()
        MIN_OCCURRENCES=(0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--maximum-mapping-quality --minimum-mapping-quality )
        ALL_ARGUMENT_VALUE_TYPES=("Integer" "int" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "MappingQualityZero" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=()
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=()
        MIN_OCCURRENCES=()
        MAX_OCCURRENCES=()
        ALL_LEGAL_ARGUMENTS=()
        ALL_ARGUMENT_VALUE_TYPES=()

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "IntervalListToBed" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--INPUT --OUTPUT --COMPRESSION_LEVEL --CREATE_INDEX --CREATE_MD5_FILE --GA4GH_CLIENT_SECRETS --MAX_RECORDS_IN_RAM --QUIET --REFERENCE_SEQUENCE --TMP_DIR --USE_JDK_DEFLATER --USE_JDK_INFLATER --VALIDATION_STRINGENCY --VERBOSITY --arguments_file --help --SCORE --SORT --version --showHidden )
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=("--INPUT;-I" "--OUTPUT;-O" "--REFERENCE_SEQUENCE;-R" "--USE_JDK_DEFLATER;-use_jdk_deflater" "--USE_JDK_INFLATER;-use_jdk_inflater" "--help;-h" "--showHidden;-showHidden" )
        MIN_OCCURRENCES=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--INPUT --OUTPUT --COMPRESSION_LEVEL --CREATE_INDEX --CREATE_MD5_FILE --GA4GH_CLIENT_SECRETS --MAX_RECORDS_IN_RAM --QUIET --REFERENCE_SEQUENCE --TMP_DIR --USE_JDK_DEFLATER --USE_JDK_INFLATER --VALIDATION_STRINGENCY --VERBOSITY --arguments_file --help --SCORE --SORT --version --showHidden )
        ALL_ARGUMENT_VALUE_TYPES=("File" "File" "int" "Boolean" "boolean" "String" "Integer" "Boolean" "File" "List[File]" "Boolean" "Boolean" "ValidationStringency" "LogLevel" "List[File]" "boolean" "int" "boolean" "boolean" "boolean" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "CollectJumpingLibraryMetrics" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--INPUT --OUTPUT --COMPRESSION_LEVEL --CREATE_INDEX --CREATE_MD5_FILE --GA4GH_CLIENT_SECRETS --MAX_RECORDS_IN_RAM --QUIET --REFERENCE_SEQUENCE --TMP_DIR --USE_JDK_DEFLATER --USE_JDK_INFLATER --VALIDATION_STRINGENCY --VERBOSITY --arguments_file --CHIMERA_KB_MIN --help --MINIMUM_MAPPING_QUALITY --TAIL_LIMIT --version --showHidden )
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=("--INPUT;-I" "--OUTPUT;-O" "--REFERENCE_SEQUENCE;-R" "--USE_JDK_DEFLATER;-use_jdk_deflater" "--USE_JDK_INFLATER;-use_jdk_inflater" "--help;-h" "--MINIMUM_MAPPING_QUALITY;-MQ" "--TAIL_LIMIT;-T" "--showHidden;-showHidden" )
        MIN_OCCURRENCES=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--INPUT --OUTPUT --COMPRESSION_LEVEL --CREATE_INDEX --CREATE_MD5_FILE --GA4GH_CLIENT_SECRETS --MAX_RECORDS_IN_RAM --QUIET --REFERENCE_SEQUENCE --TMP_DIR --USE_JDK_DEFLATER --USE_JDK_INFLATER --VALIDATION_STRINGENCY --VERBOSITY --arguments_file --CHIMERA_KB_MIN --help --MINIMUM_MAPPING_QUALITY --TAIL_LIMIT --version --showHidden )
        ALL_ARGUMENT_VALUE_TYPES=("List[File]" "File" "int" "Boolean" "boolean" "String" "Integer" "Boolean" "File" "List[File]" "Boolean" "Boolean" "ValidationStringency" "LogLevel" "List[File]" "int" "boolean" "Integer" "int" "boolean" "boolean" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "ExtractSequences" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--INTERVAL_LIST --OUTPUT --REFERENCE_SEQUENCE --COMPRESSION_LEVEL --CREATE_INDEX --CREATE_MD5_FILE --GA4GH_CLIENT_SECRETS --MAX_RECORDS_IN_RAM --QUIET --TMP_DIR --USE_JDK_DEFLATER --USE_JDK_INFLATER --VALIDATION_STRINGENCY --VERBOSITY --arguments_file --help --LINE_LENGTH --version --showHidden )
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=("--OUTPUT;-O" "--REFERENCE_SEQUENCE;-R" "--USE_JDK_DEFLATER;-use_jdk_deflater" "--USE_JDK_INFLATER;-use_jdk_inflater" "--help;-h" "--showHidden;-showHidden" )
        MIN_OCCURRENCES=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--INTERVAL_LIST --OUTPUT --REFERENCE_SEQUENCE --COMPRESSION_LEVEL --CREATE_INDEX --CREATE_MD5_FILE --GA4GH_CLIENT_SECRETS --MAX_RECORDS_IN_RAM --QUIET --TMP_DIR --USE_JDK_DEFLATER --USE_JDK_INFLATER --VALIDATION_STRINGENCY --VERBOSITY --arguments_file --help --LINE_LENGTH --version --showHidden )
        ALL_ARGUMENT_VALUE_TYPES=("File" "File" "File" "int" "Boolean" "boolean" "String" "Integer" "Boolean" "List[File]" "Boolean" "Boolean" "ValidationStringency" "LogLevel" "List[File]" "boolean" "int" "boolean" "boolean" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "ReadLengthEqualsCigarLengthReadFilter" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=()
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=()
        MIN_OCCURRENCES=()
        MAX_OCCURRENCES=()
        ALL_LEGAL_ARGUMENTS=()
        ALL_ARGUMENT_VALUE_TYPES=()

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "FirstOfPairReadFilter" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=()
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=()
        MIN_OCCURRENCES=()
        MAX_OCCURRENCES=()
        ALL_LEGAL_ARGUMENTS=()
        ALL_ARGUMENT_VALUE_TYPES=()

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "ReplaceSamHeader" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--HEADER --INPUT --OUTPUT --COMPRESSION_LEVEL --CREATE_INDEX --CREATE_MD5_FILE --GA4GH_CLIENT_SECRETS --MAX_RECORDS_IN_RAM --QUIET --REFERENCE_SEQUENCE --TMP_DIR --USE_JDK_DEFLATER --USE_JDK_INFLATER --VALIDATION_STRINGENCY --VERBOSITY --arguments_file --help --version --showHidden )
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=("--INPUT;-I" "--OUTPUT;-O" "--REFERENCE_SEQUENCE;-R" "--USE_JDK_DEFLATER;-use_jdk_deflater" "--USE_JDK_INFLATER;-use_jdk_inflater" "--help;-h" "--showHidden;-showHidden" )
        MIN_OCCURRENCES=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--HEADER --INPUT --OUTPUT --COMPRESSION_LEVEL --CREATE_INDEX --CREATE_MD5_FILE --GA4GH_CLIENT_SECRETS --MAX_RECORDS_IN_RAM --QUIET --REFERENCE_SEQUENCE --TMP_DIR --USE_JDK_DEFLATER --USE_JDK_INFLATER --VALIDATION_STRINGENCY --VERBOSITY --arguments_file --help --version --showHidden )
        ALL_ARGUMENT_VALUE_TYPES=("File" "File" "File" "int" "Boolean" "boolean" "String" "Integer" "Boolean" "File" "List[File]" "Boolean" "Boolean" "ValidationStringency" "LogLevel" "List[File]" "boolean" "boolean" "boolean" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "Mutect2" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--input --output --reference --tumor-sample --add-output-sam-program-record --add-output-vcf-command-line --create-output-bam-index --create-output-bam-md5 --create-output-variant-index --create-output-variant-md5 --disable-read-filter --disable-sequence-dictionary-validation --disable-tool-default-read-filters --exclude-intervals --gatk-config-file --interval-exclusion-padding --interval-padding --interval-set-rule --lenient --QUIET --read-filter --read-index --read-validation-stringency --seconds-between-progress-updates --sequence-dictionary --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --activity-profile-out --af-of-alleles-not-in-resource --alleles --annotate-with-num-discovered-alleles --annotation --annotation-group --annotations-to-exclude --arguments_file --assembly-region-out --base-quality-score-threshold --cloud-index-prefetch-buffer --cloud-prefetch-buffer --contamination-fraction-to-filter --disable-bam-index-caching --disable-tool-default-annotations --downsampling-stride --gcs-max-retries --genotype-pon-sites --genotyping-mode --germline-resource --graph-output --help --heterozygosity --heterozygosity-stdev --indel-heterozygosity --initial-tumor-lod --interval-merging-rule --intervals --log-somatic-prior --max-population-af --max-reads-per-alignment-start --min-base-quality-score --native-pair-hmm-threads --native-pair-hmm-use-double-precision --normal-lod --normal-sample --output-mode --panel-of-normals --sample-ploidy --standard-min-confidence-threshold-for-calling --tumor-lod-to-emit --use-new-qual-calculator --version --active-probability-threshold --allow-non-unique-kmers-in-ref --all-site-pls --assembly-region-padding --bam-output --bam-writer-type --consensus --contamination-fraction-per-sample-file --debug --do-not-run-physical-phasing --dont-increase-kmer-sizes-for-cycles --dont-trim-active-regions --dont-use-soft-clipped-bases --input-prior --kmer-size --max-alternate-alleles --max-assembly-region-size --max-genotype-count --max-num-haplotypes-in-population --max-prob-propagation-distance --max-suspicious-reads-per-alignment-start --min-assembly-region-size --min-dangling-branch-length --min-pruning --num-pruning-samples --pair-hmm-gap-continuation-penalty --pcr-indel-model --phred-scaled-global-read-mismapping-rate --showHidden --smith-waterman --use-filtered-reads-for-annotations --recover-dangling-heads )
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=("--input;-I" "--output;-O" "--reference;-R" "--tumor-sample;-tumor" "--add-output-sam-program-record;-add-output-sam-program-record" "--add-output-vcf-command-line;-add-output-vcf-command-line" "--create-output-bam-index;-OBI" "--create-output-bam-md5;-OBM" "--create-output-variant-index;-OVI" "--create-output-variant-md5;-OVM" "--disable-read-filter;-DF" "--disable-sequence-dictionary-validation;-disable-sequence-dictionary-validation" "--disable-tool-default-read-filters;-disable-tool-default-read-filters" "--exclude-intervals;-XL" "--interval-exclusion-padding;-ixp" "--interval-padding;-ip" "--interval-set-rule;-isr" "--lenient;-LE" "--read-filter;-RF" "--read-index;-read-index" "--read-validation-stringency;-VS" "--seconds-between-progress-updates;-seconds-between-progress-updates" "--sequence-dictionary;-sequence-dictionary" "--use-jdk-deflater;-jdk-deflater" "--use-jdk-inflater;-jdk-inflater" "--verbosity;-verbosity" "--af-of-alleles-not-in-resource;-default-af" "--annotation;-A" "--annotation-group;-G" "--annotations-to-exclude;-AX" "--cloud-index-prefetch-buffer;-CIPB" "--cloud-prefetch-buffer;-CPB" "--contamination-fraction-to-filter;-contamination" "--disable-bam-index-caching;-DBIC" "--disable-tool-default-annotations;-disable-tool-default-annotations" "--downsampling-stride;-stride" "--gcs-max-retries;-gcs-retries" "--graph-output;-graph" "--help;-h" "--initial-tumor-lod;-init-lod" "--interval-merging-rule;-imr" "--intervals;-L" "--max-population-af;-max-af" "--min-base-quality-score;-mbq" "--normal-sample;-normal" "--panel-of-normals;-pon" "--sample-ploidy;-ploidy" "--standard-min-confidence-threshold-for-calling;-stand-call-conf" "--tumor-lod-to-emit;-emit-lod" "--use-new-qual-calculator;-new-qual" "--bam-output;-bamout" "--contamination-fraction-per-sample-file;-contamination-file" "--debug;-debug" "--showHidden;-showHidden" )
        MIN_OCCURRENCES=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--input --output --reference --tumor-sample --add-output-sam-program-record --add-output-vcf-command-line --create-output-bam-index --create-output-bam-md5 --create-output-variant-index --create-output-variant-md5 --disable-read-filter --disable-sequence-dictionary-validation --disable-tool-default-read-filters --exclude-intervals --gatk-config-file --interval-exclusion-padding --interval-padding --interval-set-rule --lenient --QUIET --read-filter --read-index --read-validation-stringency --seconds-between-progress-updates --sequence-dictionary --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --activity-profile-out --af-of-alleles-not-in-resource --alleles --annotate-with-num-discovered-alleles --annotation --annotation-group --annotations-to-exclude --arguments_file --assembly-region-out --base-quality-score-threshold --cloud-index-prefetch-buffer --cloud-prefetch-buffer --contamination-fraction-to-filter --disable-bam-index-caching --disable-tool-default-annotations --downsampling-stride --gcs-max-retries --genotype-pon-sites --genotyping-mode --germline-resource --graph-output --help --heterozygosity --heterozygosity-stdev --indel-heterozygosity --initial-tumor-lod --interval-merging-rule --intervals --log-somatic-prior --max-population-af --max-reads-per-alignment-start --min-base-quality-score --native-pair-hmm-threads --native-pair-hmm-use-double-precision --normal-lod --normal-sample --output-mode --panel-of-normals --sample-ploidy --standard-min-confidence-threshold-for-calling --tumor-lod-to-emit --use-new-qual-calculator --version --active-probability-threshold --allow-non-unique-kmers-in-ref --all-site-pls --assembly-region-padding --bam-output --bam-writer-type --consensus --contamination-fraction-per-sample-file --debug --do-not-run-physical-phasing --dont-increase-kmer-sizes-for-cycles --dont-trim-active-regions --dont-use-soft-clipped-bases --input-prior --kmer-size --max-alternate-alleles --max-assembly-region-size --max-genotype-count --max-num-haplotypes-in-population --max-prob-propagation-distance --max-suspicious-reads-per-alignment-start --min-assembly-region-size --min-dangling-branch-length --min-pruning --num-pruning-samples --pair-hmm-gap-continuation-penalty --pcr-indel-model --phred-scaled-global-read-mismapping-rate --showHidden --smith-waterman --use-filtered-reads-for-annotations --recover-dangling-heads )
        ALL_ARGUMENT_VALUE_TYPES=("List[String]" "File" "String" "String" "boolean" "boolean" "boolean" "boolean" "boolean" "boolean" "List[String]" "boolean" "boolean" "List[String]" "String" "int" "int" "IntervalSetRule" "boolean" "Boolean" "List[String]" "List[String]" "ValidationStringency" "double" "String" "List[File]" "boolean" "boolean" "LogLevel" "String" "double" "FeatureInput[VariantContext]" "boolean" "List[String]" "List[String]" "List[String]" "List[File]" "String" "byte" "int" "int" "double" "boolean" "boolean" "int" "int" "boolean" "GenotypingOutputMode" "FeatureInput[VariantContext]" "String" "boolean" "Double" "double" "double" "double" "IntervalMergingRule" "List[String]" "double" "double" "int" "byte" "int" "boolean" "double" "String" "OutputMode" "FeatureInput[VariantContext]" "int" "double" "double" "boolean" "boolean" "double" "boolean" "boolean" "int" "String" "WriterType" "boolean" "File" "boolean" "boolean" "boolean" "boolean" "boolean" "List[Double]" "List[Integer]" "int" "int" "int" "int" "int" "int" "int" "int" "int" "int" "int" "PCRErrorModel" "int" "boolean" "Implementation" "boolean" "boolean" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "CollectQualityYieldMetricsSpark" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--input --output --disable-read-filter --disable-tool-default-read-filters --exclude-intervals --gatk-config-file --interval-exclusion-padding --interval-padding --interval-set-rule --QUIET --read-filter --read-index --read-validation-stringency --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --arguments_file --bam-partition-size --conf --disable-sequence-dictionary-validation --gcs-max-retries --help --interval-merging-rule --intervals --num-reducers --program-name --reference --sharded-output --spark-master --use-original-qualities --version --showHidden )
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=("--input;-I" "--output;-O" "--disable-read-filter;-DF" "--disable-tool-default-read-filters;-disable-tool-default-read-filters" "--exclude-intervals;-XL" "--interval-exclusion-padding;-ixp" "--interval-padding;-ip" "--interval-set-rule;-isr" "--read-filter;-RF" "--read-index;-read-index" "--read-validation-stringency;-VS" "--use-jdk-deflater;-jdk-deflater" "--use-jdk-inflater;-jdk-inflater" "--verbosity;-verbosity" "--conf;-conf" "--disable-sequence-dictionary-validation;-disable-sequence-dictionary-validation" "--gcs-max-retries;-gcs-retries" "--help;-h" "--interval-merging-rule;-imr" "--intervals;-L" "--reference;-R" "--use-original-qualities;-OQ" "--showHidden;-showHidden" )
        MIN_OCCURRENCES=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--input --output --disable-read-filter --disable-tool-default-read-filters --exclude-intervals --gatk-config-file --interval-exclusion-padding --interval-padding --interval-set-rule --QUIET --read-filter --read-index --read-validation-stringency --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --arguments_file --bam-partition-size --conf --disable-sequence-dictionary-validation --gcs-max-retries --help --interval-merging-rule --intervals --num-reducers --program-name --reference --sharded-output --spark-master --use-original-qualities --version --showHidden )
        ALL_ARGUMENT_VALUE_TYPES=("List[String]" "String" "List[String]" "boolean" "List[String]" "String" "int" "int" "IntervalSetRule" "Boolean" "List[String]" "List[String]" "ValidationStringency" "List[File]" "boolean" "boolean" "LogLevel" "List[File]" "long" "List[String]" "boolean" "int" "boolean" "IntervalMergingRule" "List[String]" "int" "String" "String" "boolean" "String" "boolean" "boolean" "boolean" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "Concordance" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--evaluation --summary --truth --add-output-sam-program-record --add-output-vcf-command-line --create-output-bam-index --create-output-bam-md5 --create-output-variant-index --create-output-variant-md5 --disable-read-filter --disable-sequence-dictionary-validation --disable-tool-default-read-filters --exclude-intervals --gatk-config-file --input --interval-exclusion-padding --interval-padding --interval-set-rule --lenient --QUIET --read-filter --read-index --read-validation-stringency --seconds-between-progress-updates --sequence-dictionary --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --arguments_file --cloud-index-prefetch-buffer --cloud-prefetch-buffer --confidence --disable-bam-index-caching --filtered-true-negatives-and-false-negatives --gcs-max-retries --help --interval-merging-rule --intervals --reference --true-positives-and-false-negatives --true-positives-and-false-positives --version --showHidden )
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=("--evaluation;-eval" "--summary;-S" "--truth;-truth" "--add-output-sam-program-record;-add-output-sam-program-record" "--add-output-vcf-command-line;-add-output-vcf-command-line" "--create-output-bam-index;-OBI" "--create-output-bam-md5;-OBM" "--create-output-variant-index;-OVI" "--create-output-variant-md5;-OVM" "--disable-read-filter;-DF" "--disable-sequence-dictionary-validation;-disable-sequence-dictionary-validation" "--disable-tool-default-read-filters;-disable-tool-default-read-filters" "--exclude-intervals;-XL" "--input;-I" "--interval-exclusion-padding;-ixp" "--interval-padding;-ip" "--interval-set-rule;-isr" "--lenient;-LE" "--read-filter;-RF" "--read-index;-read-index" "--read-validation-stringency;-VS" "--seconds-between-progress-updates;-seconds-between-progress-updates" "--sequence-dictionary;-sequence-dictionary" "--use-jdk-deflater;-jdk-deflater" "--use-jdk-inflater;-jdk-inflater" "--verbosity;-verbosity" "--cloud-index-prefetch-buffer;-CIPB" "--cloud-prefetch-buffer;-CPB" "--confidence;-C" "--disable-bam-index-caching;-DBIC" "--filtered-true-negatives-and-false-negatives;-ftnfn" "--gcs-max-retries;-gcs-retries" "--help;-h" "--interval-merging-rule;-imr" "--intervals;-L" "--reference;-R" "--true-positives-and-false-negatives;-tpfn" "--true-positives-and-false-positives;-tpfp" "--showHidden;-showHidden" )
        MIN_OCCURRENCES=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--evaluation --summary --truth --add-output-sam-program-record --add-output-vcf-command-line --create-output-bam-index --create-output-bam-md5 --create-output-variant-index --create-output-variant-md5 --disable-read-filter --disable-sequence-dictionary-validation --disable-tool-default-read-filters --exclude-intervals --gatk-config-file --input --interval-exclusion-padding --interval-padding --interval-set-rule --lenient --QUIET --read-filter --read-index --read-validation-stringency --seconds-between-progress-updates --sequence-dictionary --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --arguments_file --cloud-index-prefetch-buffer --cloud-prefetch-buffer --confidence --disable-bam-index-caching --filtered-true-negatives-and-false-negatives --gcs-max-retries --help --interval-merging-rule --intervals --reference --true-positives-and-false-negatives --true-positives-and-false-positives --version --showHidden )
        ALL_ARGUMENT_VALUE_TYPES=("String" "File" "String" "boolean" "boolean" "boolean" "boolean" "boolean" "boolean" "List[String]" "boolean" "boolean" "List[String]" "String" "List[String]" "int" "int" "IntervalSetRule" "boolean" "Boolean" "List[String]" "List[String]" "ValidationStringency" "double" "String" "List[File]" "boolean" "boolean" "LogLevel" "List[File]" "int" "int" "File" "boolean" "File" "int" "boolean" "IntervalMergingRule" "List[String]" "String" "File" "File" "boolean" "boolean" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "AS_FisherStrand" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=()
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=()
        MIN_OCCURRENCES=()
        MAX_OCCURRENCES=()
        ALL_LEGAL_ARGUMENTS=()
        ALL_ARGUMENT_VALUE_TYPES=()

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "ScatterIntervalsByNs" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--OUTPUT --REFERENCE --COMPRESSION_LEVEL --CREATE_INDEX --CREATE_MD5_FILE --GA4GH_CLIENT_SECRETS --MAX_RECORDS_IN_RAM --QUIET --TMP_DIR --USE_JDK_DEFLATER --USE_JDK_INFLATER --VALIDATION_STRINGENCY --VERBOSITY --arguments_file --help --MAX_TO_MERGE --OUTPUT_TYPE --version --showHidden )
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=("--OUTPUT;-O" "--REFERENCE;-R" "--USE_JDK_DEFLATER;-use_jdk_deflater" "--USE_JDK_INFLATER;-use_jdk_inflater" "--help;-h" "--MAX_TO_MERGE;-N" "--OUTPUT_TYPE;-OT" "--showHidden;-showHidden" )
        MIN_OCCURRENCES=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--OUTPUT --REFERENCE --COMPRESSION_LEVEL --CREATE_INDEX --CREATE_MD5_FILE --GA4GH_CLIENT_SECRETS --MAX_RECORDS_IN_RAM --QUIET --TMP_DIR --USE_JDK_DEFLATER --USE_JDK_INFLATER --VALIDATION_STRINGENCY --VERBOSITY --arguments_file --help --MAX_TO_MERGE --OUTPUT_TYPE --version --showHidden )
        ALL_ARGUMENT_VALUE_TYPES=("File" "File" "int" "Boolean" "boolean" "String" "Integer" "Boolean" "List[File]" "Boolean" "Boolean" "ValidationStringency" "LogLevel" "List[File]" "boolean" "int" "OutputType" "boolean" "boolean" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "AS_ReadPosRankSumTest" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=()
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=()
        MIN_OCCURRENCES=()
        MAX_OCCURRENCES=()
        ALL_LEGAL_ARGUMENTS=()
        ALL_ARGUMENT_VALUE_TYPES=()

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "MergeBamAlignment" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--OUTPUT --REFERENCE_SEQUENCE --UNMAPPED_BAM --ADD_PG_TAG_TO_READS --COMPRESSION_LEVEL --CREATE_INDEX --CREATE_MD5_FILE --GA4GH_CLIENT_SECRETS --MAX_RECORDS_IN_RAM --QUIET --TMP_DIR --USE_JDK_DEFLATER --USE_JDK_INFLATER --VALIDATION_STRINGENCY --VERBOSITY --ADD_MATE_CIGAR --ALIGNED_BAM --ALIGNED_READS_ONLY --ALIGNER_PROPER_PAIR_FLAGS --arguments_file --ATTRIBUTES_TO_REMOVE --ATTRIBUTES_TO_RETAIN --ATTRIBUTES_TO_REVERSE --ATTRIBUTES_TO_REVERSE_COMPLEMENT --CLIP_ADAPTERS --CLIP_OVERLAPPING_READS --EXPECTED_ORIENTATIONS --help --INCLUDE_SECONDARY_ALIGNMENTS --IS_BISULFITE_SEQUENCE --MATCHING_DICTIONARY_TAGS --MAX_INSERTIONS_OR_DELETIONS --MIN_UNCLIPPED_BASES --PRIMARY_ALIGNMENT_STRATEGY --PROGRAM_GROUP_COMMAND_LINE --PROGRAM_GROUP_NAME --PROGRAM_GROUP_VERSION --PROGRAM_RECORD_ID --READ1_ALIGNED_BAM --READ1_TRIM --READ2_ALIGNED_BAM --READ2_TRIM --SORT_ORDER --UNMAP_CONTAMINANT_READS --UNMAPPED_READ_STRATEGY --version --showHidden --JUMP_SIZE --PAIRED_RUN )
        MUTUALLY_EXCLUSIVE_ARGS=("--ALIGNED_BAM;READ1_ALIGNED_BAM,READ2_ALIGNED_BAM,R1_ALIGNED,R2_ALIGNED" "--EXPECTED_ORIENTATIONS;JUMP_SIZE" "--READ1_ALIGNED_BAM;ALIGNED_BAM" "--READ2_ALIGNED_BAM;ALIGNED_BAM" "--JUMP_SIZE;EXPECTED_ORIENTATIONS,ORIENTATIONS" )
        SYNONYMOUS_ARGS=("--OUTPUT;-O" "--REFERENCE_SEQUENCE;-R" "--UNMAPPED_BAM;-UNMAPPED" "--USE_JDK_DEFLATER;-use_jdk_deflater" "--USE_JDK_INFLATER;-use_jdk_inflater" "--ADD_MATE_CIGAR;-MC" "--ALIGNED_BAM;-ALIGNED" "--ATTRIBUTES_TO_REVERSE;-RV" "--ATTRIBUTES_TO_REVERSE_COMPLEMENT;-RC" "--EXPECTED_ORIENTATIONS;-ORIENTATIONS" "--help;-h" "--MAX_INSERTIONS_OR_DELETIONS;-MAX_GAPS" "--PROGRAM_GROUP_COMMAND_LINE;-PG_COMMAND" "--PROGRAM_GROUP_NAME;-PG_NAME" "--PROGRAM_GROUP_VERSION;-PG_VERSION" "--PROGRAM_RECORD_ID;-PG" "--READ1_ALIGNED_BAM;-R1_ALIGNED" "--READ1_TRIM;-R1_TRIM" "--READ2_ALIGNED_BAM;-R2_ALIGNED" "--READ2_TRIM;-R2_TRIM" "--SORT_ORDER;-SO" "--UNMAP_CONTAMINANT_READS;-UNMAP_CONTAM" "--showHidden;-showHidden" "--JUMP_SIZE;-JUMP" "--PAIRED_RUN;-PE" )
        MIN_OCCURRENCES=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--OUTPUT --REFERENCE_SEQUENCE --UNMAPPED_BAM --ADD_PG_TAG_TO_READS --COMPRESSION_LEVEL --CREATE_INDEX --CREATE_MD5_FILE --GA4GH_CLIENT_SECRETS --MAX_RECORDS_IN_RAM --QUIET --TMP_DIR --USE_JDK_DEFLATER --USE_JDK_INFLATER --VALIDATION_STRINGENCY --VERBOSITY --ADD_MATE_CIGAR --ALIGNED_BAM --ALIGNED_READS_ONLY --ALIGNER_PROPER_PAIR_FLAGS --arguments_file --ATTRIBUTES_TO_REMOVE --ATTRIBUTES_TO_RETAIN --ATTRIBUTES_TO_REVERSE --ATTRIBUTES_TO_REVERSE_COMPLEMENT --CLIP_ADAPTERS --CLIP_OVERLAPPING_READS --EXPECTED_ORIENTATIONS --help --INCLUDE_SECONDARY_ALIGNMENTS --IS_BISULFITE_SEQUENCE --MATCHING_DICTIONARY_TAGS --MAX_INSERTIONS_OR_DELETIONS --MIN_UNCLIPPED_BASES --PRIMARY_ALIGNMENT_STRATEGY --PROGRAM_GROUP_COMMAND_LINE --PROGRAM_GROUP_NAME --PROGRAM_GROUP_VERSION --PROGRAM_RECORD_ID --READ1_ALIGNED_BAM --READ1_TRIM --READ2_ALIGNED_BAM --READ2_TRIM --SORT_ORDER --UNMAP_CONTAMINANT_READS --UNMAPPED_READ_STRATEGY --version --showHidden --JUMP_SIZE --PAIRED_RUN )
        ALL_ARGUMENT_VALUE_TYPES=("File" "File" "File" "Boolean" "int" "Boolean" "boolean" "String" "Integer" "Boolean" "List[File]" "Boolean" "Boolean" "ValidationStringency" "LogLevel" "Boolean" "List[File]" "boolean" "boolean" "List[File]" "List[String]" "List[String]" "Set[String]" "Set[String]" "boolean" "boolean" "List[PairOrientation]" "boolean" "boolean" "boolean" "List[String]" "int" "int" "PrimaryAlignmentStrategy" "String" "String" "String" "String" "List[File]" "int" "List[File]" "int" "SortOrder" "boolean" "UnmappingReadStrategy" "boolean" "boolean" "Integer" "Boolean" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "SamToFastq" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--FASTQ --INPUT --COMPRESSION_LEVEL --CREATE_INDEX --CREATE_MD5_FILE --GA4GH_CLIENT_SECRETS --MAX_RECORDS_IN_RAM --QUIET --REFERENCE_SEQUENCE --TMP_DIR --USE_JDK_DEFLATER --USE_JDK_INFLATER --VALIDATION_STRINGENCY --VERBOSITY --arguments_file --CLIPPING_ACTION --CLIPPING_ATTRIBUTE --CLIPPING_MIN_LENGTH --COMPRESS_OUTPUTS_PER_RG --help --INCLUDE_NON_PF_READS --INCLUDE_NON_PRIMARY_ALIGNMENTS --INTERLEAVE --OUTPUT_DIR --OUTPUT_PER_RG --QUALITY --RE_REVERSE --READ1_MAX_BASES_TO_WRITE --READ1_TRIM --READ2_MAX_BASES_TO_WRITE --READ2_TRIM --RG_TAG --SECOND_END_FASTQ --UNPAIRED_FASTQ --version --showHidden )
        MUTUALLY_EXCLUSIVE_ARGS=("--FASTQ;OUTPUT_PER_RG,COMPRESS_OUTPUTS_PER_RG,OPRG,GZOPRG" "--COMPRESS_OUTPUTS_PER_RG;FASTQ,SECOND_END_FASTQ,UNPAIRED_FASTQ" "--OUTPUT_PER_RG;FASTQ,SECOND_END_FASTQ,UNPAIRED_FASTQ" "--SECOND_END_FASTQ;OUTPUT_PER_RG,COMPRESS_OUTPUTS_PER_RG,OPRG,GZOPRG" "--UNPAIRED_FASTQ;OUTPUT_PER_RG,COMPRESS_OUTPUTS_PER_RG,OPRG,GZOPRG" )
        SYNONYMOUS_ARGS=("--FASTQ;-F" "--INPUT;-I" "--REFERENCE_SEQUENCE;-R" "--USE_JDK_DEFLATER;-use_jdk_deflater" "--USE_JDK_INFLATER;-use_jdk_inflater" "--CLIPPING_ACTION;-CLIP_ACT" "--CLIPPING_ATTRIBUTE;-CLIP_ATTR" "--CLIPPING_MIN_LENGTH;-CLIP_MIN" "--COMPRESS_OUTPUTS_PER_RG;-GZOPRG" "--help;-h" "--INCLUDE_NON_PF_READS;-NON_PF" "--INTERLEAVE;-INTER" "--OUTPUT_DIR;-ODIR" "--OUTPUT_PER_RG;-OPRG" "--QUALITY;-Q" "--RE_REVERSE;-RC" "--READ1_MAX_BASES_TO_WRITE;-R1_MAX_BASES" "--READ1_TRIM;-R1_TRIM" "--READ2_MAX_BASES_TO_WRITE;-R2_MAX_BASES" "--READ2_TRIM;-R2_TRIM" "--RG_TAG;-RGT" "--SECOND_END_FASTQ;-F2" "--UNPAIRED_FASTQ;-FU" "--showHidden;-showHidden" )
        MIN_OCCURRENCES=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--FASTQ --INPUT --COMPRESSION_LEVEL --CREATE_INDEX --CREATE_MD5_FILE --GA4GH_CLIENT_SECRETS --MAX_RECORDS_IN_RAM --QUIET --REFERENCE_SEQUENCE --TMP_DIR --USE_JDK_DEFLATER --USE_JDK_INFLATER --VALIDATION_STRINGENCY --VERBOSITY --arguments_file --CLIPPING_ACTION --CLIPPING_ATTRIBUTE --CLIPPING_MIN_LENGTH --COMPRESS_OUTPUTS_PER_RG --help --INCLUDE_NON_PF_READS --INCLUDE_NON_PRIMARY_ALIGNMENTS --INTERLEAVE --OUTPUT_DIR --OUTPUT_PER_RG --QUALITY --RE_REVERSE --READ1_MAX_BASES_TO_WRITE --READ1_TRIM --READ2_MAX_BASES_TO_WRITE --READ2_TRIM --RG_TAG --SECOND_END_FASTQ --UNPAIRED_FASTQ --version --showHidden )
        ALL_ARGUMENT_VALUE_TYPES=("File" "File" "int" "Boolean" "boolean" "String" "Integer" "Boolean" "File" "List[File]" "Boolean" "Boolean" "ValidationStringency" "LogLevel" "List[File]" "String" "String" "int" "Boolean" "boolean" "boolean" "boolean" "boolean" "File" "boolean" "Integer" "boolean" "Integer" "int" "Integer" "int" "String" "File" "File" "boolean" "boolean" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "AddCommentsToBam" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--COMMENT --INPUT --OUTPUT --COMPRESSION_LEVEL --CREATE_INDEX --CREATE_MD5_FILE --GA4GH_CLIENT_SECRETS --MAX_RECORDS_IN_RAM --QUIET --REFERENCE_SEQUENCE --TMP_DIR --USE_JDK_DEFLATER --USE_JDK_INFLATER --VALIDATION_STRINGENCY --VERBOSITY --arguments_file --help --version --showHidden )
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=("--COMMENT;-C" "--INPUT;-I" "--OUTPUT;-O" "--REFERENCE_SEQUENCE;-R" "--USE_JDK_DEFLATER;-use_jdk_deflater" "--USE_JDK_INFLATER;-use_jdk_inflater" "--help;-h" "--showHidden;-showHidden" )
        MIN_OCCURRENCES=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--COMMENT --INPUT --OUTPUT --COMPRESSION_LEVEL --CREATE_INDEX --CREATE_MD5_FILE --GA4GH_CLIENT_SECRETS --MAX_RECORDS_IN_RAM --QUIET --REFERENCE_SEQUENCE --TMP_DIR --USE_JDK_DEFLATER --USE_JDK_INFLATER --VALIDATION_STRINGENCY --VERBOSITY --arguments_file --help --version --showHidden )
        ALL_ARGUMENT_VALUE_TYPES=("List[String]" "File" "File" "int" "Boolean" "boolean" "String" "Integer" "Boolean" "File" "List[File]" "Boolean" "Boolean" "ValidationStringency" "LogLevel" "List[File]" "boolean" "boolean" "boolean" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "CreateSequenceDictionary" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--REFERENCE --COMPRESSION_LEVEL --CREATE_INDEX --CREATE_MD5_FILE --GA4GH_CLIENT_SECRETS --MAX_RECORDS_IN_RAM --QUIET --TMP_DIR --USE_JDK_DEFLATER --USE_JDK_INFLATER --VALIDATION_STRINGENCY --VERBOSITY --arguments_file --GENOME_ASSEMBLY --help --NUM_SEQUENCES --OUTPUT --SPECIES --TRUNCATE_NAMES_AT_WHITESPACE --URI --version --showHidden )
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=("--REFERENCE;-R" "--USE_JDK_DEFLATER;-use_jdk_deflater" "--USE_JDK_INFLATER;-use_jdk_inflater" "--GENOME_ASSEMBLY;-AS" "--help;-h" "--OUTPUT;-O" "--SPECIES;-SP" "--URI;-UR" "--showHidden;-showHidden" )
        MIN_OCCURRENCES=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--REFERENCE --COMPRESSION_LEVEL --CREATE_INDEX --CREATE_MD5_FILE --GA4GH_CLIENT_SECRETS --MAX_RECORDS_IN_RAM --QUIET --TMP_DIR --USE_JDK_DEFLATER --USE_JDK_INFLATER --VALIDATION_STRINGENCY --VERBOSITY --arguments_file --GENOME_ASSEMBLY --help --NUM_SEQUENCES --OUTPUT --SPECIES --TRUNCATE_NAMES_AT_WHITESPACE --URI --version --showHidden )
        ALL_ARGUMENT_VALUE_TYPES=("File" "int" "Boolean" "boolean" "String" "Integer" "Boolean" "List[File]" "Boolean" "Boolean" "ValidationStringency" "LogLevel" "List[File]" "String" "boolean" "int" "File" "String" "boolean" "String" "boolean" "boolean" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "WellformedReadFilter" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=()
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=()
        MIN_OCCURRENCES=()
        MAX_OCCURRENCES=()
        ALL_LEGAL_ARGUMENTS=()
        ALL_ARGUMENT_VALUE_TYPES=()

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "CollectIlluminaBasecallingMetrics" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--BASECALLS_DIR --LANE --READ_STRUCTURE --COMPRESSION_LEVEL --CREATE_INDEX --CREATE_MD5_FILE --GA4GH_CLIENT_SECRETS --MAX_RECORDS_IN_RAM --QUIET --REFERENCE_SEQUENCE --TMP_DIR --USE_JDK_DEFLATER --USE_JDK_INFLATER --VALIDATION_STRINGENCY --VERBOSITY --arguments_file --BARCODES_DIR --help --INPUT --OUTPUT --version --showHidden )
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=("--BASECALLS_DIR;-B" "--LANE;-L" "--READ_STRUCTURE;-RS" "--REFERENCE_SEQUENCE;-R" "--USE_JDK_DEFLATER;-use_jdk_deflater" "--USE_JDK_INFLATER;-use_jdk_inflater" "--BARCODES_DIR;-BCD" "--help;-h" "--INPUT;-I" "--OUTPUT;-O" "--showHidden;-showHidden" )
        MIN_OCCURRENCES=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--BASECALLS_DIR --LANE --READ_STRUCTURE --COMPRESSION_LEVEL --CREATE_INDEX --CREATE_MD5_FILE --GA4GH_CLIENT_SECRETS --MAX_RECORDS_IN_RAM --QUIET --REFERENCE_SEQUENCE --TMP_DIR --USE_JDK_DEFLATER --USE_JDK_INFLATER --VALIDATION_STRINGENCY --VERBOSITY --arguments_file --BARCODES_DIR --help --INPUT --OUTPUT --version --showHidden )
        ALL_ARGUMENT_VALUE_TYPES=("File" "Integer" "String" "int" "Boolean" "boolean" "String" "Integer" "Boolean" "File" "List[File]" "Boolean" "Boolean" "ValidationStringency" "LogLevel" "List[File]" "File" "boolean" "File" "File" "boolean" "boolean" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "ReadStrandFilter" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--keep-reverse-strand-only )
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=()
        MIN_OCCURRENCES=(0 )
        MAX_OCCURRENCES=(2147483647 )
        ALL_LEGAL_ARGUMENTS=(--keep-reverse-strand-only )
        ALL_ARGUMENT_VALUE_TYPES=("Boolean" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "SampleReadFilter" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--sample )
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=("--sample;-sample" )
        MIN_OCCURRENCES=(0 )
        MAX_OCCURRENCES=(2147483647 )
        ALL_LEGAL_ARGUMENTS=(--sample )
        ALL_ARGUMENT_VALUE_TYPES=("Set[String]" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "MateDifferentStrandReadFilter" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=()
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=()
        MIN_OCCURRENCES=()
        MAX_OCCURRENCES=()
        ALL_LEGAL_ARGUMENTS=()
        ALL_ARGUMENT_VALUE_TYPES=()

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "ApplyBQSR" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--bqsr-recal-file --input --output --add-output-sam-program-record --add-output-vcf-command-line --create-output-bam-index --create-output-bam-md5 --create-output-variant-index --create-output-variant-md5 --disable-read-filter --disable-sequence-dictionary-validation --disable-tool-default-read-filters --exclude-intervals --gatk-config-file --interval-exclusion-padding --interval-padding --interval-set-rule --lenient --QUIET --read-filter --read-index --read-validation-stringency --seconds-between-progress-updates --sequence-dictionary --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --arguments_file --cloud-index-prefetch-buffer --cloud-prefetch-buffer --disable-bam-index-caching --emit-original-quals --gcs-max-retries --global-qscore-prior --help --interval-merging-rule --intervals --preserve-qscores-less-than --quantize-quals --reference --use-original-qualities --version --round-down-quantized --showHidden --static-quantized-quals )
        MUTUALLY_EXCLUSIVE_ARGS=("--quantize-quals;static-quantized-quals,round-down-quantized" "--round-down-quantized;quantize-quals" "--static-quantized-quals;quantize-quals" )
        SYNONYMOUS_ARGS=("--bqsr-recal-file;-bqsr" "--input;-I" "--output;-O" "--add-output-sam-program-record;-add-output-sam-program-record" "--add-output-vcf-command-line;-add-output-vcf-command-line" "--create-output-bam-index;-OBI" "--create-output-bam-md5;-OBM" "--create-output-variant-index;-OVI" "--create-output-variant-md5;-OVM" "--disable-read-filter;-DF" "--disable-sequence-dictionary-validation;-disable-sequence-dictionary-validation" "--disable-tool-default-read-filters;-disable-tool-default-read-filters" "--exclude-intervals;-XL" "--interval-exclusion-padding;-ixp" "--interval-padding;-ip" "--interval-set-rule;-isr" "--lenient;-LE" "--read-filter;-RF" "--read-index;-read-index" "--read-validation-stringency;-VS" "--seconds-between-progress-updates;-seconds-between-progress-updates" "--sequence-dictionary;-sequence-dictionary" "--use-jdk-deflater;-jdk-deflater" "--use-jdk-inflater;-jdk-inflater" "--verbosity;-verbosity" "--cloud-index-prefetch-buffer;-CIPB" "--cloud-prefetch-buffer;-CPB" "--disable-bam-index-caching;-DBIC" "--gcs-max-retries;-gcs-retries" "--help;-h" "--interval-merging-rule;-imr" "--intervals;-L" "--reference;-R" "--use-original-qualities;-OQ" "--showHidden;-showHidden" )
        MIN_OCCURRENCES=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--bqsr-recal-file --input --output --add-output-sam-program-record --add-output-vcf-command-line --create-output-bam-index --create-output-bam-md5 --create-output-variant-index --create-output-variant-md5 --disable-read-filter --disable-sequence-dictionary-validation --disable-tool-default-read-filters --exclude-intervals --gatk-config-file --interval-exclusion-padding --interval-padding --interval-set-rule --lenient --QUIET --read-filter --read-index --read-validation-stringency --seconds-between-progress-updates --sequence-dictionary --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --arguments_file --cloud-index-prefetch-buffer --cloud-prefetch-buffer --disable-bam-index-caching --emit-original-quals --gcs-max-retries --global-qscore-prior --help --interval-merging-rule --intervals --preserve-qscores-less-than --quantize-quals --reference --use-original-qualities --version --round-down-quantized --showHidden --static-quantized-quals )
        ALL_ARGUMENT_VALUE_TYPES=("File" "List[String]" "File" "boolean" "boolean" "boolean" "boolean" "boolean" "boolean" "List[String]" "boolean" "boolean" "List[String]" "String" "int" "int" "IntervalSetRule" "boolean" "Boolean" "List[String]" "List[String]" "ValidationStringency" "double" "String" "List[File]" "boolean" "boolean" "LogLevel" "List[File]" "int" "int" "boolean" "boolean" "int" "double" "boolean" "IntervalMergingRule" "List[String]" "int" "int" "String" "Boolean" "boolean" "boolean" "boolean" "List[Integer]" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "AnnotatePairOrientation" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--input --output --variant --add-output-sam-program-record --add-output-vcf-command-line --create-output-bam-index --create-output-bam-md5 --create-output-variant-index --create-output-variant-md5 --disable-read-filter --disable-sequence-dictionary-validation --disable-tool-default-read-filters --exclude-intervals --gatk-config-file --interval-exclusion-padding --interval-padding --interval-set-rule --lenient --QUIET --read-filter --read-index --read-validation-stringency --seconds-between-progress-updates --sequence-dictionary --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --arguments_file --cloud-index-prefetch-buffer --cloud-prefetch-buffer --disable-bam-index-caching --gcs-max-retries --help --interval-merging-rule --intervals --min-base-quality-cutoff --reference --version --showHidden )
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=("--input;-I" "--output;-O" "--variant;-V" "--add-output-sam-program-record;-add-output-sam-program-record" "--add-output-vcf-command-line;-add-output-vcf-command-line" "--create-output-bam-index;-OBI" "--create-output-bam-md5;-OBM" "--create-output-variant-index;-OVI" "--create-output-variant-md5;-OVM" "--disable-read-filter;-DF" "--disable-sequence-dictionary-validation;-disable-sequence-dictionary-validation" "--disable-tool-default-read-filters;-disable-tool-default-read-filters" "--exclude-intervals;-XL" "--interval-exclusion-padding;-ixp" "--interval-padding;-ip" "--interval-set-rule;-isr" "--lenient;-LE" "--read-filter;-RF" "--read-index;-read-index" "--read-validation-stringency;-VS" "--seconds-between-progress-updates;-seconds-between-progress-updates" "--sequence-dictionary;-sequence-dictionary" "--use-jdk-deflater;-jdk-deflater" "--use-jdk-inflater;-jdk-inflater" "--verbosity;-verbosity" "--cloud-index-prefetch-buffer;-CIPB" "--cloud-prefetch-buffer;-CPB" "--disable-bam-index-caching;-DBIC" "--gcs-max-retries;-gcs-retries" "--help;-h" "--interval-merging-rule;-imr" "--intervals;-L" "--min-base-quality-cutoff;-cutoff" "--reference;-R" "--showHidden;-showHidden" )
        MIN_OCCURRENCES=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--input --output --variant --add-output-sam-program-record --add-output-vcf-command-line --create-output-bam-index --create-output-bam-md5 --create-output-variant-index --create-output-variant-md5 --disable-read-filter --disable-sequence-dictionary-validation --disable-tool-default-read-filters --exclude-intervals --gatk-config-file --interval-exclusion-padding --interval-padding --interval-set-rule --lenient --QUIET --read-filter --read-index --read-validation-stringency --seconds-between-progress-updates --sequence-dictionary --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --arguments_file --cloud-index-prefetch-buffer --cloud-prefetch-buffer --disable-bam-index-caching --gcs-max-retries --help --interval-merging-rule --intervals --min-base-quality-cutoff --reference --version --showHidden )
        ALL_ARGUMENT_VALUE_TYPES=("List[String]" "File" "String" "boolean" "boolean" "boolean" "boolean" "boolean" "boolean" "List[String]" "boolean" "boolean" "List[String]" "String" "int" "int" "IntervalSetRule" "boolean" "Boolean" "List[String]" "List[String]" "ValidationStringency" "double" "String" "List[File]" "boolean" "boolean" "LogLevel" "List[File]" "int" "int" "boolean" "int" "boolean" "IntervalMergingRule" "List[String]" "int" "String" "boolean" "boolean" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "FilterLongReadAlignmentsSAMSpark" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--input --output --disable-read-filter --disable-tool-default-read-filters --exclude-intervals --gatk-config-file --interval-exclusion-padding --interval-padding --interval-set-rule --QUIET --read-filter --read-index --read-validation-stringency --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --arguments_file --bam-partition-size --conf --disable-sequence-dictionary-validation --gcs-max-retries --help --interval-merging-rule --intervals --non-canonical-contig-names-file --num-reducers --old-filtering-too --program-name --reference --sharded-output --spark-master --version --config-score-diff-tolerance --showHidden )
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=("--input;-I" "--output;-O" "--disable-read-filter;-DF" "--disable-tool-default-read-filters;-disable-tool-default-read-filters" "--exclude-intervals;-XL" "--interval-exclusion-padding;-ixp" "--interval-padding;-ip" "--interval-set-rule;-isr" "--read-filter;-RF" "--read-index;-read-index" "--read-validation-stringency;-VS" "--use-jdk-deflater;-jdk-deflater" "--use-jdk-inflater;-jdk-inflater" "--verbosity;-verbosity" "--conf;-conf" "--disable-sequence-dictionary-validation;-disable-sequence-dictionary-validation" "--gcs-max-retries;-gcs-retries" "--help;-h" "--interval-merging-rule;-imr" "--intervals;-L" "--non-canonical-contig-names-file;-alt-tigs" "--old-filtering-too;-OT" "--reference;-R" "--config-score-diff-tolerance;-cst" "--showHidden;-showHidden" )
        MIN_OCCURRENCES=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--input --output --disable-read-filter --disable-tool-default-read-filters --exclude-intervals --gatk-config-file --interval-exclusion-padding --interval-padding --interval-set-rule --QUIET --read-filter --read-index --read-validation-stringency --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --arguments_file --bam-partition-size --conf --disable-sequence-dictionary-validation --gcs-max-retries --help --interval-merging-rule --intervals --non-canonical-contig-names-file --num-reducers --old-filtering-too --program-name --reference --sharded-output --spark-master --version --config-score-diff-tolerance --showHidden )
        ALL_ARGUMENT_VALUE_TYPES=("List[String]" "String" "List[String]" "boolean" "List[String]" "String" "int" "int" "IntervalSetRule" "Boolean" "List[String]" "List[String]" "ValidationStringency" "List[File]" "boolean" "boolean" "LogLevel" "List[File]" "long" "List[String]" "boolean" "int" "boolean" "IntervalMergingRule" "List[String]" "String" "int" "boolean" "String" "String" "boolean" "String" "boolean" "Double" "boolean" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "RevertBaseQualityScores" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--input --output --add-output-sam-program-record --add-output-vcf-command-line --create-output-bam-index --create-output-bam-md5 --create-output-variant-index --create-output-variant-md5 --disable-read-filter --disable-sequence-dictionary-validation --disable-tool-default-read-filters --exclude-intervals --gatk-config-file --interval-exclusion-padding --interval-padding --interval-set-rule --lenient --QUIET --read-filter --read-index --read-validation-stringency --seconds-between-progress-updates --sequence-dictionary --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --arguments_file --cloud-index-prefetch-buffer --cloud-prefetch-buffer --disable-bam-index-caching --gcs-max-retries --help --interval-merging-rule --intervals --reference --version --showHidden )
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=("--input;-I" "--output;-O" "--add-output-sam-program-record;-add-output-sam-program-record" "--add-output-vcf-command-line;-add-output-vcf-command-line" "--create-output-bam-index;-OBI" "--create-output-bam-md5;-OBM" "--create-output-variant-index;-OVI" "--create-output-variant-md5;-OVM" "--disable-read-filter;-DF" "--disable-sequence-dictionary-validation;-disable-sequence-dictionary-validation" "--disable-tool-default-read-filters;-disable-tool-default-read-filters" "--exclude-intervals;-XL" "--interval-exclusion-padding;-ixp" "--interval-padding;-ip" "--interval-set-rule;-isr" "--lenient;-LE" "--read-filter;-RF" "--read-index;-read-index" "--read-validation-stringency;-VS" "--seconds-between-progress-updates;-seconds-between-progress-updates" "--sequence-dictionary;-sequence-dictionary" "--use-jdk-deflater;-jdk-deflater" "--use-jdk-inflater;-jdk-inflater" "--verbosity;-verbosity" "--cloud-index-prefetch-buffer;-CIPB" "--cloud-prefetch-buffer;-CPB" "--disable-bam-index-caching;-DBIC" "--gcs-max-retries;-gcs-retries" "--help;-h" "--interval-merging-rule;-imr" "--intervals;-L" "--reference;-R" "--showHidden;-showHidden" )
        MIN_OCCURRENCES=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--input --output --add-output-sam-program-record --add-output-vcf-command-line --create-output-bam-index --create-output-bam-md5 --create-output-variant-index --create-output-variant-md5 --disable-read-filter --disable-sequence-dictionary-validation --disable-tool-default-read-filters --exclude-intervals --gatk-config-file --interval-exclusion-padding --interval-padding --interval-set-rule --lenient --QUIET --read-filter --read-index --read-validation-stringency --seconds-between-progress-updates --sequence-dictionary --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --arguments_file --cloud-index-prefetch-buffer --cloud-prefetch-buffer --disable-bam-index-caching --gcs-max-retries --help --interval-merging-rule --intervals --reference --version --showHidden )
        ALL_ARGUMENT_VALUE_TYPES=("List[String]" "File" "boolean" "boolean" "boolean" "boolean" "boolean" "boolean" "List[String]" "boolean" "boolean" "List[String]" "String" "int" "int" "IntervalSetRule" "boolean" "Boolean" "List[String]" "List[String]" "ValidationStringency" "double" "String" "List[File]" "boolean" "boolean" "LogLevel" "List[File]" "int" "int" "boolean" "int" "boolean" "IntervalMergingRule" "List[String]" "String" "boolean" "boolean" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "ViewSam" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--INPUT --COMPRESSION_LEVEL --CREATE_INDEX --CREATE_MD5_FILE --GA4GH_CLIENT_SECRETS --MAX_RECORDS_IN_RAM --QUIET --REFERENCE_SEQUENCE --TMP_DIR --USE_JDK_DEFLATER --USE_JDK_INFLATER --VALIDATION_STRINGENCY --VERBOSITY --ALIGNMENT_STATUS --arguments_file --HEADER_ONLY --help --INTERVAL_LIST --PF_STATUS --RECORDS_ONLY --version --showHidden )
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=("--INPUT;-I" "--REFERENCE_SEQUENCE;-R" "--USE_JDK_DEFLATER;-use_jdk_deflater" "--USE_JDK_INFLATER;-use_jdk_inflater" "--help;-h" "--showHidden;-showHidden" )
        MIN_OCCURRENCES=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--INPUT --COMPRESSION_LEVEL --CREATE_INDEX --CREATE_MD5_FILE --GA4GH_CLIENT_SECRETS --MAX_RECORDS_IN_RAM --QUIET --REFERENCE_SEQUENCE --TMP_DIR --USE_JDK_DEFLATER --USE_JDK_INFLATER --VALIDATION_STRINGENCY --VERBOSITY --ALIGNMENT_STATUS --arguments_file --HEADER_ONLY --help --INTERVAL_LIST --PF_STATUS --RECORDS_ONLY --version --showHidden )
        ALL_ARGUMENT_VALUE_TYPES=("String" "int" "Boolean" "boolean" "String" "Integer" "Boolean" "File" "List[File]" "Boolean" "Boolean" "ValidationStringency" "LogLevel" "AlignmentStatus" "List[File]" "boolean" "boolean" "File" "PfStatus" "boolean" "boolean" "boolean" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "CollectFragmentCounts" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--input --intervals --output --add-output-sam-program-record --add-output-vcf-command-line --create-output-bam-index --create-output-bam-md5 --create-output-variant-index --create-output-variant-md5 --disable-read-filter --disable-sequence-dictionary-validation --disable-tool-default-read-filters --exclude-intervals --gatk-config-file --interval-exclusion-padding --interval-padding --interval-set-rule --lenient --QUIET --read-filter --read-index --read-validation-stringency --seconds-between-progress-updates --sequence-dictionary --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --arguments_file --cloud-index-prefetch-buffer --cloud-prefetch-buffer --disable-bam-index-caching --format --gcs-max-retries --help --interval-merging-rule --reference --version --showHidden )
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=("--input;-I" "--intervals;-L" "--output;-O" "--add-output-sam-program-record;-add-output-sam-program-record" "--add-output-vcf-command-line;-add-output-vcf-command-line" "--create-output-bam-index;-OBI" "--create-output-bam-md5;-OBM" "--create-output-variant-index;-OVI" "--create-output-variant-md5;-OVM" "--disable-read-filter;-DF" "--disable-sequence-dictionary-validation;-disable-sequence-dictionary-validation" "--disable-tool-default-read-filters;-disable-tool-default-read-filters" "--exclude-intervals;-XL" "--interval-exclusion-padding;-ixp" "--interval-padding;-ip" "--interval-set-rule;-isr" "--lenient;-LE" "--read-filter;-RF" "--read-index;-read-index" "--read-validation-stringency;-VS" "--seconds-between-progress-updates;-seconds-between-progress-updates" "--sequence-dictionary;-sequence-dictionary" "--use-jdk-deflater;-jdk-deflater" "--use-jdk-inflater;-jdk-inflater" "--verbosity;-verbosity" "--cloud-index-prefetch-buffer;-CIPB" "--cloud-prefetch-buffer;-CPB" "--disable-bam-index-caching;-DBIC" "--gcs-max-retries;-gcs-retries" "--help;-h" "--interval-merging-rule;-imr" "--reference;-R" "--showHidden;-showHidden" )
        MIN_OCCURRENCES=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--input --intervals --output --add-output-sam-program-record --add-output-vcf-command-line --create-output-bam-index --create-output-bam-md5 --create-output-variant-index --create-output-variant-md5 --disable-read-filter --disable-sequence-dictionary-validation --disable-tool-default-read-filters --exclude-intervals --gatk-config-file --interval-exclusion-padding --interval-padding --interval-set-rule --lenient --QUIET --read-filter --read-index --read-validation-stringency --seconds-between-progress-updates --sequence-dictionary --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --arguments_file --cloud-index-prefetch-buffer --cloud-prefetch-buffer --disable-bam-index-caching --format --gcs-max-retries --help --interval-merging-rule --reference --version --showHidden )
        ALL_ARGUMENT_VALUE_TYPES=("List[String]" "List[String]" "File" "boolean" "boolean" "boolean" "boolean" "boolean" "boolean" "List[String]" "boolean" "boolean" "List[String]" "String" "int" "int" "IntervalSetRule" "boolean" "Boolean" "List[String]" "List[String]" "ValidationStringency" "double" "String" "List[File]" "boolean" "boolean" "LogLevel" "List[File]" "int" "int" "boolean" "Format" "int" "boolean" "IntervalMergingRule" "String" "boolean" "boolean" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "IlluminaBasecallsToSam" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--BARCODE_PARAMS --BASECALLS_DIR --LANE --LIBRARY_PARAMS --OUTPUT --READ_STRUCTURE --RUN_BARCODE --SAMPLE_ALIAS --COMPRESSION_LEVEL --CREATE_INDEX --CREATE_MD5_FILE --GA4GH_CLIENT_SECRETS --MAX_RECORDS_IN_RAM --QUIET --REFERENCE_SEQUENCE --TMP_DIR --USE_JDK_DEFLATER --USE_JDK_INFLATER --VALIDATION_STRINGENCY --VERBOSITY --ADAPTERS_TO_CHECK --APPLY_EAMSS_FILTER --arguments_file --BARCODES_DIR --FIRST_TILE --FIVE_PRIME_ADAPTER --FORCE_GC --help --IGNORE_UNEXPECTED_BARCODES --INCLUDE_NON_PF_READS --LIBRARY_NAME --MAX_READS_IN_RAM_PER_TILE --MINIMUM_QUALITY --MOLECULAR_INDEX_BASE_QUALITY_TAG --MOLECULAR_INDEX_TAG --NUM_PROCESSORS --PLATFORM --READ_GROUP_ID --RUN_START_DATE --SEQUENCING_CENTER --TAG_PER_MOLECULAR_INDEX --THREE_PRIME_ADAPTER --TILE_LIMIT --version --showHidden )
        MUTUALLY_EXCLUSIVE_ARGS=("--BARCODE_PARAMS;OUTPUT,SAMPLE_ALIAS,LIBRARY_NAME,LIBRARY_PARAMS" "--LIBRARY_PARAMS;OUTPUT,SAMPLE_ALIAS,LIBRARY_NAME,BARCODE_PARAMS" "--OUTPUT;BARCODE_PARAMS,LIBRARY_PARAMS" "--SAMPLE_ALIAS;BARCODE_PARAMS,LIBRARY_PARAMS" "--LIBRARY_NAME;BARCODE_PARAMS,LIBRARY_PARAMS" )
        SYNONYMOUS_ARGS=("--BASECALLS_DIR;-B" "--LANE;-L" "--OUTPUT;-O" "--READ_STRUCTURE;-RS" "--SAMPLE_ALIAS;-ALIAS" "--REFERENCE_SEQUENCE;-R" "--USE_JDK_DEFLATER;-use_jdk_deflater" "--USE_JDK_INFLATER;-use_jdk_inflater" "--BARCODES_DIR;-BCD" "--help;-h" "--IGNORE_UNEXPECTED_BARCODES;-IGNORE_UNEXPECTED" "--INCLUDE_NON_PF_READS;-NONPF" "--LIBRARY_NAME;-LIB" "--READ_GROUP_ID;-RG" "--showHidden;-showHidden" )
        MIN_OCCURRENCES=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--BARCODE_PARAMS --BASECALLS_DIR --LANE --LIBRARY_PARAMS --OUTPUT --READ_STRUCTURE --RUN_BARCODE --SAMPLE_ALIAS --COMPRESSION_LEVEL --CREATE_INDEX --CREATE_MD5_FILE --GA4GH_CLIENT_SECRETS --MAX_RECORDS_IN_RAM --QUIET --REFERENCE_SEQUENCE --TMP_DIR --USE_JDK_DEFLATER --USE_JDK_INFLATER --VALIDATION_STRINGENCY --VERBOSITY --ADAPTERS_TO_CHECK --APPLY_EAMSS_FILTER --arguments_file --BARCODES_DIR --FIRST_TILE --FIVE_PRIME_ADAPTER --FORCE_GC --help --IGNORE_UNEXPECTED_BARCODES --INCLUDE_NON_PF_READS --LIBRARY_NAME --MAX_READS_IN_RAM_PER_TILE --MINIMUM_QUALITY --MOLECULAR_INDEX_BASE_QUALITY_TAG --MOLECULAR_INDEX_TAG --NUM_PROCESSORS --PLATFORM --READ_GROUP_ID --RUN_START_DATE --SEQUENCING_CENTER --TAG_PER_MOLECULAR_INDEX --THREE_PRIME_ADAPTER --TILE_LIMIT --version --showHidden )
        ALL_ARGUMENT_VALUE_TYPES=("File" "File" "Integer" "File" "File" "String" "String" "String" "int" "Boolean" "boolean" "String" "Integer" "Boolean" "File" "List[File]" "Boolean" "Boolean" "ValidationStringency" "LogLevel" "List[IlluminaAdapterPair]" "boolean" "List[File]" "File" "Integer" "String" "Boolean" "boolean" "boolean" "boolean" "String" "int" "int" "String" "String" "Integer" "String" "String" "Date" "String" "List[String]" "String" "Integer" "boolean" "boolean" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "CombineSegmentBreakpoints" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--columnsOfInterest --output --reference --segments --add-output-sam-program-record --add-output-vcf-command-line --create-output-bam-index --create-output-bam-md5 --create-output-variant-index --create-output-variant-md5 --disable-read-filter --disable-sequence-dictionary-validation --disable-tool-default-read-filters --exclude-intervals --gatk-config-file --input --interval-exclusion-padding --interval-padding --interval-set-rule --lenient --QUIET --read-filter --read-index --read-validation-stringency --seconds-between-progress-updates --sequence-dictionary --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --arguments_file --cloud-index-prefetch-buffer --cloud-prefetch-buffer --disable-bam-index-caching --gcs-max-retries --help --interval-merging-rule --intervals --labels --version --showHidden )
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=("--columnsOfInterest;-cols" "--output;-O" "--reference;-R" "--add-output-sam-program-record;-add-output-sam-program-record" "--add-output-vcf-command-line;-add-output-vcf-command-line" "--create-output-bam-index;-OBI" "--create-output-bam-md5;-OBM" "--create-output-variant-index;-OVI" "--create-output-variant-md5;-OVM" "--disable-read-filter;-DF" "--disable-sequence-dictionary-validation;-disable-sequence-dictionary-validation" "--disable-tool-default-read-filters;-disable-tool-default-read-filters" "--exclude-intervals;-XL" "--input;-I" "--interval-exclusion-padding;-ixp" "--interval-padding;-ip" "--interval-set-rule;-isr" "--lenient;-LE" "--read-filter;-RF" "--read-index;-read-index" "--read-validation-stringency;-VS" "--seconds-between-progress-updates;-seconds-between-progress-updates" "--sequence-dictionary;-sequence-dictionary" "--use-jdk-deflater;-jdk-deflater" "--use-jdk-inflater;-jdk-inflater" "--verbosity;-verbosity" "--cloud-index-prefetch-buffer;-CIPB" "--cloud-prefetch-buffer;-CPB" "--disable-bam-index-caching;-DBIC" "--gcs-max-retries;-gcs-retries" "--help;-h" "--interval-merging-rule;-imr" "--intervals;-L" "--labels;-lbls" "--showHidden;-showHidden" )
        MIN_OCCURRENCES=(1 0 0 2 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 2 0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 2147483647 2 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2 2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--columnsOfInterest --output --reference --segments --add-output-sam-program-record --add-output-vcf-command-line --create-output-bam-index --create-output-bam-md5 --create-output-variant-index --create-output-variant-md5 --disable-read-filter --disable-sequence-dictionary-validation --disable-tool-default-read-filters --exclude-intervals --gatk-config-file --input --interval-exclusion-padding --interval-padding --interval-set-rule --lenient --QUIET --read-filter --read-index --read-validation-stringency --seconds-between-progress-updates --sequence-dictionary --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --arguments_file --cloud-index-prefetch-buffer --cloud-prefetch-buffer --disable-bam-index-caching --gcs-max-retries --help --interval-merging-rule --intervals --labels --version --showHidden )
        ALL_ARGUMENT_VALUE_TYPES=("Set[String]" "File" "String" "List[File]" "boolean" "boolean" "boolean" "boolean" "boolean" "boolean" "List[String]" "boolean" "boolean" "List[String]" "String" "List[String]" "int" "int" "IntervalSetRule" "boolean" "Boolean" "List[String]" "List[String]" "ValidationStringency" "double" "String" "List[File]" "boolean" "boolean" "LogLevel" "List[File]" "int" "int" "boolean" "int" "boolean" "IntervalMergingRule" "List[String]" "List[String]" "boolean" "boolean" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "DiscoverVariantsFromContigAlignmentsSAMSpark" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--input --output --reference --disable-read-filter --disable-tool-default-read-filters --exclude-intervals --gatk-config-file --interval-exclusion-padding --interval-padding --interval-set-rule --QUIET --read-filter --read-index --read-validation-stringency --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --arguments_file --assembly-imprecise-evidence-overlap-uncertainty --bam-partition-size --cnv-calls --conf --disable-sequence-dictionary-validation --gcs-max-retries --help --imprecise-variant-evidence-threshold --interval-merging-rule --intervals --max-callable-imprecise-deletion-size --min-align-length --num-reducers --program-name --sharded-output --spark-master --truth-interval-padding --version --showHidden )
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=("--input;-I" "--output;-O" "--reference;-R" "--disable-read-filter;-DF" "--disable-tool-default-read-filters;-disable-tool-default-read-filters" "--exclude-intervals;-XL" "--interval-exclusion-padding;-ixp" "--interval-padding;-ip" "--interval-set-rule;-isr" "--read-filter;-RF" "--read-index;-read-index" "--read-validation-stringency;-VS" "--use-jdk-deflater;-jdk-deflater" "--use-jdk-inflater;-jdk-inflater" "--verbosity;-verbosity" "--conf;-conf" "--disable-sequence-dictionary-validation;-disable-sequence-dictionary-validation" "--gcs-max-retries;-gcs-retries" "--help;-h" "--interval-merging-rule;-imr" "--intervals;-L" "--showHidden;-showHidden" )
        MIN_OCCURRENCES=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--input --output --reference --disable-read-filter --disable-tool-default-read-filters --exclude-intervals --gatk-config-file --interval-exclusion-padding --interval-padding --interval-set-rule --QUIET --read-filter --read-index --read-validation-stringency --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --arguments_file --assembly-imprecise-evidence-overlap-uncertainty --bam-partition-size --cnv-calls --conf --disable-sequence-dictionary-validation --gcs-max-retries --help --imprecise-variant-evidence-threshold --interval-merging-rule --intervals --max-callable-imprecise-deletion-size --min-align-length --num-reducers --program-name --sharded-output --spark-master --truth-interval-padding --version --showHidden )
        ALL_ARGUMENT_VALUE_TYPES=("List[String]" "String" "String" "List[String]" "boolean" "List[String]" "String" "int" "int" "IntervalSetRule" "Boolean" "List[String]" "List[String]" "ValidationStringency" "List[File]" "boolean" "boolean" "LogLevel" "List[File]" "int" "long" "String" "List[String]" "boolean" "int" "boolean" "int" "IntervalMergingRule" "List[String]" "int" "Integer" "int" "String" "boolean" "String" "int" "boolean" "boolean" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "AS_MappingQualityRankSumTest" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=()
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=()
        MIN_OCCURRENCES=()
        MAX_OCCURRENCES=()
        ALL_LEGAL_ARGUMENTS=()
        ALL_ARGUMENT_VALUE_TYPES=()

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "NonNFastaSize" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--INPUT --OUTPUT --COMPRESSION_LEVEL --CREATE_INDEX --CREATE_MD5_FILE --GA4GH_CLIENT_SECRETS --MAX_RECORDS_IN_RAM --QUIET --REFERENCE_SEQUENCE --TMP_DIR --USE_JDK_DEFLATER --USE_JDK_INFLATER --VALIDATION_STRINGENCY --VERBOSITY --arguments_file --help --INTERVALS --version --showHidden )
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=("--INPUT;-I" "--OUTPUT;-O" "--REFERENCE_SEQUENCE;-R" "--USE_JDK_DEFLATER;-use_jdk_deflater" "--USE_JDK_INFLATER;-use_jdk_inflater" "--help;-h" "--INTERVALS;-INTERVALS" "--showHidden;-showHidden" )
        MIN_OCCURRENCES=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--INPUT --OUTPUT --COMPRESSION_LEVEL --CREATE_INDEX --CREATE_MD5_FILE --GA4GH_CLIENT_SECRETS --MAX_RECORDS_IN_RAM --QUIET --REFERENCE_SEQUENCE --TMP_DIR --USE_JDK_DEFLATER --USE_JDK_INFLATER --VALIDATION_STRINGENCY --VERBOSITY --arguments_file --help --INTERVALS --version --showHidden )
        ALL_ARGUMENT_VALUE_TYPES=("File" "File" "int" "Boolean" "boolean" "String" "Integer" "Boolean" "File" "List[File]" "Boolean" "Boolean" "ValidationStringency" "LogLevel" "List[File]" "boolean" "File" "boolean" "boolean" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "LikelihoodRankSumTest" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=()
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=()
        MIN_OCCURRENCES=()
        MAX_OCCURRENCES=()
        ALL_LEGAL_ARGUMENTS=()
        ALL_ARGUMENT_VALUE_TYPES=()

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "MappedReadFilter" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=()
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=()
        MIN_OCCURRENCES=()
        MAX_OCCURRENCES=()
        ALL_LEGAL_ARGUMENTS=()
        ALL_ARGUMENT_VALUE_TYPES=()

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "SplitNCigarReads" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--input --output --reference --add-output-sam-program-record --add-output-vcf-command-line --create-output-bam-index --create-output-bam-md5 --create-output-variant-index --create-output-variant-md5 --disable-read-filter --disable-sequence-dictionary-validation --disable-tool-default-read-filters --exclude-intervals --gatk-config-file --interval-exclusion-padding --interval-padding --interval-set-rule --lenient --QUIET --read-filter --read-index --read-validation-stringency --seconds-between-progress-updates --sequence-dictionary --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --arguments_file --cloud-index-prefetch-buffer --cloud-prefetch-buffer --disable-bam-index-caching --do-not-fix-overhangs --gcs-max-retries --help --interval-merging-rule --intervals --max-bases-in-overhang --max-mismatches-in-overhang --process-secondary-alignments --refactor-cigar-string --skip-mapping-quality-transform --version --max-reads-in-memory --showHidden )
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=("--input;-I" "--output;-O" "--reference;-R" "--add-output-sam-program-record;-add-output-sam-program-record" "--add-output-vcf-command-line;-add-output-vcf-command-line" "--create-output-bam-index;-OBI" "--create-output-bam-md5;-OBM" "--create-output-variant-index;-OVI" "--create-output-variant-md5;-OVM" "--disable-read-filter;-DF" "--disable-sequence-dictionary-validation;-disable-sequence-dictionary-validation" "--disable-tool-default-read-filters;-disable-tool-default-read-filters" "--exclude-intervals;-XL" "--interval-exclusion-padding;-ixp" "--interval-padding;-ip" "--interval-set-rule;-isr" "--lenient;-LE" "--read-filter;-RF" "--read-index;-read-index" "--read-validation-stringency;-VS" "--seconds-between-progress-updates;-seconds-between-progress-updates" "--sequence-dictionary;-sequence-dictionary" "--use-jdk-deflater;-jdk-deflater" "--use-jdk-inflater;-jdk-inflater" "--verbosity;-verbosity" "--cloud-index-prefetch-buffer;-CIPB" "--cloud-prefetch-buffer;-CPB" "--disable-bam-index-caching;-DBIC" "--gcs-max-retries;-gcs-retries" "--help;-h" "--interval-merging-rule;-imr" "--intervals;-L" "--refactor-cigar-string;-fixNDN" "--skip-mapping-quality-transform;-skip-mq-transform" "--showHidden;-showHidden" )
        MIN_OCCURRENCES=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--input --output --reference --add-output-sam-program-record --add-output-vcf-command-line --create-output-bam-index --create-output-bam-md5 --create-output-variant-index --create-output-variant-md5 --disable-read-filter --disable-sequence-dictionary-validation --disable-tool-default-read-filters --exclude-intervals --gatk-config-file --interval-exclusion-padding --interval-padding --interval-set-rule --lenient --QUIET --read-filter --read-index --read-validation-stringency --seconds-between-progress-updates --sequence-dictionary --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --arguments_file --cloud-index-prefetch-buffer --cloud-prefetch-buffer --disable-bam-index-caching --do-not-fix-overhangs --gcs-max-retries --help --interval-merging-rule --intervals --max-bases-in-overhang --max-mismatches-in-overhang --process-secondary-alignments --refactor-cigar-string --skip-mapping-quality-transform --version --max-reads-in-memory --showHidden )
        ALL_ARGUMENT_VALUE_TYPES=("List[String]" "File" "String" "boolean" "boolean" "boolean" "boolean" "boolean" "boolean" "List[String]" "boolean" "boolean" "List[String]" "String" "int" "int" "IntervalSetRule" "boolean" "Boolean" "List[String]" "List[String]" "ValidationStringency" "double" "String" "List[File]" "boolean" "boolean" "LogLevel" "List[File]" "int" "int" "boolean" "boolean" "int" "boolean" "IntervalMergingRule" "List[String]" "int" "int" "boolean" "boolean" "boolean" "boolean" "int" "boolean" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "SvDiscoverFromLocalAssemblyContigAlignmentsSpark" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--input --output --reference --disable-read-filter --disable-tool-default-read-filters --exclude-intervals --gatk-config-file --interval-exclusion-padding --interval-padding --interval-set-rule --QUIET --read-filter --read-index --read-validation-stringency --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --arguments_file --assembly-imprecise-evidence-overlap-uncertainty --bam-partition-size --cnv-calls --conf --disable-sequence-dictionary-validation --gcs-max-retries --help --imprecise-variant-evidence-threshold --interval-merging-rule --intervals --max-callable-imprecise-deletion-size --min-align-length --non-canonical-contig-names-file --num-reducers --program-name --sharded-output --spark-master --truth-interval-padding --version --write-sam --showHidden )
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=("--input;-I" "--output;-O" "--reference;-R" "--disable-read-filter;-DF" "--disable-tool-default-read-filters;-disable-tool-default-read-filters" "--exclude-intervals;-XL" "--interval-exclusion-padding;-ixp" "--interval-padding;-ip" "--interval-set-rule;-isr" "--read-filter;-RF" "--read-index;-read-index" "--read-validation-stringency;-VS" "--use-jdk-deflater;-jdk-deflater" "--use-jdk-inflater;-jdk-inflater" "--verbosity;-verbosity" "--conf;-conf" "--disable-sequence-dictionary-validation;-disable-sequence-dictionary-validation" "--gcs-max-retries;-gcs-retries" "--help;-h" "--interval-merging-rule;-imr" "--intervals;-L" "--non-canonical-contig-names-file;-alt-tigs" "--showHidden;-showHidden" )
        MIN_OCCURRENCES=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--input --output --reference --disable-read-filter --disable-tool-default-read-filters --exclude-intervals --gatk-config-file --interval-exclusion-padding --interval-padding --interval-set-rule --QUIET --read-filter --read-index --read-validation-stringency --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --arguments_file --assembly-imprecise-evidence-overlap-uncertainty --bam-partition-size --cnv-calls --conf --disable-sequence-dictionary-validation --gcs-max-retries --help --imprecise-variant-evidence-threshold --interval-merging-rule --intervals --max-callable-imprecise-deletion-size --min-align-length --non-canonical-contig-names-file --num-reducers --program-name --sharded-output --spark-master --truth-interval-padding --version --write-sam --showHidden )
        ALL_ARGUMENT_VALUE_TYPES=("List[String]" "String" "String" "List[String]" "boolean" "List[String]" "String" "int" "int" "IntervalSetRule" "Boolean" "List[String]" "List[String]" "ValidationStringency" "List[File]" "boolean" "boolean" "LogLevel" "List[File]" "int" "long" "String" "List[String]" "boolean" "int" "boolean" "int" "IntervalMergingRule" "List[String]" "int" "Integer" "String" "int" "String" "boolean" "String" "int" "boolean" "boolean" "boolean" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "QualByDepth" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=()
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=()
        MIN_OCCURRENCES=()
        MAX_OCCURRENCES=()
        ALL_LEGAL_ARGUMENTS=()
        ALL_ARGUMENT_VALUE_TYPES=()

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "MappingQualityRankSumTest" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=()
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=()
        MIN_OCCURRENCES=()
        MAX_OCCURRENCES=()
        ALL_LEGAL_ARGUMENTS=()
        ALL_ARGUMENT_VALUE_TYPES=()

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "BaitDesigner" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--DESIGN_NAME --REFERENCE_SEQUENCE --TARGETS --COMPRESSION_LEVEL --CREATE_INDEX --CREATE_MD5_FILE --GA4GH_CLIENT_SECRETS --MAX_RECORDS_IN_RAM --QUIET --TMP_DIR --USE_JDK_DEFLATER --USE_JDK_INFLATER --VALIDATION_STRINGENCY --VERBOSITY --arguments_file --BAIT_OFFSET --BAIT_SIZE --DESIGN_ON_TARGET_STRAND --DESIGN_STRATEGY --FILL_POOLS --help --LEFT_PRIMER --MERGE_NEARBY_TARGETS --MINIMUM_BAITS_PER_TARGET --OUTPUT_AGILENT_FILES --OUTPUT_DIRECTORY --PADDING --POOL_SIZE --REPEAT_TOLERANCE --RIGHT_PRIMER --version --showHidden )
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=("--REFERENCE_SEQUENCE;-R" "--TARGETS;-T" "--USE_JDK_DEFLATER;-use_jdk_deflater" "--USE_JDK_INFLATER;-use_jdk_inflater" "--help;-h" "--OUTPUT_DIRECTORY;-O" "--showHidden;-showHidden" )
        MIN_OCCURRENCES=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--DESIGN_NAME --REFERENCE_SEQUENCE --TARGETS --COMPRESSION_LEVEL --CREATE_INDEX --CREATE_MD5_FILE --GA4GH_CLIENT_SECRETS --MAX_RECORDS_IN_RAM --QUIET --TMP_DIR --USE_JDK_DEFLATER --USE_JDK_INFLATER --VALIDATION_STRINGENCY --VERBOSITY --arguments_file --BAIT_OFFSET --BAIT_SIZE --DESIGN_ON_TARGET_STRAND --DESIGN_STRATEGY --FILL_POOLS --help --LEFT_PRIMER --MERGE_NEARBY_TARGETS --MINIMUM_BAITS_PER_TARGET --OUTPUT_AGILENT_FILES --OUTPUT_DIRECTORY --PADDING --POOL_SIZE --REPEAT_TOLERANCE --RIGHT_PRIMER --version --showHidden )
        ALL_ARGUMENT_VALUE_TYPES=("String" "File" "File" "int" "Boolean" "boolean" "String" "Integer" "Boolean" "List[File]" "Boolean" "Boolean" "ValidationStringency" "LogLevel" "List[File]" "int" "int" "boolean" "DesignStrategy" "boolean" "boolean" "String" "boolean" "int" "boolean" "File" "int" "int" "int" "String" "boolean" "boolean" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "CollectIndependentReplicateMetrics" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--INPUT --OUTPUT --VCF --COMPRESSION_LEVEL --CREATE_INDEX --CREATE_MD5_FILE --GA4GH_CLIENT_SECRETS --MAX_RECORDS_IN_RAM --QUIET --REFERENCE_SEQUENCE --TMP_DIR --USE_JDK_DEFLATER --USE_JDK_INFLATER --VALIDATION_STRINGENCY --VERBOSITY --arguments_file --BARCODE_BQ --BARCODE_TAG --help --MATRIX_OUTPUT --MINIMUM_BARCODE_BQ --MINIMUM_BQ --MINIMUM_GQ --MINIMUM_MQ --SAMPLE --STOP_AFTER --version --showHidden )
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=("--INPUT;-I" "--OUTPUT;-O" "--VCF;-V" "--REFERENCE_SEQUENCE;-R" "--USE_JDK_DEFLATER;-use_jdk_deflater" "--USE_JDK_INFLATER;-use_jdk_inflater" "--help;-h" "--MATRIX_OUTPUT;-MO" "--MINIMUM_BARCODE_BQ;-MBQ" "--MINIMUM_BQ;-BQ" "--MINIMUM_GQ;-GQ" "--MINIMUM_MQ;-MQ" "--SAMPLE;-ALIAS" "--showHidden;-showHidden" )
        MIN_OCCURRENCES=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--INPUT --OUTPUT --VCF --COMPRESSION_LEVEL --CREATE_INDEX --CREATE_MD5_FILE --GA4GH_CLIENT_SECRETS --MAX_RECORDS_IN_RAM --QUIET --REFERENCE_SEQUENCE --TMP_DIR --USE_JDK_DEFLATER --USE_JDK_INFLATER --VALIDATION_STRINGENCY --VERBOSITY --arguments_file --BARCODE_BQ --BARCODE_TAG --help --MATRIX_OUTPUT --MINIMUM_BARCODE_BQ --MINIMUM_BQ --MINIMUM_GQ --MINIMUM_MQ --SAMPLE --STOP_AFTER --version --showHidden )
        ALL_ARGUMENT_VALUE_TYPES=("File" "File" "File" "int" "Boolean" "boolean" "String" "Integer" "Boolean" "File" "List[File]" "Boolean" "Boolean" "ValidationStringency" "LogLevel" "List[File]" "String" "String" "boolean" "File" "Integer" "Integer" "Integer" "Integer" "String" "Integer" "boolean" "boolean" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "ReadPosRankSumTest" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=()
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=()
        MIN_OCCURRENCES=()
        MAX_OCCURRENCES=()
        ALL_LEGAL_ARGUMENTS=()
        ALL_ARGUMENT_VALUE_TYPES=()

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "ReadsPipelineSpark" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--input --known-sites --output --reference --disable-read-filter --disable-tool-default-read-filters --exclude-intervals --gatk-config-file --interval-exclusion-padding --interval-padding --interval-set-rule --QUIET --read-filter --read-index --read-validation-stringency --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --align --alleles --annotate-with-num-discovered-alleles --annotation --annotation-group --annotations-to-exclude --arguments_file --assembly-region-padding --bam-partition-size --base-quality-score-threshold --binary-tag-name --bqsr-baq-gap-open-penalty --bwa-mem-index-image --conf --contamination-fraction-to-filter --dbsnp --default-base-qualities --deletions-default-quality --disable-sequence-dictionary-validation --disable-tool-default-annotations --duplicates-scoring-strategy --emit-original-quals --gcs-max-retries --genotyping-mode --global-qscore-prior --graph-output --help --heterozygosity --heterozygosity-stdev --indel-heterozygosity --indels-context-size --insertions-default-quality --interval-merging-rule --intervals --join-strategy --low-quality-tail --max-assembly-region-size --maximum-cycle-value --max-reads-per-alignment-start --min-assembly-region-size --min-base-quality-score --mismatches-context-size --mismatches-default-quality --native-pair-hmm-threads --native-pair-hmm-use-double-precision --num-reducers --output-bam --output-mode --preserve-qscores-less-than --program-name --quantize-quals --quantizing-levels --read-shard-padding --read-shard-size --sample-name --sample-ploidy --sharded-output --single-end-alignment --spark-master --standard-min-confidence-threshold-for-calling --use-new-qual-calculator --use-original-qualities --version --active-probability-threshold --allow-non-unique-kmers-in-ref --all-site-pls --bam-output --bam-writer-type --comp --consensus --contamination-fraction-per-sample-file --debug --disable-optimizations --do-not-run-physical-phasing --dont-increase-kmer-sizes-for-cycles --dont-trim-active-regions --dont-use-soft-clipped-bases --emit-ref-confidence --gvcf-gq-bands --indel-size-to-eliminate-in-ref-model --input-prior --kmer-size --max-alternate-alleles --max-genotype-count --max-num-haplotypes-in-population --max-prob-propagation-distance --min-dangling-branch-length --min-pruning --num-pruning-samples --pair-hmm-gap-continuation-penalty --pcr-indel-model --phred-scaled-global-read-mismapping-rate --round-down-quantized --showHidden --smith-waterman --static-quantized-quals --use-alleles-trigger --use-filtered-reads-for-annotations --recover-dangling-heads )
        MUTUALLY_EXCLUSIVE_ARGS=("--quantize-quals;static-quantized-quals,round-down-quantized" "--round-down-quantized;quantize-quals" "--static-quantized-quals;quantize-quals" )
        SYNONYMOUS_ARGS=("--input;-I" "--output;-O" "--reference;-R" "--disable-read-filter;-DF" "--disable-tool-default-read-filters;-disable-tool-default-read-filters" "--exclude-intervals;-XL" "--interval-exclusion-padding;-ixp" "--interval-padding;-ip" "--interval-set-rule;-isr" "--read-filter;-RF" "--read-index;-read-index" "--read-validation-stringency;-VS" "--use-jdk-deflater;-jdk-deflater" "--use-jdk-inflater;-jdk-inflater" "--verbosity;-verbosity" "--annotation;-A" "--annotation-group;-G" "--annotations-to-exclude;-AX" "--bwa-mem-index-image;-image" "--conf;-conf" "--contamination-fraction-to-filter;-contamination" "--dbsnp;-D" "--disable-sequence-dictionary-validation;-disable-sequence-dictionary-validation" "--disable-tool-default-annotations;-disable-tool-default-annotations" "--duplicates-scoring-strategy;-DS" "--gcs-max-retries;-gcs-retries" "--graph-output;-graph" "--help;-h" "--indels-context-size;-ics" "--interval-merging-rule;-imr" "--intervals;-L" "--maximum-cycle-value;-max-cycle" "--min-base-quality-score;-mbq" "--mismatches-context-size;-mcs" "--sample-name;-ALIAS" "--sample-ploidy;-ploidy" "--single-end-alignment;-se" "--standard-min-confidence-threshold-for-calling;-stand-call-conf" "--use-new-qual-calculator;-new-qual" "--use-original-qualities;-OQ" "--bam-output;-bamout" "--comp;-comp" "--contamination-fraction-per-sample-file;-contamination-file" "--debug;-debug" "--emit-ref-confidence;-ERC" "--gvcf-gq-bands;-GQB" "--showHidden;-showHidden" )
        MIN_OCCURRENCES=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--input --known-sites --output --reference --disable-read-filter --disable-tool-default-read-filters --exclude-intervals --gatk-config-file --interval-exclusion-padding --interval-padding --interval-set-rule --QUIET --read-filter --read-index --read-validation-stringency --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --align --alleles --annotate-with-num-discovered-alleles --annotation --annotation-group --annotations-to-exclude --arguments_file --assembly-region-padding --bam-partition-size --base-quality-score-threshold --binary-tag-name --bqsr-baq-gap-open-penalty --bwa-mem-index-image --conf --contamination-fraction-to-filter --dbsnp --default-base-qualities --deletions-default-quality --disable-sequence-dictionary-validation --disable-tool-default-annotations --duplicates-scoring-strategy --emit-original-quals --gcs-max-retries --genotyping-mode --global-qscore-prior --graph-output --help --heterozygosity --heterozygosity-stdev --indel-heterozygosity --indels-context-size --insertions-default-quality --interval-merging-rule --intervals --join-strategy --low-quality-tail --max-assembly-region-size --maximum-cycle-value --max-reads-per-alignment-start --min-assembly-region-size --min-base-quality-score --mismatches-context-size --mismatches-default-quality --native-pair-hmm-threads --native-pair-hmm-use-double-precision --num-reducers --output-bam --output-mode --preserve-qscores-less-than --program-name --quantize-quals --quantizing-levels --read-shard-padding --read-shard-size --sample-name --sample-ploidy --sharded-output --single-end-alignment --spark-master --standard-min-confidence-threshold-for-calling --use-new-qual-calculator --use-original-qualities --version --active-probability-threshold --allow-non-unique-kmers-in-ref --all-site-pls --bam-output --bam-writer-type --comp --consensus --contamination-fraction-per-sample-file --debug --disable-optimizations --do-not-run-physical-phasing --dont-increase-kmer-sizes-for-cycles --dont-trim-active-regions --dont-use-soft-clipped-bases --emit-ref-confidence --gvcf-gq-bands --indel-size-to-eliminate-in-ref-model --input-prior --kmer-size --max-alternate-alleles --max-genotype-count --max-num-haplotypes-in-population --max-prob-propagation-distance --min-dangling-branch-length --min-pruning --num-pruning-samples --pair-hmm-gap-continuation-penalty --pcr-indel-model --phred-scaled-global-read-mismapping-rate --round-down-quantized --showHidden --smith-waterman --static-quantized-quals --use-alleles-trigger --use-filtered-reads-for-annotations --recover-dangling-heads )
        ALL_ARGUMENT_VALUE_TYPES=("List[String]" "List[String]" "String" "String" "List[String]" "boolean" "List[String]" "String" "int" "int" "IntervalSetRule" "Boolean" "List[String]" "List[String]" "ValidationStringency" "List[File]" "boolean" "boolean" "LogLevel" "boolean" "FeatureInput[VariantContext]" "boolean" "List[String]" "List[String]" "List[String]" "List[File]" "int" "long" "byte" "String" "double" "String" "List[String]" "double" "FeatureInput[VariantContext]" "byte" "byte" "boolean" "boolean" "MarkDuplicatesScoringStrategy" "boolean" "int" "GenotypingOutputMode" "double" "String" "boolean" "Double" "double" "double" "int" "byte" "IntervalMergingRule" "List[String]" "JoinStrategy" "byte" "int" "int" "int" "int" "byte" "int" "byte" "int" "boolean" "int" "String" "OutputMode" "int" "String" "int" "int" "int" "int" "String" "int" "boolean" "boolean" "String" "double" "boolean" "Boolean" "boolean" "double" "boolean" "boolean" "String" "WriterType" "List[FeatureInput[VariantContext]]" "boolean" "File" "boolean" "boolean" "boolean" "boolean" "boolean" "boolean" "ReferenceConfidenceMode" "List[Integer]" "int" "List[Double]" "List[Integer]" "int" "int" "int" "int" "int" "int" "int" "int" "PCRErrorModel" "int" "boolean" "boolean" "Implementation" "List[Integer]" "boolean" "boolean" "boolean" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "AnnotateVcfWithExpectedAlleleFraction" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--mixing-fractions --output --variant --add-output-sam-program-record --add-output-vcf-command-line --create-output-bam-index --create-output-bam-md5 --create-output-variant-index --create-output-variant-md5 --disable-read-filter --disable-sequence-dictionary-validation --disable-tool-default-read-filters --exclude-intervals --gatk-config-file --input --interval-exclusion-padding --interval-padding --interval-set-rule --lenient --QUIET --read-filter --read-index --read-validation-stringency --seconds-between-progress-updates --sequence-dictionary --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --arguments_file --cloud-index-prefetch-buffer --cloud-prefetch-buffer --disable-bam-index-caching --gcs-max-retries --help --interval-merging-rule --intervals --reference --version --showHidden )
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=("--mixing-fractions;-mixing-fractions" "--output;-O" "--variant;-V" "--add-output-sam-program-record;-add-output-sam-program-record" "--add-output-vcf-command-line;-add-output-vcf-command-line" "--create-output-bam-index;-OBI" "--create-output-bam-md5;-OBM" "--create-output-variant-index;-OVI" "--create-output-variant-md5;-OVM" "--disable-read-filter;-DF" "--disable-sequence-dictionary-validation;-disable-sequence-dictionary-validation" "--disable-tool-default-read-filters;-disable-tool-default-read-filters" "--exclude-intervals;-XL" "--input;-I" "--interval-exclusion-padding;-ixp" "--interval-padding;-ip" "--interval-set-rule;-isr" "--lenient;-LE" "--read-filter;-RF" "--read-index;-read-index" "--read-validation-stringency;-VS" "--seconds-between-progress-updates;-seconds-between-progress-updates" "--sequence-dictionary;-sequence-dictionary" "--use-jdk-deflater;-jdk-deflater" "--use-jdk-inflater;-jdk-inflater" "--verbosity;-verbosity" "--cloud-index-prefetch-buffer;-CIPB" "--cloud-prefetch-buffer;-CPB" "--disable-bam-index-caching;-DBIC" "--gcs-max-retries;-gcs-retries" "--help;-h" "--interval-merging-rule;-imr" "--intervals;-L" "--reference;-R" "--showHidden;-showHidden" )
        MIN_OCCURRENCES=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--mixing-fractions --output --variant --add-output-sam-program-record --add-output-vcf-command-line --create-output-bam-index --create-output-bam-md5 --create-output-variant-index --create-output-variant-md5 --disable-read-filter --disable-sequence-dictionary-validation --disable-tool-default-read-filters --exclude-intervals --gatk-config-file --input --interval-exclusion-padding --interval-padding --interval-set-rule --lenient --QUIET --read-filter --read-index --read-validation-stringency --seconds-between-progress-updates --sequence-dictionary --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --arguments_file --cloud-index-prefetch-buffer --cloud-prefetch-buffer --disable-bam-index-caching --gcs-max-retries --help --interval-merging-rule --intervals --reference --version --showHidden )
        ALL_ARGUMENT_VALUE_TYPES=("File" "File" "String" "boolean" "boolean" "boolean" "boolean" "boolean" "boolean" "List[String]" "boolean" "boolean" "List[String]" "String" "List[String]" "int" "int" "IntervalSetRule" "boolean" "Boolean" "List[String]" "List[String]" "ValidationStringency" "double" "String" "List[File]" "boolean" "boolean" "LogLevel" "List[File]" "int" "int" "boolean" "int" "boolean" "IntervalMergingRule" "List[String]" "String" "boolean" "boolean" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "ExcessHet" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=()
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=()
        MIN_OCCURRENCES=()
        MAX_OCCURRENCES=()
        ALL_LEGAL_ARGUMENTS=()
        ALL_ARGUMENT_VALUE_TYPES=()

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "ReadGroupReadFilter" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--keep-read-group )
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=()
        MIN_OCCURRENCES=(0 )
        MAX_OCCURRENCES=(2147483647 )
        ALL_LEGAL_ARGUMENTS=(--keep-read-group )
        ALL_ARGUMENT_VALUE_TYPES=("String" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "TandemRepeat" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=()
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=()
        MIN_OCCURRENCES=()
        MAX_OCCURRENCES=()
        ALL_LEGAL_ARGUMENTS=()
        ALL_ARGUMENT_VALUE_TYPES=()

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "ModelSegments" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--output --output-prefix --gatk-config-file --QUIET --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --allelic-counts --arguments_file --denoised-copy-ratios --gcs-max-retries --genotyping-base-error-rate --genotyping-homozygous-log-ratio-threshold --help --kernel-approximation-dimension --kernel-scaling-allele-fraction --kernel-variance-allele-fraction --kernel-variance-copy-ratio --maximum-number-of-segments-per-chromosome --maximum-number-of-smoothing-iterations --minimum-total-allele-count --minor-allele-fraction-prior-alpha --normal-allelic-counts --number-of-burn-in-samples-allele-fraction --number-of-burn-in-samples-copy-ratio --number-of-changepoints-penalty-factor --number-of-samples-allele-fraction --number-of-samples-copy-ratio --number-of-smoothing-iterations-per-fit --smoothing-credible-interval-threshold-allele-fraction --smoothing-credible-interval-threshold-copy-ratio --version --window-size --showHidden )
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=("--output;-O" "--use-jdk-deflater;-jdk-deflater" "--use-jdk-inflater;-jdk-inflater" "--verbosity;-verbosity" "--gcs-max-retries;-gcs-retries" "--help;-h" "--showHidden;-showHidden" )
        MIN_OCCURRENCES=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--output --output-prefix --gatk-config-file --QUIET --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --allelic-counts --arguments_file --denoised-copy-ratios --gcs-max-retries --genotyping-base-error-rate --genotyping-homozygous-log-ratio-threshold --help --kernel-approximation-dimension --kernel-scaling-allele-fraction --kernel-variance-allele-fraction --kernel-variance-copy-ratio --maximum-number-of-segments-per-chromosome --maximum-number-of-smoothing-iterations --minimum-total-allele-count --minor-allele-fraction-prior-alpha --normal-allelic-counts --number-of-burn-in-samples-allele-fraction --number-of-burn-in-samples-copy-ratio --number-of-changepoints-penalty-factor --number-of-samples-allele-fraction --number-of-samples-copy-ratio --number-of-smoothing-iterations-per-fit --smoothing-credible-interval-threshold-allele-fraction --smoothing-credible-interval-threshold-copy-ratio --version --window-size --showHidden )
        ALL_ARGUMENT_VALUE_TYPES=("String" "String" "String" "Boolean" "List[File]" "boolean" "boolean" "LogLevel" "File" "List[File]" "File" "int" "double" "double" "boolean" "int" "double" "double" "double" "int" "int" "int" "double" "File" "int" "int" "double" "int" "int" "int" "double" "double" "boolean" "List[Integer]" "boolean" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "CallCopyRatioSegments" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--input --output --gatk-config-file --QUIET --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --arguments_file --calling-copy-ratio-z-score-threshold --gcs-max-retries --help --neutral-segment-copy-ratio-lower-bound --neutral-segment-copy-ratio-upper-bound --outlier-neutral-segment-copy-ratio-z-score-threshold --version --showHidden )
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=("--input;-I" "--output;-O" "--use-jdk-deflater;-jdk-deflater" "--use-jdk-inflater;-jdk-inflater" "--verbosity;-verbosity" "--gcs-max-retries;-gcs-retries" "--help;-h" "--showHidden;-showHidden" )
        MIN_OCCURRENCES=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--input --output --gatk-config-file --QUIET --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --arguments_file --calling-copy-ratio-z-score-threshold --gcs-max-retries --help --neutral-segment-copy-ratio-lower-bound --neutral-segment-copy-ratio-upper-bound --outlier-neutral-segment-copy-ratio-z-score-threshold --version --showHidden )
        ALL_ARGUMENT_VALUE_TYPES=("File" "File" "String" "Boolean" "List[File]" "boolean" "boolean" "LogLevel" "List[File]" "double" "int" "boolean" "double" "double" "double" "boolean" "boolean" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "SetNmMdAndUqTags" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--INPUT --OUTPUT --REFERENCE_SEQUENCE --COMPRESSION_LEVEL --CREATE_INDEX --CREATE_MD5_FILE --GA4GH_CLIENT_SECRETS --MAX_RECORDS_IN_RAM --QUIET --TMP_DIR --USE_JDK_DEFLATER --USE_JDK_INFLATER --VALIDATION_STRINGENCY --VERBOSITY --arguments_file --help --IS_BISULFITE_SEQUENCE --SET_ONLY_UQ --version --showHidden )
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=("--INPUT;-I" "--OUTPUT;-O" "--REFERENCE_SEQUENCE;-R" "--USE_JDK_DEFLATER;-use_jdk_deflater" "--USE_JDK_INFLATER;-use_jdk_inflater" "--help;-h" "--showHidden;-showHidden" )
        MIN_OCCURRENCES=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--INPUT --OUTPUT --REFERENCE_SEQUENCE --COMPRESSION_LEVEL --CREATE_INDEX --CREATE_MD5_FILE --GA4GH_CLIENT_SECRETS --MAX_RECORDS_IN_RAM --QUIET --TMP_DIR --USE_JDK_DEFLATER --USE_JDK_INFLATER --VALIDATION_STRINGENCY --VERBOSITY --arguments_file --help --IS_BISULFITE_SEQUENCE --SET_ONLY_UQ --version --showHidden )
        ALL_ARGUMENT_VALUE_TYPES=("File" "File" "File" "int" "Boolean" "boolean" "String" "Integer" "Boolean" "List[File]" "Boolean" "Boolean" "ValidationStringency" "LogLevel" "List[File]" "boolean" "boolean" "boolean" "boolean" "boolean" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "CountReadsSpark" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--input --disable-read-filter --disable-tool-default-read-filters --exclude-intervals --gatk-config-file --interval-exclusion-padding --interval-padding --interval-set-rule --QUIET --read-filter --read-index --read-validation-stringency --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --arguments_file --bam-partition-size --conf --disable-sequence-dictionary-validation --gcs-max-retries --help --interval-merging-rule --intervals --num-reducers --output --program-name --reference --sharded-output --spark-master --version --showHidden )
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=("--input;-I" "--disable-read-filter;-DF" "--disable-tool-default-read-filters;-disable-tool-default-read-filters" "--exclude-intervals;-XL" "--interval-exclusion-padding;-ixp" "--interval-padding;-ip" "--interval-set-rule;-isr" "--read-filter;-RF" "--read-index;-read-index" "--read-validation-stringency;-VS" "--use-jdk-deflater;-jdk-deflater" "--use-jdk-inflater;-jdk-inflater" "--verbosity;-verbosity" "--conf;-conf" "--disable-sequence-dictionary-validation;-disable-sequence-dictionary-validation" "--gcs-max-retries;-gcs-retries" "--help;-h" "--interval-merging-rule;-imr" "--intervals;-L" "--output;-O" "--reference;-R" "--showHidden;-showHidden" )
        MIN_OCCURRENCES=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--input --disable-read-filter --disable-tool-default-read-filters --exclude-intervals --gatk-config-file --interval-exclusion-padding --interval-padding --interval-set-rule --QUIET --read-filter --read-index --read-validation-stringency --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --arguments_file --bam-partition-size --conf --disable-sequence-dictionary-validation --gcs-max-retries --help --interval-merging-rule --intervals --num-reducers --output --program-name --reference --sharded-output --spark-master --version --showHidden )
        ALL_ARGUMENT_VALUE_TYPES=("List[String]" "List[String]" "boolean" "List[String]" "String" "int" "int" "IntervalSetRule" "Boolean" "List[String]" "List[String]" "ValidationStringency" "List[File]" "boolean" "boolean" "LogLevel" "List[File]" "long" "List[String]" "boolean" "int" "boolean" "IntervalMergingRule" "List[String]" "int" "String" "String" "String" "boolean" "String" "boolean" "boolean" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "CollectQualityYieldMetrics" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--INPUT --OUTPUT --COMPRESSION_LEVEL --CREATE_INDEX --CREATE_MD5_FILE --GA4GH_CLIENT_SECRETS --MAX_RECORDS_IN_RAM --QUIET --REFERENCE_SEQUENCE --TMP_DIR --USE_JDK_DEFLATER --USE_JDK_INFLATER --VALIDATION_STRINGENCY --VERBOSITY --arguments_file --ASSUME_SORTED --help --INCLUDE_SECONDARY_ALIGNMENTS --INCLUDE_SUPPLEMENTAL_ALIGNMENTS --STOP_AFTER --USE_ORIGINAL_QUALITIES --version --showHidden )
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=("--INPUT;-I" "--OUTPUT;-O" "--REFERENCE_SEQUENCE;-R" "--USE_JDK_DEFLATER;-use_jdk_deflater" "--USE_JDK_INFLATER;-use_jdk_inflater" "--ASSUME_SORTED;-AS" "--help;-h" "--USE_ORIGINAL_QUALITIES;-OQ" "--showHidden;-showHidden" )
        MIN_OCCURRENCES=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--INPUT --OUTPUT --COMPRESSION_LEVEL --CREATE_INDEX --CREATE_MD5_FILE --GA4GH_CLIENT_SECRETS --MAX_RECORDS_IN_RAM --QUIET --REFERENCE_SEQUENCE --TMP_DIR --USE_JDK_DEFLATER --USE_JDK_INFLATER --VALIDATION_STRINGENCY --VERBOSITY --arguments_file --ASSUME_SORTED --help --INCLUDE_SECONDARY_ALIGNMENTS --INCLUDE_SUPPLEMENTAL_ALIGNMENTS --STOP_AFTER --USE_ORIGINAL_QUALITIES --version --showHidden )
        ALL_ARGUMENT_VALUE_TYPES=("File" "File" "int" "Boolean" "boolean" "String" "Integer" "Boolean" "File" "List[File]" "Boolean" "Boolean" "ValidationStringency" "LogLevel" "List[File]" "boolean" "boolean" "boolean" "boolean" "long" "boolean" "boolean" "boolean" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "AllowAllReadsReadFilter" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=()
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=()
        MIN_OCCURRENCES=()
        MAX_OCCURRENCES=()
        ALL_LEGAL_ARGUMENTS=()
        ALL_ARGUMENT_VALUE_TYPES=()

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "AnnotateIntervals" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--intervals --output --reference --add-output-sam-program-record --add-output-vcf-command-line --create-output-bam-index --create-output-bam-md5 --create-output-variant-index --create-output-variant-md5 --disable-read-filter --disable-sequence-dictionary-validation --disable-tool-default-read-filters --exclude-intervals --gatk-config-file --input --interval-exclusion-padding --interval-padding --interval-set-rule --lenient --QUIET --read-filter --read-index --read-validation-stringency --seconds-between-progress-updates --sequence-dictionary --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --arguments_file --cloud-index-prefetch-buffer --cloud-prefetch-buffer --disable-bam-index-caching --gcs-max-retries --help --interval-merging-rule --version --showHidden )
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=("--intervals;-L" "--output;-O" "--reference;-R" "--add-output-sam-program-record;-add-output-sam-program-record" "--add-output-vcf-command-line;-add-output-vcf-command-line" "--create-output-bam-index;-OBI" "--create-output-bam-md5;-OBM" "--create-output-variant-index;-OVI" "--create-output-variant-md5;-OVM" "--disable-read-filter;-DF" "--disable-sequence-dictionary-validation;-disable-sequence-dictionary-validation" "--disable-tool-default-read-filters;-disable-tool-default-read-filters" "--exclude-intervals;-XL" "--input;-I" "--interval-exclusion-padding;-ixp" "--interval-padding;-ip" "--interval-set-rule;-isr" "--lenient;-LE" "--read-filter;-RF" "--read-index;-read-index" "--read-validation-stringency;-VS" "--seconds-between-progress-updates;-seconds-between-progress-updates" "--sequence-dictionary;-sequence-dictionary" "--use-jdk-deflater;-jdk-deflater" "--use-jdk-inflater;-jdk-inflater" "--verbosity;-verbosity" "--cloud-index-prefetch-buffer;-CIPB" "--cloud-prefetch-buffer;-CPB" "--disable-bam-index-caching;-DBIC" "--gcs-max-retries;-gcs-retries" "--help;-h" "--interval-merging-rule;-imr" "--showHidden;-showHidden" )
        MIN_OCCURRENCES=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--intervals --output --reference --add-output-sam-program-record --add-output-vcf-command-line --create-output-bam-index --create-output-bam-md5 --create-output-variant-index --create-output-variant-md5 --disable-read-filter --disable-sequence-dictionary-validation --disable-tool-default-read-filters --exclude-intervals --gatk-config-file --input --interval-exclusion-padding --interval-padding --interval-set-rule --lenient --QUIET --read-filter --read-index --read-validation-stringency --seconds-between-progress-updates --sequence-dictionary --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --arguments_file --cloud-index-prefetch-buffer --cloud-prefetch-buffer --disable-bam-index-caching --gcs-max-retries --help --interval-merging-rule --version --showHidden )
        ALL_ARGUMENT_VALUE_TYPES=("List[String]" "File" "String" "boolean" "boolean" "boolean" "boolean" "boolean" "boolean" "List[String]" "boolean" "boolean" "List[String]" "String" "List[String]" "int" "int" "IntervalSetRule" "boolean" "Boolean" "List[String]" "List[String]" "ValidationStringency" "double" "String" "List[File]" "boolean" "boolean" "LogLevel" "List[File]" "int" "int" "boolean" "int" "boolean" "IntervalMergingRule" "boolean" "boolean" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "CollectInsertSizeMetrics" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--Histogram_FILE --INPUT --OUTPUT --COMPRESSION_LEVEL --CREATE_INDEX --CREATE_MD5_FILE --GA4GH_CLIENT_SECRETS --MAX_RECORDS_IN_RAM --QUIET --REFERENCE_SEQUENCE --TMP_DIR --USE_JDK_DEFLATER --USE_JDK_INFLATER --VALIDATION_STRINGENCY --VERBOSITY --arguments_file --ASSUME_SORTED --DEVIATIONS --help --HISTOGRAM_WIDTH --INCLUDE_DUPLICATES --METRIC_ACCUMULATION_LEVEL --MINIMUM_PCT --STOP_AFTER --version --showHidden )
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=("--Histogram_FILE;-H" "--INPUT;-I" "--OUTPUT;-O" "--REFERENCE_SEQUENCE;-R" "--USE_JDK_DEFLATER;-use_jdk_deflater" "--USE_JDK_INFLATER;-use_jdk_inflater" "--ASSUME_SORTED;-AS" "--help;-h" "--HISTOGRAM_WIDTH;-W" "--METRIC_ACCUMULATION_LEVEL;-LEVEL" "--MINIMUM_PCT;-M" "--showHidden;-showHidden" )
        MIN_OCCURRENCES=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--Histogram_FILE --INPUT --OUTPUT --COMPRESSION_LEVEL --CREATE_INDEX --CREATE_MD5_FILE --GA4GH_CLIENT_SECRETS --MAX_RECORDS_IN_RAM --QUIET --REFERENCE_SEQUENCE --TMP_DIR --USE_JDK_DEFLATER --USE_JDK_INFLATER --VALIDATION_STRINGENCY --VERBOSITY --arguments_file --ASSUME_SORTED --DEVIATIONS --help --HISTOGRAM_WIDTH --INCLUDE_DUPLICATES --METRIC_ACCUMULATION_LEVEL --MINIMUM_PCT --STOP_AFTER --version --showHidden )
        ALL_ARGUMENT_VALUE_TYPES=("File" "File" "File" "int" "Boolean" "boolean" "String" "Integer" "Boolean" "File" "List[File]" "Boolean" "Boolean" "ValidationStringency" "LogLevel" "List[File]" "boolean" "double" "boolean" "Integer" "boolean" "Set[MetricAccumulationLevel]" "float" "long" "boolean" "boolean" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "LibraryReadFilter" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--library )
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=("--library;-library" )
        MIN_OCCURRENCES=(0 )
        MAX_OCCURRENCES=(2147483647 )
        ALL_LEGAL_ARGUMENTS=(--library )
        ALL_ARGUMENT_VALUE_TYPES=("Set[String]" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "FifoBuffer" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--COMPRESSION_LEVEL --CREATE_INDEX --CREATE_MD5_FILE --GA4GH_CLIENT_SECRETS --MAX_RECORDS_IN_RAM --QUIET --REFERENCE_SEQUENCE --TMP_DIR --USE_JDK_DEFLATER --USE_JDK_INFLATER --VALIDATION_STRINGENCY --VERBOSITY --arguments_file --BUFFER_SIZE --DEBUG_FREQUENCY --help --IO_SIZE --NAME --version --showHidden )
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=("--REFERENCE_SEQUENCE;-R" "--USE_JDK_DEFLATER;-use_jdk_deflater" "--USE_JDK_INFLATER;-use_jdk_inflater" "--help;-h" "--showHidden;-showHidden" )
        MIN_OCCURRENCES=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--COMPRESSION_LEVEL --CREATE_INDEX --CREATE_MD5_FILE --GA4GH_CLIENT_SECRETS --MAX_RECORDS_IN_RAM --QUIET --REFERENCE_SEQUENCE --TMP_DIR --USE_JDK_DEFLATER --USE_JDK_INFLATER --VALIDATION_STRINGENCY --VERBOSITY --arguments_file --BUFFER_SIZE --DEBUG_FREQUENCY --help --IO_SIZE --NAME --version --showHidden )
        ALL_ARGUMENT_VALUE_TYPES=("int" "Boolean" "boolean" "String" "Integer" "Boolean" "File" "List[File]" "Boolean" "Boolean" "ValidationStringency" "LogLevel" "List[File]" "int" "int" "boolean" "int" "String" "boolean" "boolean" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "UpdateVcfSequenceDictionary" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--INPUT --OUTPUT --SEQUENCE_DICTIONARY --COMPRESSION_LEVEL --CREATE_INDEX --CREATE_MD5_FILE --GA4GH_CLIENT_SECRETS --MAX_RECORDS_IN_RAM --QUIET --REFERENCE_SEQUENCE --TMP_DIR --USE_JDK_DEFLATER --USE_JDK_INFLATER --VALIDATION_STRINGENCY --VERBOSITY --arguments_file --help --version --showHidden )
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=("--INPUT;-I" "--OUTPUT;-O" "--SEQUENCE_DICTIONARY;-SD" "--REFERENCE_SEQUENCE;-R" "--USE_JDK_DEFLATER;-use_jdk_deflater" "--USE_JDK_INFLATER;-use_jdk_inflater" "--help;-h" "--showHidden;-showHidden" )
        MIN_OCCURRENCES=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--INPUT --OUTPUT --SEQUENCE_DICTIONARY --COMPRESSION_LEVEL --CREATE_INDEX --CREATE_MD5_FILE --GA4GH_CLIENT_SECRETS --MAX_RECORDS_IN_RAM --QUIET --REFERENCE_SEQUENCE --TMP_DIR --USE_JDK_DEFLATER --USE_JDK_INFLATER --VALIDATION_STRINGENCY --VERBOSITY --arguments_file --help --version --showHidden )
        ALL_ARGUMENT_VALUE_TYPES=("File" "File" "File" "int" "Boolean" "boolean" "String" "Integer" "Boolean" "File" "List[File]" "Boolean" "Boolean" "ValidationStringency" "LogLevel" "List[File]" "boolean" "boolean" "boolean" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "IntervalListTools" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--INPUT --COMPRESSION_LEVEL --CREATE_INDEX --CREATE_MD5_FILE --GA4GH_CLIENT_SECRETS --MAX_RECORDS_IN_RAM --QUIET --REFERENCE_SEQUENCE --TMP_DIR --USE_JDK_DEFLATER --USE_JDK_INFLATER --VALIDATION_STRINGENCY --VERBOSITY --ACTION --arguments_file --BREAK_BANDS_AT_MULTIPLES_OF --COMMENT --help --INCLUDE_FILTERED --INVERT --OUTPUT --PADDING --SCATTER_COUNT --SECOND_INPUT --SORT --SUBDIVISION_MODE --UNIQUE --version --showHidden )
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=("--INPUT;-I" "--REFERENCE_SEQUENCE;-R" "--USE_JDK_DEFLATER;-use_jdk_deflater" "--USE_JDK_INFLATER;-use_jdk_inflater" "--BREAK_BANDS_AT_MULTIPLES_OF;-BRK" "--help;-h" "--OUTPUT;-O" "--SECOND_INPUT;-SI" "--SUBDIVISION_MODE;-M" "--showHidden;-showHidden" )
        MIN_OCCURRENCES=(1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--INPUT --COMPRESSION_LEVEL --CREATE_INDEX --CREATE_MD5_FILE --GA4GH_CLIENT_SECRETS --MAX_RECORDS_IN_RAM --QUIET --REFERENCE_SEQUENCE --TMP_DIR --USE_JDK_DEFLATER --USE_JDK_INFLATER --VALIDATION_STRINGENCY --VERBOSITY --ACTION --arguments_file --BREAK_BANDS_AT_MULTIPLES_OF --COMMENT --help --INCLUDE_FILTERED --INVERT --OUTPUT --PADDING --SCATTER_COUNT --SECOND_INPUT --SORT --SUBDIVISION_MODE --UNIQUE --version --showHidden )
        ALL_ARGUMENT_VALUE_TYPES=("List[File]" "int" "Boolean" "boolean" "String" "Integer" "Boolean" "File" "List[File]" "Boolean" "Boolean" "ValidationStringency" "LogLevel" "Action" "List[File]" "int" "List[String]" "boolean" "boolean" "boolean" "File" "int" "int" "List[File]" "boolean" "Mode" "boolean" "boolean" "boolean" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "PossibleDeNovo" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=()
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=()
        MIN_OCCURRENCES=()
        MAX_OCCURRENCES=()
        ALL_LEGAL_ARGUMENTS=()
        ALL_ARGUMENT_VALUE_TYPES=()

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "CollectWgsMetricsWithNonZeroCoverage" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--CHART_OUTPUT --INPUT --OUTPUT --REFERENCE_SEQUENCE --COMPRESSION_LEVEL --CREATE_INDEX --CREATE_MD5_FILE --GA4GH_CLIENT_SECRETS --MAX_RECORDS_IN_RAM --QUIET --TMP_DIR --USE_JDK_DEFLATER --USE_JDK_INFLATER --VALIDATION_STRINGENCY --VERBOSITY --arguments_file --COUNT_UNPAIRED --COVERAGE_CAP --help --INCLUDE_BQ_HISTOGRAM --INTERVALS --LOCUS_ACCUMULATION_CAP --MINIMUM_BASE_QUALITY --MINIMUM_MAPPING_QUALITY --READ_LENGTH --SAMPLE_SIZE --STOP_AFTER --USE_FAST_ALGORITHM --version --showHidden )
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=("--CHART_OUTPUT;-CHART" "--INPUT;-I" "--OUTPUT;-O" "--REFERENCE_SEQUENCE;-R" "--USE_JDK_DEFLATER;-use_jdk_deflater" "--USE_JDK_INFLATER;-use_jdk_inflater" "--COVERAGE_CAP;-CAP" "--help;-h" "--MINIMUM_BASE_QUALITY;-Q" "--MINIMUM_MAPPING_QUALITY;-MQ" "--showHidden;-showHidden" )
        MIN_OCCURRENCES=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--CHART_OUTPUT --INPUT --OUTPUT --REFERENCE_SEQUENCE --COMPRESSION_LEVEL --CREATE_INDEX --CREATE_MD5_FILE --GA4GH_CLIENT_SECRETS --MAX_RECORDS_IN_RAM --QUIET --TMP_DIR --USE_JDK_DEFLATER --USE_JDK_INFLATER --VALIDATION_STRINGENCY --VERBOSITY --arguments_file --COUNT_UNPAIRED --COVERAGE_CAP --help --INCLUDE_BQ_HISTOGRAM --INTERVALS --LOCUS_ACCUMULATION_CAP --MINIMUM_BASE_QUALITY --MINIMUM_MAPPING_QUALITY --READ_LENGTH --SAMPLE_SIZE --STOP_AFTER --USE_FAST_ALGORITHM --version --showHidden )
        ALL_ARGUMENT_VALUE_TYPES=("File" "File" "File" "File" "int" "Boolean" "boolean" "String" "Integer" "Boolean" "List[File]" "Boolean" "Boolean" "ValidationStringency" "LogLevel" "List[File]" "boolean" "int" "boolean" "boolean" "File" "int" "int" "int" "int" "int" "long" "boolean" "boolean" "boolean" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "GermlineCNVCaller" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--contig-ploidy-calls --input --output --output-prefix --run-mode --exclude-intervals --gatk-config-file --interval-exclusion-padding --interval-padding --interval-set-rule --QUIET --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --active-class-padding-hybrid-mode --adamax-beta-1 --adamax-beta-2 --annotated-intervals --arguments_file --caller-admixing-rate --caller-update-convergence-threshold --class-coherence-length --cnv-coherence-length --convergence-snr-averaging-window --convergence-snr-countdown-window --convergence-snr-trigger-threshold --copy-number-posterior-expectation-mode --depth-correction-tau --disable-annealing --disable-caller --disable-sampler --enable-bias-factors --gc-curve-standard-deviation --gcs-max-retries --help --init-ard-rel-unexplained-variance --initial-temperature --interval-merging-rule --interval-psi-scale --intervals --learning-rate --log-emission-samples-per-round --log-emission-sampling-median-rel-error --log-emission-sampling-rounds --log-mean-bias-standard-deviation --mapping-error-rate --max-advi-iter-first-epoch --max-advi-iter-subsequent-epochs --max-bias-factors --max-calling-iters --max-copy-number --max-training-epochs --min-training-epochs --model --num-gc-bins --num-thermal-epochs --p-active --p-alt --sample-psi-scale --version --showHidden )
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=("--exclude-intervals;-XL" "--interval-exclusion-padding;-ixp" "--interval-padding;-ip" "--interval-set-rule;-isr" "--use-jdk-deflater;-jdk-deflater" "--use-jdk-inflater;-jdk-inflater" "--verbosity;-verbosity" "--gcs-max-retries;-gcs-retries" "--help;-h" "--interval-merging-rule;-imr" "--intervals;-L" "--showHidden;-showHidden" )
        MIN_OCCURRENCES=(0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--contig-ploidy-calls --input --output --output-prefix --run-mode --exclude-intervals --gatk-config-file --interval-exclusion-padding --interval-padding --interval-set-rule --QUIET --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --active-class-padding-hybrid-mode --adamax-beta-1 --adamax-beta-2 --annotated-intervals --arguments_file --caller-admixing-rate --caller-update-convergence-threshold --class-coherence-length --cnv-coherence-length --convergence-snr-averaging-window --convergence-snr-countdown-window --convergence-snr-trigger-threshold --copy-number-posterior-expectation-mode --depth-correction-tau --disable-annealing --disable-caller --disable-sampler --enable-bias-factors --gc-curve-standard-deviation --gcs-max-retries --help --init-ard-rel-unexplained-variance --initial-temperature --interval-merging-rule --interval-psi-scale --intervals --learning-rate --log-emission-samples-per-round --log-emission-sampling-median-rel-error --log-emission-sampling-rounds --log-mean-bias-standard-deviation --mapping-error-rate --max-advi-iter-first-epoch --max-advi-iter-subsequent-epochs --max-bias-factors --max-calling-iters --max-copy-number --max-training-epochs --min-training-epochs --model --num-gc-bins --num-thermal-epochs --p-active --p-alt --sample-psi-scale --version --showHidden )
        ALL_ARGUMENT_VALUE_TYPES=("String" "List[File]" "String" "String" "RunMode" "List[String]" "String" "int" "int" "IntervalSetRule" "Boolean" "List[File]" "boolean" "boolean" "LogLevel" "int" "double" "double" "File" "List[File]" "double" "double" "double" "double" "int" "int" "double" "CopyNumberPosteriorExpectationMode" "double" "boolean" "boolean" "boolean" "boolean" "double" "int" "boolean" "double" "double" "IntervalMergingRule" "double" "List[String]" "double" "int" "double" "int" "double" "double" "int" "int" "int" "int" "int" "int" "int" "String" "int" "int" "double" "double" "double" "boolean" "boolean" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "AS_StrandOddsRatio" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=()
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=()
        MIN_OCCURRENCES=()
        MAX_OCCURRENCES=()
        ALL_LEGAL_ARGUMENTS=()
        ALL_ARGUMENT_VALUE_TYPES=()

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "CollectVariantCallingMetrics" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--DBSNP --INPUT --OUTPUT --COMPRESSION_LEVEL --CREATE_INDEX --CREATE_MD5_FILE --GA4GH_CLIENT_SECRETS --MAX_RECORDS_IN_RAM --QUIET --REFERENCE_SEQUENCE --TMP_DIR --USE_JDK_DEFLATER --USE_JDK_INFLATER --VALIDATION_STRINGENCY --VERBOSITY --arguments_file --GVCF_INPUT --help --SEQUENCE_DICTIONARY --TARGET_INTERVALS --THREAD_COUNT --version --showHidden )
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=("--INPUT;-I" "--OUTPUT;-O" "--REFERENCE_SEQUENCE;-R" "--USE_JDK_DEFLATER;-use_jdk_deflater" "--USE_JDK_INFLATER;-use_jdk_inflater" "--help;-h" "--SEQUENCE_DICTIONARY;-SD" "--TARGET_INTERVALS;-TI" "--showHidden;-showHidden" )
        MIN_OCCURRENCES=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--DBSNP --INPUT --OUTPUT --COMPRESSION_LEVEL --CREATE_INDEX --CREATE_MD5_FILE --GA4GH_CLIENT_SECRETS --MAX_RECORDS_IN_RAM --QUIET --REFERENCE_SEQUENCE --TMP_DIR --USE_JDK_DEFLATER --USE_JDK_INFLATER --VALIDATION_STRINGENCY --VERBOSITY --arguments_file --GVCF_INPUT --help --SEQUENCE_DICTIONARY --TARGET_INTERVALS --THREAD_COUNT --version --showHidden )
        ALL_ARGUMENT_VALUE_TYPES=("File" "File" "File" "int" "Boolean" "boolean" "String" "Integer" "Boolean" "File" "List[File]" "Boolean" "Boolean" "ValidationStringency" "LogLevel" "List[File]" "boolean" "boolean" "File" "File" "int" "boolean" "boolean" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "CountBasesSpark" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--input --disable-read-filter --disable-tool-default-read-filters --exclude-intervals --gatk-config-file --interval-exclusion-padding --interval-padding --interval-set-rule --QUIET --read-filter --read-index --read-validation-stringency --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --arguments_file --bam-partition-size --conf --disable-sequence-dictionary-validation --gcs-max-retries --help --interval-merging-rule --intervals --num-reducers --output --program-name --reference --sharded-output --spark-master --version --showHidden )
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=("--input;-I" "--disable-read-filter;-DF" "--disable-tool-default-read-filters;-disable-tool-default-read-filters" "--exclude-intervals;-XL" "--interval-exclusion-padding;-ixp" "--interval-padding;-ip" "--interval-set-rule;-isr" "--read-filter;-RF" "--read-index;-read-index" "--read-validation-stringency;-VS" "--use-jdk-deflater;-jdk-deflater" "--use-jdk-inflater;-jdk-inflater" "--verbosity;-verbosity" "--conf;-conf" "--disable-sequence-dictionary-validation;-disable-sequence-dictionary-validation" "--gcs-max-retries;-gcs-retries" "--help;-h" "--interval-merging-rule;-imr" "--intervals;-L" "--output;-O" "--reference;-R" "--showHidden;-showHidden" )
        MIN_OCCURRENCES=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--input --disable-read-filter --disable-tool-default-read-filters --exclude-intervals --gatk-config-file --interval-exclusion-padding --interval-padding --interval-set-rule --QUIET --read-filter --read-index --read-validation-stringency --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --arguments_file --bam-partition-size --conf --disable-sequence-dictionary-validation --gcs-max-retries --help --interval-merging-rule --intervals --num-reducers --output --program-name --reference --sharded-output --spark-master --version --showHidden )
        ALL_ARGUMENT_VALUE_TYPES=("List[String]" "List[String]" "boolean" "List[String]" "String" "int" "int" "IntervalSetRule" "Boolean" "List[String]" "List[String]" "ValidationStringency" "List[File]" "boolean" "boolean" "LogLevel" "List[File]" "long" "List[String]" "boolean" "int" "boolean" "IntervalMergingRule" "List[String]" "int" "String" "String" "String" "boolean" "String" "boolean" "boolean" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "ConvertHeaderlessHadoopBamShardToBam" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--bam-shard --bam-with-header --output --gatk-config-file --QUIET --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --arguments_file --gcs-max-retries --help --version --showHidden )
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=("--output;-O" "--use-jdk-deflater;-jdk-deflater" "--use-jdk-inflater;-jdk-inflater" "--verbosity;-verbosity" "--gcs-max-retries;-gcs-retries" "--help;-h" "--showHidden;-showHidden" )
        MIN_OCCURRENCES=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--bam-shard --bam-with-header --output --gatk-config-file --QUIET --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --arguments_file --gcs-max-retries --help --version --showHidden )
        ALL_ARGUMENT_VALUE_TYPES=("File" "File" "File" "String" "Boolean" "List[File]" "boolean" "boolean" "LogLevel" "List[File]" "int" "boolean" "boolean" "boolean" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "FastqToSam" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--FASTQ --OUTPUT --SAMPLE_NAME --COMPRESSION_LEVEL --CREATE_INDEX --CREATE_MD5_FILE --GA4GH_CLIENT_SECRETS --MAX_RECORDS_IN_RAM --QUIET --REFERENCE_SEQUENCE --TMP_DIR --USE_JDK_DEFLATER --USE_JDK_INFLATER --VALIDATION_STRINGENCY --VERBOSITY --ALLOW_AND_IGNORE_EMPTY_LINES --arguments_file --COMMENT --DESCRIPTION --FASTQ2 --help --LIBRARY_NAME --MAX_Q --MIN_Q --PLATFORM --PLATFORM_MODEL --PLATFORM_UNIT --PREDICTED_INSERT_SIZE --PROGRAM_GROUP --QUALITY_FORMAT --READ_GROUP_NAME --RUN_DATE --SEQUENCING_CENTER --SORT_ORDER --USE_SEQUENTIAL_FASTQS --version --showHidden --STRIP_UNPAIRED_MATE_NUMBER )
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=("--FASTQ;-F1" "--OUTPUT;-O" "--SAMPLE_NAME;-SM" "--REFERENCE_SEQUENCE;-R" "--USE_JDK_DEFLATER;-use_jdk_deflater" "--USE_JDK_INFLATER;-use_jdk_inflater" "--COMMENT;-CO" "--DESCRIPTION;-DS" "--FASTQ2;-F2" "--help;-h" "--LIBRARY_NAME;-LB" "--PLATFORM;-PL" "--PLATFORM_MODEL;-PM" "--PLATFORM_UNIT;-PU" "--PREDICTED_INSERT_SIZE;-PI" "--PROGRAM_GROUP;-PG" "--QUALITY_FORMAT;-V" "--READ_GROUP_NAME;-RG" "--RUN_DATE;-DT" "--SEQUENCING_CENTER;-CN" "--SORT_ORDER;-SO" "--showHidden;-showHidden" )
        MIN_OCCURRENCES=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--FASTQ --OUTPUT --SAMPLE_NAME --COMPRESSION_LEVEL --CREATE_INDEX --CREATE_MD5_FILE --GA4GH_CLIENT_SECRETS --MAX_RECORDS_IN_RAM --QUIET --REFERENCE_SEQUENCE --TMP_DIR --USE_JDK_DEFLATER --USE_JDK_INFLATER --VALIDATION_STRINGENCY --VERBOSITY --ALLOW_AND_IGNORE_EMPTY_LINES --arguments_file --COMMENT --DESCRIPTION --FASTQ2 --help --LIBRARY_NAME --MAX_Q --MIN_Q --PLATFORM --PLATFORM_MODEL --PLATFORM_UNIT --PREDICTED_INSERT_SIZE --PROGRAM_GROUP --QUALITY_FORMAT --READ_GROUP_NAME --RUN_DATE --SEQUENCING_CENTER --SORT_ORDER --USE_SEQUENTIAL_FASTQS --version --showHidden --STRIP_UNPAIRED_MATE_NUMBER )
        ALL_ARGUMENT_VALUE_TYPES=("File" "File" "String" "int" "Boolean" "boolean" "String" "Integer" "Boolean" "File" "List[File]" "Boolean" "Boolean" "ValidationStringency" "LogLevel" "Boolean" "List[File]" "List[String]" "String" "File" "boolean" "String" "int" "int" "String" "String" "String" "Integer" "String" "FastqQualityFormat" "String" "Iso8601Date" "String" "SortOrder" "boolean" "boolean" "boolean" "Boolean" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "MarkIlluminaAdapters" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--INPUT --METRICS --COMPRESSION_LEVEL --CREATE_INDEX --CREATE_MD5_FILE --GA4GH_CLIENT_SECRETS --MAX_RECORDS_IN_RAM --QUIET --REFERENCE_SEQUENCE --TMP_DIR --USE_JDK_DEFLATER --USE_JDK_INFLATER --VALIDATION_STRINGENCY --VERBOSITY --ADAPTER_TRUNCATION_LENGTH --ADAPTERS --arguments_file --FIVE_PRIME_ADAPTER --help --MAX_ERROR_RATE_PE --MAX_ERROR_RATE_SE --MIN_MATCH_BASES_PE --MIN_MATCH_BASES_SE --NUM_ADAPTERS_TO_KEEP --OUTPUT --PAIRED_RUN --PRUNE_ADAPTER_LIST_AFTER_THIS_MANY_ADAPTERS_SEEN --THREE_PRIME_ADAPTER --version --showHidden )
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=("--INPUT;-I" "--METRICS;-M" "--REFERENCE_SEQUENCE;-R" "--USE_JDK_DEFLATER;-use_jdk_deflater" "--USE_JDK_INFLATER;-use_jdk_inflater" "--help;-h" "--OUTPUT;-O" "--PAIRED_RUN;-PE" "--PRUNE_ADAPTER_LIST_AFTER_THIS_MANY_ADAPTERS_SEEN;-APT" "--showHidden;-showHidden" )
        MIN_OCCURRENCES=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--INPUT --METRICS --COMPRESSION_LEVEL --CREATE_INDEX --CREATE_MD5_FILE --GA4GH_CLIENT_SECRETS --MAX_RECORDS_IN_RAM --QUIET --REFERENCE_SEQUENCE --TMP_DIR --USE_JDK_DEFLATER --USE_JDK_INFLATER --VALIDATION_STRINGENCY --VERBOSITY --ADAPTER_TRUNCATION_LENGTH --ADAPTERS --arguments_file --FIVE_PRIME_ADAPTER --help --MAX_ERROR_RATE_PE --MAX_ERROR_RATE_SE --MIN_MATCH_BASES_PE --MIN_MATCH_BASES_SE --NUM_ADAPTERS_TO_KEEP --OUTPUT --PAIRED_RUN --PRUNE_ADAPTER_LIST_AFTER_THIS_MANY_ADAPTERS_SEEN --THREE_PRIME_ADAPTER --version --showHidden )
        ALL_ARGUMENT_VALUE_TYPES=("File" "File" "int" "Boolean" "boolean" "String" "Integer" "Boolean" "File" "List[File]" "Boolean" "Boolean" "ValidationStringency" "LogLevel" "int" "List[IlluminaAdapterPair]" "List[File]" "String" "boolean" "double" "double" "int" "int" "int" "File" "Boolean" "int" "String" "boolean" "boolean" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "CollectIlluminaLaneMetrics" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--OUTPUT_DIRECTORY --OUTPUT_PREFIX --RUN_DIRECTORY --COMPRESSION_LEVEL --CREATE_INDEX --CREATE_MD5_FILE --GA4GH_CLIENT_SECRETS --MAX_RECORDS_IN_RAM --QUIET --REFERENCE_SEQUENCE --TMP_DIR --USE_JDK_DEFLATER --USE_JDK_INFLATER --VALIDATION_STRINGENCY --VERBOSITY --arguments_file --FILE_EXTENSION --help --IS_NOVASEQ --READ_STRUCTURE --version --showHidden )
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=("--OUTPUT_PREFIX;-O" "--REFERENCE_SEQUENCE;-R" "--USE_JDK_DEFLATER;-use_jdk_deflater" "--USE_JDK_INFLATER;-use_jdk_inflater" "--FILE_EXTENSION;-EXT" "--help;-h" "--READ_STRUCTURE;-RS" "--showHidden;-showHidden" )
        MIN_OCCURRENCES=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--OUTPUT_DIRECTORY --OUTPUT_PREFIX --RUN_DIRECTORY --COMPRESSION_LEVEL --CREATE_INDEX --CREATE_MD5_FILE --GA4GH_CLIENT_SECRETS --MAX_RECORDS_IN_RAM --QUIET --REFERENCE_SEQUENCE --TMP_DIR --USE_JDK_DEFLATER --USE_JDK_INFLATER --VALIDATION_STRINGENCY --VERBOSITY --arguments_file --FILE_EXTENSION --help --IS_NOVASEQ --READ_STRUCTURE --version --showHidden )
        ALL_ARGUMENT_VALUE_TYPES=("File" "String" "File" "int" "Boolean" "boolean" "String" "Integer" "Boolean" "File" "List[File]" "Boolean" "Boolean" "ValidationStringency" "LogLevel" "List[File]" "String" "boolean" "boolean" "ReadStructure" "boolean" "boolean" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "GenotypeGVCFs" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--output --reference --variant --add-output-sam-program-record --add-output-vcf-command-line --create-output-bam-index --create-output-bam-md5 --create-output-variant-index --create-output-variant-md5 --disable-read-filter --disable-sequence-dictionary-validation --disable-tool-default-read-filters --exclude-intervals --gatk-config-file --input --interval-exclusion-padding --interval-padding --interval-set-rule --lenient --QUIET --read-filter --read-index --read-validation-stringency --seconds-between-progress-updates --sequence-dictionary --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --annotate-with-num-discovered-alleles --annotation --annotation-group --annotations-to-exclude --arguments_file --cloud-index-prefetch-buffer --cloud-prefetch-buffer --dbsnp --disable-bam-index-caching --disable-tool-default-annotations --gcs-max-retries --help --heterozygosity --heterozygosity-stdev --indel-heterozygosity --interval-merging-rule --intervals --sample-ploidy --standard-min-confidence-threshold-for-calling --use-new-qual-calculator --version --input-prior --max-alternate-alleles --max-genotype-count --only-output-calls-starting-in-intervals --showHidden )
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=("--output;-O" "--reference;-R" "--variant;-V" "--add-output-sam-program-record;-add-output-sam-program-record" "--add-output-vcf-command-line;-add-output-vcf-command-line" "--create-output-bam-index;-OBI" "--create-output-bam-md5;-OBM" "--create-output-variant-index;-OVI" "--create-output-variant-md5;-OVM" "--disable-read-filter;-DF" "--disable-sequence-dictionary-validation;-disable-sequence-dictionary-validation" "--disable-tool-default-read-filters;-disable-tool-default-read-filters" "--exclude-intervals;-XL" "--input;-I" "--interval-exclusion-padding;-ixp" "--interval-padding;-ip" "--interval-set-rule;-isr" "--lenient;-LE" "--read-filter;-RF" "--read-index;-read-index" "--read-validation-stringency;-VS" "--seconds-between-progress-updates;-seconds-between-progress-updates" "--sequence-dictionary;-sequence-dictionary" "--use-jdk-deflater;-jdk-deflater" "--use-jdk-inflater;-jdk-inflater" "--verbosity;-verbosity" "--annotation;-A" "--annotation-group;-G" "--annotations-to-exclude;-AX" "--cloud-index-prefetch-buffer;-CIPB" "--cloud-prefetch-buffer;-CPB" "--dbsnp;-D" "--disable-bam-index-caching;-DBIC" "--disable-tool-default-annotations;-disable-tool-default-annotations" "--gcs-max-retries;-gcs-retries" "--help;-h" "--interval-merging-rule;-imr" "--intervals;-L" "--sample-ploidy;-ploidy" "--standard-min-confidence-threshold-for-calling;-stand-call-conf" "--use-new-qual-calculator;-new-qual" "--showHidden;-showHidden" )
        MIN_OCCURRENCES=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--output --reference --variant --add-output-sam-program-record --add-output-vcf-command-line --create-output-bam-index --create-output-bam-md5 --create-output-variant-index --create-output-variant-md5 --disable-read-filter --disable-sequence-dictionary-validation --disable-tool-default-read-filters --exclude-intervals --gatk-config-file --input --interval-exclusion-padding --interval-padding --interval-set-rule --lenient --QUIET --read-filter --read-index --read-validation-stringency --seconds-between-progress-updates --sequence-dictionary --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --annotate-with-num-discovered-alleles --annotation --annotation-group --annotations-to-exclude --arguments_file --cloud-index-prefetch-buffer --cloud-prefetch-buffer --dbsnp --disable-bam-index-caching --disable-tool-default-annotations --gcs-max-retries --help --heterozygosity --heterozygosity-stdev --indel-heterozygosity --interval-merging-rule --intervals --sample-ploidy --standard-min-confidence-threshold-for-calling --use-new-qual-calculator --version --input-prior --max-alternate-alleles --max-genotype-count --only-output-calls-starting-in-intervals --showHidden )
        ALL_ARGUMENT_VALUE_TYPES=("File" "String" "String" "boolean" "boolean" "boolean" "boolean" "boolean" "boolean" "List[String]" "boolean" "boolean" "List[String]" "String" "List[String]" "int" "int" "IntervalSetRule" "boolean" "Boolean" "List[String]" "List[String]" "ValidationStringency" "double" "String" "List[File]" "boolean" "boolean" "LogLevel" "boolean" "List[String]" "List[String]" "List[String]" "List[File]" "int" "int" "FeatureInput[VariantContext]" "boolean" "boolean" "int" "boolean" "Double" "double" "double" "IntervalMergingRule" "List[String]" "int" "double" "boolean" "boolean" "List[Double]" "int" "int" "boolean" "boolean" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "HaplotypeCallerSpark" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--input --output --reference --disable-read-filter --disable-tool-default-read-filters --exclude-intervals --gatk-config-file --interval-exclusion-padding --interval-padding --interval-set-rule --QUIET --read-filter --read-index --read-validation-stringency --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --alleles --annotate-with-num-discovered-alleles --annotation --annotation-group --annotations-to-exclude --arguments_file --assembly-region-padding --bam-partition-size --base-quality-score-threshold --conf --contamination-fraction-to-filter --dbsnp --disable-sequence-dictionary-validation --disable-tool-default-annotations --gcs-max-retries --genotyping-mode --graph-output --help --heterozygosity --heterozygosity-stdev --indel-heterozygosity --interval-merging-rule --intervals --max-assembly-region-size --max-reads-per-alignment-start --min-assembly-region-size --min-base-quality-score --native-pair-hmm-threads --native-pair-hmm-use-double-precision --num-reducers --output-mode --program-name --read-shard-padding --read-shard-size --sample-name --sample-ploidy --sharded-output --spark-master --standard-min-confidence-threshold-for-calling --use-new-qual-calculator --version --active-probability-threshold --allow-non-unique-kmers-in-ref --all-site-pls --bam-output --bam-writer-type --comp --consensus --contamination-fraction-per-sample-file --debug --disable-optimizations --do-not-run-physical-phasing --dont-increase-kmer-sizes-for-cycles --dont-trim-active-regions --dont-use-soft-clipped-bases --emit-ref-confidence --gvcf-gq-bands --indel-size-to-eliminate-in-ref-model --input-prior --kmer-size --max-alternate-alleles --max-genotype-count --max-num-haplotypes-in-population --max-prob-propagation-distance --min-dangling-branch-length --min-pruning --num-pruning-samples --pair-hmm-gap-continuation-penalty --pcr-indel-model --phred-scaled-global-read-mismapping-rate --showHidden --smith-waterman --use-alleles-trigger --use-filtered-reads-for-annotations --recover-dangling-heads )
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=("--input;-I" "--output;-O" "--reference;-R" "--disable-read-filter;-DF" "--disable-tool-default-read-filters;-disable-tool-default-read-filters" "--exclude-intervals;-XL" "--interval-exclusion-padding;-ixp" "--interval-padding;-ip" "--interval-set-rule;-isr" "--read-filter;-RF" "--read-index;-read-index" "--read-validation-stringency;-VS" "--use-jdk-deflater;-jdk-deflater" "--use-jdk-inflater;-jdk-inflater" "--verbosity;-verbosity" "--annotation;-A" "--annotation-group;-G" "--annotations-to-exclude;-AX" "--conf;-conf" "--contamination-fraction-to-filter;-contamination" "--dbsnp;-D" "--disable-sequence-dictionary-validation;-disable-sequence-dictionary-validation" "--disable-tool-default-annotations;-disable-tool-default-annotations" "--gcs-max-retries;-gcs-retries" "--graph-output;-graph" "--help;-h" "--interval-merging-rule;-imr" "--intervals;-L" "--min-base-quality-score;-mbq" "--sample-name;-ALIAS" "--sample-ploidy;-ploidy" "--standard-min-confidence-threshold-for-calling;-stand-call-conf" "--use-new-qual-calculator;-new-qual" "--bam-output;-bamout" "--comp;-comp" "--contamination-fraction-per-sample-file;-contamination-file" "--debug;-debug" "--emit-ref-confidence;-ERC" "--gvcf-gq-bands;-GQB" "--showHidden;-showHidden" )
        MIN_OCCURRENCES=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--input --output --reference --disable-read-filter --disable-tool-default-read-filters --exclude-intervals --gatk-config-file --interval-exclusion-padding --interval-padding --interval-set-rule --QUIET --read-filter --read-index --read-validation-stringency --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --alleles --annotate-with-num-discovered-alleles --annotation --annotation-group --annotations-to-exclude --arguments_file --assembly-region-padding --bam-partition-size --base-quality-score-threshold --conf --contamination-fraction-to-filter --dbsnp --disable-sequence-dictionary-validation --disable-tool-default-annotations --gcs-max-retries --genotyping-mode --graph-output --help --heterozygosity --heterozygosity-stdev --indel-heterozygosity --interval-merging-rule --intervals --max-assembly-region-size --max-reads-per-alignment-start --min-assembly-region-size --min-base-quality-score --native-pair-hmm-threads --native-pair-hmm-use-double-precision --num-reducers --output-mode --program-name --read-shard-padding --read-shard-size --sample-name --sample-ploidy --sharded-output --spark-master --standard-min-confidence-threshold-for-calling --use-new-qual-calculator --version --active-probability-threshold --allow-non-unique-kmers-in-ref --all-site-pls --bam-output --bam-writer-type --comp --consensus --contamination-fraction-per-sample-file --debug --disable-optimizations --do-not-run-physical-phasing --dont-increase-kmer-sizes-for-cycles --dont-trim-active-regions --dont-use-soft-clipped-bases --emit-ref-confidence --gvcf-gq-bands --indel-size-to-eliminate-in-ref-model --input-prior --kmer-size --max-alternate-alleles --max-genotype-count --max-num-haplotypes-in-population --max-prob-propagation-distance --min-dangling-branch-length --min-pruning --num-pruning-samples --pair-hmm-gap-continuation-penalty --pcr-indel-model --phred-scaled-global-read-mismapping-rate --showHidden --smith-waterman --use-alleles-trigger --use-filtered-reads-for-annotations --recover-dangling-heads )
        ALL_ARGUMENT_VALUE_TYPES=("List[String]" "String" "String" "List[String]" "boolean" "List[String]" "String" "int" "int" "IntervalSetRule" "Boolean" "List[String]" "List[String]" "ValidationStringency" "List[File]" "boolean" "boolean" "LogLevel" "FeatureInput[VariantContext]" "boolean" "List[String]" "List[String]" "List[String]" "List[File]" "int" "long" "byte" "List[String]" "double" "FeatureInput[VariantContext]" "boolean" "boolean" "int" "GenotypingOutputMode" "String" "boolean" "Double" "double" "double" "IntervalMergingRule" "List[String]" "int" "int" "int" "byte" "int" "boolean" "int" "OutputMode" "String" "int" "int" "String" "int" "boolean" "String" "double" "boolean" "boolean" "double" "boolean" "boolean" "String" "WriterType" "List[FeatureInput[VariantContext]]" "boolean" "File" "boolean" "boolean" "boolean" "boolean" "boolean" "boolean" "ReferenceConfidenceMode" "List[Integer]" "int" "List[Double]" "List[Integer]" "int" "int" "int" "int" "int" "int" "int" "int" "PCRErrorModel" "int" "boolean" "Implementation" "boolean" "boolean" "boolean" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "SimpleMarkDuplicatesWithMateCigar" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--INPUT --METRICS_FILE --OUTPUT --ADD_PG_TAG_TO_READS --COMPRESSION_LEVEL --CREATE_INDEX --CREATE_MD5_FILE --GA4GH_CLIENT_SECRETS --MAX_RECORDS_IN_RAM --QUIET --REFERENCE_SEQUENCE --TMP_DIR --USE_JDK_DEFLATER --USE_JDK_INFLATER --VALIDATION_STRINGENCY --VERBOSITY --arguments_file --ASSUME_SORT_ORDER --BARCODE_TAG --CLEAR_DT --COMMENT --DUPLICATE_SCORING_STRATEGY --help --MAX_FILE_HANDLES_FOR_READ_ENDS_MAP --MAX_OPTICAL_DUPLICATE_SET_SIZE --MAX_SEQUENCES_FOR_DISK_READ_ENDS_MAP --OPTICAL_DUPLICATE_PIXEL_DISTANCE --PROGRAM_GROUP_COMMAND_LINE --PROGRAM_GROUP_NAME --PROGRAM_GROUP_VERSION --PROGRAM_RECORD_ID --READ_NAME_REGEX --READ_ONE_BARCODE_TAG --READ_TWO_BARCODE_TAG --REMOVE_DUPLICATES --REMOVE_SEQUENCING_DUPLICATES --SORTING_COLLECTION_SIZE_RATIO --TAG_DUPLICATE_SET_MEMBERS --TAGGING_POLICY --version --showHidden --ASSUME_SORTED )
        MUTUALLY_EXCLUSIVE_ARGS=("--ASSUME_SORT_ORDER;ASSUME_SORTED" "--ASSUME_SORTED;ASSUME_SORT_ORDER,ASO" )
        SYNONYMOUS_ARGS=("--INPUT;-I" "--METRICS_FILE;-M" "--OUTPUT;-O" "--REFERENCE_SEQUENCE;-R" "--USE_JDK_DEFLATER;-use_jdk_deflater" "--USE_JDK_INFLATER;-use_jdk_inflater" "--ASSUME_SORT_ORDER;-ASO" "--COMMENT;-CO" "--DUPLICATE_SCORING_STRATEGY;-DS" "--help;-h" "--MAX_FILE_HANDLES_FOR_READ_ENDS_MAP;-MAX_FILE_HANDLES" "--MAX_SEQUENCES_FOR_DISK_READ_ENDS_MAP;-MAX_SEQS" "--PROGRAM_GROUP_COMMAND_LINE;-PG_COMMAND" "--PROGRAM_GROUP_NAME;-PG_NAME" "--PROGRAM_GROUP_VERSION;-PG_VERSION" "--PROGRAM_RECORD_ID;-PG" "--showHidden;-showHidden" "--ASSUME_SORTED;-AS" )
        MIN_OCCURRENCES=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--INPUT --METRICS_FILE --OUTPUT --ADD_PG_TAG_TO_READS --COMPRESSION_LEVEL --CREATE_INDEX --CREATE_MD5_FILE --GA4GH_CLIENT_SECRETS --MAX_RECORDS_IN_RAM --QUIET --REFERENCE_SEQUENCE --TMP_DIR --USE_JDK_DEFLATER --USE_JDK_INFLATER --VALIDATION_STRINGENCY --VERBOSITY --arguments_file --ASSUME_SORT_ORDER --BARCODE_TAG --CLEAR_DT --COMMENT --DUPLICATE_SCORING_STRATEGY --help --MAX_FILE_HANDLES_FOR_READ_ENDS_MAP --MAX_OPTICAL_DUPLICATE_SET_SIZE --MAX_SEQUENCES_FOR_DISK_READ_ENDS_MAP --OPTICAL_DUPLICATE_PIXEL_DISTANCE --PROGRAM_GROUP_COMMAND_LINE --PROGRAM_GROUP_NAME --PROGRAM_GROUP_VERSION --PROGRAM_RECORD_ID --READ_NAME_REGEX --READ_ONE_BARCODE_TAG --READ_TWO_BARCODE_TAG --REMOVE_DUPLICATES --REMOVE_SEQUENCING_DUPLICATES --SORTING_COLLECTION_SIZE_RATIO --TAG_DUPLICATE_SET_MEMBERS --TAGGING_POLICY --version --showHidden --ASSUME_SORTED )
        ALL_ARGUMENT_VALUE_TYPES=("List[String]" "File" "File" "Boolean" "int" "Boolean" "boolean" "String" "Integer" "Boolean" "File" "List[File]" "Boolean" "Boolean" "ValidationStringency" "LogLevel" "List[File]" "SortOrder" "String" "boolean" "List[String]" "ScoringStrategy" "boolean" "int" "long" "int" "int" "String" "String" "String" "String" "String" "String" "String" "boolean" "boolean" "double" "boolean" "DuplicateTaggingPolicy" "boolean" "boolean" "boolean" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "UnmarkDuplicates" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--input --output --add-output-sam-program-record --add-output-vcf-command-line --create-output-bam-index --create-output-bam-md5 --create-output-variant-index --create-output-variant-md5 --disable-read-filter --disable-sequence-dictionary-validation --disable-tool-default-read-filters --exclude-intervals --gatk-config-file --interval-exclusion-padding --interval-padding --interval-set-rule --lenient --QUIET --read-filter --read-index --read-validation-stringency --seconds-between-progress-updates --sequence-dictionary --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --arguments_file --cloud-index-prefetch-buffer --cloud-prefetch-buffer --disable-bam-index-caching --gcs-max-retries --help --interval-merging-rule --intervals --reference --version --showHidden )
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=("--input;-I" "--output;-O" "--add-output-sam-program-record;-add-output-sam-program-record" "--add-output-vcf-command-line;-add-output-vcf-command-line" "--create-output-bam-index;-OBI" "--create-output-bam-md5;-OBM" "--create-output-variant-index;-OVI" "--create-output-variant-md5;-OVM" "--disable-read-filter;-DF" "--disable-sequence-dictionary-validation;-disable-sequence-dictionary-validation" "--disable-tool-default-read-filters;-disable-tool-default-read-filters" "--exclude-intervals;-XL" "--interval-exclusion-padding;-ixp" "--interval-padding;-ip" "--interval-set-rule;-isr" "--lenient;-LE" "--read-filter;-RF" "--read-index;-read-index" "--read-validation-stringency;-VS" "--seconds-between-progress-updates;-seconds-between-progress-updates" "--sequence-dictionary;-sequence-dictionary" "--use-jdk-deflater;-jdk-deflater" "--use-jdk-inflater;-jdk-inflater" "--verbosity;-verbosity" "--cloud-index-prefetch-buffer;-CIPB" "--cloud-prefetch-buffer;-CPB" "--disable-bam-index-caching;-DBIC" "--gcs-max-retries;-gcs-retries" "--help;-h" "--interval-merging-rule;-imr" "--intervals;-L" "--reference;-R" "--showHidden;-showHidden" )
        MIN_OCCURRENCES=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--input --output --add-output-sam-program-record --add-output-vcf-command-line --create-output-bam-index --create-output-bam-md5 --create-output-variant-index --create-output-variant-md5 --disable-read-filter --disable-sequence-dictionary-validation --disable-tool-default-read-filters --exclude-intervals --gatk-config-file --interval-exclusion-padding --interval-padding --interval-set-rule --lenient --QUIET --read-filter --read-index --read-validation-stringency --seconds-between-progress-updates --sequence-dictionary --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --arguments_file --cloud-index-prefetch-buffer --cloud-prefetch-buffer --disable-bam-index-caching --gcs-max-retries --help --interval-merging-rule --intervals --reference --version --showHidden )
        ALL_ARGUMENT_VALUE_TYPES=("List[String]" "File" "boolean" "boolean" "boolean" "boolean" "boolean" "boolean" "List[String]" "boolean" "boolean" "List[String]" "String" "int" "int" "IntervalSetRule" "boolean" "Boolean" "List[String]" "List[String]" "ValidationStringency" "double" "String" "List[File]" "boolean" "boolean" "LogLevel" "List[File]" "int" "int" "boolean" "int" "boolean" "IntervalMergingRule" "List[String]" "String" "boolean" "boolean" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "CountVariantsSpark" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--variant --exclude-intervals --gatk-config-file --input --interval-exclusion-padding --interval-padding --interval-set-rule --QUIET --read-index --read-validation-stringency --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --arguments_file --bam-partition-size --conf --disable-sequence-dictionary-validation --gcs-max-retries --help --interval-merging-rule --intervals --num-reducers --output --program-name --reference --sharded-output --spark-master --version --showHidden )
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=("--variant;-V" "--exclude-intervals;-XL" "--input;-I" "--interval-exclusion-padding;-ixp" "--interval-padding;-ip" "--interval-set-rule;-isr" "--read-index;-read-index" "--read-validation-stringency;-VS" "--use-jdk-deflater;-jdk-deflater" "--use-jdk-inflater;-jdk-inflater" "--verbosity;-verbosity" "--conf;-conf" "--disable-sequence-dictionary-validation;-disable-sequence-dictionary-validation" "--gcs-max-retries;-gcs-retries" "--help;-h" "--interval-merging-rule;-imr" "--intervals;-L" "--output;-O" "--reference;-R" "--showHidden;-showHidden" )
        MIN_OCCURRENCES=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--variant --exclude-intervals --gatk-config-file --input --interval-exclusion-padding --interval-padding --interval-set-rule --QUIET --read-index --read-validation-stringency --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --arguments_file --bam-partition-size --conf --disable-sequence-dictionary-validation --gcs-max-retries --help --interval-merging-rule --intervals --num-reducers --output --program-name --reference --sharded-output --spark-master --version --showHidden )
        ALL_ARGUMENT_VALUE_TYPES=("String" "List[String]" "String" "List[String]" "int" "int" "IntervalSetRule" "Boolean" "List[String]" "ValidationStringency" "List[File]" "boolean" "boolean" "LogLevel" "List[File]" "long" "List[String]" "boolean" "int" "boolean" "IntervalMergingRule" "List[String]" "int" "String" "String" "String" "boolean" "String" "boolean" "boolean" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "DepthPerSampleHC" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=()
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=()
        MIN_OCCURRENCES=()
        MAX_OCCURRENCES=()
        ALL_LEGAL_ARGUMENTS=()
        ALL_ARGUMENT_VALUE_TYPES=()

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "MappingQualityNotZeroReadFilter" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=()
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=()
        MIN_OCCURRENCES=()
        MAX_OCCURRENCES=()
        ALL_LEGAL_ARGUMENTS=()
        ALL_ARGUMENT_VALUE_TYPES=()

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "FindMendelianViolations" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--INPUT --OUTPUT --TRIOS --COMPRESSION_LEVEL --CREATE_INDEX --CREATE_MD5_FILE --GA4GH_CLIENT_SECRETS --MAX_RECORDS_IN_RAM --QUIET --REFERENCE_SEQUENCE --TMP_DIR --USE_JDK_DEFLATER --USE_JDK_INFLATER --VALIDATION_STRINGENCY --VERBOSITY --arguments_file --FEMALE_CHROMS --help --MALE_CHROMS --MIN_DP --MIN_GQ --MIN_HET_FRACTION --PSEUDO_AUTOSOMAL_REGIONS --SKIP_CHROMS --TAB_MODE --THREAD_COUNT --VCF_DIR --version --showHidden )
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=("--INPUT;-I" "--OUTPUT;-O" "--TRIOS;-PED" "--REFERENCE_SEQUENCE;-R" "--USE_JDK_DEFLATER;-use_jdk_deflater" "--USE_JDK_INFLATER;-use_jdk_inflater" "--help;-h" "--MIN_DP;-DP" "--MIN_GQ;-GQ" "--MIN_HET_FRACTION;-MINHET" "--showHidden;-showHidden" )
        MIN_OCCURRENCES=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--INPUT --OUTPUT --TRIOS --COMPRESSION_LEVEL --CREATE_INDEX --CREATE_MD5_FILE --GA4GH_CLIENT_SECRETS --MAX_RECORDS_IN_RAM --QUIET --REFERENCE_SEQUENCE --TMP_DIR --USE_JDK_DEFLATER --USE_JDK_INFLATER --VALIDATION_STRINGENCY --VERBOSITY --arguments_file --FEMALE_CHROMS --help --MALE_CHROMS --MIN_DP --MIN_GQ --MIN_HET_FRACTION --PSEUDO_AUTOSOMAL_REGIONS --SKIP_CHROMS --TAB_MODE --THREAD_COUNT --VCF_DIR --version --showHidden )
        ALL_ARGUMENT_VALUE_TYPES=("File" "File" "File" "int" "Boolean" "boolean" "String" "Integer" "Boolean" "File" "List[File]" "Boolean" "Boolean" "ValidationStringency" "LogLevel" "List[File]" "Set[String]" "boolean" "Set[String]" "int" "int" "double" "Set[String]" "Set[String]" "boolean" "int" "File" "boolean" "boolean" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "SamFormatConverter" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--INPUT --OUTPUT --COMPRESSION_LEVEL --CREATE_INDEX --CREATE_MD5_FILE --GA4GH_CLIENT_SECRETS --MAX_RECORDS_IN_RAM --QUIET --REFERENCE_SEQUENCE --TMP_DIR --USE_JDK_DEFLATER --USE_JDK_INFLATER --VALIDATION_STRINGENCY --VERBOSITY --arguments_file --help --version --showHidden )
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=("--INPUT;-I" "--OUTPUT;-O" "--REFERENCE_SEQUENCE;-R" "--USE_JDK_DEFLATER;-use_jdk_deflater" "--USE_JDK_INFLATER;-use_jdk_inflater" "--help;-h" "--showHidden;-showHidden" )
        MIN_OCCURRENCES=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--INPUT --OUTPUT --COMPRESSION_LEVEL --CREATE_INDEX --CREATE_MD5_FILE --GA4GH_CLIENT_SECRETS --MAX_RECORDS_IN_RAM --QUIET --REFERENCE_SEQUENCE --TMP_DIR --USE_JDK_DEFLATER --USE_JDK_INFLATER --VALIDATION_STRINGENCY --VERBOSITY --arguments_file --help --version --showHidden )
        ALL_ARGUMENT_VALUE_TYPES=("File" "File" "int" "Boolean" "boolean" "String" "Integer" "Boolean" "File" "List[File]" "Boolean" "Boolean" "ValidationStringency" "LogLevel" "List[File]" "boolean" "boolean" "boolean" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "SplitSamByLibrary" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--INPUT --COMPRESSION_LEVEL --CREATE_INDEX --CREATE_MD5_FILE --GA4GH_CLIENT_SECRETS --MAX_RECORDS_IN_RAM --QUIET --REFERENCE_SEQUENCE --TMP_DIR --USE_JDK_DEFLATER --USE_JDK_INFLATER --VALIDATION_STRINGENCY --VERBOSITY --arguments_file --help --OUTPUT --version --showHidden )
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=("--INPUT;-I" "--REFERENCE_SEQUENCE;-R" "--USE_JDK_DEFLATER;-use_jdk_deflater" "--USE_JDK_INFLATER;-use_jdk_inflater" "--help;-h" "--OUTPUT;-O" "--showHidden;-showHidden" )
        MIN_OCCURRENCES=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--INPUT --COMPRESSION_LEVEL --CREATE_INDEX --CREATE_MD5_FILE --GA4GH_CLIENT_SECRETS --MAX_RECORDS_IN_RAM --QUIET --REFERENCE_SEQUENCE --TMP_DIR --USE_JDK_DEFLATER --USE_JDK_INFLATER --VALIDATION_STRINGENCY --VERBOSITY --arguments_file --help --OUTPUT --version --showHidden )
        ALL_ARGUMENT_VALUE_TYPES=("File" "int" "Boolean" "boolean" "String" "Integer" "Boolean" "File" "List[File]" "Boolean" "Boolean" "ValidationStringency" "LogLevel" "List[File]" "boolean" "File" "boolean" "boolean" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "CompareMetrics" ]] ; then

        # Set up the completion information for this tool:
        NUM_POSITIONAL_ARGUMENTS=2
        POSITIONAL_ARGUMENT_TYPE=("List[File]")
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--COMPRESSION_LEVEL --CREATE_INDEX --CREATE_MD5_FILE --GA4GH_CLIENT_SECRETS --MAX_RECORDS_IN_RAM --QUIET --REFERENCE_SEQUENCE --TMP_DIR --USE_JDK_DEFLATER --USE_JDK_INFLATER --VALIDATION_STRINGENCY --VERBOSITY --arguments_file --help --version --showHidden )
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=("--REFERENCE_SEQUENCE;-R" "--USE_JDK_DEFLATER;-use_jdk_deflater" "--USE_JDK_INFLATER;-use_jdk_inflater" "--help;-h" "--showHidden;-showHidden" )
        MIN_OCCURRENCES=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--COMPRESSION_LEVEL --CREATE_INDEX --CREATE_MD5_FILE --GA4GH_CLIENT_SECRETS --MAX_RECORDS_IN_RAM --QUIET --REFERENCE_SEQUENCE --TMP_DIR --USE_JDK_DEFLATER --USE_JDK_INFLATER --VALIDATION_STRINGENCY --VERBOSITY --arguments_file --help --version --showHidden )
        ALL_ARGUMENT_VALUE_TYPES=("int" "Boolean" "boolean" "String" "Integer" "Boolean" "File" "List[File]" "Boolean" "Boolean" "ValidationStringency" "LogLevel" "List[File]" "boolean" "boolean" "boolean" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "CollectSequencingArtifactMetrics" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--INPUT --OUTPUT --REFERENCE_SEQUENCE --COMPRESSION_LEVEL --CREATE_INDEX --CREATE_MD5_FILE --GA4GH_CLIENT_SECRETS --MAX_RECORDS_IN_RAM --QUIET --TMP_DIR --USE_JDK_DEFLATER --USE_JDK_INFLATER --VALIDATION_STRINGENCY --VERBOSITY --arguments_file --ASSUME_SORTED --CONTEXT_SIZE --CONTEXTS_TO_PRINT --DB_SNP --FILE_EXTENSION --help --INCLUDE_DUPLICATES --INCLUDE_NON_PF_READS --INCLUDE_UNPAIRED --INTERVALS --MAXIMUM_INSERT_SIZE --MINIMUM_INSERT_SIZE --MINIMUM_MAPPING_QUALITY --MINIMUM_QUALITY_SCORE --STOP_AFTER --TANDEM_READS --USE_OQ --version --showHidden )
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=("--INPUT;-I" "--OUTPUT;-O" "--REFERENCE_SEQUENCE;-R" "--USE_JDK_DEFLATER;-use_jdk_deflater" "--USE_JDK_INFLATER;-use_jdk_inflater" "--ASSUME_SORTED;-AS" "--FILE_EXTENSION;-EXT" "--help;-h" "--INCLUDE_DUPLICATES;-DUPES" "--INCLUDE_NON_PF_READS;-NON_PF" "--INCLUDE_UNPAIRED;-UNPAIRED" "--MAXIMUM_INSERT_SIZE;-MAX_INS" "--MINIMUM_INSERT_SIZE;-MIN_INS" "--MINIMUM_MAPPING_QUALITY;-MQ" "--MINIMUM_QUALITY_SCORE;-Q" "--TANDEM_READS;-TANDEM" "--showHidden;-showHidden" )
        MIN_OCCURRENCES=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--INPUT --OUTPUT --REFERENCE_SEQUENCE --COMPRESSION_LEVEL --CREATE_INDEX --CREATE_MD5_FILE --GA4GH_CLIENT_SECRETS --MAX_RECORDS_IN_RAM --QUIET --TMP_DIR --USE_JDK_DEFLATER --USE_JDK_INFLATER --VALIDATION_STRINGENCY --VERBOSITY --arguments_file --ASSUME_SORTED --CONTEXT_SIZE --CONTEXTS_TO_PRINT --DB_SNP --FILE_EXTENSION --help --INCLUDE_DUPLICATES --INCLUDE_NON_PF_READS --INCLUDE_UNPAIRED --INTERVALS --MAXIMUM_INSERT_SIZE --MINIMUM_INSERT_SIZE --MINIMUM_MAPPING_QUALITY --MINIMUM_QUALITY_SCORE --STOP_AFTER --TANDEM_READS --USE_OQ --version --showHidden )
        ALL_ARGUMENT_VALUE_TYPES=("File" "File" "File" "int" "Boolean" "boolean" "String" "Integer" "Boolean" "List[File]" "Boolean" "Boolean" "ValidationStringency" "LogLevel" "List[File]" "boolean" "int" "Set[String]" "File" "String" "boolean" "boolean" "boolean" "boolean" "File" "int" "int" "int" "int" "long" "boolean" "boolean" "boolean" "boolean" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "MarkDuplicates" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--INPUT --METRICS_FILE --OUTPUT --ADD_PG_TAG_TO_READS --COMPRESSION_LEVEL --CREATE_INDEX --CREATE_MD5_FILE --GA4GH_CLIENT_SECRETS --MAX_RECORDS_IN_RAM --QUIET --REFERENCE_SEQUENCE --TMP_DIR --USE_JDK_DEFLATER --USE_JDK_INFLATER --VALIDATION_STRINGENCY --VERBOSITY --arguments_file --ASSUME_SORT_ORDER --BARCODE_TAG --CLEAR_DT --COMMENT --DUPLICATE_SCORING_STRATEGY --help --MAX_FILE_HANDLES_FOR_READ_ENDS_MAP --MAX_OPTICAL_DUPLICATE_SET_SIZE --MAX_SEQUENCES_FOR_DISK_READ_ENDS_MAP --OPTICAL_DUPLICATE_PIXEL_DISTANCE --PROGRAM_GROUP_COMMAND_LINE --PROGRAM_GROUP_NAME --PROGRAM_GROUP_VERSION --PROGRAM_RECORD_ID --READ_NAME_REGEX --READ_ONE_BARCODE_TAG --READ_TWO_BARCODE_TAG --REMOVE_DUPLICATES --REMOVE_SEQUENCING_DUPLICATES --SORTING_COLLECTION_SIZE_RATIO --TAG_DUPLICATE_SET_MEMBERS --TAGGING_POLICY --version --showHidden --ASSUME_SORTED )
        MUTUALLY_EXCLUSIVE_ARGS=("--ASSUME_SORT_ORDER;ASSUME_SORTED" "--ASSUME_SORTED;ASSUME_SORT_ORDER,ASO" )
        SYNONYMOUS_ARGS=("--INPUT;-I" "--METRICS_FILE;-M" "--OUTPUT;-O" "--REFERENCE_SEQUENCE;-R" "--USE_JDK_DEFLATER;-use_jdk_deflater" "--USE_JDK_INFLATER;-use_jdk_inflater" "--ASSUME_SORT_ORDER;-ASO" "--COMMENT;-CO" "--DUPLICATE_SCORING_STRATEGY;-DS" "--help;-h" "--MAX_FILE_HANDLES_FOR_READ_ENDS_MAP;-MAX_FILE_HANDLES" "--MAX_SEQUENCES_FOR_DISK_READ_ENDS_MAP;-MAX_SEQS" "--PROGRAM_GROUP_COMMAND_LINE;-PG_COMMAND" "--PROGRAM_GROUP_NAME;-PG_NAME" "--PROGRAM_GROUP_VERSION;-PG_VERSION" "--PROGRAM_RECORD_ID;-PG" "--showHidden;-showHidden" "--ASSUME_SORTED;-AS" )
        MIN_OCCURRENCES=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--INPUT --METRICS_FILE --OUTPUT --ADD_PG_TAG_TO_READS --COMPRESSION_LEVEL --CREATE_INDEX --CREATE_MD5_FILE --GA4GH_CLIENT_SECRETS --MAX_RECORDS_IN_RAM --QUIET --REFERENCE_SEQUENCE --TMP_DIR --USE_JDK_DEFLATER --USE_JDK_INFLATER --VALIDATION_STRINGENCY --VERBOSITY --arguments_file --ASSUME_SORT_ORDER --BARCODE_TAG --CLEAR_DT --COMMENT --DUPLICATE_SCORING_STRATEGY --help --MAX_FILE_HANDLES_FOR_READ_ENDS_MAP --MAX_OPTICAL_DUPLICATE_SET_SIZE --MAX_SEQUENCES_FOR_DISK_READ_ENDS_MAP --OPTICAL_DUPLICATE_PIXEL_DISTANCE --PROGRAM_GROUP_COMMAND_LINE --PROGRAM_GROUP_NAME --PROGRAM_GROUP_VERSION --PROGRAM_RECORD_ID --READ_NAME_REGEX --READ_ONE_BARCODE_TAG --READ_TWO_BARCODE_TAG --REMOVE_DUPLICATES --REMOVE_SEQUENCING_DUPLICATES --SORTING_COLLECTION_SIZE_RATIO --TAG_DUPLICATE_SET_MEMBERS --TAGGING_POLICY --version --showHidden --ASSUME_SORTED )
        ALL_ARGUMENT_VALUE_TYPES=("List[String]" "File" "File" "Boolean" "int" "Boolean" "boolean" "String" "Integer" "Boolean" "File" "List[File]" "Boolean" "Boolean" "ValidationStringency" "LogLevel" "List[File]" "SortOrder" "String" "boolean" "List[String]" "ScoringStrategy" "boolean" "int" "long" "int" "int" "String" "String" "String" "String" "String" "String" "String" "boolean" "boolean" "double" "boolean" "DuplicateTaggingPolicy" "boolean" "boolean" "boolean" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "SampleList" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=()
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=()
        MIN_OCCURRENCES=()
        MAX_OCCURRENCES=()
        ALL_LEGAL_ARGUMENTS=()
        ALL_ARGUMENT_VALUE_TYPES=()

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "CollectMultipleMetrics" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--INPUT --OUTPUT --COMPRESSION_LEVEL --CREATE_INDEX --CREATE_MD5_FILE --GA4GH_CLIENT_SECRETS --MAX_RECORDS_IN_RAM --QUIET --REFERENCE_SEQUENCE --TMP_DIR --USE_JDK_DEFLATER --USE_JDK_INFLATER --VALIDATION_STRINGENCY --VERBOSITY --arguments_file --ASSUME_SORTED --DB_SNP --FILE_EXTENSION --help --INCLUDE_UNPAIRED --INTERVALS --METRIC_ACCUMULATION_LEVEL --PROGRAM --STOP_AFTER --version --showHidden )
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=("--INPUT;-I" "--OUTPUT;-O" "--REFERENCE_SEQUENCE;-R" "--USE_JDK_DEFLATER;-use_jdk_deflater" "--USE_JDK_INFLATER;-use_jdk_inflater" "--ASSUME_SORTED;-AS" "--FILE_EXTENSION;-EXT" "--help;-h" "--INCLUDE_UNPAIRED;-UNPAIRED" "--METRIC_ACCUMULATION_LEVEL;-LEVEL" "--showHidden;-showHidden" )
        MIN_OCCURRENCES=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--INPUT --OUTPUT --COMPRESSION_LEVEL --CREATE_INDEX --CREATE_MD5_FILE --GA4GH_CLIENT_SECRETS --MAX_RECORDS_IN_RAM --QUIET --REFERENCE_SEQUENCE --TMP_DIR --USE_JDK_DEFLATER --USE_JDK_INFLATER --VALIDATION_STRINGENCY --VERBOSITY --arguments_file --ASSUME_SORTED --DB_SNP --FILE_EXTENSION --help --INCLUDE_UNPAIRED --INTERVALS --METRIC_ACCUMULATION_LEVEL --PROGRAM --STOP_AFTER --version --showHidden )
        ALL_ARGUMENT_VALUE_TYPES=("File" "String" "int" "Boolean" "boolean" "String" "Integer" "Boolean" "File" "List[File]" "Boolean" "Boolean" "ValidationStringency" "LogLevel" "List[File]" "boolean" "File" "String" "boolean" "boolean" "File" "Set[MetricAccumulationLevel]" "Set[Program]" "int" "boolean" "boolean" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "ExtractSVEvidenceSpark" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--aligner-index-image --input --kmers-to-ignore --output --disable-read-filter --disable-tool-default-read-filters --exclude-intervals --gatk-config-file --interval-exclusion-padding --interval-padding --interval-set-rule --QUIET --read-filter --read-index --read-validation-stringency --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --adapter-sequence --allowed-short-fragment-overhang --arguments_file --assembled-contigs-output-order --assembly-to-mapped-size-ratio-guess --bam-partition-size --breakpoint-evidence-dir --breakpoint-intervals --cleaner-max-copy-number --cleaner-max-intervals --cleaner-min-kmer-count --conf --cross-contigs-to-ignore --disable-sequence-dictionary-validation --exclusion-interval-padding --exclusion-intervals --external-evidence --external-evidence-uncertainty --external-evidence-weight --fastq-dir --gcs-max-retries --help --include-mapping-location --interval-merging-rule --interval-only-assembly --intervals --kmer-intervals --kmer-max-dust-score --k-size --max-fastq-size --max-interval-coverage --max-tracked-fragment-length --min-coherent-evidence-count --min-evidence-count --min-evidence-mapq --min-evidence-match-length --min-kmers-per-interval --num-reducers --program-name --qname-intervals-for-assembly --qname-intervals-mapped --read-metadata --reference --sharded-output --spark-master --target-link-file --unfiltered-breakpoint-evidence-dir --version --write-gfas --showHidden )
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=("--input;-I" "--output;-O" "--disable-read-filter;-DF" "--disable-tool-default-read-filters;-disable-tool-default-read-filters" "--exclude-intervals;-XL" "--interval-exclusion-padding;-ixp" "--interval-padding;-ip" "--interval-set-rule;-isr" "--read-filter;-RF" "--read-index;-read-index" "--read-validation-stringency;-VS" "--use-jdk-deflater;-jdk-deflater" "--use-jdk-inflater;-jdk-inflater" "--verbosity;-verbosity" "--assembled-contigs-output-order;-sort" "--conf;-conf" "--disable-sequence-dictionary-validation;-disable-sequence-dictionary-validation" "--gcs-max-retries;-gcs-retries" "--help;-h" "--interval-merging-rule;-imr" "--intervals;-L" "--reference;-R" "--showHidden;-showHidden" )
        MIN_OCCURRENCES=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--aligner-index-image --input --kmers-to-ignore --output --disable-read-filter --disable-tool-default-read-filters --exclude-intervals --gatk-config-file --interval-exclusion-padding --interval-padding --interval-set-rule --QUIET --read-filter --read-index --read-validation-stringency --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --adapter-sequence --allowed-short-fragment-overhang --arguments_file --assembled-contigs-output-order --assembly-to-mapped-size-ratio-guess --bam-partition-size --breakpoint-evidence-dir --breakpoint-intervals --cleaner-max-copy-number --cleaner-max-intervals --cleaner-min-kmer-count --conf --cross-contigs-to-ignore --disable-sequence-dictionary-validation --exclusion-interval-padding --exclusion-intervals --external-evidence --external-evidence-uncertainty --external-evidence-weight --fastq-dir --gcs-max-retries --help --include-mapping-location --interval-merging-rule --interval-only-assembly --intervals --kmer-intervals --kmer-max-dust-score --k-size --max-fastq-size --max-interval-coverage --max-tracked-fragment-length --min-coherent-evidence-count --min-evidence-count --min-evidence-mapq --min-evidence-match-length --min-kmers-per-interval --num-reducers --program-name --qname-intervals-for-assembly --qname-intervals-mapped --read-metadata --reference --sharded-output --spark-master --target-link-file --unfiltered-breakpoint-evidence-dir --version --write-gfas --showHidden )
        ALL_ARGUMENT_VALUE_TYPES=("String" "List[String]" "String" "String" "List[String]" "boolean" "List[String]" "String" "int" "int" "IntervalSetRule" "Boolean" "List[String]" "List[String]" "ValidationStringency" "List[File]" "boolean" "boolean" "LogLevel" "String" "int" "List[File]" "SortOrder" "int" "long" "String" "String" "int" "int" "int" "List[String]" "String" "boolean" "int" "String" "String" "int" "int" "String" "int" "boolean" "boolean" "IntervalMergingRule" "boolean" "List[String]" "String" "int" "int" "int" "int" "int" "int" "int" "int" "int" "int" "int" "String" "String" "String" "String" "String" "boolean" "String" "String" "String" "boolean" "boolean" "boolean" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "NotDuplicateReadFilter" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=()
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=()
        MIN_OCCURRENCES=()
        MAX_OCCURRENCES=()
        ALL_LEGAL_ARGUMENTS=()
        ALL_ARGUMENT_VALUE_TYPES=()

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "IlluminaBasecallsToFastq" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--BASECALLS_DIR --LANE --MULTIPLEX_PARAMS --OUTPUT_PREFIX --READ_STRUCTURE --RUN_BARCODE --COMPRESSION_LEVEL --CREATE_INDEX --CREATE_MD5_FILE --GA4GH_CLIENT_SECRETS --MAX_RECORDS_IN_RAM --QUIET --REFERENCE_SEQUENCE --TMP_DIR --USE_JDK_DEFLATER --USE_JDK_INFLATER --VALIDATION_STRINGENCY --VERBOSITY --APPLY_EAMSS_FILTER --arguments_file --BARCODES_DIR --COMPRESS_OUTPUTS --FIRST_TILE --FLOWCELL_BARCODE --FORCE_GC --help --IGNORE_UNEXPECTED_BARCODES --INCLUDE_NON_PF_READS --MACHINE_NAME --MAX_READS_IN_RAM_PER_TILE --MINIMUM_QUALITY --NUM_PROCESSORS --READ_NAME_FORMAT --TILE_LIMIT --version --showHidden --ADAPTERS_TO_CHECK )
        MUTUALLY_EXCLUSIVE_ARGS=("--MULTIPLEX_PARAMS;OUTPUT_PREFIX" "--OUTPUT_PREFIX;MULTIPLEX_PARAMS" )
        SYNONYMOUS_ARGS=("--BASECALLS_DIR;-B" "--LANE;-L" "--OUTPUT_PREFIX;-O" "--READ_STRUCTURE;-RS" "--REFERENCE_SEQUENCE;-R" "--USE_JDK_DEFLATER;-use_jdk_deflater" "--USE_JDK_INFLATER;-use_jdk_inflater" "--BARCODES_DIR;-BCD" "--COMPRESS_OUTPUTS;-GZIP" "--help;-h" "--IGNORE_UNEXPECTED_BARCODES;-INGORE_UNEXPECTED" "--INCLUDE_NON_PF_READS;-NONPF" "--showHidden;-showHidden" )
        MIN_OCCURRENCES=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--BASECALLS_DIR --LANE --MULTIPLEX_PARAMS --OUTPUT_PREFIX --READ_STRUCTURE --RUN_BARCODE --COMPRESSION_LEVEL --CREATE_INDEX --CREATE_MD5_FILE --GA4GH_CLIENT_SECRETS --MAX_RECORDS_IN_RAM --QUIET --REFERENCE_SEQUENCE --TMP_DIR --USE_JDK_DEFLATER --USE_JDK_INFLATER --VALIDATION_STRINGENCY --VERBOSITY --APPLY_EAMSS_FILTER --arguments_file --BARCODES_DIR --COMPRESS_OUTPUTS --FIRST_TILE --FLOWCELL_BARCODE --FORCE_GC --help --IGNORE_UNEXPECTED_BARCODES --INCLUDE_NON_PF_READS --MACHINE_NAME --MAX_READS_IN_RAM_PER_TILE --MINIMUM_QUALITY --NUM_PROCESSORS --READ_NAME_FORMAT --TILE_LIMIT --version --showHidden --ADAPTERS_TO_CHECK )
        ALL_ARGUMENT_VALUE_TYPES=("File" "Integer" "File" "File" "String" "String" "int" "Boolean" "boolean" "String" "Integer" "Boolean" "File" "List[File]" "Boolean" "Boolean" "ValidationStringency" "LogLevel" "boolean" "List[File]" "File" "boolean" "Integer" "String" "Boolean" "boolean" "boolean" "boolean" "String" "int" "int" "Integer" "ReadNameFormat" "Integer" "boolean" "boolean" "List[IlluminaAdapterPair]" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "ReadPosition" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=()
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=()
        MIN_OCCURRENCES=()
        MAX_OCCURRENCES=()
        ALL_LEGAL_ARGUMENTS=()
        ALL_ARGUMENT_VALUE_TYPES=()

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "IndexFeatureFile" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--feature-file --gatk-config-file --QUIET --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --arguments_file --gcs-max-retries --help --output --version --showHidden )
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=("--feature-file;-F" "--use-jdk-deflater;-jdk-deflater" "--use-jdk-inflater;-jdk-inflater" "--verbosity;-verbosity" "--gcs-max-retries;-gcs-retries" "--help;-h" "--output;-O" "--showHidden;-showHidden" )
        MIN_OCCURRENCES=(0 0 0 0 0 0 0 0 0 0 0 0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--feature-file --gatk-config-file --QUIET --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --arguments_file --gcs-max-retries --help --output --version --showHidden )
        ALL_ARGUMENT_VALUE_TYPES=("File" "String" "Boolean" "List[File]" "boolean" "boolean" "LogLevel" "List[File]" "int" "boolean" "File" "boolean" "boolean" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "AS_QualByDepth" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=()
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=()
        MIN_OCCURRENCES=()
        MAX_OCCURRENCES=()
        ALL_LEGAL_ARGUMENTS=()
        ALL_ARGUMENT_VALUE_TYPES=()

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "FixVcfHeader" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--INPUT --OUTPUT --COMPRESSION_LEVEL --CREATE_INDEX --CREATE_MD5_FILE --GA4GH_CLIENT_SECRETS --MAX_RECORDS_IN_RAM --QUIET --REFERENCE_SEQUENCE --TMP_DIR --USE_JDK_DEFLATER --USE_JDK_INFLATER --VALIDATION_STRINGENCY --VERBOSITY --arguments_file --CHECK_FIRST_N_RECORDS --ENFORCE_SAME_SAMPLES --HEADER --help --version --showHidden )
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=("--INPUT;-I" "--OUTPUT;-O" "--REFERENCE_SEQUENCE;-R" "--USE_JDK_DEFLATER;-use_jdk_deflater" "--USE_JDK_INFLATER;-use_jdk_inflater" "--CHECK_FIRST_N_RECORDS;-N" "--HEADER;-H" "--help;-h" "--showHidden;-showHidden" )
        MIN_OCCURRENCES=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--INPUT --OUTPUT --COMPRESSION_LEVEL --CREATE_INDEX --CREATE_MD5_FILE --GA4GH_CLIENT_SECRETS --MAX_RECORDS_IN_RAM --QUIET --REFERENCE_SEQUENCE --TMP_DIR --USE_JDK_DEFLATER --USE_JDK_INFLATER --VALIDATION_STRINGENCY --VERBOSITY --arguments_file --CHECK_FIRST_N_RECORDS --ENFORCE_SAME_SAMPLES --HEADER --help --version --showHidden )
        ALL_ARGUMENT_VALUE_TYPES=("File" "File" "int" "Boolean" "boolean" "String" "Integer" "Boolean" "File" "List[File]" "Boolean" "Boolean" "ValidationStringency" "LogLevel" "List[File]" "int" "boolean" "File" "boolean" "boolean" "boolean" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "StrandArtifact" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=()
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=()
        MIN_OCCURRENCES=()
        MAX_OCCURRENCES=()
        ALL_LEGAL_ARGUMENTS=()
        ALL_ARGUMENT_VALUE_TYPES=()

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "Coverage" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=()
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=()
        MIN_OCCURRENCES=()
        MAX_OCCURRENCES=()
        ALL_LEGAL_ARGUMENTS=()
        ALL_ARGUMENT_VALUE_TYPES=()

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "ReadNameReadFilter" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--read-name )
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=()
        MIN_OCCURRENCES=(0 )
        MAX_OCCURRENCES=(2147483647 )
        ALL_LEGAL_ARGUMENTS=(--read-name )
        ALL_ARGUMENT_VALUE_TYPES=("String" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "PathSeqFilterSpark" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--input --disable-read-filter --disable-tool-default-read-filters --exclude-intervals --gatk-config-file --interval-exclusion-padding --interval-padding --interval-set-rule --QUIET --read-filter --read-index --read-validation-stringency --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --arguments_file --bam-partition-size --conf --disable-sequence-dictionary-validation --dust-mask-quality --dust-t --dust-window --filter-bwa-image --filter-bwa-seed-length --filter-duplicates --filter-metrics --gcs-max-retries --help --host-kmer-thresh --host-min-identity --interval-merging-rule --intervals --is-host-aligned --kmer-file --max-adapter-mismatches --max-masked-bases --min-adapter-length --min-base-quality --min-clipped-read-length --num-reducers --paired-output --program-name --quality-threshold --reference --sharded-output --skip-quality-filters --spark-master --unpaired-output --version --filter-reads-per-partition --showHidden --skip-pre-bwa-repartition )
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=("--input;-I" "--disable-read-filter;-DF" "--disable-tool-default-read-filters;-disable-tool-default-read-filters" "--exclude-intervals;-XL" "--interval-exclusion-padding;-ixp" "--interval-padding;-ip" "--interval-set-rule;-isr" "--read-filter;-RF" "--read-index;-read-index" "--read-validation-stringency;-VS" "--use-jdk-deflater;-jdk-deflater" "--use-jdk-inflater;-jdk-inflater" "--verbosity;-verbosity" "--conf;-conf" "--disable-sequence-dictionary-validation;-disable-sequence-dictionary-validation" "--dust-mask-quality;-dust-mask-quality" "--dust-t;-dust-t" "--dust-window;-dust-window" "--filter-bwa-image;-FI" "--filter-bwa-seed-length;-filter-bwa-seed-length" "--filter-duplicates;-filter-duplicates" "--filter-metrics;-FM" "--gcs-max-retries;-gcs-retries" "--help;-h" "--host-kmer-thresh;-host-kmer-thresh" "--host-min-identity;-host-min-identity" "--interval-merging-rule;-imr" "--intervals;-L" "--is-host-aligned;-is-host-aligned" "--kmer-file;-K" "--max-adapter-mismatches;-max-adapter-mismatches" "--max-masked-bases;-max-masked-bases" "--min-adapter-length;-min-adapter-length" "--min-base-quality;-min-base-quality" "--min-clipped-read-length;-min-clipped-read-length" "--paired-output;-PO" "--quality-threshold;-quality-threshold" "--reference;-R" "--skip-quality-filters;-skip-quality-filters" "--unpaired-output;-UO" "--filter-reads-per-partition;-filter-reads-per-partition" "--showHidden;-showHidden" "--skip-pre-bwa-repartition;-skip-pre-bwa-repartition" )
        MIN_OCCURRENCES=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--input --disable-read-filter --disable-tool-default-read-filters --exclude-intervals --gatk-config-file --interval-exclusion-padding --interval-padding --interval-set-rule --QUIET --read-filter --read-index --read-validation-stringency --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --arguments_file --bam-partition-size --conf --disable-sequence-dictionary-validation --dust-mask-quality --dust-t --dust-window --filter-bwa-image --filter-bwa-seed-length --filter-duplicates --filter-metrics --gcs-max-retries --help --host-kmer-thresh --host-min-identity --interval-merging-rule --intervals --is-host-aligned --kmer-file --max-adapter-mismatches --max-masked-bases --min-adapter-length --min-base-quality --min-clipped-read-length --num-reducers --paired-output --program-name --quality-threshold --reference --sharded-output --skip-quality-filters --spark-master --unpaired-output --version --filter-reads-per-partition --showHidden --skip-pre-bwa-repartition )
        ALL_ARGUMENT_VALUE_TYPES=("List[String]" "List[String]" "boolean" "List[String]" "String" "int" "int" "IntervalSetRule" "Boolean" "List[String]" "List[String]" "ValidationStringency" "List[File]" "boolean" "boolean" "LogLevel" "List[File]" "long" "List[String]" "boolean" "int" "double" "int" "String" "int" "boolean" "String" "int" "boolean" "int" "int" "IntervalMergingRule" "List[String]" "boolean" "String" "int" "int" "int" "int" "int" "int" "String" "String" "int" "String" "boolean" "boolean" "String" "String" "boolean" "int" "boolean" "boolean" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "BwaSpark" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--input --output --reference --disable-read-filter --disable-tool-default-read-filters --exclude-intervals --gatk-config-file --interval-exclusion-padding --interval-padding --interval-set-rule --QUIET --read-filter --read-index --read-validation-stringency --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --arguments_file --bam-partition-size --bwa-mem-index-image --conf --disable-sequence-dictionary-validation --gcs-max-retries --help --interval-merging-rule --intervals --num-reducers --program-name --sharded-output --single-end-alignment --spark-master --version --showHidden )
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=("--input;-I" "--output;-O" "--reference;-R" "--disable-read-filter;-DF" "--disable-tool-default-read-filters;-disable-tool-default-read-filters" "--exclude-intervals;-XL" "--interval-exclusion-padding;-ixp" "--interval-padding;-ip" "--interval-set-rule;-isr" "--read-filter;-RF" "--read-index;-read-index" "--read-validation-stringency;-VS" "--use-jdk-deflater;-jdk-deflater" "--use-jdk-inflater;-jdk-inflater" "--verbosity;-verbosity" "--bwa-mem-index-image;-image" "--conf;-conf" "--disable-sequence-dictionary-validation;-disable-sequence-dictionary-validation" "--gcs-max-retries;-gcs-retries" "--help;-h" "--interval-merging-rule;-imr" "--intervals;-L" "--single-end-alignment;-se" "--showHidden;-showHidden" )
        MIN_OCCURRENCES=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--input --output --reference --disable-read-filter --disable-tool-default-read-filters --exclude-intervals --gatk-config-file --interval-exclusion-padding --interval-padding --interval-set-rule --QUIET --read-filter --read-index --read-validation-stringency --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --arguments_file --bam-partition-size --bwa-mem-index-image --conf --disable-sequence-dictionary-validation --gcs-max-retries --help --interval-merging-rule --intervals --num-reducers --program-name --sharded-output --single-end-alignment --spark-master --version --showHidden )
        ALL_ARGUMENT_VALUE_TYPES=("List[String]" "String" "String" "List[String]" "boolean" "List[String]" "String" "int" "int" "IntervalSetRule" "Boolean" "List[String]" "List[String]" "ValidationStringency" "List[File]" "boolean" "boolean" "LogLevel" "List[File]" "long" "String" "List[String]" "boolean" "int" "boolean" "IntervalMergingRule" "List[String]" "int" "String" "boolean" "boolean" "String" "boolean" "boolean" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "FilterSamReads" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--FILTER --INPUT --OUTPUT --COMPRESSION_LEVEL --CREATE_INDEX --CREATE_MD5_FILE --GA4GH_CLIENT_SECRETS --MAX_RECORDS_IN_RAM --QUIET --REFERENCE_SEQUENCE --TMP_DIR --USE_JDK_DEFLATER --USE_JDK_INFLATER --VALIDATION_STRINGENCY --VERBOSITY --arguments_file --help --INTERVAL_LIST --JAVASCRIPT_FILE --READ_LIST_FILE --SORT_ORDER --version --WRITE_READS_FILES --showHidden )
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=("--INPUT;-I" "--OUTPUT;-O" "--REFERENCE_SEQUENCE;-R" "--USE_JDK_DEFLATER;-use_jdk_deflater" "--USE_JDK_INFLATER;-use_jdk_inflater" "--help;-h" "--INTERVAL_LIST;-IL" "--JAVASCRIPT_FILE;-JS" "--READ_LIST_FILE;-RLF" "--SORT_ORDER;-SO" "--showHidden;-showHidden" )
        MIN_OCCURRENCES=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--FILTER --INPUT --OUTPUT --COMPRESSION_LEVEL --CREATE_INDEX --CREATE_MD5_FILE --GA4GH_CLIENT_SECRETS --MAX_RECORDS_IN_RAM --QUIET --REFERENCE_SEQUENCE --TMP_DIR --USE_JDK_DEFLATER --USE_JDK_INFLATER --VALIDATION_STRINGENCY --VERBOSITY --arguments_file --help --INTERVAL_LIST --JAVASCRIPT_FILE --READ_LIST_FILE --SORT_ORDER --version --WRITE_READS_FILES --showHidden )
        ALL_ARGUMENT_VALUE_TYPES=("Filter" "File" "File" "int" "Boolean" "boolean" "String" "Integer" "Boolean" "File" "List[File]" "Boolean" "Boolean" "ValidationStringency" "LogLevel" "List[File]" "boolean" "File" "File" "File" "SortOrder" "boolean" "boolean" "boolean" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "EstimateLibraryComplexityGATK" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--input --output --COMPRESSION_LEVEL --CREATE_INDEX --CREATE_MD5_FILE --gatk-config-file --MAX_RECORDS_IN_RAM --QUIET --reference --TMP_DIR --use-jdk-deflater --use-jdk-inflater --VALIDATION_STRINGENCY --verbosity --arguments_file --gcs-max-retries --help --max-diff-rate --max-group-ratio --min-identical-bases --min-mean-quality --OPTICAL_DUPLICATE_PIXEL_DISTANCE --READ_NAME_REGEX --version --showHidden )
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=("--input;-I" "--output;-O" "--reference;-R" "--use-jdk-deflater;-jdk-deflater" "--use-jdk-inflater;-jdk-inflater" "--verbosity;-verbosity" "--gcs-max-retries;-gcs-retries" "--help;-h" "--showHidden;-showHidden" )
        MIN_OCCURRENCES=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--input --output --COMPRESSION_LEVEL --CREATE_INDEX --CREATE_MD5_FILE --gatk-config-file --MAX_RECORDS_IN_RAM --QUIET --reference --TMP_DIR --use-jdk-deflater --use-jdk-inflater --VALIDATION_STRINGENCY --verbosity --arguments_file --gcs-max-retries --help --max-diff-rate --max-group-ratio --min-identical-bases --min-mean-quality --OPTICAL_DUPLICATE_PIXEL_DISTANCE --READ_NAME_REGEX --version --showHidden )
        ALL_ARGUMENT_VALUE_TYPES=("List[File]" "File" "int" "Boolean" "boolean" "String" "Integer" "Boolean" "File" "List[File]" "boolean" "boolean" "ValidationStringency" "LogLevel" "List[File]" "int" "boolean" "double" "int" "int" "int" "int" "String" "boolean" "boolean" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "PositionBasedDownsampleSam" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--FRACTION --INPUT --OUTPUT --COMPRESSION_LEVEL --CREATE_INDEX --CREATE_MD5_FILE --GA4GH_CLIENT_SECRETS --MAX_RECORDS_IN_RAM --QUIET --REFERENCE_SEQUENCE --TMP_DIR --USE_JDK_DEFLATER --USE_JDK_INFLATER --VALIDATION_STRINGENCY --VERBOSITY --ALLOW_MULTIPLE_DOWNSAMPLING_DESPITE_WARNINGS --arguments_file --help --READ_NAME_REGEX --REMOVE_DUPLICATE_INFORMATION --STOP_AFTER --version --showHidden )
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=("--FRACTION;-F" "--INPUT;-I" "--OUTPUT;-O" "--REFERENCE_SEQUENCE;-R" "--USE_JDK_DEFLATER;-use_jdk_deflater" "--USE_JDK_INFLATER;-use_jdk_inflater" "--help;-h" "--showHidden;-showHidden" )
        MIN_OCCURRENCES=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--FRACTION --INPUT --OUTPUT --COMPRESSION_LEVEL --CREATE_INDEX --CREATE_MD5_FILE --GA4GH_CLIENT_SECRETS --MAX_RECORDS_IN_RAM --QUIET --REFERENCE_SEQUENCE --TMP_DIR --USE_JDK_DEFLATER --USE_JDK_INFLATER --VALIDATION_STRINGENCY --VERBOSITY --ALLOW_MULTIPLE_DOWNSAMPLING_DESPITE_WARNINGS --arguments_file --help --READ_NAME_REGEX --REMOVE_DUPLICATE_INFORMATION --STOP_AFTER --version --showHidden )
        ALL_ARGUMENT_VALUE_TYPES=("Double" "File" "File" "int" "Boolean" "boolean" "String" "Integer" "Boolean" "File" "List[File]" "Boolean" "Boolean" "ValidationStringency" "LogLevel" "boolean" "List[File]" "boolean" "String" "boolean" "Long" "boolean" "boolean" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "SeqIsStoredReadFilter" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=()
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=()
        MIN_OCCURRENCES=()
        MAX_OCCURRENCES=()
        ALL_LEGAL_ARGUMENTS=()
        ALL_ARGUMENT_VALUE_TYPES=()

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "CollectAlignmentSummaryMetrics" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--INPUT --OUTPUT --COMPRESSION_LEVEL --CREATE_INDEX --CREATE_MD5_FILE --GA4GH_CLIENT_SECRETS --MAX_RECORDS_IN_RAM --QUIET --TMP_DIR --USE_JDK_DEFLATER --USE_JDK_INFLATER --VALIDATION_STRINGENCY --VERBOSITY --ADAPTER_SEQUENCE --arguments_file --ASSUME_SORTED --EXPECTED_PAIR_ORIENTATIONS --help --IS_BISULFITE_SEQUENCED --MAX_INSERT_SIZE --METRIC_ACCUMULATION_LEVEL --REFERENCE_SEQUENCE --STOP_AFTER --version --showHidden )
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=("--INPUT;-I" "--OUTPUT;-O" "--USE_JDK_DEFLATER;-use_jdk_deflater" "--USE_JDK_INFLATER;-use_jdk_inflater" "--ASSUME_SORTED;-AS" "--help;-h" "--IS_BISULFITE_SEQUENCED;-BS" "--METRIC_ACCUMULATION_LEVEL;-LEVEL" "--REFERENCE_SEQUENCE;-R" "--showHidden;-showHidden" )
        MIN_OCCURRENCES=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--INPUT --OUTPUT --COMPRESSION_LEVEL --CREATE_INDEX --CREATE_MD5_FILE --GA4GH_CLIENT_SECRETS --MAX_RECORDS_IN_RAM --QUIET --TMP_DIR --USE_JDK_DEFLATER --USE_JDK_INFLATER --VALIDATION_STRINGENCY --VERBOSITY --ADAPTER_SEQUENCE --arguments_file --ASSUME_SORTED --EXPECTED_PAIR_ORIENTATIONS --help --IS_BISULFITE_SEQUENCED --MAX_INSERT_SIZE --METRIC_ACCUMULATION_LEVEL --REFERENCE_SEQUENCE --STOP_AFTER --version --showHidden )
        ALL_ARGUMENT_VALUE_TYPES=("File" "File" "int" "Boolean" "boolean" "String" "Integer" "Boolean" "List[File]" "Boolean" "Boolean" "ValidationStringency" "LogLevel" "List[String]" "List[File]" "boolean" "Set[PairOrientation]" "boolean" "boolean" "int" "Set[MetricAccumulationLevel]" "File" "long" "boolean" "boolean" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "CollectWgsMetrics" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--INPUT --OUTPUT --REFERENCE_SEQUENCE --COMPRESSION_LEVEL --CREATE_INDEX --CREATE_MD5_FILE --GA4GH_CLIENT_SECRETS --MAX_RECORDS_IN_RAM --QUIET --TMP_DIR --USE_JDK_DEFLATER --USE_JDK_INFLATER --VALIDATION_STRINGENCY --VERBOSITY --arguments_file --COUNT_UNPAIRED --COVERAGE_CAP --help --INCLUDE_BQ_HISTOGRAM --INTERVALS --LOCUS_ACCUMULATION_CAP --MINIMUM_BASE_QUALITY --MINIMUM_MAPPING_QUALITY --READ_LENGTH --SAMPLE_SIZE --STOP_AFTER --USE_FAST_ALGORITHM --version --showHidden )
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=("--INPUT;-I" "--OUTPUT;-O" "--REFERENCE_SEQUENCE;-R" "--USE_JDK_DEFLATER;-use_jdk_deflater" "--USE_JDK_INFLATER;-use_jdk_inflater" "--COVERAGE_CAP;-CAP" "--help;-h" "--MINIMUM_BASE_QUALITY;-Q" "--MINIMUM_MAPPING_QUALITY;-MQ" "--showHidden;-showHidden" )
        MIN_OCCURRENCES=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--INPUT --OUTPUT --REFERENCE_SEQUENCE --COMPRESSION_LEVEL --CREATE_INDEX --CREATE_MD5_FILE --GA4GH_CLIENT_SECRETS --MAX_RECORDS_IN_RAM --QUIET --TMP_DIR --USE_JDK_DEFLATER --USE_JDK_INFLATER --VALIDATION_STRINGENCY --VERBOSITY --arguments_file --COUNT_UNPAIRED --COVERAGE_CAP --help --INCLUDE_BQ_HISTOGRAM --INTERVALS --LOCUS_ACCUMULATION_CAP --MINIMUM_BASE_QUALITY --MINIMUM_MAPPING_QUALITY --READ_LENGTH --SAMPLE_SIZE --STOP_AFTER --USE_FAST_ALGORITHM --version --showHidden )
        ALL_ARGUMENT_VALUE_TYPES=("File" "File" "File" "int" "Boolean" "boolean" "String" "Integer" "Boolean" "List[File]" "Boolean" "Boolean" "ValidationStringency" "LogLevel" "List[File]" "boolean" "int" "boolean" "boolean" "File" "int" "int" "int" "int" "int" "long" "boolean" "boolean" "boolean" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "BamToBfq" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--ANALYSIS_DIR --FLOWCELL_BARCODE --INPUT --OUTPUT_FILE_PREFIX --PAIRED_RUN --COMPRESSION_LEVEL --CREATE_INDEX --CREATE_MD5_FILE --GA4GH_CLIENT_SECRETS --MAX_RECORDS_IN_RAM --QUIET --REFERENCE_SEQUENCE --TMP_DIR --USE_JDK_DEFLATER --USE_JDK_INFLATER --VALIDATION_STRINGENCY --VERBOSITY --arguments_file --BASES_TO_WRITE --CLIP_ADAPTERS --help --INCLUDE_NON_PF_READS --LANE --READ_CHUNK_SIZE --READ_NAME_PREFIX --READS_TO_ALIGN --RUN_BARCODE --version --showHidden )
        MUTUALLY_EXCLUSIVE_ARGS=("--FLOWCELL_BARCODE;OUTPUT_FILE_PREFIX" "--OUTPUT_FILE_PREFIX;FLOWCELL_BARCODE,LANE" "--LANE;OUTPUT_FILE_PREFIX" "--RUN_BARCODE;READ_NAME_PREFIX" )
        SYNONYMOUS_ARGS=("--FLOWCELL_BARCODE;-F" "--INPUT;-I" "--PAIRED_RUN;-PE" "--REFERENCE_SEQUENCE;-R" "--USE_JDK_DEFLATER;-use_jdk_deflater" "--USE_JDK_INFLATER;-use_jdk_inflater" "--help;-h" "--INCLUDE_NON_PF_READS;-NONPF" "--LANE;-L" "--READ_CHUNK_SIZE;-CHUNK" "--READS_TO_ALIGN;-NUM" "--RUN_BARCODE;-RB" "--showHidden;-showHidden" )
        MIN_OCCURRENCES=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--ANALYSIS_DIR --FLOWCELL_BARCODE --INPUT --OUTPUT_FILE_PREFIX --PAIRED_RUN --COMPRESSION_LEVEL --CREATE_INDEX --CREATE_MD5_FILE --GA4GH_CLIENT_SECRETS --MAX_RECORDS_IN_RAM --QUIET --REFERENCE_SEQUENCE --TMP_DIR --USE_JDK_DEFLATER --USE_JDK_INFLATER --VALIDATION_STRINGENCY --VERBOSITY --arguments_file --BASES_TO_WRITE --CLIP_ADAPTERS --help --INCLUDE_NON_PF_READS --LANE --READ_CHUNK_SIZE --READ_NAME_PREFIX --READS_TO_ALIGN --RUN_BARCODE --version --showHidden )
        ALL_ARGUMENT_VALUE_TYPES=("File" "String" "File" "String" "Boolean" "int" "Boolean" "boolean" "String" "Integer" "Boolean" "File" "List[File]" "Boolean" "Boolean" "ValidationStringency" "LogLevel" "List[File]" "Integer" "boolean" "boolean" "Boolean" "Integer" "Integer" "String" "Integer" "String" "boolean" "boolean" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "CheckIlluminaDirectory" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--BASECALLS_DIR --LANES --READ_STRUCTURE --COMPRESSION_LEVEL --CREATE_INDEX --CREATE_MD5_FILE --GA4GH_CLIENT_SECRETS --MAX_RECORDS_IN_RAM --QUIET --REFERENCE_SEQUENCE --TMP_DIR --USE_JDK_DEFLATER --USE_JDK_INFLATER --VALIDATION_STRINGENCY --VERBOSITY --arguments_file --DATA_TYPES --FAKE_FILES --help --LINK_LOCS --TILE_NUMBERS --version --showHidden )
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=("--BASECALLS_DIR;-B" "--LANES;-L" "--READ_STRUCTURE;-RS" "--REFERENCE_SEQUENCE;-R" "--USE_JDK_DEFLATER;-use_jdk_deflater" "--USE_JDK_INFLATER;-use_jdk_inflater" "--DATA_TYPES;-DT" "--FAKE_FILES;-F" "--help;-h" "--LINK_LOCS;-X" "--TILE_NUMBERS;-T" "--showHidden;-showHidden" )
        MIN_OCCURRENCES=(0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--BASECALLS_DIR --LANES --READ_STRUCTURE --COMPRESSION_LEVEL --CREATE_INDEX --CREATE_MD5_FILE --GA4GH_CLIENT_SECRETS --MAX_RECORDS_IN_RAM --QUIET --REFERENCE_SEQUENCE --TMP_DIR --USE_JDK_DEFLATER --USE_JDK_INFLATER --VALIDATION_STRINGENCY --VERBOSITY --arguments_file --DATA_TYPES --FAKE_FILES --help --LINK_LOCS --TILE_NUMBERS --version --showHidden )
        ALL_ARGUMENT_VALUE_TYPES=("File" "List[Integer]" "String" "int" "Boolean" "boolean" "String" "Integer" "Boolean" "File" "List[File]" "Boolean" "Boolean" "ValidationStringency" "LogLevel" "List[File]" "Set[IlluminaDataType]" "Boolean" "boolean" "Boolean" "List[Integer]" "boolean" "boolean" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "NotSecondaryAlignmentReadFilter" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=()
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=()
        MIN_OCCURRENCES=()
        MAX_OCCURRENCES=()
        ALL_LEGAL_ARGUMENTS=()
        ALL_ARGUMENT_VALUE_TYPES=()

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "CigarContainsNoNOperator" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=()
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=()
        MIN_OCCURRENCES=()
        MAX_OCCURRENCES=()
        ALL_LEGAL_ARGUMENTS=()
        ALL_ARGUMENT_VALUE_TYPES=()

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "CheckFingerprint" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--DETAIL_OUTPUT --GENOTYPES --HAPLOTYPE_MAP --INPUT --OUTPUT --SUMMARY_OUTPUT --COMPRESSION_LEVEL --CREATE_INDEX --CREATE_MD5_FILE --GA4GH_CLIENT_SECRETS --MAX_RECORDS_IN_RAM --QUIET --REFERENCE_SEQUENCE --TMP_DIR --USE_JDK_DEFLATER --USE_JDK_INFLATER --VALIDATION_STRINGENCY --VERBOSITY --arguments_file --EXPECTED_SAMPLE_ALIAS --GENOTYPE_LOD_THRESHOLD --help --IGNORE_READ_GROUPS --OBSERVED_SAMPLE_ALIAS --version --showHidden )
        MUTUALLY_EXCLUSIVE_ARGS=("--DETAIL_OUTPUT;OUTPUT" "--OUTPUT;SUMMARY_OUTPUT,DETAIL_OUTPUT,S,D" "--SUMMARY_OUTPUT;OUTPUT" )
        SYNONYMOUS_ARGS=("--DETAIL_OUTPUT;-D" "--GENOTYPES;-G" "--HAPLOTYPE_MAP;-H" "--INPUT;-I" "--OUTPUT;-O" "--SUMMARY_OUTPUT;-S" "--REFERENCE_SEQUENCE;-R" "--USE_JDK_DEFLATER;-use_jdk_deflater" "--USE_JDK_INFLATER;-use_jdk_inflater" "--EXPECTED_SAMPLE_ALIAS;-SAMPLE_ALIAS" "--GENOTYPE_LOD_THRESHOLD;-LOD" "--help;-h" "--IGNORE_READ_GROUPS;-IGNORE_RG" "--showHidden;-showHidden" )
        MIN_OCCURRENCES=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--DETAIL_OUTPUT --GENOTYPES --HAPLOTYPE_MAP --INPUT --OUTPUT --SUMMARY_OUTPUT --COMPRESSION_LEVEL --CREATE_INDEX --CREATE_MD5_FILE --GA4GH_CLIENT_SECRETS --MAX_RECORDS_IN_RAM --QUIET --REFERENCE_SEQUENCE --TMP_DIR --USE_JDK_DEFLATER --USE_JDK_INFLATER --VALIDATION_STRINGENCY --VERBOSITY --arguments_file --EXPECTED_SAMPLE_ALIAS --GENOTYPE_LOD_THRESHOLD --help --IGNORE_READ_GROUPS --OBSERVED_SAMPLE_ALIAS --version --showHidden )
        ALL_ARGUMENT_VALUE_TYPES=("File" "File" "File" "File" "String" "File" "int" "Boolean" "boolean" "String" "Integer" "Boolean" "File" "List[File]" "Boolean" "Boolean" "ValidationStringency" "LogLevel" "List[File]" "String" "double" "boolean" "boolean" "String" "boolean" "boolean" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "AddOrReplaceReadGroups" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--INPUT --OUTPUT --RGLB --RGPL --RGPU --RGSM --COMPRESSION_LEVEL --CREATE_INDEX --CREATE_MD5_FILE --GA4GH_CLIENT_SECRETS --MAX_RECORDS_IN_RAM --QUIET --REFERENCE_SEQUENCE --TMP_DIR --USE_JDK_DEFLATER --USE_JDK_INFLATER --VALIDATION_STRINGENCY --VERBOSITY --arguments_file --help --RGCN --RGDS --RGDT --RGFO --RGID --RGKS --RGPG --RGPI --RGPM --SORT_ORDER --version --showHidden )
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=("--INPUT;-I" "--OUTPUT;-O" "--RGLB;-LB" "--RGPL;-PL" "--RGPU;-PU" "--RGSM;-SM" "--REFERENCE_SEQUENCE;-R" "--USE_JDK_DEFLATER;-use_jdk_deflater" "--USE_JDK_INFLATER;-use_jdk_inflater" "--help;-h" "--RGCN;-CN" "--RGDS;-DS" "--RGDT;-DT" "--RGFO;-FO" "--RGID;-ID" "--RGKS;-KS" "--RGPG;-PG" "--RGPI;-PI" "--RGPM;-PM" "--SORT_ORDER;-SO" "--showHidden;-showHidden" )
        MIN_OCCURRENCES=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--INPUT --OUTPUT --RGLB --RGPL --RGPU --RGSM --COMPRESSION_LEVEL --CREATE_INDEX --CREATE_MD5_FILE --GA4GH_CLIENT_SECRETS --MAX_RECORDS_IN_RAM --QUIET --REFERENCE_SEQUENCE --TMP_DIR --USE_JDK_DEFLATER --USE_JDK_INFLATER --VALIDATION_STRINGENCY --VERBOSITY --arguments_file --help --RGCN --RGDS --RGDT --RGFO --RGID --RGKS --RGPG --RGPI --RGPM --SORT_ORDER --version --showHidden )
        ALL_ARGUMENT_VALUE_TYPES=("String" "File" "String" "String" "String" "String" "int" "Boolean" "boolean" "String" "Integer" "Boolean" "File" "List[File]" "Boolean" "Boolean" "ValidationStringency" "LogLevel" "List[File]" "boolean" "String" "String" "Iso8601Date" "String" "String" "String" "String" "Integer" "String" "SortOrder" "boolean" "boolean" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "VcfToIntervalList" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--INPUT --OUTPUT --COMPRESSION_LEVEL --CREATE_INDEX --CREATE_MD5_FILE --GA4GH_CLIENT_SECRETS --MAX_RECORDS_IN_RAM --QUIET --REFERENCE_SEQUENCE --TMP_DIR --USE_JDK_DEFLATER --USE_JDK_INFLATER --VALIDATION_STRINGENCY --VERBOSITY --arguments_file --help --INCLUDE_FILTERED --version --showHidden )
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=("--INPUT;-I" "--OUTPUT;-O" "--REFERENCE_SEQUENCE;-R" "--USE_JDK_DEFLATER;-use_jdk_deflater" "--USE_JDK_INFLATER;-use_jdk_inflater" "--help;-h" "--INCLUDE_FILTERED;-IF" "--showHidden;-showHidden" )
        MIN_OCCURRENCES=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--INPUT --OUTPUT --COMPRESSION_LEVEL --CREATE_INDEX --CREATE_MD5_FILE --GA4GH_CLIENT_SECRETS --MAX_RECORDS_IN_RAM --QUIET --REFERENCE_SEQUENCE --TMP_DIR --USE_JDK_DEFLATER --USE_JDK_INFLATER --VALIDATION_STRINGENCY --VERBOSITY --arguments_file --help --INCLUDE_FILTERED --version --showHidden )
        ALL_ARGUMENT_VALUE_TYPES=("File" "File" "int" "Boolean" "boolean" "String" "Integer" "Boolean" "File" "List[File]" "Boolean" "Boolean" "ValidationStringency" "LogLevel" "List[File]" "boolean" "boolean" "boolean" "boolean" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "CalculateMixingFractions" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--output --variant --add-output-sam-program-record --add-output-vcf-command-line --create-output-bam-index --create-output-bam-md5 --create-output-variant-index --create-output-variant-md5 --disable-read-filter --disable-sequence-dictionary-validation --disable-tool-default-read-filters --exclude-intervals --gatk-config-file --input --interval-exclusion-padding --interval-padding --interval-set-rule --lenient --QUIET --read-filter --read-index --read-validation-stringency --seconds-between-progress-updates --sequence-dictionary --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --arguments_file --cloud-index-prefetch-buffer --cloud-prefetch-buffer --disable-bam-index-caching --gcs-max-retries --help --interval-merging-rule --intervals --reference --version --showHidden )
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=("--output;-O" "--variant;-V" "--add-output-sam-program-record;-add-output-sam-program-record" "--add-output-vcf-command-line;-add-output-vcf-command-line" "--create-output-bam-index;-OBI" "--create-output-bam-md5;-OBM" "--create-output-variant-index;-OVI" "--create-output-variant-md5;-OVM" "--disable-read-filter;-DF" "--disable-sequence-dictionary-validation;-disable-sequence-dictionary-validation" "--disable-tool-default-read-filters;-disable-tool-default-read-filters" "--exclude-intervals;-XL" "--input;-I" "--interval-exclusion-padding;-ixp" "--interval-padding;-ip" "--interval-set-rule;-isr" "--lenient;-LE" "--read-filter;-RF" "--read-index;-read-index" "--read-validation-stringency;-VS" "--seconds-between-progress-updates;-seconds-between-progress-updates" "--sequence-dictionary;-sequence-dictionary" "--use-jdk-deflater;-jdk-deflater" "--use-jdk-inflater;-jdk-inflater" "--verbosity;-verbosity" "--cloud-index-prefetch-buffer;-CIPB" "--cloud-prefetch-buffer;-CPB" "--disable-bam-index-caching;-DBIC" "--gcs-max-retries;-gcs-retries" "--help;-h" "--interval-merging-rule;-imr" "--intervals;-L" "--reference;-R" "--showHidden;-showHidden" )
        MIN_OCCURRENCES=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--output --variant --add-output-sam-program-record --add-output-vcf-command-line --create-output-bam-index --create-output-bam-md5 --create-output-variant-index --create-output-variant-md5 --disable-read-filter --disable-sequence-dictionary-validation --disable-tool-default-read-filters --exclude-intervals --gatk-config-file --input --interval-exclusion-padding --interval-padding --interval-set-rule --lenient --QUIET --read-filter --read-index --read-validation-stringency --seconds-between-progress-updates --sequence-dictionary --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --arguments_file --cloud-index-prefetch-buffer --cloud-prefetch-buffer --disable-bam-index-caching --gcs-max-retries --help --interval-merging-rule --intervals --reference --version --showHidden )
        ALL_ARGUMENT_VALUE_TYPES=("File" "String" "boolean" "boolean" "boolean" "boolean" "boolean" "boolean" "List[String]" "boolean" "boolean" "List[String]" "String" "List[String]" "int" "int" "IntervalSetRule" "boolean" "Boolean" "List[String]" "List[String]" "ValidationStringency" "double" "String" "List[File]" "boolean" "boolean" "LogLevel" "List[File]" "int" "int" "boolean" "int" "boolean" "IntervalMergingRule" "List[String]" "String" "boolean" "boolean" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "Pileup" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--input --output --add-output-sam-program-record --add-output-vcf-command-line --create-output-bam-index --create-output-bam-md5 --create-output-variant-index --create-output-variant-md5 --disable-read-filter --disable-sequence-dictionary-validation --disable-tool-default-read-filters --exclude-intervals --gatk-config-file --interval-exclusion-padding --interval-padding --interval-set-rule --lenient --QUIET --read-filter --read-index --read-validation-stringency --seconds-between-progress-updates --sequence-dictionary --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --arguments_file --cloud-index-prefetch-buffer --cloud-prefetch-buffer --disable-bam-index-caching --gcs-max-retries --help --interval-merging-rule --intervals --maxDepthPerSample --metadata --output-insert-length --reference --show-verbose --version --showHidden )
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=("--input;-I" "--output;-O" "--add-output-sam-program-record;-add-output-sam-program-record" "--add-output-vcf-command-line;-add-output-vcf-command-line" "--create-output-bam-index;-OBI" "--create-output-bam-md5;-OBM" "--create-output-variant-index;-OVI" "--create-output-variant-md5;-OVM" "--disable-read-filter;-DF" "--disable-sequence-dictionary-validation;-disable-sequence-dictionary-validation" "--disable-tool-default-read-filters;-disable-tool-default-read-filters" "--exclude-intervals;-XL" "--interval-exclusion-padding;-ixp" "--interval-padding;-ip" "--interval-set-rule;-isr" "--lenient;-LE" "--read-filter;-RF" "--read-index;-read-index" "--read-validation-stringency;-VS" "--seconds-between-progress-updates;-seconds-between-progress-updates" "--sequence-dictionary;-sequence-dictionary" "--use-jdk-deflater;-jdk-deflater" "--use-jdk-inflater;-jdk-inflater" "--verbosity;-verbosity" "--cloud-index-prefetch-buffer;-CIPB" "--cloud-prefetch-buffer;-CPB" "--disable-bam-index-caching;-DBIC" "--gcs-max-retries;-gcs-retries" "--help;-h" "--interval-merging-rule;-imr" "--intervals;-L" "--maxDepthPerSample;-maxDepthPerSample" "--metadata;-metadata" "--output-insert-length;-output-insert-length" "--reference;-R" "--show-verbose;-verbose" "--showHidden;-showHidden" )
        MIN_OCCURRENCES=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--input --output --add-output-sam-program-record --add-output-vcf-command-line --create-output-bam-index --create-output-bam-md5 --create-output-variant-index --create-output-variant-md5 --disable-read-filter --disable-sequence-dictionary-validation --disable-tool-default-read-filters --exclude-intervals --gatk-config-file --interval-exclusion-padding --interval-padding --interval-set-rule --lenient --QUIET --read-filter --read-index --read-validation-stringency --seconds-between-progress-updates --sequence-dictionary --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --arguments_file --cloud-index-prefetch-buffer --cloud-prefetch-buffer --disable-bam-index-caching --gcs-max-retries --help --interval-merging-rule --intervals --maxDepthPerSample --metadata --output-insert-length --reference --show-verbose --version --showHidden )
        ALL_ARGUMENT_VALUE_TYPES=("List[String]" "File" "boolean" "boolean" "boolean" "boolean" "boolean" "boolean" "List[String]" "boolean" "boolean" "List[String]" "String" "int" "int" "IntervalSetRule" "boolean" "Boolean" "List[String]" "List[String]" "ValidationStringency" "double" "String" "List[File]" "boolean" "boolean" "LogLevel" "List[File]" "int" "int" "boolean" "int" "boolean" "IntervalMergingRule" "List[String]" "int" "List[FeatureInput[Feature]]" "boolean" "String" "boolean" "boolean" "boolean" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "SplitReads" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--input --add-output-sam-program-record --add-output-vcf-command-line --create-output-bam-index --create-output-bam-md5 --create-output-variant-index --create-output-variant-md5 --disable-read-filter --disable-sequence-dictionary-validation --disable-tool-default-read-filters --exclude-intervals --gatk-config-file --interval-exclusion-padding --interval-padding --interval-set-rule --lenient --QUIET --read-filter --read-index --read-validation-stringency --seconds-between-progress-updates --sequence-dictionary --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --arguments_file --cloud-index-prefetch-buffer --cloud-prefetch-buffer --disable-bam-index-caching --gcs-max-retries --help --interval-merging-rule --intervals --output --reference --split-library-name --split-read-group --split-sample --version --showHidden )
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=("--input;-I" "--add-output-sam-program-record;-add-output-sam-program-record" "--add-output-vcf-command-line;-add-output-vcf-command-line" "--create-output-bam-index;-OBI" "--create-output-bam-md5;-OBM" "--create-output-variant-index;-OVI" "--create-output-variant-md5;-OVM" "--disable-read-filter;-DF" "--disable-sequence-dictionary-validation;-disable-sequence-dictionary-validation" "--disable-tool-default-read-filters;-disable-tool-default-read-filters" "--exclude-intervals;-XL" "--interval-exclusion-padding;-ixp" "--interval-padding;-ip" "--interval-set-rule;-isr" "--lenient;-LE" "--read-filter;-RF" "--read-index;-read-index" "--read-validation-stringency;-VS" "--seconds-between-progress-updates;-seconds-between-progress-updates" "--sequence-dictionary;-sequence-dictionary" "--use-jdk-deflater;-jdk-deflater" "--use-jdk-inflater;-jdk-inflater" "--verbosity;-verbosity" "--cloud-index-prefetch-buffer;-CIPB" "--cloud-prefetch-buffer;-CPB" "--disable-bam-index-caching;-DBIC" "--gcs-max-retries;-gcs-retries" "--help;-h" "--interval-merging-rule;-imr" "--intervals;-L" "--output;-O" "--reference;-R" "--split-library-name;-LB" "--split-read-group;-RG" "--split-sample;-SM" "--showHidden;-showHidden" )
        MIN_OCCURRENCES=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--input --add-output-sam-program-record --add-output-vcf-command-line --create-output-bam-index --create-output-bam-md5 --create-output-variant-index --create-output-variant-md5 --disable-read-filter --disable-sequence-dictionary-validation --disable-tool-default-read-filters --exclude-intervals --gatk-config-file --interval-exclusion-padding --interval-padding --interval-set-rule --lenient --QUIET --read-filter --read-index --read-validation-stringency --seconds-between-progress-updates --sequence-dictionary --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --arguments_file --cloud-index-prefetch-buffer --cloud-prefetch-buffer --disable-bam-index-caching --gcs-max-retries --help --interval-merging-rule --intervals --output --reference --split-library-name --split-read-group --split-sample --version --showHidden )
        ALL_ARGUMENT_VALUE_TYPES=("List[String]" "boolean" "boolean" "boolean" "boolean" "boolean" "boolean" "List[String]" "boolean" "boolean" "List[String]" "String" "int" "int" "IntervalSetRule" "boolean" "Boolean" "List[String]" "List[String]" "ValidationStringency" "double" "String" "List[File]" "boolean" "boolean" "LogLevel" "List[File]" "int" "int" "boolean" "int" "boolean" "IntervalMergingRule" "List[String]" "File" "String" "boolean" "boolean" "boolean" "boolean" "boolean" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "ApplyVQSR" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--output --recal-file --variant --add-output-sam-program-record --add-output-vcf-command-line --create-output-bam-index --create-output-bam-md5 --create-output-variant-index --create-output-variant-md5 --disable-read-filter --disable-sequence-dictionary-validation --disable-tool-default-read-filters --exclude-intervals --gatk-config-file --input --interval-exclusion-padding --interval-padding --interval-set-rule --lenient --QUIET --read-filter --read-index --read-validation-stringency --seconds-between-progress-updates --sequence-dictionary --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --arguments_file --cloud-index-prefetch-buffer --cloud-prefetch-buffer --disable-bam-index-caching --exclude-filtered --gcs-max-retries --help --ignore-all-filters --ignore-filter --interval-merging-rule --intervals --mode --reference --tranches-file --truth-sensitivity-filter-level --use-allele-specific-annotations --version --lod-score-cutoff --showHidden )
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=("--output;-O" "--variant;-V" "--add-output-sam-program-record;-add-output-sam-program-record" "--add-output-vcf-command-line;-add-output-vcf-command-line" "--create-output-bam-index;-OBI" "--create-output-bam-md5;-OBM" "--create-output-variant-index;-OVI" "--create-output-variant-md5;-OVM" "--disable-read-filter;-DF" "--disable-sequence-dictionary-validation;-disable-sequence-dictionary-validation" "--disable-tool-default-read-filters;-disable-tool-default-read-filters" "--exclude-intervals;-XL" "--input;-I" "--interval-exclusion-padding;-ixp" "--interval-padding;-ip" "--interval-set-rule;-isr" "--lenient;-LE" "--read-filter;-RF" "--read-index;-read-index" "--read-validation-stringency;-VS" "--seconds-between-progress-updates;-seconds-between-progress-updates" "--sequence-dictionary;-sequence-dictionary" "--use-jdk-deflater;-jdk-deflater" "--use-jdk-inflater;-jdk-inflater" "--verbosity;-verbosity" "--cloud-index-prefetch-buffer;-CIPB" "--cloud-prefetch-buffer;-CPB" "--disable-bam-index-caching;-DBIC" "--gcs-max-retries;-gcs-retries" "--help;-h" "--interval-merging-rule;-imr" "--intervals;-L" "--mode;-mode" "--reference;-R" "--truth-sensitivity-filter-level;-ts-filter-level" "--use-allele-specific-annotations;-AS" "--showHidden;-showHidden" )
        MIN_OCCURRENCES=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--output --recal-file --variant --add-output-sam-program-record --add-output-vcf-command-line --create-output-bam-index --create-output-bam-md5 --create-output-variant-index --create-output-variant-md5 --disable-read-filter --disable-sequence-dictionary-validation --disable-tool-default-read-filters --exclude-intervals --gatk-config-file --input --interval-exclusion-padding --interval-padding --interval-set-rule --lenient --QUIET --read-filter --read-index --read-validation-stringency --seconds-between-progress-updates --sequence-dictionary --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --arguments_file --cloud-index-prefetch-buffer --cloud-prefetch-buffer --disable-bam-index-caching --exclude-filtered --gcs-max-retries --help --ignore-all-filters --ignore-filter --interval-merging-rule --intervals --mode --reference --tranches-file --truth-sensitivity-filter-level --use-allele-specific-annotations --version --lod-score-cutoff --showHidden )
        ALL_ARGUMENT_VALUE_TYPES=("String" "FeatureInput[VariantContext]" "List[String]" "boolean" "boolean" "boolean" "boolean" "boolean" "boolean" "List[String]" "boolean" "boolean" "List[String]" "String" "List[String]" "int" "int" "IntervalSetRule" "boolean" "Boolean" "List[String]" "List[String]" "ValidationStringency" "double" "String" "List[File]" "boolean" "boolean" "LogLevel" "List[File]" "int" "int" "boolean" "boolean" "int" "boolean" "boolean" "List[String]" "IntervalMergingRule" "List[String]" "Mode" "String" "File" "Double" "boolean" "boolean" "Double" "boolean" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "PlotDenoisedCopyRatios" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--denoised-copy-ratios --output --output-prefix --sequence-dictionary --standardized-copy-ratios --gatk-config-file --QUIET --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --arguments_file --gcs-max-retries --help --minimum-contig-length --version --showHidden )
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=("--output;-O" "--sequence-dictionary;-sequence-dictionary" "--use-jdk-deflater;-jdk-deflater" "--use-jdk-inflater;-jdk-inflater" "--verbosity;-verbosity" "--gcs-max-retries;-gcs-retries" "--help;-h" "--showHidden;-showHidden" )
        MIN_OCCURRENCES=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--denoised-copy-ratios --output --output-prefix --sequence-dictionary --standardized-copy-ratios --gatk-config-file --QUIET --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --arguments_file --gcs-max-retries --help --minimum-contig-length --version --showHidden )
        ALL_ARGUMENT_VALUE_TYPES=("File" "String" "String" "File" "File" "String" "Boolean" "List[File]" "boolean" "boolean" "LogLevel" "List[File]" "int" "boolean" "int" "boolean" "boolean" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "ReorderSam" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--INPUT --OUTPUT --REFERENCE --COMPRESSION_LEVEL --CREATE_INDEX --CREATE_MD5_FILE --GA4GH_CLIENT_SECRETS --MAX_RECORDS_IN_RAM --QUIET --TMP_DIR --USE_JDK_DEFLATER --USE_JDK_INFLATER --VALIDATION_STRINGENCY --VERBOSITY --ALLOW_CONTIG_LENGTH_DISCORDANCE --ALLOW_INCOMPLETE_DICT_CONCORDANCE --arguments_file --help --version --showHidden )
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=("--INPUT;-I" "--OUTPUT;-O" "--REFERENCE;-R" "--USE_JDK_DEFLATER;-use_jdk_deflater" "--USE_JDK_INFLATER;-use_jdk_inflater" "--ALLOW_CONTIG_LENGTH_DISCORDANCE;-U" "--ALLOW_INCOMPLETE_DICT_CONCORDANCE;-S" "--help;-h" "--showHidden;-showHidden" )
        MIN_OCCURRENCES=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--INPUT --OUTPUT --REFERENCE --COMPRESSION_LEVEL --CREATE_INDEX --CREATE_MD5_FILE --GA4GH_CLIENT_SECRETS --MAX_RECORDS_IN_RAM --QUIET --TMP_DIR --USE_JDK_DEFLATER --USE_JDK_INFLATER --VALIDATION_STRINGENCY --VERBOSITY --ALLOW_CONTIG_LENGTH_DISCORDANCE --ALLOW_INCOMPLETE_DICT_CONCORDANCE --arguments_file --help --version --showHidden )
        ALL_ARGUMENT_VALUE_TYPES=("File" "File" "File" "int" "Boolean" "boolean" "String" "Integer" "Boolean" "List[File]" "Boolean" "Boolean" "ValidationStringency" "LogLevel" "boolean" "boolean" "List[File]" "boolean" "boolean" "boolean" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "MarkDuplicatesGATK" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--input --METRICS_FILE --output --COMPRESSION_LEVEL --CREATE_INDEX --CREATE_MD5_FILE --gatk-config-file --MAX_RECORDS_IN_RAM --QUIET --reference --TMP_DIR --use-jdk-deflater --use-jdk-inflater --VALIDATION_STRINGENCY --verbosity --arguments_file --ASSUME_SORTED --COMMENT --DUPLICATE_SCORING_STRATEGY --gcs-max-retries --help --MAX_FILE_HANDLES_FOR_READ_ENDS_MAP --MAX_SEQUENCES_FOR_DISK_READ_ENDS_MAP --OPTICAL_DUPLICATE_PIXEL_DISTANCE --PROGRAM_GROUP_COMMAND_LINE --PROGRAM_GROUP_NAME --PROGRAM_GROUP_VERSION --PROGRAM_RECORD_ID --READ_NAME_REGEX --REMOVE_DUPLICATES --reportMemoryStats --SORTING_COLLECTION_SIZE_RATIO --version --showHidden )
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=("--input;-I" "--METRICS_FILE;-M" "--output;-O" "--reference;-R" "--use-jdk-deflater;-jdk-deflater" "--use-jdk-inflater;-jdk-inflater" "--verbosity;-verbosity" "--ASSUME_SORTED;-AS" "--COMMENT;-CO" "--DUPLICATE_SCORING_STRATEGY;-DS" "--gcs-max-retries;-gcs-retries" "--help;-h" "--MAX_FILE_HANDLES_FOR_READ_ENDS_MAP;-MAX_FILE_HANDLES" "--MAX_SEQUENCES_FOR_DISK_READ_ENDS_MAP;-MAX_SEQS" "--PROGRAM_GROUP_COMMAND_LINE;-PG_COMMAND" "--PROGRAM_GROUP_NAME;-PG_NAME" "--PROGRAM_GROUP_VERSION;-PG_VERSION" "--PROGRAM_RECORD_ID;-PG" "--showHidden;-showHidden" )
        MIN_OCCURRENCES=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--input --METRICS_FILE --output --COMPRESSION_LEVEL --CREATE_INDEX --CREATE_MD5_FILE --gatk-config-file --MAX_RECORDS_IN_RAM --QUIET --reference --TMP_DIR --use-jdk-deflater --use-jdk-inflater --VALIDATION_STRINGENCY --verbosity --arguments_file --ASSUME_SORTED --COMMENT --DUPLICATE_SCORING_STRATEGY --gcs-max-retries --help --MAX_FILE_HANDLES_FOR_READ_ENDS_MAP --MAX_SEQUENCES_FOR_DISK_READ_ENDS_MAP --OPTICAL_DUPLICATE_PIXEL_DISTANCE --PROGRAM_GROUP_COMMAND_LINE --PROGRAM_GROUP_NAME --PROGRAM_GROUP_VERSION --PROGRAM_RECORD_ID --READ_NAME_REGEX --REMOVE_DUPLICATES --reportMemoryStats --SORTING_COLLECTION_SIZE_RATIO --version --showHidden )
        ALL_ARGUMENT_VALUE_TYPES=("List[File]" "File" "File" "int" "Boolean" "boolean" "String" "Integer" "Boolean" "File" "List[File]" "boolean" "boolean" "ValidationStringency" "LogLevel" "List[File]" "boolean" "List[String]" "ScoringStrategy" "int" "boolean" "int" "int" "int" "String" "String" "String" "String" "String" "boolean" "boolean" "double" "boolean" "boolean" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "PathSeqScoreSpark" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--scores-output --taxonomy-file --disable-read-filter --disable-tool-default-read-filters --exclude-intervals --gatk-config-file --input --interval-exclusion-padding --interval-padding --interval-set-rule --QUIET --read-filter --read-index --read-validation-stringency --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --arguments_file --bam-partition-size --conf --disable-sequence-dictionary-validation --divide-by-genome-length --gcs-max-retries --help --identity-margin --interval-merging-rule --intervals --min-score-identity --not-normalized-by-kingdom --num-reducers --output --paired-input --program-name --reference --score-metrics --score-warnings --sharded-output --spark-master --unpaired-input --version --score-reads-per-partition-estimate --showHidden )
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=("--scores-output;-SO" "--taxonomy-file;-T" "--disable-read-filter;-DF" "--disable-tool-default-read-filters;-disable-tool-default-read-filters" "--exclude-intervals;-XL" "--input;-I" "--interval-exclusion-padding;-ixp" "--interval-padding;-ip" "--interval-set-rule;-isr" "--read-filter;-RF" "--read-index;-read-index" "--read-validation-stringency;-VS" "--use-jdk-deflater;-jdk-deflater" "--use-jdk-inflater;-jdk-inflater" "--verbosity;-verbosity" "--conf;-conf" "--disable-sequence-dictionary-validation;-disable-sequence-dictionary-validation" "--divide-by-genome-length;-divide-by-genome-length" "--gcs-max-retries;-gcs-retries" "--help;-h" "--identity-margin;-identity-margin" "--interval-merging-rule;-imr" "--intervals;-L" "--min-score-identity;-min-score-identity" "--not-normalized-by-kingdom;-not-normalized-by-kingdom" "--output;-O" "--paired-input;-PI" "--reference;-R" "--score-metrics;-SM" "--score-warnings;-SW" "--unpaired-input;-UI" "--score-reads-per-partition-estimate;-score-reads-per-partition-estimate" "--showHidden;-showHidden" )
        MIN_OCCURRENCES=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--scores-output --taxonomy-file --disable-read-filter --disable-tool-default-read-filters --exclude-intervals --gatk-config-file --input --interval-exclusion-padding --interval-padding --interval-set-rule --QUIET --read-filter --read-index --read-validation-stringency --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --arguments_file --bam-partition-size --conf --disable-sequence-dictionary-validation --divide-by-genome-length --gcs-max-retries --help --identity-margin --interval-merging-rule --intervals --min-score-identity --not-normalized-by-kingdom --num-reducers --output --paired-input --program-name --reference --score-metrics --score-warnings --sharded-output --spark-master --unpaired-input --version --score-reads-per-partition-estimate --showHidden )
        ALL_ARGUMENT_VALUE_TYPES=("String" "String" "List[String]" "boolean" "List[String]" "String" "List[String]" "int" "int" "IntervalSetRule" "Boolean" "List[String]" "List[String]" "ValidationStringency" "List[File]" "boolean" "boolean" "LogLevel" "List[File]" "long" "List[String]" "boolean" "boolean" "int" "boolean" "double" "IntervalMergingRule" "List[String]" "double" "boolean" "int" "String" "String" "String" "String" "String" "String" "boolean" "String" "String" "boolean" "int" "boolean" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "ProperlyPairedReadFilter" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=()
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=()
        MIN_OCCURRENCES=()
        MAX_OCCURRENCES=()
        ALL_LEGAL_ARGUMENTS=()
        ALL_ARGUMENT_VALUE_TYPES=()

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "ConvertSequencingArtifactToOxoG" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--INPUT_BASE --COMPRESSION_LEVEL --CREATE_INDEX --CREATE_MD5_FILE --GA4GH_CLIENT_SECRETS --MAX_RECORDS_IN_RAM --QUIET --REFERENCE_SEQUENCE --TMP_DIR --USE_JDK_DEFLATER --USE_JDK_INFLATER --VALIDATION_STRINGENCY --VERBOSITY --arguments_file --help --OUTPUT_BASE --version --showHidden )
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=("--INPUT_BASE;-I" "--REFERENCE_SEQUENCE;-R" "--USE_JDK_DEFLATER;-use_jdk_deflater" "--USE_JDK_INFLATER;-use_jdk_inflater" "--help;-h" "--OUTPUT_BASE;-O" "--showHidden;-showHidden" )
        MIN_OCCURRENCES=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--INPUT_BASE --COMPRESSION_LEVEL --CREATE_INDEX --CREATE_MD5_FILE --GA4GH_CLIENT_SECRETS --MAX_RECORDS_IN_RAM --QUIET --REFERENCE_SEQUENCE --TMP_DIR --USE_JDK_DEFLATER --USE_JDK_INFLATER --VALIDATION_STRINGENCY --VERBOSITY --arguments_file --help --OUTPUT_BASE --version --showHidden )
        ALL_ARGUMENT_VALUE_TYPES=("File" "int" "Boolean" "boolean" "String" "Integer" "Boolean" "File" "List[File]" "Boolean" "Boolean" "ValidationStringency" "LogLevel" "List[File]" "boolean" "File" "boolean" "boolean" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "FixMateInformation" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--INPUT --COMPRESSION_LEVEL --CREATE_INDEX --CREATE_MD5_FILE --GA4GH_CLIENT_SECRETS --MAX_RECORDS_IN_RAM --QUIET --REFERENCE_SEQUENCE --TMP_DIR --USE_JDK_DEFLATER --USE_JDK_INFLATER --VALIDATION_STRINGENCY --VERBOSITY --ADD_MATE_CIGAR --arguments_file --ASSUME_SORTED --help --IGNORE_MISSING_MATES --OUTPUT --SORT_ORDER --version --showHidden )
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=("--INPUT;-I" "--REFERENCE_SEQUENCE;-R" "--USE_JDK_DEFLATER;-use_jdk_deflater" "--USE_JDK_INFLATER;-use_jdk_inflater" "--ADD_MATE_CIGAR;-MC" "--ASSUME_SORTED;-AS" "--help;-h" "--OUTPUT;-O" "--SORT_ORDER;-SO" "--showHidden;-showHidden" )
        MIN_OCCURRENCES=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--INPUT --COMPRESSION_LEVEL --CREATE_INDEX --CREATE_MD5_FILE --GA4GH_CLIENT_SECRETS --MAX_RECORDS_IN_RAM --QUIET --REFERENCE_SEQUENCE --TMP_DIR --USE_JDK_DEFLATER --USE_JDK_INFLATER --VALIDATION_STRINGENCY --VERBOSITY --ADD_MATE_CIGAR --arguments_file --ASSUME_SORTED --help --IGNORE_MISSING_MATES --OUTPUT --SORT_ORDER --version --showHidden )
        ALL_ARGUMENT_VALUE_TYPES=("List[File]" "int" "Boolean" "boolean" "String" "Integer" "Boolean" "File" "List[File]" "Boolean" "Boolean" "ValidationStringency" "LogLevel" "Boolean" "List[File]" "boolean" "boolean" "Boolean" "File" "SortOrder" "boolean" "boolean" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "DenoiseReadCounts" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--denoised-copy-ratios --input --standardized-copy-ratios --gatk-config-file --QUIET --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --annotated-intervals --arguments_file --count-panel-of-normals --gcs-max-retries --help --number-of-eigensamples --version --showHidden )
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=("--input;-I" "--use-jdk-deflater;-jdk-deflater" "--use-jdk-inflater;-jdk-inflater" "--verbosity;-verbosity" "--gcs-max-retries;-gcs-retries" "--help;-h" "--showHidden;-showHidden" )
        MIN_OCCURRENCES=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--denoised-copy-ratios --input --standardized-copy-ratios --gatk-config-file --QUIET --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --annotated-intervals --arguments_file --count-panel-of-normals --gcs-max-retries --help --number-of-eigensamples --version --showHidden )
        ALL_ARGUMENT_VALUE_TYPES=("File" "File" "File" "String" "Boolean" "List[File]" "boolean" "boolean" "LogLevel" "File" "List[File]" "File" "int" "boolean" "Integer" "boolean" "boolean" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "GenomicsDBImport" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--genomicsdb-workspace-path --intervals --add-output-sam-program-record --add-output-vcf-command-line --create-output-bam-index --create-output-bam-md5 --create-output-variant-index --create-output-variant-md5 --disable-read-filter --disable-sequence-dictionary-validation --disable-tool-default-read-filters --exclude-intervals --gatk-config-file --input --interval-exclusion-padding --interval-padding --interval-set-rule --lenient --QUIET --read-filter --read-index --read-validation-stringency --seconds-between-progress-updates --sequence-dictionary --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --arguments_file --batch-size --cloud-index-prefetch-buffer --cloud-prefetch-buffer --consolidate --disable-bam-index-caching --gcs-max-retries --genomicsdb-segment-size --genomicsdb-vcf-buffer-size --help --interval-merging-rule --overwrite-existing-genomicsdb-workspace --reference --validate-sample-name-map --variant --version --reader-threads --sample-name-map --showHidden )
        MUTUALLY_EXCLUSIVE_ARGS=("--variant;sample-name-map" "--sample-name-map;variant" )
        SYNONYMOUS_ARGS=("--intervals;-L" "--add-output-sam-program-record;-add-output-sam-program-record" "--add-output-vcf-command-line;-add-output-vcf-command-line" "--create-output-bam-index;-OBI" "--create-output-bam-md5;-OBM" "--create-output-variant-index;-OVI" "--create-output-variant-md5;-OVM" "--disable-read-filter;-DF" "--disable-sequence-dictionary-validation;-disable-sequence-dictionary-validation" "--disable-tool-default-read-filters;-disable-tool-default-read-filters" "--exclude-intervals;-XL" "--input;-I" "--interval-exclusion-padding;-ixp" "--interval-padding;-ip" "--interval-set-rule;-isr" "--lenient;-LE" "--read-filter;-RF" "--read-index;-read-index" "--read-validation-stringency;-VS" "--seconds-between-progress-updates;-seconds-between-progress-updates" "--sequence-dictionary;-sequence-dictionary" "--use-jdk-deflater;-jdk-deflater" "--use-jdk-inflater;-jdk-inflater" "--verbosity;-verbosity" "--cloud-index-prefetch-buffer;-CIPB" "--cloud-prefetch-buffer;-CPB" "--consolidate;-consolidate" "--disable-bam-index-caching;-DBIC" "--gcs-max-retries;-gcs-retries" "--genomicsdb-vcf-buffer-size;-genomicsdb-vcf-buffer-size" "--help;-h" "--interval-merging-rule;-imr" "--reference;-R" "--validate-sample-name-map;-validate-sample-name-map" "--variant;-V" "--reader-threads;-reader-threads" "--showHidden;-showHidden" )
        MIN_OCCURRENCES=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--genomicsdb-workspace-path --intervals --add-output-sam-program-record --add-output-vcf-command-line --create-output-bam-index --create-output-bam-md5 --create-output-variant-index --create-output-variant-md5 --disable-read-filter --disable-sequence-dictionary-validation --disable-tool-default-read-filters --exclude-intervals --gatk-config-file --input --interval-exclusion-padding --interval-padding --interval-set-rule --lenient --QUIET --read-filter --read-index --read-validation-stringency --seconds-between-progress-updates --sequence-dictionary --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --arguments_file --batch-size --cloud-index-prefetch-buffer --cloud-prefetch-buffer --consolidate --disable-bam-index-caching --gcs-max-retries --genomicsdb-segment-size --genomicsdb-vcf-buffer-size --help --interval-merging-rule --overwrite-existing-genomicsdb-workspace --reference --validate-sample-name-map --variant --version --reader-threads --sample-name-map --showHidden )
        ALL_ARGUMENT_VALUE_TYPES=("String" "List[String]" "boolean" "boolean" "boolean" "boolean" "boolean" "boolean" "List[String]" "boolean" "boolean" "List[String]" "String" "List[String]" "int" "int" "IntervalSetRule" "boolean" "Boolean" "List[String]" "List[String]" "ValidationStringency" "double" "String" "List[File]" "boolean" "boolean" "LogLevel" "List[File]" "int" "int" "int" "Boolean" "boolean" "int" "long" "long" "boolean" "IntervalMergingRule" "Boolean" "String" "Boolean" "List[String]" "boolean" "int" "String" "boolean" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "CheckPileup" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--input --pileup --reference --add-output-sam-program-record --add-output-vcf-command-line --create-output-bam-index --create-output-bam-md5 --create-output-variant-index --create-output-variant-md5 --disable-read-filter --disable-sequence-dictionary-validation --disable-tool-default-read-filters --exclude-intervals --gatk-config-file --interval-exclusion-padding --interval-padding --interval-set-rule --lenient --QUIET --read-filter --read-index --read-validation-stringency --seconds-between-progress-updates --sequence-dictionary --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --arguments_file --cloud-index-prefetch-buffer --cloud-prefetch-buffer --continue-after-error --disable-bam-index-caching --gcs-max-retries --help --ignore-overlaps --interval-merging-rule --intervals --maxDepthPerSample --output --version --showHidden )
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=("--input;-I" "--reference;-R" "--add-output-sam-program-record;-add-output-sam-program-record" "--add-output-vcf-command-line;-add-output-vcf-command-line" "--create-output-bam-index;-OBI" "--create-output-bam-md5;-OBM" "--create-output-variant-index;-OVI" "--create-output-variant-md5;-OVM" "--disable-read-filter;-DF" "--disable-sequence-dictionary-validation;-disable-sequence-dictionary-validation" "--disable-tool-default-read-filters;-disable-tool-default-read-filters" "--exclude-intervals;-XL" "--interval-exclusion-padding;-ixp" "--interval-padding;-ip" "--interval-set-rule;-isr" "--lenient;-LE" "--read-filter;-RF" "--read-index;-read-index" "--read-validation-stringency;-VS" "--seconds-between-progress-updates;-seconds-between-progress-updates" "--sequence-dictionary;-sequence-dictionary" "--use-jdk-deflater;-jdk-deflater" "--use-jdk-inflater;-jdk-inflater" "--verbosity;-verbosity" "--cloud-index-prefetch-buffer;-CIPB" "--cloud-prefetch-buffer;-CPB" "--disable-bam-index-caching;-DBIC" "--gcs-max-retries;-gcs-retries" "--help;-h" "--interval-merging-rule;-imr" "--intervals;-L" "--maxDepthPerSample;-maxDepthPerSample" "--output;-O" "--showHidden;-showHidden" )
        MIN_OCCURRENCES=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--input --pileup --reference --add-output-sam-program-record --add-output-vcf-command-line --create-output-bam-index --create-output-bam-md5 --create-output-variant-index --create-output-variant-md5 --disable-read-filter --disable-sequence-dictionary-validation --disable-tool-default-read-filters --exclude-intervals --gatk-config-file --interval-exclusion-padding --interval-padding --interval-set-rule --lenient --QUIET --read-filter --read-index --read-validation-stringency --seconds-between-progress-updates --sequence-dictionary --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --arguments_file --cloud-index-prefetch-buffer --cloud-prefetch-buffer --continue-after-error --disable-bam-index-caching --gcs-max-retries --help --ignore-overlaps --interval-merging-rule --intervals --maxDepthPerSample --output --version --showHidden )
        ALL_ARGUMENT_VALUE_TYPES=("List[String]" "FeatureInput[SAMPileupFeature]" "String" "boolean" "boolean" "boolean" "boolean" "boolean" "boolean" "List[String]" "boolean" "boolean" "List[String]" "String" "int" "int" "IntervalSetRule" "boolean" "Boolean" "List[String]" "List[String]" "ValidationStringency" "double" "String" "List[File]" "boolean" "boolean" "LogLevel" "List[File]" "int" "int" "boolean" "boolean" "int" "boolean" "boolean" "IntervalMergingRule" "List[String]" "int" "File" "boolean" "boolean" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "UmiAwareMarkDuplicatesWithMateCigar" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--INPUT --METRICS_FILE --OUTPUT --UMI_METRICS_FILE --ADD_PG_TAG_TO_READS --COMPRESSION_LEVEL --CREATE_INDEX --CREATE_MD5_FILE --GA4GH_CLIENT_SECRETS --MAX_RECORDS_IN_RAM --QUIET --REFERENCE_SEQUENCE --TMP_DIR --USE_JDK_DEFLATER --USE_JDK_INFLATER --VALIDATION_STRINGENCY --VERBOSITY --ALLOW_MISSING_UMIS --arguments_file --ASSIGNED_UMI_TAG --ASSUME_SORT_ORDER --BARCODE_TAG --CLEAR_DT --COMMENT --DUPLICATE_SCORING_STRATEGY --help --MAX_EDIT_DISTANCE_TO_JOIN --MAX_FILE_HANDLES_FOR_READ_ENDS_MAP --MAX_OPTICAL_DUPLICATE_SET_SIZE --MAX_SEQUENCES_FOR_DISK_READ_ENDS_MAP --OPTICAL_DUPLICATE_PIXEL_DISTANCE --PROGRAM_GROUP_COMMAND_LINE --PROGRAM_GROUP_NAME --PROGRAM_GROUP_VERSION --PROGRAM_RECORD_ID --READ_NAME_REGEX --READ_ONE_BARCODE_TAG --READ_TWO_BARCODE_TAG --REMOVE_DUPLICATES --REMOVE_SEQUENCING_DUPLICATES --SORTING_COLLECTION_SIZE_RATIO --TAG_DUPLICATE_SET_MEMBERS --TAGGING_POLICY --UMI_TAG_NAME --version --showHidden --ASSUME_SORTED )
        MUTUALLY_EXCLUSIVE_ARGS=("--ASSUME_SORT_ORDER;ASSUME_SORTED" "--ASSUME_SORTED;ASSUME_SORT_ORDER,ASO" )
        SYNONYMOUS_ARGS=("--INPUT;-I" "--METRICS_FILE;-M" "--OUTPUT;-O" "--UMI_METRICS_FILE;-UMI_METRICS" "--REFERENCE_SEQUENCE;-R" "--USE_JDK_DEFLATER;-use_jdk_deflater" "--USE_JDK_INFLATER;-use_jdk_inflater" "--ASSIGNED_UMI_TAG;-ASSIGNED_UMI_TAG" "--ASSUME_SORT_ORDER;-ASO" "--COMMENT;-CO" "--DUPLICATE_SCORING_STRATEGY;-DS" "--help;-h" "--MAX_EDIT_DISTANCE_TO_JOIN;-MAX_EDIT_DISTANCE_TO_JOIN" "--MAX_FILE_HANDLES_FOR_READ_ENDS_MAP;-MAX_FILE_HANDLES" "--MAX_SEQUENCES_FOR_DISK_READ_ENDS_MAP;-MAX_SEQS" "--PROGRAM_GROUP_COMMAND_LINE;-PG_COMMAND" "--PROGRAM_GROUP_NAME;-PG_NAME" "--PROGRAM_GROUP_VERSION;-PG_VERSION" "--PROGRAM_RECORD_ID;-PG" "--UMI_TAG_NAME;-UMI_TAG_NAME" "--showHidden;-showHidden" "--ASSUME_SORTED;-AS" )
        MIN_OCCURRENCES=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--INPUT --METRICS_FILE --OUTPUT --UMI_METRICS_FILE --ADD_PG_TAG_TO_READS --COMPRESSION_LEVEL --CREATE_INDEX --CREATE_MD5_FILE --GA4GH_CLIENT_SECRETS --MAX_RECORDS_IN_RAM --QUIET --REFERENCE_SEQUENCE --TMP_DIR --USE_JDK_DEFLATER --USE_JDK_INFLATER --VALIDATION_STRINGENCY --VERBOSITY --ALLOW_MISSING_UMIS --arguments_file --ASSIGNED_UMI_TAG --ASSUME_SORT_ORDER --BARCODE_TAG --CLEAR_DT --COMMENT --DUPLICATE_SCORING_STRATEGY --help --MAX_EDIT_DISTANCE_TO_JOIN --MAX_FILE_HANDLES_FOR_READ_ENDS_MAP --MAX_OPTICAL_DUPLICATE_SET_SIZE --MAX_SEQUENCES_FOR_DISK_READ_ENDS_MAP --OPTICAL_DUPLICATE_PIXEL_DISTANCE --PROGRAM_GROUP_COMMAND_LINE --PROGRAM_GROUP_NAME --PROGRAM_GROUP_VERSION --PROGRAM_RECORD_ID --READ_NAME_REGEX --READ_ONE_BARCODE_TAG --READ_TWO_BARCODE_TAG --REMOVE_DUPLICATES --REMOVE_SEQUENCING_DUPLICATES --SORTING_COLLECTION_SIZE_RATIO --TAG_DUPLICATE_SET_MEMBERS --TAGGING_POLICY --UMI_TAG_NAME --version --showHidden --ASSUME_SORTED )
        ALL_ARGUMENT_VALUE_TYPES=("List[String]" "File" "File" "File" "Boolean" "int" "Boolean" "boolean" "String" "Integer" "Boolean" "File" "List[File]" "Boolean" "Boolean" "ValidationStringency" "LogLevel" "boolean" "List[File]" "String" "SortOrder" "String" "boolean" "List[String]" "ScoringStrategy" "boolean" "int" "int" "long" "int" "int" "String" "String" "String" "String" "String" "String" "String" "boolean" "boolean" "double" "boolean" "DuplicateTaggingPolicy" "String" "boolean" "boolean" "boolean" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "ClipReads" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--input --output --add-output-sam-program-record --add-output-vcf-command-line --create-output-bam-index --create-output-bam-md5 --create-output-variant-index --create-output-variant-md5 --disable-read-filter --disable-sequence-dictionary-validation --disable-tool-default-read-filters --exclude-intervals --gatk-config-file --interval-exclusion-padding --interval-padding --interval-set-rule --lenient --QUIET --read-filter --read-index --read-validation-stringency --seconds-between-progress-updates --sequence-dictionary --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --arguments_file --clip-representation --clip-sequence --clip-sequences-file --cloud-index-prefetch-buffer --cloud-prefetch-buffer --cycles-to-trim --disable-bam-index-caching --gcs-max-retries --help --interval-merging-rule --intervals --output-statistics --q-trimming-threshold --read --reference --version --showHidden )
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=("--input;-I" "--output;-O" "--add-output-sam-program-record;-add-output-sam-program-record" "--add-output-vcf-command-line;-add-output-vcf-command-line" "--create-output-bam-index;-OBI" "--create-output-bam-md5;-OBM" "--create-output-variant-index;-OVI" "--create-output-variant-md5;-OVM" "--disable-read-filter;-DF" "--disable-sequence-dictionary-validation;-disable-sequence-dictionary-validation" "--disable-tool-default-read-filters;-disable-tool-default-read-filters" "--exclude-intervals;-XL" "--interval-exclusion-padding;-ixp" "--interval-padding;-ip" "--interval-set-rule;-isr" "--lenient;-LE" "--read-filter;-RF" "--read-index;-read-index" "--read-validation-stringency;-VS" "--seconds-between-progress-updates;-seconds-between-progress-updates" "--sequence-dictionary;-sequence-dictionary" "--use-jdk-deflater;-jdk-deflater" "--use-jdk-inflater;-jdk-inflater" "--verbosity;-verbosity" "--clip-representation;-CR" "--clip-sequence;-X" "--clip-sequences-file;-XF" "--cloud-index-prefetch-buffer;-CIPB" "--cloud-prefetch-buffer;-CPB" "--cycles-to-trim;-CT" "--disable-bam-index-caching;-DBIC" "--gcs-max-retries;-gcs-retries" "--help;-h" "--interval-merging-rule;-imr" "--intervals;-L" "--output-statistics;-os" "--q-trimming-threshold;-QT" "--read;-read" "--reference;-R" "--showHidden;-showHidden" )
        MIN_OCCURRENCES=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--input --output --add-output-sam-program-record --add-output-vcf-command-line --create-output-bam-index --create-output-bam-md5 --create-output-variant-index --create-output-variant-md5 --disable-read-filter --disable-sequence-dictionary-validation --disable-tool-default-read-filters --exclude-intervals --gatk-config-file --interval-exclusion-padding --interval-padding --interval-set-rule --lenient --QUIET --read-filter --read-index --read-validation-stringency --seconds-between-progress-updates --sequence-dictionary --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --arguments_file --clip-representation --clip-sequence --clip-sequences-file --cloud-index-prefetch-buffer --cloud-prefetch-buffer --cycles-to-trim --disable-bam-index-caching --gcs-max-retries --help --interval-merging-rule --intervals --output-statistics --q-trimming-threshold --read --reference --version --showHidden )
        ALL_ARGUMENT_VALUE_TYPES=("List[String]" "File" "boolean" "boolean" "boolean" "boolean" "boolean" "boolean" "List[String]" "boolean" "boolean" "List[String]" "String" "int" "int" "IntervalSetRule" "boolean" "Boolean" "List[String]" "List[String]" "ValidationStringency" "double" "String" "List[File]" "boolean" "boolean" "LogLevel" "List[File]" "ClippingRepresentation" "List[String]" "String" "int" "int" "String" "boolean" "int" "boolean" "IntervalMergingRule" "List[String]" "File" "int" "String" "String" "boolean" "boolean" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "ReadGroupBlackListReadFilter" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--read-group-black-list )
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=()
        MIN_OCCURRENCES=(0 )
        MAX_OCCURRENCES=(2147483647 )
        ALL_LEGAL_ARGUMENTS=(--read-group-black-list )
        ALL_ARGUMENT_VALUE_TYPES=("List[String]" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "GetPileupSummaries" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--input --output --variant --add-output-sam-program-record --add-output-vcf-command-line --create-output-bam-index --create-output-bam-md5 --create-output-variant-index --create-output-variant-md5 --disable-read-filter --disable-sequence-dictionary-validation --disable-tool-default-read-filters --exclude-intervals --gatk-config-file --interval-exclusion-padding --interval-padding --interval-set-rule --lenient --QUIET --read-filter --read-index --read-validation-stringency --seconds-between-progress-updates --sequence-dictionary --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --arguments_file --cloud-index-prefetch-buffer --cloud-prefetch-buffer --disable-bam-index-caching --gcs-max-retries --help --interval-merging-rule --intervals --maximum-population-allele-frequency --minimum-population-allele-frequency --reference --version --showHidden )
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=("--input;-I" "--output;-O" "--variant;-V" "--add-output-sam-program-record;-add-output-sam-program-record" "--add-output-vcf-command-line;-add-output-vcf-command-line" "--create-output-bam-index;-OBI" "--create-output-bam-md5;-OBM" "--create-output-variant-index;-OVI" "--create-output-variant-md5;-OVM" "--disable-read-filter;-DF" "--disable-sequence-dictionary-validation;-disable-sequence-dictionary-validation" "--disable-tool-default-read-filters;-disable-tool-default-read-filters" "--exclude-intervals;-XL" "--interval-exclusion-padding;-ixp" "--interval-padding;-ip" "--interval-set-rule;-isr" "--lenient;-LE" "--read-filter;-RF" "--read-index;-read-index" "--read-validation-stringency;-VS" "--seconds-between-progress-updates;-seconds-between-progress-updates" "--sequence-dictionary;-sequence-dictionary" "--use-jdk-deflater;-jdk-deflater" "--use-jdk-inflater;-jdk-inflater" "--verbosity;-verbosity" "--cloud-index-prefetch-buffer;-CIPB" "--cloud-prefetch-buffer;-CPB" "--disable-bam-index-caching;-DBIC" "--gcs-max-retries;-gcs-retries" "--help;-h" "--interval-merging-rule;-imr" "--intervals;-L" "--maximum-population-allele-frequency;-max-af" "--minimum-population-allele-frequency;-min-af" "--reference;-R" "--showHidden;-showHidden" )
        MIN_OCCURRENCES=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--input --output --variant --add-output-sam-program-record --add-output-vcf-command-line --create-output-bam-index --create-output-bam-md5 --create-output-variant-index --create-output-variant-md5 --disable-read-filter --disable-sequence-dictionary-validation --disable-tool-default-read-filters --exclude-intervals --gatk-config-file --interval-exclusion-padding --interval-padding --interval-set-rule --lenient --QUIET --read-filter --read-index --read-validation-stringency --seconds-between-progress-updates --sequence-dictionary --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --arguments_file --cloud-index-prefetch-buffer --cloud-prefetch-buffer --disable-bam-index-caching --gcs-max-retries --help --interval-merging-rule --intervals --maximum-population-allele-frequency --minimum-population-allele-frequency --reference --version --showHidden )
        ALL_ARGUMENT_VALUE_TYPES=("List[String]" "File" "List[String]" "boolean" "boolean" "boolean" "boolean" "boolean" "boolean" "List[String]" "boolean" "boolean" "List[String]" "String" "int" "int" "IntervalSetRule" "boolean" "Boolean" "List[String]" "List[String]" "ValidationStringency" "double" "String" "List[File]" "boolean" "boolean" "LogLevel" "List[File]" "int" "int" "boolean" "int" "boolean" "IntervalMergingRule" "List[String]" "double" "double" "String" "boolean" "boolean" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "BuildBamIndex" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--INPUT --COMPRESSION_LEVEL --CREATE_INDEX --CREATE_MD5_FILE --GA4GH_CLIENT_SECRETS --MAX_RECORDS_IN_RAM --QUIET --REFERENCE_SEQUENCE --TMP_DIR --USE_JDK_DEFLATER --USE_JDK_INFLATER --VALIDATION_STRINGENCY --VERBOSITY --arguments_file --help --OUTPUT --version --showHidden )
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=("--INPUT;-I" "--REFERENCE_SEQUENCE;-R" "--USE_JDK_DEFLATER;-use_jdk_deflater" "--USE_JDK_INFLATER;-use_jdk_inflater" "--help;-h" "--OUTPUT;-O" "--showHidden;-showHidden" )
        MIN_OCCURRENCES=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--INPUT --COMPRESSION_LEVEL --CREATE_INDEX --CREATE_MD5_FILE --GA4GH_CLIENT_SECRETS --MAX_RECORDS_IN_RAM --QUIET --REFERENCE_SEQUENCE --TMP_DIR --USE_JDK_DEFLATER --USE_JDK_INFLATER --VALIDATION_STRINGENCY --VERBOSITY --arguments_file --help --OUTPUT --version --showHidden )
        ALL_ARGUMENT_VALUE_TYPES=("String" "int" "Boolean" "boolean" "String" "Integer" "Boolean" "File" "List[File]" "Boolean" "Boolean" "ValidationStringency" "LogLevel" "List[File]" "boolean" "File" "boolean" "boolean" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "AlignmentAgreesWithHeaderReadFilter" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=()
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=()
        MIN_OCCURRENCES=()
        MAX_OCCURRENCES=()
        ALL_LEGAL_ARGUMENTS=()
        ALL_ARGUMENT_VALUE_TYPES=()

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "NotSupplementaryAlignmentReadFilter" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=()
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=()
        MIN_OCCURRENCES=()
        MAX_OCCURRENCES=()
        ALL_LEGAL_ARGUMENTS=()
        ALL_ARGUMENT_VALUE_TYPES=()

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "ExtractOriginalAlignmentRecordsByNameSpark" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--input --output --read-name-file --disable-read-filter --disable-tool-default-read-filters --exclude-intervals --gatk-config-file --interval-exclusion-padding --interval-padding --interval-set-rule --QUIET --read-filter --read-index --read-validation-stringency --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --arguments_file --bam-partition-size --conf --disable-sequence-dictionary-validation --gcs-max-retries --help --interval-merging-rule --intervals --num-reducers --program-name --reference --sharded-output --spark-master --version --showHidden )
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=("--input;-I" "--output;-O" "--read-name-file;-names" "--disable-read-filter;-DF" "--disable-tool-default-read-filters;-disable-tool-default-read-filters" "--exclude-intervals;-XL" "--interval-exclusion-padding;-ixp" "--interval-padding;-ip" "--interval-set-rule;-isr" "--read-filter;-RF" "--read-index;-read-index" "--read-validation-stringency;-VS" "--use-jdk-deflater;-jdk-deflater" "--use-jdk-inflater;-jdk-inflater" "--verbosity;-verbosity" "--conf;-conf" "--disable-sequence-dictionary-validation;-disable-sequence-dictionary-validation" "--gcs-max-retries;-gcs-retries" "--help;-h" "--interval-merging-rule;-imr" "--intervals;-L" "--reference;-R" "--showHidden;-showHidden" )
        MIN_OCCURRENCES=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--input --output --read-name-file --disable-read-filter --disable-tool-default-read-filters --exclude-intervals --gatk-config-file --interval-exclusion-padding --interval-padding --interval-set-rule --QUIET --read-filter --read-index --read-validation-stringency --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --arguments_file --bam-partition-size --conf --disable-sequence-dictionary-validation --gcs-max-retries --help --interval-merging-rule --intervals --num-reducers --program-name --reference --sharded-output --spark-master --version --showHidden )
        ALL_ARGUMENT_VALUE_TYPES=("List[String]" "String" "String" "List[String]" "boolean" "List[String]" "String" "int" "int" "IntervalSetRule" "Boolean" "List[String]" "List[String]" "ValidationStringency" "List[File]" "boolean" "boolean" "LogLevel" "List[File]" "long" "List[String]" "boolean" "int" "boolean" "IntervalMergingRule" "List[String]" "int" "String" "String" "boolean" "String" "boolean" "boolean" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "AS_RMSMappingQuality" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=()
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=()
        MIN_OCCURRENCES=()
        MAX_OCCURRENCES=()
        ALL_LEGAL_ARGUMENTS=()
        ALL_ARGUMENT_VALUE_TYPES=()

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "BQSRPipelineSpark" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--input --known-sites --output --reference --disable-read-filter --disable-tool-default-read-filters --exclude-intervals --gatk-config-file --interval-exclusion-padding --interval-padding --interval-set-rule --QUIET --read-filter --read-index --read-validation-stringency --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --arguments_file --bam-partition-size --binary-tag-name --bqsr-baq-gap-open-penalty --conf --default-base-qualities --deletions-default-quality --disable-sequence-dictionary-validation --emit-original-quals --gcs-max-retries --global-qscore-prior --help --indels-context-size --insertions-default-quality --interval-merging-rule --intervals --join-strategy --low-quality-tail --maximum-cycle-value --mismatches-context-size --mismatches-default-quality --num-reducers --preserve-qscores-less-than --program-name --quantize-quals --quantizing-levels --read-shard-padding --read-shard-size --sharded-output --spark-master --use-original-qualities --version --round-down-quantized --showHidden --static-quantized-quals )
        MUTUALLY_EXCLUSIVE_ARGS=("--quantize-quals;static-quantized-quals,round-down-quantized" "--round-down-quantized;quantize-quals" "--static-quantized-quals;quantize-quals" )
        SYNONYMOUS_ARGS=("--input;-I" "--output;-O" "--reference;-R" "--disable-read-filter;-DF" "--disable-tool-default-read-filters;-disable-tool-default-read-filters" "--exclude-intervals;-XL" "--interval-exclusion-padding;-ixp" "--interval-padding;-ip" "--interval-set-rule;-isr" "--read-filter;-RF" "--read-index;-read-index" "--read-validation-stringency;-VS" "--use-jdk-deflater;-jdk-deflater" "--use-jdk-inflater;-jdk-inflater" "--verbosity;-verbosity" "--conf;-conf" "--disable-sequence-dictionary-validation;-disable-sequence-dictionary-validation" "--gcs-max-retries;-gcs-retries" "--help;-h" "--indels-context-size;-ics" "--interval-merging-rule;-imr" "--intervals;-L" "--maximum-cycle-value;-max-cycle" "--mismatches-context-size;-mcs" "--use-original-qualities;-OQ" "--showHidden;-showHidden" )
        MIN_OCCURRENCES=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--input --known-sites --output --reference --disable-read-filter --disable-tool-default-read-filters --exclude-intervals --gatk-config-file --interval-exclusion-padding --interval-padding --interval-set-rule --QUIET --read-filter --read-index --read-validation-stringency --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --arguments_file --bam-partition-size --binary-tag-name --bqsr-baq-gap-open-penalty --conf --default-base-qualities --deletions-default-quality --disable-sequence-dictionary-validation --emit-original-quals --gcs-max-retries --global-qscore-prior --help --indels-context-size --insertions-default-quality --interval-merging-rule --intervals --join-strategy --low-quality-tail --maximum-cycle-value --mismatches-context-size --mismatches-default-quality --num-reducers --preserve-qscores-less-than --program-name --quantize-quals --quantizing-levels --read-shard-padding --read-shard-size --sharded-output --spark-master --use-original-qualities --version --round-down-quantized --showHidden --static-quantized-quals )
        ALL_ARGUMENT_VALUE_TYPES=("List[String]" "List[String]" "String" "String" "List[String]" "boolean" "List[String]" "String" "int" "int" "IntervalSetRule" "Boolean" "List[String]" "List[String]" "ValidationStringency" "List[File]" "boolean" "boolean" "LogLevel" "List[File]" "long" "String" "double" "List[String]" "byte" "byte" "boolean" "boolean" "int" "double" "boolean" "int" "byte" "IntervalMergingRule" "List[String]" "JoinStrategy" "byte" "int" "int" "byte" "int" "int" "String" "int" "int" "int" "int" "boolean" "String" "Boolean" "boolean" "boolean" "boolean" "List[Integer]" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "UpdateVCFSequenceDictionary" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--output --variant --add-output-sam-program-record --add-output-vcf-command-line --create-output-bam-index --create-output-bam-md5 --create-output-variant-index --create-output-variant-md5 --disable-read-filter --disable-sequence-dictionary-validation --disable-tool-default-read-filters --exclude-intervals --gatk-config-file --input --interval-exclusion-padding --interval-padding --interval-set-rule --lenient --QUIET --read-filter --read-index --read-validation-stringency --seconds-between-progress-updates --sequence-dictionary --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --arguments_file --cloud-index-prefetch-buffer --cloud-prefetch-buffer --disable-bam-index-caching --gcs-max-retries --help --interval-merging-rule --intervals --reference --replace --source-dictionary --version --showHidden )
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=("--output;-O" "--variant;-V" "--add-output-sam-program-record;-add-output-sam-program-record" "--add-output-vcf-command-line;-add-output-vcf-command-line" "--create-output-bam-index;-OBI" "--create-output-bam-md5;-OBM" "--create-output-variant-index;-OVI" "--create-output-variant-md5;-OVM" "--disable-read-filter;-DF" "--disable-sequence-dictionary-validation;-disable-sequence-dictionary-validation" "--disable-tool-default-read-filters;-disable-tool-default-read-filters" "--exclude-intervals;-XL" "--input;-I" "--interval-exclusion-padding;-ixp" "--interval-padding;-ip" "--interval-set-rule;-isr" "--lenient;-LE" "--read-filter;-RF" "--read-index;-read-index" "--read-validation-stringency;-VS" "--seconds-between-progress-updates;-seconds-between-progress-updates" "--sequence-dictionary;-sequence-dictionary" "--use-jdk-deflater;-jdk-deflater" "--use-jdk-inflater;-jdk-inflater" "--verbosity;-verbosity" "--cloud-index-prefetch-buffer;-CIPB" "--cloud-prefetch-buffer;-CPB" "--disable-bam-index-caching;-DBIC" "--gcs-max-retries;-gcs-retries" "--help;-h" "--interval-merging-rule;-imr" "--intervals;-L" "--reference;-R" "--showHidden;-showHidden" )
        MIN_OCCURRENCES=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--output --variant --add-output-sam-program-record --add-output-vcf-command-line --create-output-bam-index --create-output-bam-md5 --create-output-variant-index --create-output-variant-md5 --disable-read-filter --disable-sequence-dictionary-validation --disable-tool-default-read-filters --exclude-intervals --gatk-config-file --input --interval-exclusion-padding --interval-padding --interval-set-rule --lenient --QUIET --read-filter --read-index --read-validation-stringency --seconds-between-progress-updates --sequence-dictionary --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --arguments_file --cloud-index-prefetch-buffer --cloud-prefetch-buffer --disable-bam-index-caching --gcs-max-retries --help --interval-merging-rule --intervals --reference --replace --source-dictionary --version --showHidden )
        ALL_ARGUMENT_VALUE_TYPES=("String" "String" "boolean" "boolean" "boolean" "boolean" "boolean" "boolean" "List[String]" "boolean" "boolean" "List[String]" "String" "List[String]" "int" "int" "IntervalSetRule" "boolean" "Boolean" "List[String]" "List[String]" "ValidationStringency" "double" "String" "List[File]" "boolean" "boolean" "LogLevel" "List[File]" "int" "int" "boolean" "int" "boolean" "IntervalMergingRule" "List[String]" "String" "boolean" "String" "boolean" "boolean" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "BaseRecalibratorSpark" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--input --known-sites --output --reference --disable-read-filter --disable-tool-default-read-filters --exclude-intervals --gatk-config-file --interval-exclusion-padding --interval-padding --interval-set-rule --QUIET --read-filter --read-index --read-validation-stringency --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --arguments_file --bam-partition-size --binary-tag-name --bqsr-baq-gap-open-penalty --conf --default-base-qualities --deletions-default-quality --disable-sequence-dictionary-validation --gcs-max-retries --help --indels-context-size --insertions-default-quality --interval-merging-rule --intervals --join-strategy --low-quality-tail --maximum-cycle-value --mismatches-context-size --mismatches-default-quality --num-reducers --preserve-qscores-less-than --program-name --quantizing-levels --read-shard-padding --read-shard-size --sharded-output --spark-master --use-original-qualities --version --showHidden )
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=("--input;-I" "--output;-O" "--reference;-R" "--disable-read-filter;-DF" "--disable-tool-default-read-filters;-disable-tool-default-read-filters" "--exclude-intervals;-XL" "--interval-exclusion-padding;-ixp" "--interval-padding;-ip" "--interval-set-rule;-isr" "--read-filter;-RF" "--read-index;-read-index" "--read-validation-stringency;-VS" "--use-jdk-deflater;-jdk-deflater" "--use-jdk-inflater;-jdk-inflater" "--verbosity;-verbosity" "--conf;-conf" "--disable-sequence-dictionary-validation;-disable-sequence-dictionary-validation" "--gcs-max-retries;-gcs-retries" "--help;-h" "--indels-context-size;-ics" "--interval-merging-rule;-imr" "--intervals;-L" "--maximum-cycle-value;-max-cycle" "--mismatches-context-size;-mcs" "--use-original-qualities;-OQ" "--showHidden;-showHidden" )
        MIN_OCCURRENCES=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--input --known-sites --output --reference --disable-read-filter --disable-tool-default-read-filters --exclude-intervals --gatk-config-file --interval-exclusion-padding --interval-padding --interval-set-rule --QUIET --read-filter --read-index --read-validation-stringency --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --arguments_file --bam-partition-size --binary-tag-name --bqsr-baq-gap-open-penalty --conf --default-base-qualities --deletions-default-quality --disable-sequence-dictionary-validation --gcs-max-retries --help --indels-context-size --insertions-default-quality --interval-merging-rule --intervals --join-strategy --low-quality-tail --maximum-cycle-value --mismatches-context-size --mismatches-default-quality --num-reducers --preserve-qscores-less-than --program-name --quantizing-levels --read-shard-padding --read-shard-size --sharded-output --spark-master --use-original-qualities --version --showHidden )
        ALL_ARGUMENT_VALUE_TYPES=("List[String]" "List[String]" "String" "String" "List[String]" "boolean" "List[String]" "String" "int" "int" "IntervalSetRule" "Boolean" "List[String]" "List[String]" "ValidationStringency" "List[File]" "boolean" "boolean" "LogLevel" "List[File]" "long" "String" "double" "List[String]" "byte" "byte" "boolean" "int" "boolean" "int" "byte" "IntervalMergingRule" "List[String]" "JoinStrategy" "byte" "int" "int" "byte" "int" "int" "String" "int" "int" "int" "boolean" "String" "Boolean" "boolean" "boolean" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "CollectRawWgsMetrics" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--INPUT --OUTPUT --REFERENCE_SEQUENCE --COMPRESSION_LEVEL --CREATE_INDEX --CREATE_MD5_FILE --GA4GH_CLIENT_SECRETS --MAX_RECORDS_IN_RAM --QUIET --TMP_DIR --USE_JDK_DEFLATER --USE_JDK_INFLATER --VALIDATION_STRINGENCY --VERBOSITY --arguments_file --COUNT_UNPAIRED --COVERAGE_CAP --help --INCLUDE_BQ_HISTOGRAM --INTERVALS --LOCUS_ACCUMULATION_CAP --MINIMUM_BASE_QUALITY --MINIMUM_MAPPING_QUALITY --READ_LENGTH --SAMPLE_SIZE --STOP_AFTER --USE_FAST_ALGORITHM --version --showHidden )
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=("--INPUT;-I" "--OUTPUT;-O" "--REFERENCE_SEQUENCE;-R" "--USE_JDK_DEFLATER;-use_jdk_deflater" "--USE_JDK_INFLATER;-use_jdk_inflater" "--COVERAGE_CAP;-CAP" "--help;-h" "--MINIMUM_BASE_QUALITY;-Q" "--MINIMUM_MAPPING_QUALITY;-MQ" "--showHidden;-showHidden" )
        MIN_OCCURRENCES=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--INPUT --OUTPUT --REFERENCE_SEQUENCE --COMPRESSION_LEVEL --CREATE_INDEX --CREATE_MD5_FILE --GA4GH_CLIENT_SECRETS --MAX_RECORDS_IN_RAM --QUIET --TMP_DIR --USE_JDK_DEFLATER --USE_JDK_INFLATER --VALIDATION_STRINGENCY --VERBOSITY --arguments_file --COUNT_UNPAIRED --COVERAGE_CAP --help --INCLUDE_BQ_HISTOGRAM --INTERVALS --LOCUS_ACCUMULATION_CAP --MINIMUM_BASE_QUALITY --MINIMUM_MAPPING_QUALITY --READ_LENGTH --SAMPLE_SIZE --STOP_AFTER --USE_FAST_ALGORITHM --version --showHidden )
        ALL_ARGUMENT_VALUE_TYPES=("File" "File" "File" "int" "Boolean" "boolean" "String" "Integer" "Boolean" "List[File]" "Boolean" "Boolean" "ValidationStringency" "LogLevel" "List[File]" "boolean" "int" "boolean" "boolean" "File" "int" "int" "int" "int" "int" "long" "boolean" "boolean" "boolean" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "DepthPerAlleleBySample" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=()
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=()
        MIN_OCCURRENCES=()
        MAX_OCCURRENCES=()
        ALL_LEGAL_ARGUMENTS=()
        ALL_ARGUMENT_VALUE_TYPES=()

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "SelectVariants" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--output --variant --add-output-sam-program-record --add-output-vcf-command-line --create-output-bam-index --create-output-bam-md5 --create-output-variant-index --create-output-variant-md5 --disable-read-filter --disable-sequence-dictionary-validation --disable-tool-default-read-filters --exclude-intervals --gatk-config-file --input --interval-exclusion-padding --interval-padding --interval-set-rule --lenient --QUIET --read-filter --read-index --read-validation-stringency --seconds-between-progress-updates --sequence-dictionary --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --arguments_file --cloud-index-prefetch-buffer --cloud-prefetch-buffer --concordance --disable-bam-index-caching --discordance --exclude-filtered --exclude-ids --exclude-non-variants --exclude-sample-expressions --exclude-sample-name --gcs-max-retries --help --interval-merging-rule --intervals --invert-mendelian-violation --invertSelect --keep-ids --keep-original-ac --keep-original-dp --max-filtered-genotypes --max-fraction-filtered-genotypes --max-indel-size --max-nocall-fraction --max-nocall-number --mendelian-violation --mendelian-violation-qual-threshold --min-filtered-genotypes --min-fraction-filtered-genotypes --min-indel-size --pedigree --preserve-alleles --reference --remove-fraction-genotypes --remove-unused-alternates --restrict-alleles-to --sample-expressions --sample-name --selectExpressions --select-random-fraction --select-type-to-exclude --select-type-to-include --set-filtered-gt-to-nocall --version --showHidden )
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=("--output;-O" "--variant;-V" "--add-output-sam-program-record;-add-output-sam-program-record" "--add-output-vcf-command-line;-add-output-vcf-command-line" "--create-output-bam-index;-OBI" "--create-output-bam-md5;-OBM" "--create-output-variant-index;-OVI" "--create-output-variant-md5;-OVM" "--disable-read-filter;-DF" "--disable-sequence-dictionary-validation;-disable-sequence-dictionary-validation" "--disable-tool-default-read-filters;-disable-tool-default-read-filters" "--exclude-intervals;-XL" "--input;-I" "--interval-exclusion-padding;-ixp" "--interval-padding;-ip" "--interval-set-rule;-isr" "--lenient;-LE" "--read-filter;-RF" "--read-index;-read-index" "--read-validation-stringency;-VS" "--seconds-between-progress-updates;-seconds-between-progress-updates" "--sequence-dictionary;-sequence-dictionary" "--use-jdk-deflater;-jdk-deflater" "--use-jdk-inflater;-jdk-inflater" "--verbosity;-verbosity" "--cloud-index-prefetch-buffer;-CIPB" "--cloud-prefetch-buffer;-CPB" "--concordance;-conc" "--disable-bam-index-caching;-DBIC" "--discordance;-disc" "--exclude-ids;-xl-ids" "--exclude-sample-expressions;-xl-se" "--exclude-sample-name;-xl-sn" "--gcs-max-retries;-gcs-retries" "--help;-h" "--interval-merging-rule;-imr" "--intervals;-L" "--invertSelect;-invert-select" "--keep-ids;-ids" "--pedigree;-ped" "--reference;-R" "--sample-expressions;-se" "--sample-name;-sn" "--selectExpressions;-select" "--select-random-fraction;-fraction" "--select-type-to-exclude;-xl-select-type" "--select-type-to-include;-select-type" "--showHidden;-showHidden" )
        MIN_OCCURRENCES=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--output --variant --add-output-sam-program-record --add-output-vcf-command-line --create-output-bam-index --create-output-bam-md5 --create-output-variant-index --create-output-variant-md5 --disable-read-filter --disable-sequence-dictionary-validation --disable-tool-default-read-filters --exclude-intervals --gatk-config-file --input --interval-exclusion-padding --interval-padding --interval-set-rule --lenient --QUIET --read-filter --read-index --read-validation-stringency --seconds-between-progress-updates --sequence-dictionary --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --arguments_file --cloud-index-prefetch-buffer --cloud-prefetch-buffer --concordance --disable-bam-index-caching --discordance --exclude-filtered --exclude-ids --exclude-non-variants --exclude-sample-expressions --exclude-sample-name --gcs-max-retries --help --interval-merging-rule --intervals --invert-mendelian-violation --invertSelect --keep-ids --keep-original-ac --keep-original-dp --max-filtered-genotypes --max-fraction-filtered-genotypes --max-indel-size --max-nocall-fraction --max-nocall-number --mendelian-violation --mendelian-violation-qual-threshold --min-filtered-genotypes --min-fraction-filtered-genotypes --min-indel-size --pedigree --preserve-alleles --reference --remove-fraction-genotypes --remove-unused-alternates --restrict-alleles-to --sample-expressions --sample-name --selectExpressions --select-random-fraction --select-type-to-exclude --select-type-to-include --set-filtered-gt-to-nocall --version --showHidden )
        ALL_ARGUMENT_VALUE_TYPES=("File" "String" "boolean" "boolean" "boolean" "boolean" "boolean" "boolean" "List[String]" "boolean" "boolean" "List[String]" "String" "List[String]" "int" "int" "IntervalSetRule" "boolean" "Boolean" "List[String]" "List[String]" "ValidationStringency" "double" "String" "List[File]" "boolean" "boolean" "LogLevel" "List[File]" "int" "int" "FeatureInput[VariantContext]" "boolean" "FeatureInput[VariantContext]" "boolean" "Set[String]" "boolean" "Set[String]" "Set[String]" "int" "boolean" "IntervalMergingRule" "List[String]" "Boolean" "boolean" "Set[String]" "boolean" "boolean" "int" "double" "int" "double" "int" "Boolean" "double" "int" "double" "int" "File" "boolean" "String" "double" "boolean" "NumberAlleleRestriction" "Set[String]" "Set[String]" "ArrayList[String]" "double" "List[Type]" "List[Type]" "boolean" "boolean" "boolean" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "AnalyzeCovariates" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--gatk-config-file --QUIET --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --after-report-file --arguments_file --before-report-file --bqsr-recal-file --gcs-max-retries --help --ignore-last-modification-times --intermediate-csv-file --plots-report-file --version --showHidden )
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=("--use-jdk-deflater;-jdk-deflater" "--use-jdk-inflater;-jdk-inflater" "--verbosity;-verbosity" "--after-report-file;-after" "--before-report-file;-before" "--bqsr-recal-file;-bqsr" "--gcs-max-retries;-gcs-retries" "--help;-h" "--intermediate-csv-file;-csv" "--plots-report-file;-plots" "--showHidden;-showHidden" )
        MIN_OCCURRENCES=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--gatk-config-file --QUIET --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --after-report-file --arguments_file --before-report-file --bqsr-recal-file --gcs-max-retries --help --ignore-last-modification-times --intermediate-csv-file --plots-report-file --version --showHidden )
        ALL_ARGUMENT_VALUE_TYPES=("String" "Boolean" "List[File]" "boolean" "boolean" "LogLevel" "File" "List[File]" "File" "File" "int" "boolean" "boolean" "File" "File" "boolean" "boolean" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "PathSeqBuildReferenceTaxonomy" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--output --reference --tax-dump --gatk-config-file --QUIET --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --arguments_file --gcs-max-retries --genbank-catalog --help --min-non-virus-contig-length --refseq-catalog --version --showHidden )
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=("--output;-O" "--reference;-R" "--tax-dump;-TD" "--use-jdk-deflater;-jdk-deflater" "--use-jdk-inflater;-jdk-inflater" "--verbosity;-verbosity" "--gcs-max-retries;-gcs-retries" "--genbank-catalog;-GC" "--help;-h" "--min-non-virus-contig-length;-min-non-virus-contig-length" "--refseq-catalog;-RC" "--showHidden;-showHidden" )
        MIN_OCCURRENCES=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--output --reference --tax-dump --gatk-config-file --QUIET --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --arguments_file --gcs-max-retries --genbank-catalog --help --min-non-virus-contig-length --refseq-catalog --version --showHidden )
        ALL_ARGUMENT_VALUE_TYPES=("String" "String" "String" "String" "Boolean" "List[File]" "boolean" "boolean" "LogLevel" "List[File]" "int" "String" "boolean" "int" "String" "boolean" "boolean" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "PrintReads" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--input --output --add-output-sam-program-record --add-output-vcf-command-line --create-output-bam-index --create-output-bam-md5 --create-output-variant-index --create-output-variant-md5 --disable-read-filter --disable-sequence-dictionary-validation --disable-tool-default-read-filters --exclude-intervals --gatk-config-file --interval-exclusion-padding --interval-padding --interval-set-rule --lenient --QUIET --read-filter --read-index --read-validation-stringency --seconds-between-progress-updates --sequence-dictionary --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --arguments_file --cloud-index-prefetch-buffer --cloud-prefetch-buffer --disable-bam-index-caching --gcs-max-retries --help --interval-merging-rule --intervals --reference --version --showHidden )
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=("--input;-I" "--output;-O" "--add-output-sam-program-record;-add-output-sam-program-record" "--add-output-vcf-command-line;-add-output-vcf-command-line" "--create-output-bam-index;-OBI" "--create-output-bam-md5;-OBM" "--create-output-variant-index;-OVI" "--create-output-variant-md5;-OVM" "--disable-read-filter;-DF" "--disable-sequence-dictionary-validation;-disable-sequence-dictionary-validation" "--disable-tool-default-read-filters;-disable-tool-default-read-filters" "--exclude-intervals;-XL" "--interval-exclusion-padding;-ixp" "--interval-padding;-ip" "--interval-set-rule;-isr" "--lenient;-LE" "--read-filter;-RF" "--read-index;-read-index" "--read-validation-stringency;-VS" "--seconds-between-progress-updates;-seconds-between-progress-updates" "--sequence-dictionary;-sequence-dictionary" "--use-jdk-deflater;-jdk-deflater" "--use-jdk-inflater;-jdk-inflater" "--verbosity;-verbosity" "--cloud-index-prefetch-buffer;-CIPB" "--cloud-prefetch-buffer;-CPB" "--disable-bam-index-caching;-DBIC" "--gcs-max-retries;-gcs-retries" "--help;-h" "--interval-merging-rule;-imr" "--intervals;-L" "--reference;-R" "--showHidden;-showHidden" )
        MIN_OCCURRENCES=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--input --output --add-output-sam-program-record --add-output-vcf-command-line --create-output-bam-index --create-output-bam-md5 --create-output-variant-index --create-output-variant-md5 --disable-read-filter --disable-sequence-dictionary-validation --disable-tool-default-read-filters --exclude-intervals --gatk-config-file --interval-exclusion-padding --interval-padding --interval-set-rule --lenient --QUIET --read-filter --read-index --read-validation-stringency --seconds-between-progress-updates --sequence-dictionary --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --arguments_file --cloud-index-prefetch-buffer --cloud-prefetch-buffer --disable-bam-index-caching --gcs-max-retries --help --interval-merging-rule --intervals --reference --version --showHidden )
        ALL_ARGUMENT_VALUE_TYPES=("List[String]" "String" "boolean" "boolean" "boolean" "boolean" "boolean" "boolean" "List[String]" "boolean" "boolean" "List[String]" "String" "int" "int" "IntervalSetRule" "boolean" "Boolean" "List[String]" "List[String]" "ValidationStringency" "double" "String" "List[File]" "boolean" "boolean" "LogLevel" "List[File]" "int" "int" "boolean" "int" "boolean" "IntervalMergingRule" "List[String]" "String" "boolean" "boolean" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "CalculateReadGroupChecksum" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--INPUT --COMPRESSION_LEVEL --CREATE_INDEX --CREATE_MD5_FILE --GA4GH_CLIENT_SECRETS --MAX_RECORDS_IN_RAM --QUIET --REFERENCE_SEQUENCE --TMP_DIR --USE_JDK_DEFLATER --USE_JDK_INFLATER --VALIDATION_STRINGENCY --VERBOSITY --arguments_file --help --OUTPUT --version --showHidden )
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=("--INPUT;-I" "--REFERENCE_SEQUENCE;-R" "--USE_JDK_DEFLATER;-use_jdk_deflater" "--USE_JDK_INFLATER;-use_jdk_inflater" "--help;-h" "--OUTPUT;-O" "--showHidden;-showHidden" )
        MIN_OCCURRENCES=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--INPUT --COMPRESSION_LEVEL --CREATE_INDEX --CREATE_MD5_FILE --GA4GH_CLIENT_SECRETS --MAX_RECORDS_IN_RAM --QUIET --REFERENCE_SEQUENCE --TMP_DIR --USE_JDK_DEFLATER --USE_JDK_INFLATER --VALIDATION_STRINGENCY --VERBOSITY --arguments_file --help --OUTPUT --version --showHidden )
        ALL_ARGUMENT_VALUE_TYPES=("File" "int" "Boolean" "boolean" "String" "Integer" "Boolean" "File" "List[File]" "Boolean" "Boolean" "ValidationStringency" "LogLevel" "List[File]" "boolean" "File" "boolean" "boolean" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "CollectRnaSeqMetrics" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--IGNORE_SEQUENCE --INPUT --OUTPUT --REF_FLAT --STRAND_SPECIFICITY --COMPRESSION_LEVEL --CREATE_INDEX --CREATE_MD5_FILE --GA4GH_CLIENT_SECRETS --MAX_RECORDS_IN_RAM --QUIET --REFERENCE_SEQUENCE --TMP_DIR --USE_JDK_DEFLATER --USE_JDK_INFLATER --VALIDATION_STRINGENCY --VERBOSITY --arguments_file --ASSUME_SORTED --CHART_OUTPUT --help --METRIC_ACCUMULATION_LEVEL --MINIMUM_LENGTH --RIBOSOMAL_INTERVALS --RRNA_FRAGMENT_PERCENTAGE --STOP_AFTER --version --showHidden )
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=("--INPUT;-I" "--OUTPUT;-O" "--STRAND_SPECIFICITY;-STRAND" "--REFERENCE_SEQUENCE;-R" "--USE_JDK_DEFLATER;-use_jdk_deflater" "--USE_JDK_INFLATER;-use_jdk_inflater" "--ASSUME_SORTED;-AS" "--CHART_OUTPUT;-CHART" "--help;-h" "--METRIC_ACCUMULATION_LEVEL;-LEVEL" "--showHidden;-showHidden" )
        MIN_OCCURRENCES=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--IGNORE_SEQUENCE --INPUT --OUTPUT --REF_FLAT --STRAND_SPECIFICITY --COMPRESSION_LEVEL --CREATE_INDEX --CREATE_MD5_FILE --GA4GH_CLIENT_SECRETS --MAX_RECORDS_IN_RAM --QUIET --REFERENCE_SEQUENCE --TMP_DIR --USE_JDK_DEFLATER --USE_JDK_INFLATER --VALIDATION_STRINGENCY --VERBOSITY --arguments_file --ASSUME_SORTED --CHART_OUTPUT --help --METRIC_ACCUMULATION_LEVEL --MINIMUM_LENGTH --RIBOSOMAL_INTERVALS --RRNA_FRAGMENT_PERCENTAGE --STOP_AFTER --version --showHidden )
        ALL_ARGUMENT_VALUE_TYPES=("Set[String]" "File" "File" "File" "StrandSpecificity" "int" "Boolean" "boolean" "String" "Integer" "Boolean" "File" "List[File]" "Boolean" "Boolean" "ValidationStringency" "LogLevel" "List[File]" "boolean" "File" "boolean" "Set[MetricAccumulationLevel]" "int" "File" "double" "long" "boolean" "boolean" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "GetSampleName" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--input --output --add-output-sam-program-record --add-output-vcf-command-line --create-output-bam-index --create-output-bam-md5 --create-output-variant-index --create-output-variant-md5 --disable-read-filter --disable-sequence-dictionary-validation --disable-tool-default-read-filters --exclude-intervals --gatk-config-file --interval-exclusion-padding --interval-padding --interval-set-rule --lenient --QUIET --read-filter --read-index --read-validation-stringency --seconds-between-progress-updates --sequence-dictionary --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --arguments_file --cloud-index-prefetch-buffer --cloud-prefetch-buffer --disable-bam-index-caching --gcs-max-retries --help --interval-merging-rule --intervals --reference --use-url-encoding --version --showHidden )
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=("--input;-I" "--output;-O" "--add-output-sam-program-record;-add-output-sam-program-record" "--add-output-vcf-command-line;-add-output-vcf-command-line" "--create-output-bam-index;-OBI" "--create-output-bam-md5;-OBM" "--create-output-variant-index;-OVI" "--create-output-variant-md5;-OVM" "--disable-read-filter;-DF" "--disable-sequence-dictionary-validation;-disable-sequence-dictionary-validation" "--disable-tool-default-read-filters;-disable-tool-default-read-filters" "--exclude-intervals;-XL" "--interval-exclusion-padding;-ixp" "--interval-padding;-ip" "--interval-set-rule;-isr" "--lenient;-LE" "--read-filter;-RF" "--read-index;-read-index" "--read-validation-stringency;-VS" "--seconds-between-progress-updates;-seconds-between-progress-updates" "--sequence-dictionary;-sequence-dictionary" "--use-jdk-deflater;-jdk-deflater" "--use-jdk-inflater;-jdk-inflater" "--verbosity;-verbosity" "--cloud-index-prefetch-buffer;-CIPB" "--cloud-prefetch-buffer;-CPB" "--disable-bam-index-caching;-DBIC" "--gcs-max-retries;-gcs-retries" "--help;-h" "--interval-merging-rule;-imr" "--intervals;-L" "--reference;-R" "--use-url-encoding;-encode" "--showHidden;-showHidden" )
        MIN_OCCURRENCES=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--input --output --add-output-sam-program-record --add-output-vcf-command-line --create-output-bam-index --create-output-bam-md5 --create-output-variant-index --create-output-variant-md5 --disable-read-filter --disable-sequence-dictionary-validation --disable-tool-default-read-filters --exclude-intervals --gatk-config-file --interval-exclusion-padding --interval-padding --interval-set-rule --lenient --QUIET --read-filter --read-index --read-validation-stringency --seconds-between-progress-updates --sequence-dictionary --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --arguments_file --cloud-index-prefetch-buffer --cloud-prefetch-buffer --disable-bam-index-caching --gcs-max-retries --help --interval-merging-rule --intervals --reference --use-url-encoding --version --showHidden )
        ALL_ARGUMENT_VALUE_TYPES=("List[String]" "File" "boolean" "boolean" "boolean" "boolean" "boolean" "boolean" "List[String]" "boolean" "boolean" "List[String]" "String" "int" "int" "IntervalSetRule" "boolean" "Boolean" "List[String]" "List[String]" "ValidationStringency" "double" "String" "List[File]" "boolean" "boolean" "LogLevel" "List[File]" "int" "int" "boolean" "int" "boolean" "IntervalMergingRule" "List[String]" "String" "boolean" "boolean" "boolean" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "CompareBaseQualities" ]] ; then

        # Set up the completion information for this tool:
        NUM_POSITIONAL_ARGUMENTS=2
        POSITIONAL_ARGUMENT_TYPE=("List[File]")
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--COMPRESSION_LEVEL --CREATE_INDEX --CREATE_MD5_FILE --gatk-config-file --MAX_RECORDS_IN_RAM --QUIET --reference --TMP_DIR --use-jdk-deflater --use-jdk-inflater --VALIDATION_STRINGENCY --verbosity --arguments_file --gcs-max-retries --help --output --throw-on-diff --version --round-down-quantized --showHidden --static-quantized-quals )
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=("--reference;-R" "--use-jdk-deflater;-jdk-deflater" "--use-jdk-inflater;-jdk-inflater" "--verbosity;-verbosity" "--gcs-max-retries;-gcs-retries" "--help;-h" "--output;-O" "--showHidden;-showHidden" )
        MIN_OCCURRENCES=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--COMPRESSION_LEVEL --CREATE_INDEX --CREATE_MD5_FILE --gatk-config-file --MAX_RECORDS_IN_RAM --QUIET --reference --TMP_DIR --use-jdk-deflater --use-jdk-inflater --VALIDATION_STRINGENCY --verbosity --arguments_file --gcs-max-retries --help --output --throw-on-diff --version --round-down-quantized --showHidden --static-quantized-quals )
        ALL_ARGUMENT_VALUE_TYPES=("int" "Boolean" "boolean" "String" "Integer" "Boolean" "File" "List[File]" "boolean" "boolean" "ValidationStringency" "LogLevel" "List[File]" "int" "boolean" "String" "boolean" "boolean" "boolean" "boolean" "List[Integer]" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "BamIndexStats" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--INPUT --COMPRESSION_LEVEL --CREATE_INDEX --CREATE_MD5_FILE --GA4GH_CLIENT_SECRETS --MAX_RECORDS_IN_RAM --QUIET --REFERENCE_SEQUENCE --TMP_DIR --USE_JDK_DEFLATER --USE_JDK_INFLATER --VALIDATION_STRINGENCY --VERBOSITY --arguments_file --help --version --showHidden )
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=("--INPUT;-I" "--REFERENCE_SEQUENCE;-R" "--USE_JDK_DEFLATER;-use_jdk_deflater" "--USE_JDK_INFLATER;-use_jdk_inflater" "--help;-h" "--showHidden;-showHidden" )
        MIN_OCCURRENCES=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--INPUT --COMPRESSION_LEVEL --CREATE_INDEX --CREATE_MD5_FILE --GA4GH_CLIENT_SECRETS --MAX_RECORDS_IN_RAM --QUIET --REFERENCE_SEQUENCE --TMP_DIR --USE_JDK_DEFLATER --USE_JDK_INFLATER --VALIDATION_STRINGENCY --VERBOSITY --arguments_file --help --version --showHidden )
        ALL_ARGUMENT_VALUE_TYPES=("File" "int" "Boolean" "boolean" "String" "Integer" "Boolean" "File" "List[File]" "Boolean" "Boolean" "ValidationStringency" "LogLevel" "List[File]" "boolean" "boolean" "boolean" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "CollectOxoGMetrics" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--INPUT --OUTPUT --REFERENCE_SEQUENCE --COMPRESSION_LEVEL --CREATE_INDEX --CREATE_MD5_FILE --GA4GH_CLIENT_SECRETS --MAX_RECORDS_IN_RAM --QUIET --TMP_DIR --USE_JDK_DEFLATER --USE_JDK_INFLATER --VALIDATION_STRINGENCY --VERBOSITY --arguments_file --CONTEXT_SIZE --CONTEXTS --DB_SNP --help --INCLUDE_NON_PF_READS --INTERVALS --MAXIMUM_INSERT_SIZE --MINIMUM_INSERT_SIZE --MINIMUM_MAPPING_QUALITY --MINIMUM_QUALITY_SCORE --STOP_AFTER --USE_OQ --version --showHidden )
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=("--INPUT;-I" "--OUTPUT;-O" "--REFERENCE_SEQUENCE;-R" "--USE_JDK_DEFLATER;-use_jdk_deflater" "--USE_JDK_INFLATER;-use_jdk_inflater" "--help;-h" "--INCLUDE_NON_PF_READS;-NON_PF" "--MAXIMUM_INSERT_SIZE;-MAX_INS" "--MINIMUM_INSERT_SIZE;-MIN_INS" "--MINIMUM_MAPPING_QUALITY;-MQ" "--MINIMUM_QUALITY_SCORE;-Q" "--showHidden;-showHidden" )
        MIN_OCCURRENCES=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--INPUT --OUTPUT --REFERENCE_SEQUENCE --COMPRESSION_LEVEL --CREATE_INDEX --CREATE_MD5_FILE --GA4GH_CLIENT_SECRETS --MAX_RECORDS_IN_RAM --QUIET --TMP_DIR --USE_JDK_DEFLATER --USE_JDK_INFLATER --VALIDATION_STRINGENCY --VERBOSITY --arguments_file --CONTEXT_SIZE --CONTEXTS --DB_SNP --help --INCLUDE_NON_PF_READS --INTERVALS --MAXIMUM_INSERT_SIZE --MINIMUM_INSERT_SIZE --MINIMUM_MAPPING_QUALITY --MINIMUM_QUALITY_SCORE --STOP_AFTER --USE_OQ --version --showHidden )
        ALL_ARGUMENT_VALUE_TYPES=("File" "File" "File" "int" "Boolean" "boolean" "String" "Integer" "Boolean" "List[File]" "Boolean" "Boolean" "ValidationStringency" "LogLevel" "List[File]" "int" "Set[String]" "File" "boolean" "boolean" "File" "int" "int" "int" "int" "int" "boolean" "boolean" "boolean" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "MarkDuplicatesWithMateCigar" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--INPUT --METRICS_FILE --OUTPUT --ADD_PG_TAG_TO_READS --COMPRESSION_LEVEL --CREATE_INDEX --CREATE_MD5_FILE --GA4GH_CLIENT_SECRETS --MAX_RECORDS_IN_RAM --QUIET --REFERENCE_SEQUENCE --TMP_DIR --USE_JDK_DEFLATER --USE_JDK_INFLATER --VALIDATION_STRINGENCY --VERBOSITY --arguments_file --ASSUME_SORT_ORDER --BLOCK_SIZE --COMMENT --DUPLICATE_SCORING_STRATEGY --help --MAX_OPTICAL_DUPLICATE_SET_SIZE --MINIMUM_DISTANCE --OPTICAL_DUPLICATE_PIXEL_DISTANCE --PROGRAM_GROUP_COMMAND_LINE --PROGRAM_GROUP_NAME --PROGRAM_GROUP_VERSION --PROGRAM_RECORD_ID --READ_NAME_REGEX --REMOVE_DUPLICATES --SKIP_PAIRS_WITH_NO_MATE_CIGAR --version --showHidden --ASSUME_SORTED )
        MUTUALLY_EXCLUSIVE_ARGS=("--ASSUME_SORT_ORDER;ASSUME_SORTED" "--ASSUME_SORTED;ASSUME_SORT_ORDER,ASO" )
        SYNONYMOUS_ARGS=("--INPUT;-I" "--METRICS_FILE;-M" "--OUTPUT;-O" "--REFERENCE_SEQUENCE;-R" "--USE_JDK_DEFLATER;-use_jdk_deflater" "--USE_JDK_INFLATER;-use_jdk_inflater" "--ASSUME_SORT_ORDER;-ASO" "--COMMENT;-CO" "--DUPLICATE_SCORING_STRATEGY;-DS" "--help;-h" "--PROGRAM_GROUP_COMMAND_LINE;-PG_COMMAND" "--PROGRAM_GROUP_NAME;-PG_NAME" "--PROGRAM_GROUP_VERSION;-PG_VERSION" "--PROGRAM_RECORD_ID;-PG" "--showHidden;-showHidden" "--ASSUME_SORTED;-AS" )
        MIN_OCCURRENCES=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--INPUT --METRICS_FILE --OUTPUT --ADD_PG_TAG_TO_READS --COMPRESSION_LEVEL --CREATE_INDEX --CREATE_MD5_FILE --GA4GH_CLIENT_SECRETS --MAX_RECORDS_IN_RAM --QUIET --REFERENCE_SEQUENCE --TMP_DIR --USE_JDK_DEFLATER --USE_JDK_INFLATER --VALIDATION_STRINGENCY --VERBOSITY --arguments_file --ASSUME_SORT_ORDER --BLOCK_SIZE --COMMENT --DUPLICATE_SCORING_STRATEGY --help --MAX_OPTICAL_DUPLICATE_SET_SIZE --MINIMUM_DISTANCE --OPTICAL_DUPLICATE_PIXEL_DISTANCE --PROGRAM_GROUP_COMMAND_LINE --PROGRAM_GROUP_NAME --PROGRAM_GROUP_VERSION --PROGRAM_RECORD_ID --READ_NAME_REGEX --REMOVE_DUPLICATES --SKIP_PAIRS_WITH_NO_MATE_CIGAR --version --showHidden --ASSUME_SORTED )
        ALL_ARGUMENT_VALUE_TYPES=("List[String]" "File" "File" "Boolean" "int" "Boolean" "boolean" "String" "Integer" "Boolean" "File" "List[File]" "Boolean" "Boolean" "ValidationStringency" "LogLevel" "List[File]" "SortOrder" "int" "List[String]" "ScoringStrategy" "boolean" "long" "int" "int" "String" "String" "String" "String" "String" "boolean" "boolean" "boolean" "boolean" "boolean" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "BaseRecalibratorSparkSharded" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--input --known-sites --output --reference --exclude-intervals --gatk-config-file --interval-exclusion-padding --interval-padding --interval-set-rule --QUIET --read-index --read-validation-stringency --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --arguments_file --binary-tag-name --bqsr-baq-gap-open-penalty --conf --default-base-qualities --deletions-default-quality --gcs-max-retries --help --indels-context-size --insertions-default-quality --interval-merging-rule --intervals --low-quality-tail --maximum-cycle-value --mismatches-context-size --mismatches-default-quality --preserve-qscores-less-than --program-name --quantizing-levels --spark-master --use-original-qualities --version --showHidden )
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=("--input;-I" "--output;-O" "--reference;-R" "--exclude-intervals;-XL" "--interval-exclusion-padding;-ixp" "--interval-padding;-ip" "--interval-set-rule;-isr" "--read-index;-read-index" "--read-validation-stringency;-VS" "--use-jdk-deflater;-jdk-deflater" "--use-jdk-inflater;-jdk-inflater" "--verbosity;-verbosity" "--conf;-conf" "--gcs-max-retries;-gcs-retries" "--help;-h" "--indels-context-size;-ics" "--interval-merging-rule;-imr" "--intervals;-L" "--maximum-cycle-value;-max-cycle" "--mismatches-context-size;-mcs" "--use-original-qualities;-OQ" "--showHidden;-showHidden" )
        MIN_OCCURRENCES=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--input --known-sites --output --reference --exclude-intervals --gatk-config-file --interval-exclusion-padding --interval-padding --interval-set-rule --QUIET --read-index --read-validation-stringency --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --arguments_file --binary-tag-name --bqsr-baq-gap-open-penalty --conf --default-base-qualities --deletions-default-quality --gcs-max-retries --help --indels-context-size --insertions-default-quality --interval-merging-rule --intervals --low-quality-tail --maximum-cycle-value --mismatches-context-size --mismatches-default-quality --preserve-qscores-less-than --program-name --quantizing-levels --spark-master --use-original-qualities --version --showHidden )
        ALL_ARGUMENT_VALUE_TYPES=("List[String]" "List[String]" "String" "String" "List[String]" "String" "int" "int" "IntervalSetRule" "Boolean" "List[String]" "ValidationStringency" "List[File]" "boolean" "boolean" "LogLevel" "List[File]" "String" "double" "List[String]" "byte" "byte" "int" "boolean" "int" "byte" "IntervalMergingRule" "List[String]" "byte" "int" "int" "byte" "int" "String" "int" "String" "Boolean" "boolean" "boolean" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "GatherBQSRReports" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--input --output --gatk-config-file --QUIET --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --arguments_file --gcs-max-retries --help --version --showHidden )
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=("--input;-I" "--output;-O" "--use-jdk-deflater;-jdk-deflater" "--use-jdk-inflater;-jdk-inflater" "--verbosity;-verbosity" "--gcs-max-retries;-gcs-retries" "--help;-h" "--showHidden;-showHidden" )
        MIN_OCCURRENCES=(0 0 0 0 0 0 0 0 0 0 0 0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--input --output --gatk-config-file --QUIET --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --arguments_file --gcs-max-retries --help --version --showHidden )
        ALL_ARGUMENT_VALUE_TYPES=("List[File]" "File" "String" "Boolean" "List[File]" "boolean" "boolean" "LogLevel" "List[File]" "int" "boolean" "boolean" "boolean" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "GenotypeConcordance" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--CALL_VCF --OUTPUT --TRUTH_VCF --COMPRESSION_LEVEL --CREATE_INDEX --CREATE_MD5_FILE --GA4GH_CLIENT_SECRETS --MAX_RECORDS_IN_RAM --QUIET --REFERENCE_SEQUENCE --TMP_DIR --USE_JDK_DEFLATER --USE_JDK_INFLATER --VALIDATION_STRINGENCY --VERBOSITY --arguments_file --CALL_SAMPLE --help --IGNORE_FILTER_STATUS --INTERSECT_INTERVALS --INTERVALS --MIN_DP --MIN_GQ --MISSING_SITES_HOM_REF --OUTPUT_ALL_ROWS --OUTPUT_VCF --TRUTH_SAMPLE --USE_VCF_INDEX --version --showHidden )
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=("--CALL_VCF;-CV" "--OUTPUT;-O" "--TRUTH_VCF;-TV" "--REFERENCE_SEQUENCE;-R" "--USE_JDK_DEFLATER;-use_jdk_deflater" "--USE_JDK_INFLATER;-use_jdk_inflater" "--CALL_SAMPLE;-CS" "--help;-h" "--MISSING_SITES_HOM_REF;-MISSING_HOM" "--TRUTH_SAMPLE;-TS" "--showHidden;-showHidden" )
        MIN_OCCURRENCES=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--CALL_VCF --OUTPUT --TRUTH_VCF --COMPRESSION_LEVEL --CREATE_INDEX --CREATE_MD5_FILE --GA4GH_CLIENT_SECRETS --MAX_RECORDS_IN_RAM --QUIET --REFERENCE_SEQUENCE --TMP_DIR --USE_JDK_DEFLATER --USE_JDK_INFLATER --VALIDATION_STRINGENCY --VERBOSITY --arguments_file --CALL_SAMPLE --help --IGNORE_FILTER_STATUS --INTERSECT_INTERVALS --INTERVALS --MIN_DP --MIN_GQ --MISSING_SITES_HOM_REF --OUTPUT_ALL_ROWS --OUTPUT_VCF --TRUTH_SAMPLE --USE_VCF_INDEX --version --showHidden )
        ALL_ARGUMENT_VALUE_TYPES=("File" "File" "File" "int" "Boolean" "boolean" "String" "Integer" "Boolean" "File" "List[File]" "Boolean" "Boolean" "ValidationStringency" "LogLevel" "List[File]" "String" "boolean" "boolean" "boolean" "List[File]" "int" "int" "boolean" "boolean" "boolean" "String" "boolean" "boolean" "boolean" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "CompareDuplicatesSpark" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--input --input2 --disable-read-filter --disable-tool-default-read-filters --exclude-intervals --gatk-config-file --interval-exclusion-padding --interval-padding --interval-set-rule --QUIET --read-filter --read-index --read-validation-stringency --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --arguments_file --bam-partition-size --conf --disable-sequence-dictionary-validation --gcs-max-retries --help --interval-merging-rule --intervals --num-reducers --print-summary --program-name --reference --sharded-output --spark-master --throw-on-diff --version --showHidden )
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=("--input;-I" "--input2;-I2" "--disable-read-filter;-DF" "--disable-tool-default-read-filters;-disable-tool-default-read-filters" "--exclude-intervals;-XL" "--interval-exclusion-padding;-ixp" "--interval-padding;-ip" "--interval-set-rule;-isr" "--read-filter;-RF" "--read-index;-read-index" "--read-validation-stringency;-VS" "--use-jdk-deflater;-jdk-deflater" "--use-jdk-inflater;-jdk-inflater" "--verbosity;-verbosity" "--conf;-conf" "--disable-sequence-dictionary-validation;-disable-sequence-dictionary-validation" "--gcs-max-retries;-gcs-retries" "--help;-h" "--interval-merging-rule;-imr" "--intervals;-L" "--reference;-R" "--showHidden;-showHidden" )
        MIN_OCCURRENCES=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--input --input2 --disable-read-filter --disable-tool-default-read-filters --exclude-intervals --gatk-config-file --interval-exclusion-padding --interval-padding --interval-set-rule --QUIET --read-filter --read-index --read-validation-stringency --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --arguments_file --bam-partition-size --conf --disable-sequence-dictionary-validation --gcs-max-retries --help --interval-merging-rule --intervals --num-reducers --print-summary --program-name --reference --sharded-output --spark-master --throw-on-diff --version --showHidden )
        ALL_ARGUMENT_VALUE_TYPES=("List[String]" "String" "List[String]" "boolean" "List[String]" "String" "int" "int" "IntervalSetRule" "Boolean" "List[String]" "List[String]" "ValidationStringency" "List[File]" "boolean" "boolean" "LogLevel" "List[File]" "long" "List[String]" "boolean" "int" "boolean" "IntervalMergingRule" "List[String]" "int" "boolean" "String" "String" "boolean" "String" "boolean" "boolean" "boolean" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "BaseQualityRankSumTest" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=()
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=()
        MIN_OCCURRENCES=()
        MAX_OCCURRENCES=()
        ALL_LEGAL_ARGUMENTS=()
        ALL_ARGUMENT_VALUE_TYPES=()

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "MateOnSameContigOrNoMappedMateReadFilter" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=()
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=()
        MIN_OCCURRENCES=()
        MAX_OCCURRENCES=()
        ALL_LEGAL_ARGUMENTS=()
        ALL_ARGUMENT_VALUE_TYPES=()

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "BaseRecalibrator" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--input --known-sites --output --reference --add-output-sam-program-record --add-output-vcf-command-line --create-output-bam-index --create-output-bam-md5 --create-output-variant-index --create-output-variant-md5 --disable-read-filter --disable-sequence-dictionary-validation --disable-tool-default-read-filters --exclude-intervals --gatk-config-file --interval-exclusion-padding --interval-padding --interval-set-rule --lenient --QUIET --read-filter --read-index --read-validation-stringency --seconds-between-progress-updates --sequence-dictionary --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --arguments_file --binary-tag-name --bqsr-baq-gap-open-penalty --cloud-index-prefetch-buffer --cloud-prefetch-buffer --default-base-qualities --deletions-default-quality --disable-bam-index-caching --gcs-max-retries --help --indels-context-size --insertions-default-quality --interval-merging-rule --intervals --low-quality-tail --maximum-cycle-value --mismatches-context-size --mismatches-default-quality --preserve-qscores-less-than --quantizing-levels --use-original-qualities --version --showHidden )
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=("--input;-I" "--output;-O" "--reference;-R" "--add-output-sam-program-record;-add-output-sam-program-record" "--add-output-vcf-command-line;-add-output-vcf-command-line" "--create-output-bam-index;-OBI" "--create-output-bam-md5;-OBM" "--create-output-variant-index;-OVI" "--create-output-variant-md5;-OVM" "--disable-read-filter;-DF" "--disable-sequence-dictionary-validation;-disable-sequence-dictionary-validation" "--disable-tool-default-read-filters;-disable-tool-default-read-filters" "--exclude-intervals;-XL" "--interval-exclusion-padding;-ixp" "--interval-padding;-ip" "--interval-set-rule;-isr" "--lenient;-LE" "--read-filter;-RF" "--read-index;-read-index" "--read-validation-stringency;-VS" "--seconds-between-progress-updates;-seconds-between-progress-updates" "--sequence-dictionary;-sequence-dictionary" "--use-jdk-deflater;-jdk-deflater" "--use-jdk-inflater;-jdk-inflater" "--verbosity;-verbosity" "--cloud-index-prefetch-buffer;-CIPB" "--cloud-prefetch-buffer;-CPB" "--disable-bam-index-caching;-DBIC" "--gcs-max-retries;-gcs-retries" "--help;-h" "--indels-context-size;-ics" "--interval-merging-rule;-imr" "--intervals;-L" "--maximum-cycle-value;-max-cycle" "--mismatches-context-size;-mcs" "--use-original-qualities;-OQ" "--showHidden;-showHidden" )
        MIN_OCCURRENCES=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--input --known-sites --output --reference --add-output-sam-program-record --add-output-vcf-command-line --create-output-bam-index --create-output-bam-md5 --create-output-variant-index --create-output-variant-md5 --disable-read-filter --disable-sequence-dictionary-validation --disable-tool-default-read-filters --exclude-intervals --gatk-config-file --interval-exclusion-padding --interval-padding --interval-set-rule --lenient --QUIET --read-filter --read-index --read-validation-stringency --seconds-between-progress-updates --sequence-dictionary --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --arguments_file --binary-tag-name --bqsr-baq-gap-open-penalty --cloud-index-prefetch-buffer --cloud-prefetch-buffer --default-base-qualities --deletions-default-quality --disable-bam-index-caching --gcs-max-retries --help --indels-context-size --insertions-default-quality --interval-merging-rule --intervals --low-quality-tail --maximum-cycle-value --mismatches-context-size --mismatches-default-quality --preserve-qscores-less-than --quantizing-levels --use-original-qualities --version --showHidden )
        ALL_ARGUMENT_VALUE_TYPES=("List[String]" "List[FeatureInput[Feature]]" "File" "String" "boolean" "boolean" "boolean" "boolean" "boolean" "boolean" "List[String]" "boolean" "boolean" "List[String]" "String" "int" "int" "IntervalSetRule" "boolean" "Boolean" "List[String]" "List[String]" "ValidationStringency" "double" "String" "List[File]" "boolean" "boolean" "LogLevel" "List[File]" "String" "double" "int" "int" "byte" "byte" "boolean" "int" "boolean" "int" "byte" "IntervalMergingRule" "List[String]" "byte" "int" "int" "byte" "int" "int" "Boolean" "boolean" "boolean" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "PlatformUnitReadFilter" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--black-listed-lanes )
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=()
        MIN_OCCURRENCES=(0 )
        MAX_OCCURRENCES=(2147483647 )
        ALL_LEGAL_ARGUMENTS=(--black-listed-lanes )
        ALL_ARGUMENT_VALUE_TYPES=("Set[String]" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "SortSamSpark" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--input --output --disable-read-filter --disable-tool-default-read-filters --exclude-intervals --gatk-config-file --interval-exclusion-padding --interval-padding --interval-set-rule --QUIET --read-filter --read-index --read-validation-stringency --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --arguments_file --bam-partition-size --conf --disable-sequence-dictionary-validation --gcs-max-retries --help --interval-merging-rule --intervals --num-reducers --program-name --reference --sharded-output --spark-master --version --showHidden )
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=("--input;-I" "--output;-O" "--disable-read-filter;-DF" "--disable-tool-default-read-filters;-disable-tool-default-read-filters" "--exclude-intervals;-XL" "--interval-exclusion-padding;-ixp" "--interval-padding;-ip" "--interval-set-rule;-isr" "--read-filter;-RF" "--read-index;-read-index" "--read-validation-stringency;-VS" "--use-jdk-deflater;-jdk-deflater" "--use-jdk-inflater;-jdk-inflater" "--verbosity;-verbosity" "--conf;-conf" "--disable-sequence-dictionary-validation;-disable-sequence-dictionary-validation" "--gcs-max-retries;-gcs-retries" "--help;-h" "--interval-merging-rule;-imr" "--intervals;-L" "--reference;-R" "--showHidden;-showHidden" )
        MIN_OCCURRENCES=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--input --output --disable-read-filter --disable-tool-default-read-filters --exclude-intervals --gatk-config-file --interval-exclusion-padding --interval-padding --interval-set-rule --QUIET --read-filter --read-index --read-validation-stringency --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --arguments_file --bam-partition-size --conf --disable-sequence-dictionary-validation --gcs-max-retries --help --interval-merging-rule --intervals --num-reducers --program-name --reference --sharded-output --spark-master --version --showHidden )
        ALL_ARGUMENT_VALUE_TYPES=("List[String]" "String" "List[String]" "boolean" "List[String]" "String" "int" "int" "IntervalSetRule" "Boolean" "List[String]" "List[String]" "ValidationStringency" "List[File]" "boolean" "boolean" "LogLevel" "List[File]" "long" "List[String]" "boolean" "int" "boolean" "IntervalMergingRule" "List[String]" "int" "String" "String" "boolean" "String" "boolean" "boolean" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "SetNmAndUqTags" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--INPUT --OUTPUT --REFERENCE_SEQUENCE --COMPRESSION_LEVEL --CREATE_INDEX --CREATE_MD5_FILE --GA4GH_CLIENT_SECRETS --MAX_RECORDS_IN_RAM --QUIET --TMP_DIR --USE_JDK_DEFLATER --USE_JDK_INFLATER --VALIDATION_STRINGENCY --VERBOSITY --arguments_file --help --IS_BISULFITE_SEQUENCE --SET_ONLY_UQ --version --showHidden )
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=("--INPUT;-I" "--OUTPUT;-O" "--REFERENCE_SEQUENCE;-R" "--USE_JDK_DEFLATER;-use_jdk_deflater" "--USE_JDK_INFLATER;-use_jdk_inflater" "--help;-h" "--showHidden;-showHidden" )
        MIN_OCCURRENCES=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--INPUT --OUTPUT --REFERENCE_SEQUENCE --COMPRESSION_LEVEL --CREATE_INDEX --CREATE_MD5_FILE --GA4GH_CLIENT_SECRETS --MAX_RECORDS_IN_RAM --QUIET --TMP_DIR --USE_JDK_DEFLATER --USE_JDK_INFLATER --VALIDATION_STRINGENCY --VERBOSITY --arguments_file --help --IS_BISULFITE_SEQUENCE --SET_ONLY_UQ --version --showHidden )
        ALL_ARGUMENT_VALUE_TYPES=("File" "File" "File" "int" "Boolean" "boolean" "String" "Integer" "Boolean" "List[File]" "Boolean" "Boolean" "ValidationStringency" "LogLevel" "List[File]" "boolean" "boolean" "boolean" "boolean" "boolean" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "OxoGReadCounts" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=()
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=()
        MIN_OCCURRENCES=()
        MAX_OCCURRENCES=()
        ALL_LEGAL_ARGUMENTS=()
        ALL_ARGUMENT_VALUE_TYPES=()

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "VariantRecalibrator" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--output --resource --tranches-file --use-annotation --variant --add-output-sam-program-record --add-output-vcf-command-line --create-output-bam-index --create-output-bam-md5 --create-output-variant-index --create-output-variant-md5 --disable-read-filter --disable-sequence-dictionary-validation --disable-tool-default-read-filters --exclude-intervals --gatk-config-file --input --interval-exclusion-padding --interval-padding --interval-set-rule --lenient --QUIET --read-filter --read-index --read-validation-stringency --seconds-between-progress-updates --sequence-dictionary --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --aggregate --arguments_file --cloud-index-prefetch-buffer --cloud-prefetch-buffer --disable-bam-index-caching --gcs-max-retries --help --ignore-all-filters --ignore-filter --input-model --interval-merging-rule --intervals --mode --output-model --reference --rscript-file --target-titv --truth-sensitivity-tranche --use-allele-specific-annotations --version --bad-lod-score-cutoff --dirichlet --k-means-iterations --max-attempts --max-gaussians --maximum-training-variants --max-iterations --max-negative-gaussians --minimum-bad-variants --mq-cap-for-logit-jitter-transform --prior-counts --showHidden --shrinkage --standard-deviation-threshold --trust-all-polymorphic )
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=("--output;-O" "--resource;-resource" "--use-annotation;-an" "--variant;-V" "--add-output-sam-program-record;-add-output-sam-program-record" "--add-output-vcf-command-line;-add-output-vcf-command-line" "--create-output-bam-index;-OBI" "--create-output-bam-md5;-OBM" "--create-output-variant-index;-OVI" "--create-output-variant-md5;-OVM" "--disable-read-filter;-DF" "--disable-sequence-dictionary-validation;-disable-sequence-dictionary-validation" "--disable-tool-default-read-filters;-disable-tool-default-read-filters" "--exclude-intervals;-XL" "--input;-I" "--interval-exclusion-padding;-ixp" "--interval-padding;-ip" "--interval-set-rule;-isr" "--lenient;-LE" "--read-filter;-RF" "--read-index;-read-index" "--read-validation-stringency;-VS" "--seconds-between-progress-updates;-seconds-between-progress-updates" "--sequence-dictionary;-sequence-dictionary" "--use-jdk-deflater;-jdk-deflater" "--use-jdk-inflater;-jdk-inflater" "--verbosity;-verbosity" "--aggregate;-aggregate" "--cloud-index-prefetch-buffer;-CIPB" "--cloud-prefetch-buffer;-CPB" "--disable-bam-index-caching;-DBIC" "--gcs-max-retries;-gcs-retries" "--help;-h" "--interval-merging-rule;-imr" "--intervals;-L" "--mode;-mode" "--reference;-R" "--target-titv;-titv" "--truth-sensitivity-tranche;-tranche" "--use-allele-specific-annotations;-AS" "--bad-lod-score-cutoff;-bad-lod-cutoff" "--mq-cap-for-logit-jitter-transform;-mq-cap" "--showHidden;-showHidden" "--standard-deviation-threshold;-std" )
        MIN_OCCURRENCES=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--output --resource --tranches-file --use-annotation --variant --add-output-sam-program-record --add-output-vcf-command-line --create-output-bam-index --create-output-bam-md5 --create-output-variant-index --create-output-variant-md5 --disable-read-filter --disable-sequence-dictionary-validation --disable-tool-default-read-filters --exclude-intervals --gatk-config-file --input --interval-exclusion-padding --interval-padding --interval-set-rule --lenient --QUIET --read-filter --read-index --read-validation-stringency --seconds-between-progress-updates --sequence-dictionary --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --aggregate --arguments_file --cloud-index-prefetch-buffer --cloud-prefetch-buffer --disable-bam-index-caching --gcs-max-retries --help --ignore-all-filters --ignore-filter --input-model --interval-merging-rule --intervals --mode --output-model --reference --rscript-file --target-titv --truth-sensitivity-tranche --use-allele-specific-annotations --version --bad-lod-score-cutoff --dirichlet --k-means-iterations --max-attempts --max-gaussians --maximum-training-variants --max-iterations --max-negative-gaussians --minimum-bad-variants --mq-cap-for-logit-jitter-transform --prior-counts --showHidden --shrinkage --standard-deviation-threshold --trust-all-polymorphic )
        ALL_ARGUMENT_VALUE_TYPES=("String" "List[FeatureInput[VariantContext]]" "String" "List[String]" "List[String]" "boolean" "boolean" "boolean" "boolean" "boolean" "boolean" "List[String]" "boolean" "boolean" "List[String]" "String" "List[String]" "int" "int" "IntervalSetRule" "boolean" "Boolean" "List[String]" "List[String]" "ValidationStringency" "double" "String" "List[File]" "boolean" "boolean" "LogLevel" "List[FeatureInput[VariantContext]]" "List[File]" "int" "int" "boolean" "int" "boolean" "boolean" "List[String]" "String" "IntervalMergingRule" "List[String]" "Mode" "String" "String" "String" "double" "List[Double]" "boolean" "boolean" "double" "double" "int" "int" "int" "int" "int" "int" "int" "int" "double" "boolean" "double" "double" "boolean" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "ValidateBasicSomaticShortMutations" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--discoveryVariants --input --output --reference --validationCaseName --validationControlName --variant --add-output-sam-program-record --add-output-vcf-command-line --create-output-bam-index --create-output-bam-md5 --create-output-variant-index --create-output-variant-md5 --disable-read-filter --disable-sequence-dictionary-validation --disable-tool-default-read-filters --exclude-intervals --gatk-config-file --interval-exclusion-padding --interval-padding --interval-set-rule --lenient --QUIET --read-filter --read-index --read-validation-stringency --seconds-between-progress-updates --sequence-dictionary --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --arguments_file --cloud-index-prefetch-buffer --cloud-prefetch-buffer --disable-bam-index-caching --gcs-max-retries --help --interval-merging-rule --intervals --min-base-quality-cutoff --version --showHidden )
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=("--discoveryVariants;-discv" "--input;-I" "--output;-O" "--reference;-R" "--validationCaseName;-valcase" "--validationControlName;-valcontrol" "--variant;-V" "--add-output-sam-program-record;-add-output-sam-program-record" "--add-output-vcf-command-line;-add-output-vcf-command-line" "--create-output-bam-index;-OBI" "--create-output-bam-md5;-OBM" "--create-output-variant-index;-OVI" "--create-output-variant-md5;-OVM" "--disable-read-filter;-DF" "--disable-sequence-dictionary-validation;-disable-sequence-dictionary-validation" "--disable-tool-default-read-filters;-disable-tool-default-read-filters" "--exclude-intervals;-XL" "--interval-exclusion-padding;-ixp" "--interval-padding;-ip" "--interval-set-rule;-isr" "--lenient;-LE" "--read-filter;-RF" "--read-index;-read-index" "--read-validation-stringency;-VS" "--seconds-between-progress-updates;-seconds-between-progress-updates" "--sequence-dictionary;-sequence-dictionary" "--use-jdk-deflater;-jdk-deflater" "--use-jdk-inflater;-jdk-inflater" "--verbosity;-verbosity" "--cloud-index-prefetch-buffer;-CIPB" "--cloud-prefetch-buffer;-CPB" "--disable-bam-index-caching;-DBIC" "--gcs-max-retries;-gcs-retries" "--help;-h" "--interval-merging-rule;-imr" "--intervals;-L" "--min-base-quality-cutoff;-bqcutoff" "--showHidden;-showHidden" )
        MIN_OCCURRENCES=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--discoveryVariants --input --output --reference --validationCaseName --validationControlName --variant --add-output-sam-program-record --add-output-vcf-command-line --create-output-bam-index --create-output-bam-md5 --create-output-variant-index --create-output-variant-md5 --disable-read-filter --disable-sequence-dictionary-validation --disable-tool-default-read-filters --exclude-intervals --gatk-config-file --interval-exclusion-padding --interval-padding --interval-set-rule --lenient --QUIET --read-filter --read-index --read-validation-stringency --seconds-between-progress-updates --sequence-dictionary --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --arguments_file --cloud-index-prefetch-buffer --cloud-prefetch-buffer --disable-bam-index-caching --gcs-max-retries --help --interval-merging-rule --intervals --min-base-quality-cutoff --version --showHidden )
        ALL_ARGUMENT_VALUE_TYPES=("String" "List[String]" "String" "String" "String" "String" "String" "boolean" "boolean" "boolean" "boolean" "boolean" "boolean" "List[String]" "boolean" "boolean" "List[String]" "String" "int" "int" "IntervalSetRule" "boolean" "Boolean" "List[String]" "List[String]" "ValidationStringency" "double" "String" "List[File]" "boolean" "boolean" "LogLevel" "List[File]" "int" "int" "boolean" "int" "boolean" "IntervalMergingRule" "List[String]" "int" "boolean" "boolean" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "OverclippedReadFilter" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--dont-require-soft-clips-both-ends --filter-too-short )
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=()
        MIN_OCCURRENCES=(0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--dont-require-soft-clips-both-ends --filter-too-short )
        ALL_ARGUMENT_VALUE_TYPES=("boolean" "int" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "FragmentLength" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=()
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=()
        MIN_OCCURRENCES=()
        MAX_OCCURRENCES=()
        ALL_LEGAL_ARGUMENTS=()
        ALL_ARGUMENT_VALUE_TYPES=()

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "CountBases" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--input --add-output-sam-program-record --add-output-vcf-command-line --create-output-bam-index --create-output-bam-md5 --create-output-variant-index --create-output-variant-md5 --disable-read-filter --disable-sequence-dictionary-validation --disable-tool-default-read-filters --exclude-intervals --gatk-config-file --interval-exclusion-padding --interval-padding --interval-set-rule --lenient --QUIET --read-filter --read-index --read-validation-stringency --seconds-between-progress-updates --sequence-dictionary --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --arguments_file --cloud-index-prefetch-buffer --cloud-prefetch-buffer --disable-bam-index-caching --gcs-max-retries --help --interval-merging-rule --intervals --reference --version --showHidden )
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=("--input;-I" "--add-output-sam-program-record;-add-output-sam-program-record" "--add-output-vcf-command-line;-add-output-vcf-command-line" "--create-output-bam-index;-OBI" "--create-output-bam-md5;-OBM" "--create-output-variant-index;-OVI" "--create-output-variant-md5;-OVM" "--disable-read-filter;-DF" "--disable-sequence-dictionary-validation;-disable-sequence-dictionary-validation" "--disable-tool-default-read-filters;-disable-tool-default-read-filters" "--exclude-intervals;-XL" "--interval-exclusion-padding;-ixp" "--interval-padding;-ip" "--interval-set-rule;-isr" "--lenient;-LE" "--read-filter;-RF" "--read-index;-read-index" "--read-validation-stringency;-VS" "--seconds-between-progress-updates;-seconds-between-progress-updates" "--sequence-dictionary;-sequence-dictionary" "--use-jdk-deflater;-jdk-deflater" "--use-jdk-inflater;-jdk-inflater" "--verbosity;-verbosity" "--cloud-index-prefetch-buffer;-CIPB" "--cloud-prefetch-buffer;-CPB" "--disable-bam-index-caching;-DBIC" "--gcs-max-retries;-gcs-retries" "--help;-h" "--interval-merging-rule;-imr" "--intervals;-L" "--reference;-R" "--showHidden;-showHidden" )
        MIN_OCCURRENCES=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--input --add-output-sam-program-record --add-output-vcf-command-line --create-output-bam-index --create-output-bam-md5 --create-output-variant-index --create-output-variant-md5 --disable-read-filter --disable-sequence-dictionary-validation --disable-tool-default-read-filters --exclude-intervals --gatk-config-file --interval-exclusion-padding --interval-padding --interval-set-rule --lenient --QUIET --read-filter --read-index --read-validation-stringency --seconds-between-progress-updates --sequence-dictionary --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --arguments_file --cloud-index-prefetch-buffer --cloud-prefetch-buffer --disable-bam-index-caching --gcs-max-retries --help --interval-merging-rule --intervals --reference --version --showHidden )
        ALL_ARGUMENT_VALUE_TYPES=("List[String]" "boolean" "boolean" "boolean" "boolean" "boolean" "boolean" "List[String]" "boolean" "boolean" "List[String]" "String" "int" "int" "IntervalSetRule" "boolean" "Boolean" "List[String]" "List[String]" "ValidationStringency" "double" "String" "List[File]" "boolean" "boolean" "LogLevel" "List[File]" "int" "int" "boolean" "int" "boolean" "IntervalMergingRule" "List[String]" "String" "boolean" "boolean" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "PlatformReadFilter" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--platform-filter-name )
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=()
        MIN_OCCURRENCES=(0 )
        MAX_OCCURRENCES=(2147483647 )
        ALL_LEGAL_ARGUMENTS=(--platform-filter-name )
        ALL_ARGUMENT_VALUE_TYPES=("Set[String]" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "LiftOverIntervalList" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--CHAIN --INPUT --OUTPUT --SEQUENCE_DICTIONARY --COMPRESSION_LEVEL --CREATE_INDEX --CREATE_MD5_FILE --GA4GH_CLIENT_SECRETS --MAX_RECORDS_IN_RAM --QUIET --REFERENCE_SEQUENCE --TMP_DIR --USE_JDK_DEFLATER --USE_JDK_INFLATER --VALIDATION_STRINGENCY --VERBOSITY --arguments_file --help --MIN_LIFTOVER_PCT --version --showHidden )
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=("--INPUT;-I" "--OUTPUT;-O" "--SEQUENCE_DICTIONARY;-SD" "--REFERENCE_SEQUENCE;-R" "--USE_JDK_DEFLATER;-use_jdk_deflater" "--USE_JDK_INFLATER;-use_jdk_inflater" "--help;-h" "--showHidden;-showHidden" )
        MIN_OCCURRENCES=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--CHAIN --INPUT --OUTPUT --SEQUENCE_DICTIONARY --COMPRESSION_LEVEL --CREATE_INDEX --CREATE_MD5_FILE --GA4GH_CLIENT_SECRETS --MAX_RECORDS_IN_RAM --QUIET --REFERENCE_SEQUENCE --TMP_DIR --USE_JDK_DEFLATER --USE_JDK_INFLATER --VALIDATION_STRINGENCY --VERBOSITY --arguments_file --help --MIN_LIFTOVER_PCT --version --showHidden )
        ALL_ARGUMENT_VALUE_TYPES=("File" "File" "File" "File" "int" "Boolean" "boolean" "String" "Integer" "Boolean" "File" "List[File]" "Boolean" "Boolean" "ValidationStringency" "LogLevel" "List[File]" "boolean" "double" "boolean" "boolean" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "PassesVendorQualityCheckReadFilter" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=()
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=()
        MIN_OCCURRENCES=()
        MAX_OCCURRENCES=()
        ALL_LEGAL_ARGUMENTS=()
        ALL_ARGUMENT_VALUE_TYPES=()

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "PrimaryLineReadFilter" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=()
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=()
        MIN_OCCURRENCES=()
        MAX_OCCURRENCES=()
        ALL_LEGAL_ARGUMENTS=()
        ALL_ARGUMENT_VALUE_TYPES=()

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "CollectBaseDistributionByCycle" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--CHART_OUTPUT --INPUT --OUTPUT --COMPRESSION_LEVEL --CREATE_INDEX --CREATE_MD5_FILE --GA4GH_CLIENT_SECRETS --MAX_RECORDS_IN_RAM --QUIET --REFERENCE_SEQUENCE --TMP_DIR --USE_JDK_DEFLATER --USE_JDK_INFLATER --VALIDATION_STRINGENCY --VERBOSITY --ALIGNED_READS_ONLY --arguments_file --ASSUME_SORTED --help --PF_READS_ONLY --STOP_AFTER --version --showHidden )
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=("--CHART_OUTPUT;-CHART" "--INPUT;-I" "--OUTPUT;-O" "--REFERENCE_SEQUENCE;-R" "--USE_JDK_DEFLATER;-use_jdk_deflater" "--USE_JDK_INFLATER;-use_jdk_inflater" "--ASSUME_SORTED;-AS" "--help;-h" "--showHidden;-showHidden" )
        MIN_OCCURRENCES=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--CHART_OUTPUT --INPUT --OUTPUT --COMPRESSION_LEVEL --CREATE_INDEX --CREATE_MD5_FILE --GA4GH_CLIENT_SECRETS --MAX_RECORDS_IN_RAM --QUIET --REFERENCE_SEQUENCE --TMP_DIR --USE_JDK_DEFLATER --USE_JDK_INFLATER --VALIDATION_STRINGENCY --VERBOSITY --ALIGNED_READS_ONLY --arguments_file --ASSUME_SORTED --help --PF_READS_ONLY --STOP_AFTER --version --showHidden )
        ALL_ARGUMENT_VALUE_TYPES=("File" "File" "File" "int" "Boolean" "boolean" "String" "Integer" "Boolean" "File" "List[File]" "Boolean" "Boolean" "ValidationStringency" "LogLevel" "boolean" "List[File]" "boolean" "boolean" "boolean" "long" "boolean" "boolean" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "PrintReadsSpark" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--input --output --disable-read-filter --disable-tool-default-read-filters --exclude-intervals --gatk-config-file --interval-exclusion-padding --interval-padding --interval-set-rule --QUIET --read-filter --read-index --read-validation-stringency --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --arguments_file --bam-partition-size --conf --disable-sequence-dictionary-validation --gcs-max-retries --help --interval-merging-rule --intervals --num-reducers --program-name --reference --sharded-output --spark-master --version --showHidden )
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=("--input;-I" "--output;-O" "--disable-read-filter;-DF" "--disable-tool-default-read-filters;-disable-tool-default-read-filters" "--exclude-intervals;-XL" "--interval-exclusion-padding;-ixp" "--interval-padding;-ip" "--interval-set-rule;-isr" "--read-filter;-RF" "--read-index;-read-index" "--read-validation-stringency;-VS" "--use-jdk-deflater;-jdk-deflater" "--use-jdk-inflater;-jdk-inflater" "--verbosity;-verbosity" "--conf;-conf" "--disable-sequence-dictionary-validation;-disable-sequence-dictionary-validation" "--gcs-max-retries;-gcs-retries" "--help;-h" "--interval-merging-rule;-imr" "--intervals;-L" "--reference;-R" "--showHidden;-showHidden" )
        MIN_OCCURRENCES=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--input --output --disable-read-filter --disable-tool-default-read-filters --exclude-intervals --gatk-config-file --interval-exclusion-padding --interval-padding --interval-set-rule --QUIET --read-filter --read-index --read-validation-stringency --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --arguments_file --bam-partition-size --conf --disable-sequence-dictionary-validation --gcs-max-retries --help --interval-merging-rule --intervals --num-reducers --program-name --reference --sharded-output --spark-master --version --showHidden )
        ALL_ARGUMENT_VALUE_TYPES=("List[String]" "String" "List[String]" "boolean" "List[String]" "String" "int" "int" "IntervalSetRule" "Boolean" "List[String]" "List[String]" "ValidationStringency" "List[File]" "boolean" "boolean" "LogLevel" "List[File]" "long" "List[String]" "boolean" "int" "boolean" "IntervalMergingRule" "List[String]" "int" "String" "String" "boolean" "String" "boolean" "boolean" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "PathSeqBuildKmers" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--output --reference --gatk-config-file --QUIET --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --arguments_file --bloom-false-positive-probability --gcs-max-retries --help --kmer-mask --kmer-size --kmer-spacing --version --showHidden )
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=("--output;-O" "--reference;-R" "--use-jdk-deflater;-jdk-deflater" "--use-jdk-inflater;-jdk-inflater" "--verbosity;-verbosity" "--bloom-false-positive-probability;-P" "--gcs-max-retries;-gcs-retries" "--help;-h" "--kmer-mask;-M" "--kmer-size;-SZ" "--kmer-spacing;-SP" "--showHidden;-showHidden" )
        MIN_OCCURRENCES=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--output --reference --gatk-config-file --QUIET --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --arguments_file --bloom-false-positive-probability --gcs-max-retries --help --kmer-mask --kmer-size --kmer-spacing --version --showHidden )
        ALL_ARGUMENT_VALUE_TYPES=("String" "String" "String" "Boolean" "List[File]" "boolean" "boolean" "LogLevel" "List[File]" "double" "int" "boolean" "String" "int" "int" "boolean" "boolean" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "VariantFiltration" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--output --variant --add-output-sam-program-record --add-output-vcf-command-line --create-output-bam-index --create-output-bam-md5 --create-output-variant-index --create-output-variant-md5 --disable-read-filter --disable-sequence-dictionary-validation --disable-tool-default-read-filters --exclude-intervals --gatk-config-file --input --interval-exclusion-padding --interval-padding --interval-set-rule --lenient --QUIET --read-filter --read-index --read-validation-stringency --seconds-between-progress-updates --sequence-dictionary --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --arguments_file --cloud-index-prefetch-buffer --cloud-prefetch-buffer --cluster-size --cluster-window-size --disable-bam-index-caching --filter-expression --filter-name --filter-not-in-mask --gcs-max-retries --genotype-filter-expression --genotype-filter-name --help --interval-merging-rule --intervals --invalidate-previous-filters --invert-filter-expression --invert-genotype-filter-expression --mask --mask-extension --mask-name --missing-values-evaluate-as-failing --reference --set-filtered-genotype-to-no-call --version --showHidden )
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=("--output;-O" "--variant;-V" "--add-output-sam-program-record;-add-output-sam-program-record" "--add-output-vcf-command-line;-add-output-vcf-command-line" "--create-output-bam-index;-OBI" "--create-output-bam-md5;-OBM" "--create-output-variant-index;-OVI" "--create-output-variant-md5;-OVM" "--disable-read-filter;-DF" "--disable-sequence-dictionary-validation;-disable-sequence-dictionary-validation" "--disable-tool-default-read-filters;-disable-tool-default-read-filters" "--exclude-intervals;-XL" "--input;-I" "--interval-exclusion-padding;-ixp" "--interval-padding;-ip" "--interval-set-rule;-isr" "--lenient;-LE" "--read-filter;-RF" "--read-index;-read-index" "--read-validation-stringency;-VS" "--seconds-between-progress-updates;-seconds-between-progress-updates" "--sequence-dictionary;-sequence-dictionary" "--use-jdk-deflater;-jdk-deflater" "--use-jdk-inflater;-jdk-inflater" "--verbosity;-verbosity" "--cloud-index-prefetch-buffer;-CIPB" "--cloud-prefetch-buffer;-CPB" "--cluster-size;-cluster" "--cluster-window-size;-window" "--disable-bam-index-caching;-DBIC" "--filter-expression;-filter" "--gcs-max-retries;-gcs-retries" "--genotype-filter-expression;-G-filter" "--genotype-filter-name;-G-filter-name" "--help;-h" "--interval-merging-rule;-imr" "--intervals;-L" "--invert-filter-expression;-invfilter" "--invert-genotype-filter-expression;-invG-filter" "--mask;-mask" "--reference;-R" "--showHidden;-showHidden" )
        MIN_OCCURRENCES=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--output --variant --add-output-sam-program-record --add-output-vcf-command-line --create-output-bam-index --create-output-bam-md5 --create-output-variant-index --create-output-variant-md5 --disable-read-filter --disable-sequence-dictionary-validation --disable-tool-default-read-filters --exclude-intervals --gatk-config-file --input --interval-exclusion-padding --interval-padding --interval-set-rule --lenient --QUIET --read-filter --read-index --read-validation-stringency --seconds-between-progress-updates --sequence-dictionary --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --arguments_file --cloud-index-prefetch-buffer --cloud-prefetch-buffer --cluster-size --cluster-window-size --disable-bam-index-caching --filter-expression --filter-name --filter-not-in-mask --gcs-max-retries --genotype-filter-expression --genotype-filter-name --help --interval-merging-rule --intervals --invalidate-previous-filters --invert-filter-expression --invert-genotype-filter-expression --mask --mask-extension --mask-name --missing-values-evaluate-as-failing --reference --set-filtered-genotype-to-no-call --version --showHidden )
        ALL_ARGUMENT_VALUE_TYPES=("String" "String" "boolean" "boolean" "boolean" "boolean" "boolean" "boolean" "List[String]" "boolean" "boolean" "List[String]" "String" "List[String]" "int" "int" "IntervalSetRule" "boolean" "Boolean" "List[String]" "List[String]" "ValidationStringency" "double" "String" "List[File]" "boolean" "boolean" "LogLevel" "List[File]" "int" "int" "Integer" "Integer" "boolean" "List[String]" "List[String]" "boolean" "int" "List[String]" "List[String]" "boolean" "IntervalMergingRule" "List[String]" "boolean" "boolean" "boolean" "FeatureInput[Feature]" "Integer" "String" "Boolean" "String" "boolean" "boolean" "boolean" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "InbreedingCoeff" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=()
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=()
        MIN_OCCURRENCES=()
        MAX_OCCURRENCES=()
        ALL_LEGAL_ARGUMENTS=()
        ALL_ARGUMENT_VALUE_TYPES=()

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "MetricsReadFilter" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=()
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=()
        MIN_OCCURRENCES=()
        MAX_OCCURRENCES=()
        ALL_LEGAL_ARGUMENTS=()
        ALL_ARGUMENT_VALUE_TYPES=()

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "RevertSam" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--INPUT --OUTPUT --OUTPUT_MAP --COMPRESSION_LEVEL --CREATE_INDEX --CREATE_MD5_FILE --GA4GH_CLIENT_SECRETS --MAX_RECORDS_IN_RAM --QUIET --REFERENCE_SEQUENCE --TMP_DIR --USE_JDK_DEFLATER --USE_JDK_INFLATER --VALIDATION_STRINGENCY --VERBOSITY --arguments_file --ATTRIBUTE_TO_CLEAR --help --KEEP_FIRST_DUPLICATE --LIBRARY_NAME --MAX_DISCARD_FRACTION --OUTPUT_BY_READGROUP --OUTPUT_BY_READGROUP_FILE_FORMAT --REMOVE_ALIGNMENT_INFORMATION --REMOVE_DUPLICATE_INFORMATION --RESTORE_ORIGINAL_QUALITIES --SAMPLE_ALIAS --SANITIZE --SORT_ORDER --version --showHidden )
        MUTUALLY_EXCLUSIVE_ARGS=("--OUTPUT;OUTPUT_MAP,OM" "--OUTPUT_MAP;OUTPUT" )
        SYNONYMOUS_ARGS=("--INPUT;-I" "--OUTPUT;-O" "--OUTPUT_MAP;-OM" "--REFERENCE_SEQUENCE;-R" "--USE_JDK_DEFLATER;-use_jdk_deflater" "--USE_JDK_INFLATER;-use_jdk_inflater" "--help;-h" "--LIBRARY_NAME;-LIB" "--OUTPUT_BY_READGROUP;-OBR" "--OUTPUT_BY_READGROUP_FILE_FORMAT;-OBRFF" "--RESTORE_ORIGINAL_QUALITIES;-OQ" "--SAMPLE_ALIAS;-ALIAS" "--SORT_ORDER;-SO" "--showHidden;-showHidden" )
        MIN_OCCURRENCES=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--INPUT --OUTPUT --OUTPUT_MAP --COMPRESSION_LEVEL --CREATE_INDEX --CREATE_MD5_FILE --GA4GH_CLIENT_SECRETS --MAX_RECORDS_IN_RAM --QUIET --REFERENCE_SEQUENCE --TMP_DIR --USE_JDK_DEFLATER --USE_JDK_INFLATER --VALIDATION_STRINGENCY --VERBOSITY --arguments_file --ATTRIBUTE_TO_CLEAR --help --KEEP_FIRST_DUPLICATE --LIBRARY_NAME --MAX_DISCARD_FRACTION --OUTPUT_BY_READGROUP --OUTPUT_BY_READGROUP_FILE_FORMAT --REMOVE_ALIGNMENT_INFORMATION --REMOVE_DUPLICATE_INFORMATION --RESTORE_ORIGINAL_QUALITIES --SAMPLE_ALIAS --SANITIZE --SORT_ORDER --version --showHidden )
        ALL_ARGUMENT_VALUE_TYPES=("File" "File" "File" "int" "Boolean" "boolean" "String" "Integer" "Boolean" "File" "List[File]" "Boolean" "Boolean" "ValidationStringency" "LogLevel" "List[File]" "List[String]" "boolean" "boolean" "String" "double" "boolean" "FileType" "boolean" "boolean" "boolean" "String" "boolean" "SortOrder" "boolean" "boolean" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "CountReads" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--input --add-output-sam-program-record --add-output-vcf-command-line --create-output-bam-index --create-output-bam-md5 --create-output-variant-index --create-output-variant-md5 --disable-read-filter --disable-sequence-dictionary-validation --disable-tool-default-read-filters --exclude-intervals --gatk-config-file --interval-exclusion-padding --interval-padding --interval-set-rule --lenient --QUIET --read-filter --read-index --read-validation-stringency --seconds-between-progress-updates --sequence-dictionary --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --arguments_file --cloud-index-prefetch-buffer --cloud-prefetch-buffer --disable-bam-index-caching --gcs-max-retries --help --interval-merging-rule --intervals --reference --version --showHidden )
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=("--input;-I" "--add-output-sam-program-record;-add-output-sam-program-record" "--add-output-vcf-command-line;-add-output-vcf-command-line" "--create-output-bam-index;-OBI" "--create-output-bam-md5;-OBM" "--create-output-variant-index;-OVI" "--create-output-variant-md5;-OVM" "--disable-read-filter;-DF" "--disable-sequence-dictionary-validation;-disable-sequence-dictionary-validation" "--disable-tool-default-read-filters;-disable-tool-default-read-filters" "--exclude-intervals;-XL" "--interval-exclusion-padding;-ixp" "--interval-padding;-ip" "--interval-set-rule;-isr" "--lenient;-LE" "--read-filter;-RF" "--read-index;-read-index" "--read-validation-stringency;-VS" "--seconds-between-progress-updates;-seconds-between-progress-updates" "--sequence-dictionary;-sequence-dictionary" "--use-jdk-deflater;-jdk-deflater" "--use-jdk-inflater;-jdk-inflater" "--verbosity;-verbosity" "--cloud-index-prefetch-buffer;-CIPB" "--cloud-prefetch-buffer;-CPB" "--disable-bam-index-caching;-DBIC" "--gcs-max-retries;-gcs-retries" "--help;-h" "--interval-merging-rule;-imr" "--intervals;-L" "--reference;-R" "--showHidden;-showHidden" )
        MIN_OCCURRENCES=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--input --add-output-sam-program-record --add-output-vcf-command-line --create-output-bam-index --create-output-bam-md5 --create-output-variant-index --create-output-variant-md5 --disable-read-filter --disable-sequence-dictionary-validation --disable-tool-default-read-filters --exclude-intervals --gatk-config-file --interval-exclusion-padding --interval-padding --interval-set-rule --lenient --QUIET --read-filter --read-index --read-validation-stringency --seconds-between-progress-updates --sequence-dictionary --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --arguments_file --cloud-index-prefetch-buffer --cloud-prefetch-buffer --disable-bam-index-caching --gcs-max-retries --help --interval-merging-rule --intervals --reference --version --showHidden )
        ALL_ARGUMENT_VALUE_TYPES=("List[String]" "boolean" "boolean" "boolean" "boolean" "boolean" "boolean" "List[String]" "boolean" "boolean" "List[String]" "String" "int" "int" "IntervalSetRule" "boolean" "Boolean" "List[String]" "List[String]" "ValidationStringency" "double" "String" "List[File]" "boolean" "boolean" "LogLevel" "List[File]" "int" "int" "boolean" "int" "boolean" "IntervalMergingRule" "List[String]" "String" "boolean" "boolean" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "UniqueAltReadCount" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=()
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=()
        MIN_OCCURRENCES=()
        MAX_OCCURRENCES=()
        ALL_LEGAL_ARGUMENTS=()
        ALL_ARGUMENT_VALUE_TYPES=()

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "MeanQualityByCycle" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--CHART_OUTPUT --INPUT --OUTPUT --COMPRESSION_LEVEL --CREATE_INDEX --CREATE_MD5_FILE --GA4GH_CLIENT_SECRETS --MAX_RECORDS_IN_RAM --QUIET --REFERENCE_SEQUENCE --TMP_DIR --USE_JDK_DEFLATER --USE_JDK_INFLATER --VALIDATION_STRINGENCY --VERBOSITY --ALIGNED_READS_ONLY --arguments_file --ASSUME_SORTED --help --PF_READS_ONLY --STOP_AFTER --version --showHidden )
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=("--CHART_OUTPUT;-CHART" "--INPUT;-I" "--OUTPUT;-O" "--REFERENCE_SEQUENCE;-R" "--USE_JDK_DEFLATER;-use_jdk_deflater" "--USE_JDK_INFLATER;-use_jdk_inflater" "--ASSUME_SORTED;-AS" "--help;-h" "--showHidden;-showHidden" )
        MIN_OCCURRENCES=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--CHART_OUTPUT --INPUT --OUTPUT --COMPRESSION_LEVEL --CREATE_INDEX --CREATE_MD5_FILE --GA4GH_CLIENT_SECRETS --MAX_RECORDS_IN_RAM --QUIET --REFERENCE_SEQUENCE --TMP_DIR --USE_JDK_DEFLATER --USE_JDK_INFLATER --VALIDATION_STRINGENCY --VERBOSITY --ALIGNED_READS_ONLY --arguments_file --ASSUME_SORTED --help --PF_READS_ONLY --STOP_AFTER --version --showHidden )
        ALL_ARGUMENT_VALUE_TYPES=("File" "File" "File" "int" "Boolean" "boolean" "String" "Integer" "Boolean" "File" "List[File]" "Boolean" "Boolean" "ValidationStringency" "LogLevel" "boolean" "List[File]" "boolean" "boolean" "boolean" "long" "boolean" "boolean" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "VcfFormatConverter" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--INPUT --OUTPUT --COMPRESSION_LEVEL --CREATE_INDEX --CREATE_MD5_FILE --GA4GH_CLIENT_SECRETS --MAX_RECORDS_IN_RAM --QUIET --REFERENCE_SEQUENCE --TMP_DIR --USE_JDK_DEFLATER --USE_JDK_INFLATER --VALIDATION_STRINGENCY --VERBOSITY --arguments_file --help --REQUIRE_INDEX --version --showHidden )
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=("--INPUT;-I" "--OUTPUT;-O" "--REFERENCE_SEQUENCE;-R" "--USE_JDK_DEFLATER;-use_jdk_deflater" "--USE_JDK_INFLATER;-use_jdk_inflater" "--help;-h" "--showHidden;-showHidden" )
        MIN_OCCURRENCES=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--INPUT --OUTPUT --COMPRESSION_LEVEL --CREATE_INDEX --CREATE_MD5_FILE --GA4GH_CLIENT_SECRETS --MAX_RECORDS_IN_RAM --QUIET --REFERENCE_SEQUENCE --TMP_DIR --USE_JDK_DEFLATER --USE_JDK_INFLATER --VALIDATION_STRINGENCY --VERBOSITY --arguments_file --help --REQUIRE_INDEX --version --showHidden )
        ALL_ARGUMENT_VALUE_TYPES=("File" "File" "int" "Boolean" "boolean" "String" "Integer" "Boolean" "File" "List[File]" "Boolean" "Boolean" "ValidationStringency" "LogLevel" "List[File]" "boolean" "Boolean" "boolean" "boolean" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "FilterByOrientationBias" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--output --pre-adapter-detail-file --variant --add-output-sam-program-record --add-output-vcf-command-line --create-output-bam-index --create-output-bam-md5 --create-output-variant-index --create-output-variant-md5 --disable-read-filter --disable-sequence-dictionary-validation --disable-tool-default-read-filters --exclude-intervals --gatk-config-file --input --interval-exclusion-padding --interval-padding --interval-set-rule --lenient --QUIET --read-filter --read-index --read-validation-stringency --seconds-between-progress-updates --sequence-dictionary --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --arguments_file --artifact-modes --cloud-index-prefetch-buffer --cloud-prefetch-buffer --disable-bam-index-caching --gcs-max-retries --help --interval-merging-rule --intervals --reference --version --showHidden )
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=("--output;-O" "--pre-adapter-detail-file;-P" "--variant;-V" "--add-output-sam-program-record;-add-output-sam-program-record" "--add-output-vcf-command-line;-add-output-vcf-command-line" "--create-output-bam-index;-OBI" "--create-output-bam-md5;-OBM" "--create-output-variant-index;-OVI" "--create-output-variant-md5;-OVM" "--disable-read-filter;-DF" "--disable-sequence-dictionary-validation;-disable-sequence-dictionary-validation" "--disable-tool-default-read-filters;-disable-tool-default-read-filters" "--exclude-intervals;-XL" "--input;-I" "--interval-exclusion-padding;-ixp" "--interval-padding;-ip" "--interval-set-rule;-isr" "--lenient;-LE" "--read-filter;-RF" "--read-index;-read-index" "--read-validation-stringency;-VS" "--seconds-between-progress-updates;-seconds-between-progress-updates" "--sequence-dictionary;-sequence-dictionary" "--use-jdk-deflater;-jdk-deflater" "--use-jdk-inflater;-jdk-inflater" "--verbosity;-verbosity" "--artifact-modes;-AM" "--cloud-index-prefetch-buffer;-CIPB" "--cloud-prefetch-buffer;-CPB" "--disable-bam-index-caching;-DBIC" "--gcs-max-retries;-gcs-retries" "--help;-h" "--interval-merging-rule;-imr" "--intervals;-L" "--reference;-R" "--showHidden;-showHidden" )
        MIN_OCCURRENCES=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--output --pre-adapter-detail-file --variant --add-output-sam-program-record --add-output-vcf-command-line --create-output-bam-index --create-output-bam-md5 --create-output-variant-index --create-output-variant-md5 --disable-read-filter --disable-sequence-dictionary-validation --disable-tool-default-read-filters --exclude-intervals --gatk-config-file --input --interval-exclusion-padding --interval-padding --interval-set-rule --lenient --QUIET --read-filter --read-index --read-validation-stringency --seconds-between-progress-updates --sequence-dictionary --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --arguments_file --artifact-modes --cloud-index-prefetch-buffer --cloud-prefetch-buffer --disable-bam-index-caching --gcs-max-retries --help --interval-merging-rule --intervals --reference --version --showHidden )
        ALL_ARGUMENT_VALUE_TYPES=("File" "File" "String" "boolean" "boolean" "boolean" "boolean" "boolean" "boolean" "List[String]" "boolean" "boolean" "List[String]" "String" "List[String]" "int" "int" "IntervalSetRule" "boolean" "Boolean" "List[String]" "List[String]" "ValidationStringency" "double" "String" "List[File]" "boolean" "boolean" "LogLevel" "List[File]" "List[String]" "int" "int" "boolean" "int" "boolean" "IntervalMergingRule" "List[String]" "String" "boolean" "boolean" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "VariantsToTable" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--output --variant --add-output-sam-program-record --add-output-vcf-command-line --create-output-bam-index --create-output-bam-md5 --create-output-variant-index --create-output-variant-md5 --disable-read-filter --disable-sequence-dictionary-validation --disable-tool-default-read-filters --exclude-intervals --gatk-config-file --input --interval-exclusion-padding --interval-padding --interval-set-rule --lenient --QUIET --read-filter --read-index --read-validation-stringency --seconds-between-progress-updates --sequence-dictionary --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --arguments_file --cloud-index-prefetch-buffer --cloud-prefetch-buffer --disable-bam-index-caching --fields --gcs-max-retries --genotype-fields --help --interval-merging-rule --intervals --reference --split-multi-allelic --version --error-if-missing-data --moltenize --show-filtered --showHidden )
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=("--output;-O" "--variant;-V" "--add-output-sam-program-record;-add-output-sam-program-record" "--add-output-vcf-command-line;-add-output-vcf-command-line" "--create-output-bam-index;-OBI" "--create-output-bam-md5;-OBM" "--create-output-variant-index;-OVI" "--create-output-variant-md5;-OVM" "--disable-read-filter;-DF" "--disable-sequence-dictionary-validation;-disable-sequence-dictionary-validation" "--disable-tool-default-read-filters;-disable-tool-default-read-filters" "--exclude-intervals;-XL" "--input;-I" "--interval-exclusion-padding;-ixp" "--interval-padding;-ip" "--interval-set-rule;-isr" "--lenient;-LE" "--read-filter;-RF" "--read-index;-read-index" "--read-validation-stringency;-VS" "--seconds-between-progress-updates;-seconds-between-progress-updates" "--sequence-dictionary;-sequence-dictionary" "--use-jdk-deflater;-jdk-deflater" "--use-jdk-inflater;-jdk-inflater" "--verbosity;-verbosity" "--cloud-index-prefetch-buffer;-CIPB" "--cloud-prefetch-buffer;-CPB" "--disable-bam-index-caching;-DBIC" "--fields;-F" "--gcs-max-retries;-gcs-retries" "--genotype-fields;-GF" "--help;-h" "--interval-merging-rule;-imr" "--intervals;-L" "--reference;-R" "--split-multi-allelic;-SMA" "--error-if-missing-data;-EMD" "--moltenize;-moltenize" "--show-filtered;-raw" "--showHidden;-showHidden" )
        MIN_OCCURRENCES=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--output --variant --add-output-sam-program-record --add-output-vcf-command-line --create-output-bam-index --create-output-bam-md5 --create-output-variant-index --create-output-variant-md5 --disable-read-filter --disable-sequence-dictionary-validation --disable-tool-default-read-filters --exclude-intervals --gatk-config-file --input --interval-exclusion-padding --interval-padding --interval-set-rule --lenient --QUIET --read-filter --read-index --read-validation-stringency --seconds-between-progress-updates --sequence-dictionary --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --arguments_file --cloud-index-prefetch-buffer --cloud-prefetch-buffer --disable-bam-index-caching --fields --gcs-max-retries --genotype-fields --help --interval-merging-rule --intervals --reference --split-multi-allelic --version --error-if-missing-data --moltenize --show-filtered --showHidden )
        ALL_ARGUMENT_VALUE_TYPES=("String" "String" "boolean" "boolean" "boolean" "boolean" "boolean" "boolean" "List[String]" "boolean" "boolean" "List[String]" "String" "List[String]" "int" "int" "IntervalSetRule" "boolean" "Boolean" "List[String]" "List[String]" "ValidationStringency" "double" "String" "List[File]" "boolean" "boolean" "LogLevel" "List[File]" "int" "int" "boolean" "List[String]" "int" "List[String]" "boolean" "IntervalMergingRule" "List[String]" "String" "boolean" "boolean" "boolean" "boolean" "boolean" "boolean" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "CollectRrbsMetrics" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--INPUT --METRICS_FILE_PREFIX --REFERENCE --COMPRESSION_LEVEL --CREATE_INDEX --CREATE_MD5_FILE --GA4GH_CLIENT_SECRETS --MAX_RECORDS_IN_RAM --QUIET --TMP_DIR --USE_JDK_DEFLATER --USE_JDK_INFLATER --VALIDATION_STRINGENCY --VERBOSITY --arguments_file --ASSUME_SORTED --C_QUALITY_THRESHOLD --help --MAX_MISMATCH_RATE --METRIC_ACCUMULATION_LEVEL --MINIMUM_READ_LENGTH --NEXT_BASE_QUALITY_THRESHOLD --SEQUENCE_NAMES --version --showHidden )
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=("--INPUT;-I" "--METRICS_FILE_PREFIX;-M" "--REFERENCE;-R" "--USE_JDK_DEFLATER;-use_jdk_deflater" "--USE_JDK_INFLATER;-use_jdk_inflater" "--ASSUME_SORTED;-AS" "--help;-h" "--METRIC_ACCUMULATION_LEVEL;-LEVEL" "--showHidden;-showHidden" )
        MIN_OCCURRENCES=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--INPUT --METRICS_FILE_PREFIX --REFERENCE --COMPRESSION_LEVEL --CREATE_INDEX --CREATE_MD5_FILE --GA4GH_CLIENT_SECRETS --MAX_RECORDS_IN_RAM --QUIET --TMP_DIR --USE_JDK_DEFLATER --USE_JDK_INFLATER --VALIDATION_STRINGENCY --VERBOSITY --arguments_file --ASSUME_SORTED --C_QUALITY_THRESHOLD --help --MAX_MISMATCH_RATE --METRIC_ACCUMULATION_LEVEL --MINIMUM_READ_LENGTH --NEXT_BASE_QUALITY_THRESHOLD --SEQUENCE_NAMES --version --showHidden )
        ALL_ARGUMENT_VALUE_TYPES=("File" "String" "File" "int" "Boolean" "boolean" "String" "Integer" "Boolean" "List[File]" "Boolean" "Boolean" "ValidationStringency" "LogLevel" "List[File]" "boolean" "int" "boolean" "double" "Set[MetricAccumulationLevel]" "int" "int" "Set[String]" "boolean" "boolean" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "CheckTerminatorBlock" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--INPUT --COMPRESSION_LEVEL --CREATE_INDEX --CREATE_MD5_FILE --GA4GH_CLIENT_SECRETS --MAX_RECORDS_IN_RAM --QUIET --REFERENCE_SEQUENCE --TMP_DIR --USE_JDK_DEFLATER --USE_JDK_INFLATER --VALIDATION_STRINGENCY --VERBOSITY --arguments_file --help --version --showHidden )
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=("--INPUT;-I" "--REFERENCE_SEQUENCE;-R" "--USE_JDK_DEFLATER;-use_jdk_deflater" "--USE_JDK_INFLATER;-use_jdk_inflater" "--help;-h" "--showHidden;-showHidden" )
        MIN_OCCURRENCES=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--INPUT --COMPRESSION_LEVEL --CREATE_INDEX --CREATE_MD5_FILE --GA4GH_CLIENT_SECRETS --MAX_RECORDS_IN_RAM --QUIET --REFERENCE_SEQUENCE --TMP_DIR --USE_JDK_DEFLATER --USE_JDK_INFLATER --VALIDATION_STRINGENCY --VERBOSITY --arguments_file --help --version --showHidden )
        ALL_ARGUMENT_VALUE_TYPES=("File" "int" "Boolean" "boolean" "String" "Integer" "Boolean" "File" "List[File]" "Boolean" "Boolean" "ValidationStringency" "LogLevel" "List[File]" "boolean" "boolean" "boolean" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "GatherTranches" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--input --output --gatk-config-file --QUIET --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --arguments_file --gcs-max-retries --help --mode --truth-sensitivity-tranche --version --showHidden )
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=("--input;-I" "--output;-O" "--use-jdk-deflater;-jdk-deflater" "--use-jdk-inflater;-jdk-inflater" "--verbosity;-verbosity" "--gcs-max-retries;-gcs-retries" "--help;-h" "--mode;-mode" "--truth-sensitivity-tranche;-tranche" "--showHidden;-showHidden" )
        MIN_OCCURRENCES=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--input --output --gatk-config-file --QUIET --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --arguments_file --gcs-max-retries --help --mode --truth-sensitivity-tranche --version --showHidden )
        ALL_ARGUMENT_VALUE_TYPES=("List[File]" "File" "String" "Boolean" "List[File]" "boolean" "boolean" "LogLevel" "List[File]" "int" "boolean" "Mode" "List[Double]" "boolean" "boolean" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "QualityScoreDistribution" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--CHART_OUTPUT --INPUT --OUTPUT --COMPRESSION_LEVEL --CREATE_INDEX --CREATE_MD5_FILE --GA4GH_CLIENT_SECRETS --MAX_RECORDS_IN_RAM --QUIET --REFERENCE_SEQUENCE --TMP_DIR --USE_JDK_DEFLATER --USE_JDK_INFLATER --VALIDATION_STRINGENCY --VERBOSITY --ALIGNED_READS_ONLY --arguments_file --ASSUME_SORTED --help --INCLUDE_NO_CALLS --PF_READS_ONLY --STOP_AFTER --version --showHidden )
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=("--CHART_OUTPUT;-CHART" "--INPUT;-I" "--OUTPUT;-O" "--REFERENCE_SEQUENCE;-R" "--USE_JDK_DEFLATER;-use_jdk_deflater" "--USE_JDK_INFLATER;-use_jdk_inflater" "--ASSUME_SORTED;-AS" "--help;-h" "--PF_READS_ONLY;-PF" "--showHidden;-showHidden" )
        MIN_OCCURRENCES=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--CHART_OUTPUT --INPUT --OUTPUT --COMPRESSION_LEVEL --CREATE_INDEX --CREATE_MD5_FILE --GA4GH_CLIENT_SECRETS --MAX_RECORDS_IN_RAM --QUIET --REFERENCE_SEQUENCE --TMP_DIR --USE_JDK_DEFLATER --USE_JDK_INFLATER --VALIDATION_STRINGENCY --VERBOSITY --ALIGNED_READS_ONLY --arguments_file --ASSUME_SORTED --help --INCLUDE_NO_CALLS --PF_READS_ONLY --STOP_AFTER --version --showHidden )
        ALL_ARGUMENT_VALUE_TYPES=("File" "File" "File" "int" "Boolean" "boolean" "String" "Integer" "Boolean" "File" "List[File]" "Boolean" "Boolean" "ValidationStringency" "LogLevel" "boolean" "List[File]" "boolean" "boolean" "boolean" "boolean" "long" "boolean" "boolean" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "FlagStatSpark" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--input --disable-read-filter --disable-tool-default-read-filters --exclude-intervals --gatk-config-file --interval-exclusion-padding --interval-padding --interval-set-rule --QUIET --read-filter --read-index --read-validation-stringency --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --arguments_file --bam-partition-size --conf --disable-sequence-dictionary-validation --gcs-max-retries --help --interval-merging-rule --intervals --num-reducers --output --program-name --reference --sharded-output --spark-master --version --showHidden )
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=("--input;-I" "--disable-read-filter;-DF" "--disable-tool-default-read-filters;-disable-tool-default-read-filters" "--exclude-intervals;-XL" "--interval-exclusion-padding;-ixp" "--interval-padding;-ip" "--interval-set-rule;-isr" "--read-filter;-RF" "--read-index;-read-index" "--read-validation-stringency;-VS" "--use-jdk-deflater;-jdk-deflater" "--use-jdk-inflater;-jdk-inflater" "--verbosity;-verbosity" "--conf;-conf" "--disable-sequence-dictionary-validation;-disable-sequence-dictionary-validation" "--gcs-max-retries;-gcs-retries" "--help;-h" "--interval-merging-rule;-imr" "--intervals;-L" "--output;-O" "--reference;-R" "--showHidden;-showHidden" )
        MIN_OCCURRENCES=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--input --disable-read-filter --disable-tool-default-read-filters --exclude-intervals --gatk-config-file --interval-exclusion-padding --interval-padding --interval-set-rule --QUIET --read-filter --read-index --read-validation-stringency --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --arguments_file --bam-partition-size --conf --disable-sequence-dictionary-validation --gcs-max-retries --help --interval-merging-rule --intervals --num-reducers --output --program-name --reference --sharded-output --spark-master --version --showHidden )
        ALL_ARGUMENT_VALUE_TYPES=("List[String]" "List[String]" "boolean" "List[String]" "String" "int" "int" "IntervalSetRule" "Boolean" "List[String]" "List[String]" "ValidationStringency" "List[File]" "boolean" "boolean" "LogLevel" "List[File]" "long" "List[String]" "boolean" "int" "boolean" "IntervalMergingRule" "List[String]" "int" "String" "String" "String" "boolean" "String" "boolean" "boolean" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "NormalizeFasta" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--INPUT --OUTPUT --COMPRESSION_LEVEL --CREATE_INDEX --CREATE_MD5_FILE --GA4GH_CLIENT_SECRETS --MAX_RECORDS_IN_RAM --QUIET --REFERENCE_SEQUENCE --TMP_DIR --USE_JDK_DEFLATER --USE_JDK_INFLATER --VALIDATION_STRINGENCY --VERBOSITY --arguments_file --help --LINE_LENGTH --TRUNCATE_SEQUENCE_NAMES_AT_WHITESPACE --version --showHidden )
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=("--INPUT;-I" "--OUTPUT;-O" "--REFERENCE_SEQUENCE;-R" "--USE_JDK_DEFLATER;-use_jdk_deflater" "--USE_JDK_INFLATER;-use_jdk_inflater" "--help;-h" "--showHidden;-showHidden" )
        MIN_OCCURRENCES=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--INPUT --OUTPUT --COMPRESSION_LEVEL --CREATE_INDEX --CREATE_MD5_FILE --GA4GH_CLIENT_SECRETS --MAX_RECORDS_IN_RAM --QUIET --REFERENCE_SEQUENCE --TMP_DIR --USE_JDK_DEFLATER --USE_JDK_INFLATER --VALIDATION_STRINGENCY --VERBOSITY --arguments_file --help --LINE_LENGTH --TRUNCATE_SEQUENCE_NAMES_AT_WHITESPACE --version --showHidden )
        ALL_ARGUMENT_VALUE_TYPES=("File" "File" "int" "Boolean" "boolean" "String" "Integer" "Boolean" "File" "List[File]" "Boolean" "Boolean" "ValidationStringency" "LogLevel" "List[File]" "boolean" "int" "boolean" "boolean" "boolean" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "ValidAlignmentStartReadFilter" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=()
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=()
        MIN_OCCURRENCES=()
        MAX_OCCURRENCES=()
        ALL_LEGAL_ARGUMENTS=()
        ALL_ARGUMENT_VALUE_TYPES=()

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "HasReadGroupReadFilter" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=()
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=()
        MIN_OCCURRENCES=()
        MAX_OCCURRENCES=()
        ALL_LEGAL_ARGUMENTS=()
        ALL_ARGUMENT_VALUE_TYPES=()

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "MakeSitesOnlyVcf" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--INPUT --OUTPUT --COMPRESSION_LEVEL --CREATE_INDEX --CREATE_MD5_FILE --GA4GH_CLIENT_SECRETS --MAX_RECORDS_IN_RAM --QUIET --REFERENCE_SEQUENCE --TMP_DIR --USE_JDK_DEFLATER --USE_JDK_INFLATER --VALIDATION_STRINGENCY --VERBOSITY --arguments_file --help --SAMPLE --version --showHidden )
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=("--INPUT;-I" "--OUTPUT;-O" "--REFERENCE_SEQUENCE;-R" "--USE_JDK_DEFLATER;-use_jdk_deflater" "--USE_JDK_INFLATER;-use_jdk_inflater" "--help;-h" "--SAMPLE;-S" "--showHidden;-showHidden" )
        MIN_OCCURRENCES=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--INPUT --OUTPUT --COMPRESSION_LEVEL --CREATE_INDEX --CREATE_MD5_FILE --GA4GH_CLIENT_SECRETS --MAX_RECORDS_IN_RAM --QUIET --REFERENCE_SEQUENCE --TMP_DIR --USE_JDK_DEFLATER --USE_JDK_INFLATER --VALIDATION_STRINGENCY --VERBOSITY --arguments_file --help --SAMPLE --version --showHidden )
        ALL_ARGUMENT_VALUE_TYPES=("File" "File" "int" "Boolean" "boolean" "String" "Integer" "Boolean" "File" "List[File]" "Boolean" "Boolean" "ValidationStringency" "LogLevel" "List[File]" "boolean" "Set[String]" "boolean" "boolean" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "BaseQuality" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=()
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=()
        MIN_OCCURRENCES=()
        MAX_OCCURRENCES=()
        ALL_LEGAL_ARGUMENTS=()
        ALL_ARGUMENT_VALUE_TYPES=()

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "SplitSamByNumberOfReads" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--INPUT --OUTPUT --COMPRESSION_LEVEL --CREATE_INDEX --CREATE_MD5_FILE --GA4GH_CLIENT_SECRETS --MAX_RECORDS_IN_RAM --QUIET --REFERENCE_SEQUENCE --TMP_DIR --USE_JDK_DEFLATER --USE_JDK_INFLATER --VALIDATION_STRINGENCY --VERBOSITY --arguments_file --help --OUT_PREFIX --SPLIT_TO_N_FILES --SPLIT_TO_N_READS --TOTAL_READS_IN_INPUT --version --showHidden )
        MUTUALLY_EXCLUSIVE_ARGS=("--SPLIT_TO_N_FILES;SPLIT_TO_N_READS" "--SPLIT_TO_N_READS;SPLIT_TO_N_FILES,N_FILES" )
        SYNONYMOUS_ARGS=("--INPUT;-I" "--OUTPUT;-O" "--REFERENCE_SEQUENCE;-R" "--USE_JDK_DEFLATER;-use_jdk_deflater" "--USE_JDK_INFLATER;-use_jdk_inflater" "--help;-h" "--OUT_PREFIX;-OUT_PREFIX" "--SPLIT_TO_N_FILES;-N_FILES" "--SPLIT_TO_N_READS;-N_READS" "--TOTAL_READS_IN_INPUT;-TOTAL_READS" "--showHidden;-showHidden" )
        MIN_OCCURRENCES=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--INPUT --OUTPUT --COMPRESSION_LEVEL --CREATE_INDEX --CREATE_MD5_FILE --GA4GH_CLIENT_SECRETS --MAX_RECORDS_IN_RAM --QUIET --REFERENCE_SEQUENCE --TMP_DIR --USE_JDK_DEFLATER --USE_JDK_INFLATER --VALIDATION_STRINGENCY --VERBOSITY --arguments_file --help --OUT_PREFIX --SPLIT_TO_N_FILES --SPLIT_TO_N_READS --TOTAL_READS_IN_INPUT --version --showHidden )
        ALL_ARGUMENT_VALUE_TYPES=("File" "File" "int" "Boolean" "boolean" "String" "Integer" "Boolean" "File" "List[File]" "Boolean" "Boolean" "ValidationStringency" "LogLevel" "List[File]" "boolean" "String" "int" "int" "long" "boolean" "boolean" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "ExtractIlluminaBarcodes" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--BARCODE --BARCODE_FILE --BASECALLS_DIR --LANE --METRICS_FILE --READ_STRUCTURE --COMPRESSION_LEVEL --CREATE_INDEX --CREATE_MD5_FILE --GA4GH_CLIENT_SECRETS --MAX_RECORDS_IN_RAM --QUIET --REFERENCE_SEQUENCE --TMP_DIR --USE_JDK_DEFLATER --USE_JDK_INFLATER --VALIDATION_STRINGENCY --VERBOSITY --arguments_file --COMPRESS_OUTPUTS --help --MAX_MISMATCHES --MAX_NO_CALLS --MIN_MISMATCH_DELTA --MINIMUM_BASE_QUALITY --MINIMUM_QUALITY --NUM_PROCESSORS --OUTPUT_DIR --version --showHidden )
        MUTUALLY_EXCLUSIVE_ARGS=("--BARCODE;BARCODE_FILE" "--BARCODE_FILE;BARCODE" )
        SYNONYMOUS_ARGS=("--BASECALLS_DIR;-B" "--LANE;-L" "--METRICS_FILE;-M" "--READ_STRUCTURE;-RS" "--REFERENCE_SEQUENCE;-R" "--USE_JDK_DEFLATER;-use_jdk_deflater" "--USE_JDK_INFLATER;-use_jdk_inflater" "--COMPRESS_OUTPUTS;-GZIP" "--help;-h" "--MINIMUM_BASE_QUALITY;-Q" "--showHidden;-showHidden" )
        MIN_OCCURRENCES=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--BARCODE --BARCODE_FILE --BASECALLS_DIR --LANE --METRICS_FILE --READ_STRUCTURE --COMPRESSION_LEVEL --CREATE_INDEX --CREATE_MD5_FILE --GA4GH_CLIENT_SECRETS --MAX_RECORDS_IN_RAM --QUIET --REFERENCE_SEQUENCE --TMP_DIR --USE_JDK_DEFLATER --USE_JDK_INFLATER --VALIDATION_STRINGENCY --VERBOSITY --arguments_file --COMPRESS_OUTPUTS --help --MAX_MISMATCHES --MAX_NO_CALLS --MIN_MISMATCH_DELTA --MINIMUM_BASE_QUALITY --MINIMUM_QUALITY --NUM_PROCESSORS --OUTPUT_DIR --version --showHidden )
        ALL_ARGUMENT_VALUE_TYPES=("List[String]" "File" "File" "Integer" "File" "String" "int" "Boolean" "boolean" "String" "Integer" "Boolean" "File" "List[File]" "Boolean" "Boolean" "ValidationStringency" "LogLevel" "List[File]" "boolean" "boolean" "int" "int" "int" "int" "int" "int" "File" "boolean" "boolean" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "FindBreakpointEvidenceSpark" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--aligner-index-image --input --kmers-to-ignore --output --disable-read-filter --disable-tool-default-read-filters --exclude-intervals --gatk-config-file --interval-exclusion-padding --interval-padding --interval-set-rule --QUIET --read-filter --read-index --read-validation-stringency --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --adapter-sequence --allowed-short-fragment-overhang --arguments_file --assembled-contigs-output-order --assembly-to-mapped-size-ratio-guess --bam-partition-size --breakpoint-evidence-dir --breakpoint-intervals --cleaner-max-copy-number --cleaner-max-intervals --cleaner-min-kmer-count --conf --cross-contigs-to-ignore --disable-sequence-dictionary-validation --exclusion-interval-padding --exclusion-intervals --external-evidence --external-evidence-uncertainty --external-evidence-weight --fastq-dir --gcs-max-retries --help --include-mapping-location --interval-merging-rule --interval-only-assembly --intervals --kmer-intervals --kmer-max-dust-score --k-size --max-fastq-size --max-interval-coverage --max-tracked-fragment-length --min-coherent-evidence-count --min-evidence-count --min-evidence-mapq --min-evidence-match-length --min-kmers-per-interval --num-reducers --program-name --qname-intervals-for-assembly --qname-intervals-mapped --read-metadata --reference --sharded-output --spark-master --target-link-file --unfiltered-breakpoint-evidence-dir --version --write-gfas --showHidden )
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=("--input;-I" "--output;-O" "--disable-read-filter;-DF" "--disable-tool-default-read-filters;-disable-tool-default-read-filters" "--exclude-intervals;-XL" "--interval-exclusion-padding;-ixp" "--interval-padding;-ip" "--interval-set-rule;-isr" "--read-filter;-RF" "--read-index;-read-index" "--read-validation-stringency;-VS" "--use-jdk-deflater;-jdk-deflater" "--use-jdk-inflater;-jdk-inflater" "--verbosity;-verbosity" "--assembled-contigs-output-order;-sort" "--conf;-conf" "--disable-sequence-dictionary-validation;-disable-sequence-dictionary-validation" "--gcs-max-retries;-gcs-retries" "--help;-h" "--interval-merging-rule;-imr" "--intervals;-L" "--reference;-R" "--showHidden;-showHidden" )
        MIN_OCCURRENCES=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--aligner-index-image --input --kmers-to-ignore --output --disable-read-filter --disable-tool-default-read-filters --exclude-intervals --gatk-config-file --interval-exclusion-padding --interval-padding --interval-set-rule --QUIET --read-filter --read-index --read-validation-stringency --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --adapter-sequence --allowed-short-fragment-overhang --arguments_file --assembled-contigs-output-order --assembly-to-mapped-size-ratio-guess --bam-partition-size --breakpoint-evidence-dir --breakpoint-intervals --cleaner-max-copy-number --cleaner-max-intervals --cleaner-min-kmer-count --conf --cross-contigs-to-ignore --disable-sequence-dictionary-validation --exclusion-interval-padding --exclusion-intervals --external-evidence --external-evidence-uncertainty --external-evidence-weight --fastq-dir --gcs-max-retries --help --include-mapping-location --interval-merging-rule --interval-only-assembly --intervals --kmer-intervals --kmer-max-dust-score --k-size --max-fastq-size --max-interval-coverage --max-tracked-fragment-length --min-coherent-evidence-count --min-evidence-count --min-evidence-mapq --min-evidence-match-length --min-kmers-per-interval --num-reducers --program-name --qname-intervals-for-assembly --qname-intervals-mapped --read-metadata --reference --sharded-output --spark-master --target-link-file --unfiltered-breakpoint-evidence-dir --version --write-gfas --showHidden )
        ALL_ARGUMENT_VALUE_TYPES=("String" "List[String]" "String" "String" "List[String]" "boolean" "List[String]" "String" "int" "int" "IntervalSetRule" "Boolean" "List[String]" "List[String]" "ValidationStringency" "List[File]" "boolean" "boolean" "LogLevel" "String" "int" "List[File]" "SortOrder" "int" "long" "String" "String" "int" "int" "int" "List[String]" "String" "boolean" "int" "String" "String" "int" "int" "String" "int" "boolean" "boolean" "IntervalMergingRule" "boolean" "List[String]" "String" "int" "int" "int" "int" "int" "int" "int" "int" "int" "int" "int" "String" "String" "String" "String" "String" "boolean" "String" "String" "String" "boolean" "boolean" "boolean" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "CalculateContamination" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--input --output --gatk-config-file --QUIET --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --arguments_file --gcs-max-retries --help --high-coverage-ratio-threshold --low-coverage-ratio-threshold --matched-normal --version --showHidden )
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=("--input;-I" "--output;-O" "--use-jdk-deflater;-jdk-deflater" "--use-jdk-inflater;-jdk-inflater" "--verbosity;-verbosity" "--gcs-max-retries;-gcs-retries" "--help;-h" "--matched-normal;-matched" "--showHidden;-showHidden" )
        MIN_OCCURRENCES=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--input --output --gatk-config-file --QUIET --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --arguments_file --gcs-max-retries --help --high-coverage-ratio-threshold --low-coverage-ratio-threshold --matched-normal --version --showHidden )
        ALL_ARGUMENT_VALUE_TYPES=("File" "File" "String" "Boolean" "List[File]" "boolean" "boolean" "LogLevel" "List[File]" "int" "boolean" "double" "double" "File" "boolean" "boolean" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "CombineGVCFs" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--output --reference --variant --add-output-sam-program-record --add-output-vcf-command-line --create-output-bam-index --create-output-bam-md5 --create-output-variant-index --create-output-variant-md5 --disable-read-filter --disable-sequence-dictionary-validation --disable-tool-default-read-filters --exclude-intervals --gatk-config-file --input --interval-exclusion-padding --interval-padding --interval-set-rule --lenient --QUIET --read-filter --read-index --read-validation-stringency --seconds-between-progress-updates --sequence-dictionary --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --annotation --annotation-group --annotations-to-exclude --arguments_file --break-bands-at-multiples-of --cloud-index-prefetch-buffer --cloud-prefetch-buffer --convert-to-base-pair-resolution --dbsnp --disable-bam-index-caching --disable-tool-default-annotations --gcs-max-retries --help --interval-merging-rule --intervals --version --ignore-variants-starting-outside-interval --showHidden )
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=("--output;-O" "--reference;-R" "--variant;-V" "--add-output-sam-program-record;-add-output-sam-program-record" "--add-output-vcf-command-line;-add-output-vcf-command-line" "--create-output-bam-index;-OBI" "--create-output-bam-md5;-OBM" "--create-output-variant-index;-OVI" "--create-output-variant-md5;-OVM" "--disable-read-filter;-DF" "--disable-sequence-dictionary-validation;-disable-sequence-dictionary-validation" "--disable-tool-default-read-filters;-disable-tool-default-read-filters" "--exclude-intervals;-XL" "--input;-I" "--interval-exclusion-padding;-ixp" "--interval-padding;-ip" "--interval-set-rule;-isr" "--lenient;-LE" "--read-filter;-RF" "--read-index;-read-index" "--read-validation-stringency;-VS" "--seconds-between-progress-updates;-seconds-between-progress-updates" "--sequence-dictionary;-sequence-dictionary" "--use-jdk-deflater;-jdk-deflater" "--use-jdk-inflater;-jdk-inflater" "--verbosity;-verbosity" "--annotation;-A" "--annotation-group;-G" "--annotations-to-exclude;-AX" "--cloud-index-prefetch-buffer;-CIPB" "--cloud-prefetch-buffer;-CPB" "--dbsnp;-D" "--disable-bam-index-caching;-DBIC" "--disable-tool-default-annotations;-disable-tool-default-annotations" "--gcs-max-retries;-gcs-retries" "--help;-h" "--interval-merging-rule;-imr" "--intervals;-L" "--showHidden;-showHidden" )
        MIN_OCCURRENCES=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--output --reference --variant --add-output-sam-program-record --add-output-vcf-command-line --create-output-bam-index --create-output-bam-md5 --create-output-variant-index --create-output-variant-md5 --disable-read-filter --disable-sequence-dictionary-validation --disable-tool-default-read-filters --exclude-intervals --gatk-config-file --input --interval-exclusion-padding --interval-padding --interval-set-rule --lenient --QUIET --read-filter --read-index --read-validation-stringency --seconds-between-progress-updates --sequence-dictionary --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --annotation --annotation-group --annotations-to-exclude --arguments_file --break-bands-at-multiples-of --cloud-index-prefetch-buffer --cloud-prefetch-buffer --convert-to-base-pair-resolution --dbsnp --disable-bam-index-caching --disable-tool-default-annotations --gcs-max-retries --help --interval-merging-rule --intervals --version --ignore-variants-starting-outside-interval --showHidden )
        ALL_ARGUMENT_VALUE_TYPES=("File" "String" "List[String]" "boolean" "boolean" "boolean" "boolean" "boolean" "boolean" "List[String]" "boolean" "boolean" "List[String]" "String" "List[String]" "int" "int" "IntervalSetRule" "boolean" "Boolean" "List[String]" "List[String]" "ValidationStringency" "double" "String" "List[File]" "boolean" "boolean" "LogLevel" "List[String]" "List[String]" "List[String]" "List[File]" "int" "int" "int" "boolean" "FeatureInput[VariantContext]" "boolean" "boolean" "int" "boolean" "IntervalMergingRule" "List[String]" "boolean" "boolean" "boolean" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "FixMisencodedBaseQualityReads" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--input --output --add-output-sam-program-record --add-output-vcf-command-line --create-output-bam-index --create-output-bam-md5 --create-output-variant-index --create-output-variant-md5 --disable-read-filter --disable-sequence-dictionary-validation --disable-tool-default-read-filters --exclude-intervals --gatk-config-file --interval-exclusion-padding --interval-padding --interval-set-rule --lenient --QUIET --read-filter --read-index --read-validation-stringency --seconds-between-progress-updates --sequence-dictionary --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --arguments_file --cloud-index-prefetch-buffer --cloud-prefetch-buffer --disable-bam-index-caching --gcs-max-retries --help --interval-merging-rule --intervals --reference --version --showHidden )
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=("--input;-I" "--output;-O" "--add-output-sam-program-record;-add-output-sam-program-record" "--add-output-vcf-command-line;-add-output-vcf-command-line" "--create-output-bam-index;-OBI" "--create-output-bam-md5;-OBM" "--create-output-variant-index;-OVI" "--create-output-variant-md5;-OVM" "--disable-read-filter;-DF" "--disable-sequence-dictionary-validation;-disable-sequence-dictionary-validation" "--disable-tool-default-read-filters;-disable-tool-default-read-filters" "--exclude-intervals;-XL" "--interval-exclusion-padding;-ixp" "--interval-padding;-ip" "--interval-set-rule;-isr" "--lenient;-LE" "--read-filter;-RF" "--read-index;-read-index" "--read-validation-stringency;-VS" "--seconds-between-progress-updates;-seconds-between-progress-updates" "--sequence-dictionary;-sequence-dictionary" "--use-jdk-deflater;-jdk-deflater" "--use-jdk-inflater;-jdk-inflater" "--verbosity;-verbosity" "--cloud-index-prefetch-buffer;-CIPB" "--cloud-prefetch-buffer;-CPB" "--disable-bam-index-caching;-DBIC" "--gcs-max-retries;-gcs-retries" "--help;-h" "--interval-merging-rule;-imr" "--intervals;-L" "--reference;-R" "--showHidden;-showHidden" )
        MIN_OCCURRENCES=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--input --output --add-output-sam-program-record --add-output-vcf-command-line --create-output-bam-index --create-output-bam-md5 --create-output-variant-index --create-output-variant-md5 --disable-read-filter --disable-sequence-dictionary-validation --disable-tool-default-read-filters --exclude-intervals --gatk-config-file --interval-exclusion-padding --interval-padding --interval-set-rule --lenient --QUIET --read-filter --read-index --read-validation-stringency --seconds-between-progress-updates --sequence-dictionary --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --arguments_file --cloud-index-prefetch-buffer --cloud-prefetch-buffer --disable-bam-index-caching --gcs-max-retries --help --interval-merging-rule --intervals --reference --version --showHidden )
        ALL_ARGUMENT_VALUE_TYPES=("List[String]" "File" "boolean" "boolean" "boolean" "boolean" "boolean" "boolean" "List[String]" "boolean" "boolean" "List[String]" "String" "int" "int" "IntervalSetRule" "boolean" "Boolean" "List[String]" "List[String]" "ValidationStringency" "double" "String" "List[File]" "boolean" "boolean" "LogLevel" "List[File]" "int" "int" "boolean" "int" "boolean" "IntervalMergingRule" "List[String]" "String" "boolean" "boolean" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "RevertOriginalBaseQualitiesAndAddMateCigar" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--INPUT --OUTPUT --COMPRESSION_LEVEL --CREATE_INDEX --CREATE_MD5_FILE --GA4GH_CLIENT_SECRETS --MAX_RECORDS_IN_RAM --QUIET --REFERENCE_SEQUENCE --TMP_DIR --USE_JDK_DEFLATER --USE_JDK_INFLATER --VALIDATION_STRINGENCY --VERBOSITY --arguments_file --help --MAX_RECORDS_TO_EXAMINE --RESTORE_ORIGINAL_QUALITIES --SORT_ORDER --version --showHidden )
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=("--INPUT;-I" "--OUTPUT;-O" "--REFERENCE_SEQUENCE;-R" "--USE_JDK_DEFLATER;-use_jdk_deflater" "--USE_JDK_INFLATER;-use_jdk_inflater" "--help;-h" "--RESTORE_ORIGINAL_QUALITIES;-OQ" "--SORT_ORDER;-SO" "--showHidden;-showHidden" )
        MIN_OCCURRENCES=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--INPUT --OUTPUT --COMPRESSION_LEVEL --CREATE_INDEX --CREATE_MD5_FILE --GA4GH_CLIENT_SECRETS --MAX_RECORDS_IN_RAM --QUIET --REFERENCE_SEQUENCE --TMP_DIR --USE_JDK_DEFLATER --USE_JDK_INFLATER --VALIDATION_STRINGENCY --VERBOSITY --arguments_file --help --MAX_RECORDS_TO_EXAMINE --RESTORE_ORIGINAL_QUALITIES --SORT_ORDER --version --showHidden )
        ALL_ARGUMENT_VALUE_TYPES=("File" "File" "int" "Boolean" "boolean" "String" "Integer" "Boolean" "File" "List[File]" "Boolean" "Boolean" "ValidationStringency" "LogLevel" "List[File]" "boolean" "int" "boolean" "SortOrder" "boolean" "boolean" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "BwaAndMarkDuplicatesPipelineSpark" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--input --output --reference --disable-read-filter --disable-tool-default-read-filters --exclude-intervals --gatk-config-file --interval-exclusion-padding --interval-padding --interval-set-rule --QUIET --read-filter --read-index --read-validation-stringency --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --arguments_file --bam-partition-size --bwa-mem-index-image --conf --disable-sequence-dictionary-validation --duplicates_scoring_strategy --gcs-max-retries --help --interval-merging-rule --intervals --num-reducers --program-name --sharded-output --single-end-alignment --spark-master --version --showHidden )
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=("--input;-I" "--output;-O" "--reference;-R" "--disable-read-filter;-DF" "--disable-tool-default-read-filters;-disable-tool-default-read-filters" "--exclude-intervals;-XL" "--interval-exclusion-padding;-ixp" "--interval-padding;-ip" "--interval-set-rule;-isr" "--read-filter;-RF" "--read-index;-read-index" "--read-validation-stringency;-VS" "--use-jdk-deflater;-jdk-deflater" "--use-jdk-inflater;-jdk-inflater" "--verbosity;-verbosity" "--bwa-mem-index-image;-image" "--conf;-conf" "--disable-sequence-dictionary-validation;-disable-sequence-dictionary-validation" "--duplicates_scoring_strategy;-DS" "--gcs-max-retries;-gcs-retries" "--help;-h" "--interval-merging-rule;-imr" "--intervals;-L" "--single-end-alignment;-se" "--showHidden;-showHidden" )
        MIN_OCCURRENCES=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--input --output --reference --disable-read-filter --disable-tool-default-read-filters --exclude-intervals --gatk-config-file --interval-exclusion-padding --interval-padding --interval-set-rule --QUIET --read-filter --read-index --read-validation-stringency --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --arguments_file --bam-partition-size --bwa-mem-index-image --conf --disable-sequence-dictionary-validation --duplicates_scoring_strategy --gcs-max-retries --help --interval-merging-rule --intervals --num-reducers --program-name --sharded-output --single-end-alignment --spark-master --version --showHidden )
        ALL_ARGUMENT_VALUE_TYPES=("List[String]" "String" "String" "List[String]" "boolean" "List[String]" "String" "int" "int" "IntervalSetRule" "Boolean" "List[String]" "List[String]" "ValidationStringency" "List[File]" "boolean" "boolean" "LogLevel" "List[File]" "long" "String" "List[String]" "boolean" "MarkDuplicatesScoringStrategy" "int" "boolean" "IntervalMergingRule" "List[String]" "int" "String" "boolean" "boolean" "String" "boolean" "boolean" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "Funcotator" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--data-sources-path --output --reference --ref-version --variant --add-output-sam-program-record --add-output-vcf-command-line --create-output-bam-index --create-output-bam-md5 --create-output-variant-index --create-output-variant-md5 --disable-read-filter --disable-sequence-dictionary-validation --disable-tool-default-read-filters --exclude-intervals --gatk-config-file --input --interval-exclusion-padding --interval-padding --interval-set-rule --lenient --QUIET --read-filter --read-index --read-validation-stringency --seconds-between-progress-updates --sequence-dictionary --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --annotation-default --annotation-override --arguments_file --cloud-index-prefetch-buffer --cloud-prefetch-buffer --disable-bam-index-caching --gcs-max-retries --help --interval-merging-rule --intervals --transcript-list --transcript-selection-mode --version --showHidden )
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=("--output;-O" "--reference;-R" "--variant;-V" "--add-output-sam-program-record;-add-output-sam-program-record" "--add-output-vcf-command-line;-add-output-vcf-command-line" "--create-output-bam-index;-OBI" "--create-output-bam-md5;-OBM" "--create-output-variant-index;-OVI" "--create-output-variant-md5;-OVM" "--disable-read-filter;-DF" "--disable-sequence-dictionary-validation;-disable-sequence-dictionary-validation" "--disable-tool-default-read-filters;-disable-tool-default-read-filters" "--exclude-intervals;-XL" "--input;-I" "--interval-exclusion-padding;-ixp" "--interval-padding;-ip" "--interval-set-rule;-isr" "--lenient;-LE" "--read-filter;-RF" "--read-index;-read-index" "--read-validation-stringency;-VS" "--seconds-between-progress-updates;-seconds-between-progress-updates" "--sequence-dictionary;-sequence-dictionary" "--use-jdk-deflater;-jdk-deflater" "--use-jdk-inflater;-jdk-inflater" "--verbosity;-verbosity" "--cloud-index-prefetch-buffer;-CIPB" "--cloud-prefetch-buffer;-CPB" "--disable-bam-index-caching;-DBIC" "--gcs-max-retries;-gcs-retries" "--help;-h" "--interval-merging-rule;-imr" "--intervals;-L" "--showHidden;-showHidden" )
        MIN_OCCURRENCES=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--data-sources-path --output --reference --ref-version --variant --add-output-sam-program-record --add-output-vcf-command-line --create-output-bam-index --create-output-bam-md5 --create-output-variant-index --create-output-variant-md5 --disable-read-filter --disable-sequence-dictionary-validation --disable-tool-default-read-filters --exclude-intervals --gatk-config-file --input --interval-exclusion-padding --interval-padding --interval-set-rule --lenient --QUIET --read-filter --read-index --read-validation-stringency --seconds-between-progress-updates --sequence-dictionary --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --annotation-default --annotation-override --arguments_file --cloud-index-prefetch-buffer --cloud-prefetch-buffer --disable-bam-index-caching --gcs-max-retries --help --interval-merging-rule --intervals --transcript-list --transcript-selection-mode --version --showHidden )
        ALL_ARGUMENT_VALUE_TYPES=("List[String]" "File" "String" "ReferenceVersionType" "String" "boolean" "boolean" "boolean" "boolean" "boolean" "boolean" "List[String]" "boolean" "boolean" "List[String]" "String" "List[String]" "int" "int" "IntervalSetRule" "boolean" "Boolean" "List[String]" "List[String]" "ValidationStringency" "double" "String" "List[File]" "boolean" "boolean" "LogLevel" "List[String]" "List[String]" "List[File]" "int" "int" "boolean" "int" "boolean" "IntervalMergingRule" "List[String]" "Set[String]" "TranscriptSelectionMode" "boolean" "boolean" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "MappingQualityAvailableReadFilter" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=()
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=()
        MIN_OCCURRENCES=()
        MAX_OCCURRENCES=()
        ALL_LEGAL_ARGUMENTS=()
        ALL_ARGUMENT_VALUE_TYPES=()

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "PathSeqPipelineSpark" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--input --microbe-bwa-image --microbe-fasta --scores-output --taxonomy-file --disable-read-filter --disable-tool-default-read-filters --exclude-intervals --gatk-config-file --interval-exclusion-padding --interval-padding --interval-set-rule --QUIET --read-filter --read-index --read-validation-stringency --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --arguments_file --bam-partition-size --bwa-score-threshold --conf --disable-sequence-dictionary-validation --divide-by-genome-length --dust-mask-quality --dust-t --dust-window --filter-bwa-image --filter-bwa-seed-length --filter-duplicates --filter-metrics --gcs-max-retries --help --host-kmer-thresh --host-min-identity --identity-margin --interval-merging-rule --intervals --is-host-aligned --kmer-file --max-adapter-mismatches --max-alternate-hits --max-masked-bases --microbe-min-seed-length --min-adapter-length --min-base-quality --min-clipped-read-length --min-score-identity --not-normalized-by-kingdom --num-reducers --output --pipeline-reads-per-partition --program-name --quality-threshold --readsPerPartitionOutput --reference --score-metrics --score-warnings --sharded-output --skip-quality-filters --spark-master --version --filter-reads-per-partition --score-reads-per-partition-estimate --showHidden --skip-pre-bwa-repartition )
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=("--input;-I" "--microbe-bwa-image;-MI" "--microbe-fasta;-MF" "--scores-output;-SO" "--taxonomy-file;-T" "--disable-read-filter;-DF" "--disable-tool-default-read-filters;-disable-tool-default-read-filters" "--exclude-intervals;-XL" "--interval-exclusion-padding;-ixp" "--interval-padding;-ip" "--interval-set-rule;-isr" "--read-filter;-RF" "--read-index;-read-index" "--read-validation-stringency;-VS" "--use-jdk-deflater;-jdk-deflater" "--use-jdk-inflater;-jdk-inflater" "--verbosity;-verbosity" "--bwa-score-threshold;-bwa-score-threshold" "--conf;-conf" "--disable-sequence-dictionary-validation;-disable-sequence-dictionary-validation" "--divide-by-genome-length;-divide-by-genome-length" "--dust-mask-quality;-dust-mask-quality" "--dust-t;-dust-t" "--dust-window;-dust-window" "--filter-bwa-image;-FI" "--filter-bwa-seed-length;-filter-bwa-seed-length" "--filter-duplicates;-filter-duplicates" "--filter-metrics;-FM" "--gcs-max-retries;-gcs-retries" "--help;-h" "--host-kmer-thresh;-host-kmer-thresh" "--host-min-identity;-host-min-identity" "--identity-margin;-identity-margin" "--interval-merging-rule;-imr" "--intervals;-L" "--is-host-aligned;-is-host-aligned" "--kmer-file;-K" "--max-adapter-mismatches;-max-adapter-mismatches" "--max-alternate-hits;-max-alternate-hits" "--max-masked-bases;-max-masked-bases" "--microbe-min-seed-length;-microbe-min-seed-length" "--min-adapter-length;-min-adapter-length" "--min-base-quality;-min-base-quality" "--min-clipped-read-length;-min-clipped-read-length" "--min-score-identity;-min-score-identity" "--not-normalized-by-kingdom;-not-normalized-by-kingdom" "--output;-O" "--pipeline-reads-per-partition;-pipeline-reads-per-partition" "--quality-threshold;-quality-threshold" "--reference;-R" "--score-metrics;-SM" "--score-warnings;-SW" "--skip-quality-filters;-skip-quality-filters" "--filter-reads-per-partition;-filter-reads-per-partition" "--score-reads-per-partition-estimate;-score-reads-per-partition-estimate" "--showHidden;-showHidden" "--skip-pre-bwa-repartition;-skip-pre-bwa-repartition" )
        MIN_OCCURRENCES=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--input --microbe-bwa-image --microbe-fasta --scores-output --taxonomy-file --disable-read-filter --disable-tool-default-read-filters --exclude-intervals --gatk-config-file --interval-exclusion-padding --interval-padding --interval-set-rule --QUIET --read-filter --read-index --read-validation-stringency --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --arguments_file --bam-partition-size --bwa-score-threshold --conf --disable-sequence-dictionary-validation --divide-by-genome-length --dust-mask-quality --dust-t --dust-window --filter-bwa-image --filter-bwa-seed-length --filter-duplicates --filter-metrics --gcs-max-retries --help --host-kmer-thresh --host-min-identity --identity-margin --interval-merging-rule --intervals --is-host-aligned --kmer-file --max-adapter-mismatches --max-alternate-hits --max-masked-bases --microbe-min-seed-length --min-adapter-length --min-base-quality --min-clipped-read-length --min-score-identity --not-normalized-by-kingdom --num-reducers --output --pipeline-reads-per-partition --program-name --quality-threshold --readsPerPartitionOutput --reference --score-metrics --score-warnings --sharded-output --skip-quality-filters --spark-master --version --filter-reads-per-partition --score-reads-per-partition-estimate --showHidden --skip-pre-bwa-repartition )
        ALL_ARGUMENT_VALUE_TYPES=("List[String]" "String" "String" "String" "String" "List[String]" "boolean" "List[String]" "String" "int" "int" "IntervalSetRule" "Boolean" "List[String]" "List[String]" "ValidationStringency" "List[File]" "boolean" "boolean" "LogLevel" "List[File]" "long" "int" "List[String]" "boolean" "boolean" "int" "double" "int" "String" "int" "boolean" "String" "int" "boolean" "int" "int" "double" "IntervalMergingRule" "List[String]" "boolean" "String" "int" "int" "int" "int" "int" "int" "int" "double" "boolean" "int" "String" "int" "String" "int" "int" "String" "String" "String" "boolean" "boolean" "String" "boolean" "int" "int" "boolean" "boolean" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "CollectHsMetrics" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--BAIT_INTERVALS --INPUT --OUTPUT --TARGET_INTERVALS --COMPRESSION_LEVEL --CREATE_INDEX --CREATE_MD5_FILE --GA4GH_CLIENT_SECRETS --MAX_RECORDS_IN_RAM --QUIET --REFERENCE_SEQUENCE --TMP_DIR --USE_JDK_DEFLATER --USE_JDK_INFLATER --VALIDATION_STRINGENCY --VERBOSITY --arguments_file --BAIT_SET_NAME --CLIP_OVERLAPPING_READS --COVERAGE_CAP --help --METRIC_ACCUMULATION_LEVEL --MINIMUM_BASE_QUALITY --MINIMUM_MAPPING_QUALITY --NEAR_DISTANCE --PER_BASE_COVERAGE --PER_TARGET_COVERAGE --SAMPLE_SIZE --version --showHidden )
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=("--BAIT_INTERVALS;-BI" "--INPUT;-I" "--OUTPUT;-O" "--TARGET_INTERVALS;-TI" "--REFERENCE_SEQUENCE;-R" "--USE_JDK_DEFLATER;-use_jdk_deflater" "--USE_JDK_INFLATER;-use_jdk_inflater" "--BAIT_SET_NAME;-N" "--COVERAGE_CAP;-covMax" "--help;-h" "--METRIC_ACCUMULATION_LEVEL;-LEVEL" "--MINIMUM_BASE_QUALITY;-Q" "--MINIMUM_MAPPING_QUALITY;-MQ" "--showHidden;-showHidden" )
        MIN_OCCURRENCES=(1 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--BAIT_INTERVALS --INPUT --OUTPUT --TARGET_INTERVALS --COMPRESSION_LEVEL --CREATE_INDEX --CREATE_MD5_FILE --GA4GH_CLIENT_SECRETS --MAX_RECORDS_IN_RAM --QUIET --REFERENCE_SEQUENCE --TMP_DIR --USE_JDK_DEFLATER --USE_JDK_INFLATER --VALIDATION_STRINGENCY --VERBOSITY --arguments_file --BAIT_SET_NAME --CLIP_OVERLAPPING_READS --COVERAGE_CAP --help --METRIC_ACCUMULATION_LEVEL --MINIMUM_BASE_QUALITY --MINIMUM_MAPPING_QUALITY --NEAR_DISTANCE --PER_BASE_COVERAGE --PER_TARGET_COVERAGE --SAMPLE_SIZE --version --showHidden )
        ALL_ARGUMENT_VALUE_TYPES=("List[File]" "File" "File" "List[File]" "int" "Boolean" "boolean" "String" "Integer" "Boolean" "File" "List[File]" "Boolean" "Boolean" "ValidationStringency" "LogLevel" "List[File]" "String" "boolean" "int" "boolean" "Set[MetricAccumulationLevel]" "int" "int" "int" "File" "File" "int" "boolean" "boolean" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "ValidateVariants" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--variant --add-output-sam-program-record --add-output-vcf-command-line --create-output-bam-index --create-output-bam-md5 --create-output-variant-index --create-output-variant-md5 --disable-read-filter --disable-sequence-dictionary-validation --disable-tool-default-read-filters --exclude-intervals --gatk-config-file --input --interval-exclusion-padding --interval-padding --interval-set-rule --lenient --QUIET --read-filter --read-index --read-validation-stringency --seconds-between-progress-updates --sequence-dictionary --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --arguments_file --cloud-index-prefetch-buffer --cloud-prefetch-buffer --dbsnp --disable-bam-index-caching --do-not-validate-filtered-records --gcs-max-retries --help --interval-merging-rule --intervals --reference --validate-GVCF --validation-type-to-exclude --version --warn-on-errors --showHidden )
        MUTUALLY_EXCLUSIVE_ARGS=("--do-not-validate-filtered-records;validate-GVCF" "--validate-GVCF;do-not-validate-filtered-records" )
        SYNONYMOUS_ARGS=("--variant;-V" "--add-output-sam-program-record;-add-output-sam-program-record" "--add-output-vcf-command-line;-add-output-vcf-command-line" "--create-output-bam-index;-OBI" "--create-output-bam-md5;-OBM" "--create-output-variant-index;-OVI" "--create-output-variant-md5;-OVM" "--disable-read-filter;-DF" "--disable-sequence-dictionary-validation;-disable-sequence-dictionary-validation" "--disable-tool-default-read-filters;-disable-tool-default-read-filters" "--exclude-intervals;-XL" "--input;-I" "--interval-exclusion-padding;-ixp" "--interval-padding;-ip" "--interval-set-rule;-isr" "--lenient;-LE" "--read-filter;-RF" "--read-index;-read-index" "--read-validation-stringency;-VS" "--seconds-between-progress-updates;-seconds-between-progress-updates" "--sequence-dictionary;-sequence-dictionary" "--use-jdk-deflater;-jdk-deflater" "--use-jdk-inflater;-jdk-inflater" "--verbosity;-verbosity" "--cloud-index-prefetch-buffer;-CIPB" "--cloud-prefetch-buffer;-CPB" "--dbsnp;-D" "--disable-bam-index-caching;-DBIC" "--do-not-validate-filtered-records;-do-not-validate-filtered-records" "--gcs-max-retries;-gcs-retries" "--help;-h" "--interval-merging-rule;-imr" "--intervals;-L" "--reference;-R" "--validate-GVCF;-gvcf" "--validation-type-to-exclude;-Xtype" "--warn-on-errors;-warn-on-errors" "--showHidden;-showHidden" )
        MIN_OCCURRENCES=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--variant --add-output-sam-program-record --add-output-vcf-command-line --create-output-bam-index --create-output-bam-md5 --create-output-variant-index --create-output-variant-md5 --disable-read-filter --disable-sequence-dictionary-validation --disable-tool-default-read-filters --exclude-intervals --gatk-config-file --input --interval-exclusion-padding --interval-padding --interval-set-rule --lenient --QUIET --read-filter --read-index --read-validation-stringency --seconds-between-progress-updates --sequence-dictionary --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --arguments_file --cloud-index-prefetch-buffer --cloud-prefetch-buffer --dbsnp --disable-bam-index-caching --do-not-validate-filtered-records --gcs-max-retries --help --interval-merging-rule --intervals --reference --validate-GVCF --validation-type-to-exclude --version --warn-on-errors --showHidden )
        ALL_ARGUMENT_VALUE_TYPES=("String" "boolean" "boolean" "boolean" "boolean" "boolean" "boolean" "List[String]" "boolean" "boolean" "List[String]" "String" "List[String]" "int" "int" "IntervalSetRule" "boolean" "Boolean" "List[String]" "List[String]" "ValidationStringency" "double" "String" "List[File]" "boolean" "boolean" "LogLevel" "List[File]" "int" "int" "FeatureInput[VariantContext]" "boolean" "Boolean" "int" "boolean" "IntervalMergingRule" "List[String]" "String" "Boolean" "List[ValidationType]" "boolean" "Boolean" "boolean" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "FilterMutectCalls" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--output --variant --add-output-sam-program-record --add-output-vcf-command-line --create-output-bam-index --create-output-bam-md5 --create-output-variant-index --create-output-variant-md5 --disable-read-filter --disable-sequence-dictionary-validation --disable-tool-default-read-filters --exclude-intervals --gatk-config-file --input --interval-exclusion-padding --interval-padding --interval-set-rule --lenient --QUIET --read-filter --read-index --read-validation-stringency --seconds-between-progress-updates --sequence-dictionary --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --alleles --annotate-with-num-discovered-alleles --arguments_file --base-quality-score-threshold --cloud-index-prefetch-buffer --cloud-prefetch-buffer --contamination-fraction-to-filter --contamination-table --disable-bam-index-caching --gcs-max-retries --genotyping-mode --graph-output --help --heterozygosity --heterozygosity-stdev --indel-heterozygosity --interval-merging-rule --intervals --log-somatic-prior --max-alt-allele-count --max-contamination-probability --max-events-in-region --max-germline-posterior --max-median-fragment-length-difference --max-strand-artifact-probability --min-base-quality-score --min-median-base-quality --min-median-mapping-quality --min-median-read-position --min-strand-artifact-allele-fraction --native-pair-hmm-threads --native-pair-hmm-use-double-precision --normal-artifact-lod --output-mode --reference --sample-ploidy --standard-min-confidence-threshold-for-calling --tumor-lod --unique-alt-read-count --use-new-qual-calculator --version --allow-non-unique-kmers-in-ref --all-site-pls --bam-output --bam-writer-type --consensus --contamination-fraction-per-sample-file --debug --do-not-run-physical-phasing --dont-increase-kmer-sizes-for-cycles --dont-trim-active-regions --dont-use-soft-clipped-bases --input-prior --kmer-size --max-alternate-alleles --max-genotype-count --max-num-haplotypes-in-population --min-dangling-branch-length --min-pruning --num-pruning-samples --pair-hmm-gap-continuation-penalty --pcr-indel-model --phred-scaled-global-read-mismapping-rate --showHidden --smith-waterman --use-filtered-reads-for-annotations --recover-dangling-heads )
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=("--output;-O" "--variant;-V" "--add-output-sam-program-record;-add-output-sam-program-record" "--add-output-vcf-command-line;-add-output-vcf-command-line" "--create-output-bam-index;-OBI" "--create-output-bam-md5;-OBM" "--create-output-variant-index;-OVI" "--create-output-variant-md5;-OVM" "--disable-read-filter;-DF" "--disable-sequence-dictionary-validation;-disable-sequence-dictionary-validation" "--disable-tool-default-read-filters;-disable-tool-default-read-filters" "--exclude-intervals;-XL" "--input;-I" "--interval-exclusion-padding;-ixp" "--interval-padding;-ip" "--interval-set-rule;-isr" "--lenient;-LE" "--read-filter;-RF" "--read-index;-read-index" "--read-validation-stringency;-VS" "--seconds-between-progress-updates;-seconds-between-progress-updates" "--sequence-dictionary;-sequence-dictionary" "--use-jdk-deflater;-jdk-deflater" "--use-jdk-inflater;-jdk-inflater" "--verbosity;-verbosity" "--cloud-index-prefetch-buffer;-CIPB" "--cloud-prefetch-buffer;-CPB" "--contamination-fraction-to-filter;-contamination" "--disable-bam-index-caching;-DBIC" "--gcs-max-retries;-gcs-retries" "--graph-output;-graph" "--help;-h" "--interval-merging-rule;-imr" "--intervals;-L" "--max-strand-artifact-probability;-strand-prob" "--min-base-quality-score;-mbq" "--min-strand-artifact-allele-fraction;-strand-af" "--reference;-R" "--sample-ploidy;-ploidy" "--standard-min-confidence-threshold-for-calling;-stand-call-conf" "--unique-alt-read-count;-unique" "--use-new-qual-calculator;-new-qual" "--bam-output;-bamout" "--contamination-fraction-per-sample-file;-contamination-file" "--debug;-debug" "--showHidden;-showHidden" )
        MIN_OCCURRENCES=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--output --variant --add-output-sam-program-record --add-output-vcf-command-line --create-output-bam-index --create-output-bam-md5 --create-output-variant-index --create-output-variant-md5 --disable-read-filter --disable-sequence-dictionary-validation --disable-tool-default-read-filters --exclude-intervals --gatk-config-file --input --interval-exclusion-padding --interval-padding --interval-set-rule --lenient --QUIET --read-filter --read-index --read-validation-stringency --seconds-between-progress-updates --sequence-dictionary --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --alleles --annotate-with-num-discovered-alleles --arguments_file --base-quality-score-threshold --cloud-index-prefetch-buffer --cloud-prefetch-buffer --contamination-fraction-to-filter --contamination-table --disable-bam-index-caching --gcs-max-retries --genotyping-mode --graph-output --help --heterozygosity --heterozygosity-stdev --indel-heterozygosity --interval-merging-rule --intervals --log-somatic-prior --max-alt-allele-count --max-contamination-probability --max-events-in-region --max-germline-posterior --max-median-fragment-length-difference --max-strand-artifact-probability --min-base-quality-score --min-median-base-quality --min-median-mapping-quality --min-median-read-position --min-strand-artifact-allele-fraction --native-pair-hmm-threads --native-pair-hmm-use-double-precision --normal-artifact-lod --output-mode --reference --sample-ploidy --standard-min-confidence-threshold-for-calling --tumor-lod --unique-alt-read-count --use-new-qual-calculator --version --allow-non-unique-kmers-in-ref --all-site-pls --bam-output --bam-writer-type --consensus --contamination-fraction-per-sample-file --debug --do-not-run-physical-phasing --dont-increase-kmer-sizes-for-cycles --dont-trim-active-regions --dont-use-soft-clipped-bases --input-prior --kmer-size --max-alternate-alleles --max-genotype-count --max-num-haplotypes-in-population --min-dangling-branch-length --min-pruning --num-pruning-samples --pair-hmm-gap-continuation-penalty --pcr-indel-model --phred-scaled-global-read-mismapping-rate --showHidden --smith-waterman --use-filtered-reads-for-annotations --recover-dangling-heads )
        ALL_ARGUMENT_VALUE_TYPES=("String" "String" "boolean" "boolean" "boolean" "boolean" "boolean" "boolean" "List[String]" "boolean" "boolean" "List[String]" "String" "List[String]" "int" "int" "IntervalSetRule" "boolean" "Boolean" "List[String]" "List[String]" "ValidationStringency" "double" "String" "List[File]" "boolean" "boolean" "LogLevel" "FeatureInput[VariantContext]" "boolean" "List[File]" "byte" "int" "int" "double" "File" "boolean" "int" "GenotypingOutputMode" "String" "boolean" "Double" "double" "double" "IntervalMergingRule" "List[String]" "double" "int" "double" "int" "double" "int" "double" "byte" "int" "int" "int" "double" "int" "boolean" "double" "OutputMode" "String" "int" "double" "double" "int" "boolean" "boolean" "boolean" "boolean" "String" "WriterType" "boolean" "File" "boolean" "boolean" "boolean" "boolean" "boolean" "List[Double]" "List[Integer]" "int" "int" "int" "int" "int" "int" "int" "PCRErrorModel" "int" "boolean" "Implementation" "boolean" "boolean" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "CrosscheckFingerprints" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--HAPLOTYPE_MAP --INPUT --COMPRESSION_LEVEL --CREATE_INDEX --CREATE_MD5_FILE --GA4GH_CLIENT_SECRETS --MAX_RECORDS_IN_RAM --QUIET --REFERENCE_SEQUENCE --TMP_DIR --USE_JDK_DEFLATER --USE_JDK_INFLATER --VALIDATION_STRINGENCY --VERBOSITY --ALLOW_DUPLICATE_READS --arguments_file --CROSSCHECK_BY --EXIT_CODE_WHEN_MISMATCH --EXPECT_ALL_GROUPS_TO_MATCH --GENOTYPING_ERROR_RATE --help --LOD_THRESHOLD --LOSS_OF_HET_RATE --MATRIX_OUTPUT --NUM_THREADS --OUTPUT --OUTPUT_ERRORS_ONLY --SECOND_INPUT --version --showHidden )
        MUTUALLY_EXCLUSIVE_ARGS=("--MATRIX_OUTPUT;SECOND_INPUT" "--SECOND_INPUT;MATRIX_OUTPUT,MO" )
        SYNONYMOUS_ARGS=("--HAPLOTYPE_MAP;-H" "--INPUT;-I" "--REFERENCE_SEQUENCE;-R" "--USE_JDK_DEFLATER;-use_jdk_deflater" "--USE_JDK_INFLATER;-use_jdk_inflater" "--help;-h" "--LOD_THRESHOLD;-LOD" "--MATRIX_OUTPUT;-MO" "--OUTPUT;-O" "--SECOND_INPUT;-SI" "--showHidden;-showHidden" )
        MIN_OCCURRENCES=(0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--HAPLOTYPE_MAP --INPUT --COMPRESSION_LEVEL --CREATE_INDEX --CREATE_MD5_FILE --GA4GH_CLIENT_SECRETS --MAX_RECORDS_IN_RAM --QUIET --REFERENCE_SEQUENCE --TMP_DIR --USE_JDK_DEFLATER --USE_JDK_INFLATER --VALIDATION_STRINGENCY --VERBOSITY --ALLOW_DUPLICATE_READS --arguments_file --CROSSCHECK_BY --EXIT_CODE_WHEN_MISMATCH --EXPECT_ALL_GROUPS_TO_MATCH --GENOTYPING_ERROR_RATE --help --LOD_THRESHOLD --LOSS_OF_HET_RATE --MATRIX_OUTPUT --NUM_THREADS --OUTPUT --OUTPUT_ERRORS_ONLY --SECOND_INPUT --version --showHidden )
        ALL_ARGUMENT_VALUE_TYPES=("File" "List[File]" "int" "Boolean" "boolean" "String" "Integer" "Boolean" "File" "List[File]" "Boolean" "Boolean" "ValidationStringency" "LogLevel" "boolean" "List[File]" "DataType" "int" "boolean" "double" "boolean" "double" "double" "File" "int" "File" "boolean" "List[File]" "boolean" "boolean" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "SplitIntervals" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--output --add-output-sam-program-record --add-output-vcf-command-line --create-output-bam-index --create-output-bam-md5 --create-output-variant-index --create-output-variant-md5 --disable-read-filter --disable-sequence-dictionary-validation --disable-tool-default-read-filters --exclude-intervals --gatk-config-file --input --interval-exclusion-padding --interval-padding --interval-set-rule --lenient --QUIET --read-filter --read-index --read-validation-stringency --seconds-between-progress-updates --sequence-dictionary --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --arguments_file --cloud-index-prefetch-buffer --cloud-prefetch-buffer --disable-bam-index-caching --gcs-max-retries --help --interval-merging-rule --intervals --reference --scatter-count --subdivision-mode --version --showHidden )
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=("--output;-O" "--add-output-sam-program-record;-add-output-sam-program-record" "--add-output-vcf-command-line;-add-output-vcf-command-line" "--create-output-bam-index;-OBI" "--create-output-bam-md5;-OBM" "--create-output-variant-index;-OVI" "--create-output-variant-md5;-OVM" "--disable-read-filter;-DF" "--disable-sequence-dictionary-validation;-disable-sequence-dictionary-validation" "--disable-tool-default-read-filters;-disable-tool-default-read-filters" "--exclude-intervals;-XL" "--input;-I" "--interval-exclusion-padding;-ixp" "--interval-padding;-ip" "--interval-set-rule;-isr" "--lenient;-LE" "--read-filter;-RF" "--read-index;-read-index" "--read-validation-stringency;-VS" "--seconds-between-progress-updates;-seconds-between-progress-updates" "--sequence-dictionary;-sequence-dictionary" "--use-jdk-deflater;-jdk-deflater" "--use-jdk-inflater;-jdk-inflater" "--verbosity;-verbosity" "--cloud-index-prefetch-buffer;-CIPB" "--cloud-prefetch-buffer;-CPB" "--disable-bam-index-caching;-DBIC" "--gcs-max-retries;-gcs-retries" "--help;-h" "--interval-merging-rule;-imr" "--intervals;-L" "--reference;-R" "--scatter-count;-scatter" "--subdivision-mode;-mode" "--showHidden;-showHidden" )
        MIN_OCCURRENCES=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--output --add-output-sam-program-record --add-output-vcf-command-line --create-output-bam-index --create-output-bam-md5 --create-output-variant-index --create-output-variant-md5 --disable-read-filter --disable-sequence-dictionary-validation --disable-tool-default-read-filters --exclude-intervals --gatk-config-file --input --interval-exclusion-padding --interval-padding --interval-set-rule --lenient --QUIET --read-filter --read-index --read-validation-stringency --seconds-between-progress-updates --sequence-dictionary --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --arguments_file --cloud-index-prefetch-buffer --cloud-prefetch-buffer --disable-bam-index-caching --gcs-max-retries --help --interval-merging-rule --intervals --reference --scatter-count --subdivision-mode --version --showHidden )
        ALL_ARGUMENT_VALUE_TYPES=("File" "boolean" "boolean" "boolean" "boolean" "boolean" "boolean" "List[String]" "boolean" "boolean" "List[String]" "String" "List[String]" "int" "int" "IntervalSetRule" "boolean" "Boolean" "List[String]" "List[String]" "ValidationStringency" "double" "String" "List[File]" "boolean" "boolean" "LogLevel" "List[File]" "int" "int" "boolean" "int" "boolean" "IntervalMergingRule" "List[String]" "String" "int" "Mode" "boolean" "boolean" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "FragmentLengthReadFilter" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--max-fragment-length )
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=()
        MIN_OCCURRENCES=(0 )
        MAX_OCCURRENCES=(2147483647 )
        ALL_LEGAL_ARGUMENTS=(--max-fragment-length )
        ALL_ARGUMENT_VALUE_TYPES=("int" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "AmbiguousBaseReadFilter" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--ambig-filter-bases --ambig-filter-frac )
        MUTUALLY_EXCLUSIVE_ARGS=("--ambig-filter-bases;ambig-filter-frac" "--ambig-filter-frac;ambig-filter-bases" )
        SYNONYMOUS_ARGS=()
        MIN_OCCURRENCES=(0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--ambig-filter-bases --ambig-filter-frac )
        ALL_ARGUMENT_VALUE_TYPES=("Integer" "double" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "ApplyBQSRSpark" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--bqsr-recal-file --input --output --disable-read-filter --disable-tool-default-read-filters --exclude-intervals --gatk-config-file --interval-exclusion-padding --interval-padding --interval-set-rule --QUIET --read-filter --read-index --read-validation-stringency --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --arguments_file --bam-partition-size --conf --disable-sequence-dictionary-validation --emit-original-quals --gcs-max-retries --global-qscore-prior --help --interval-merging-rule --intervals --num-reducers --preserve-qscores-less-than --program-name --quantize-quals --reference --sharded-output --spark-master --use-original-qualities --version --round-down-quantized --showHidden --static-quantized-quals )
        MUTUALLY_EXCLUSIVE_ARGS=("--quantize-quals;static-quantized-quals,round-down-quantized" "--round-down-quantized;quantize-quals" "--static-quantized-quals;quantize-quals" )
        SYNONYMOUS_ARGS=("--bqsr-recal-file;-bqsr" "--input;-I" "--output;-O" "--disable-read-filter;-DF" "--disable-tool-default-read-filters;-disable-tool-default-read-filters" "--exclude-intervals;-XL" "--interval-exclusion-padding;-ixp" "--interval-padding;-ip" "--interval-set-rule;-isr" "--read-filter;-RF" "--read-index;-read-index" "--read-validation-stringency;-VS" "--use-jdk-deflater;-jdk-deflater" "--use-jdk-inflater;-jdk-inflater" "--verbosity;-verbosity" "--conf;-conf" "--disable-sequence-dictionary-validation;-disable-sequence-dictionary-validation" "--gcs-max-retries;-gcs-retries" "--help;-h" "--interval-merging-rule;-imr" "--intervals;-L" "--reference;-R" "--use-original-qualities;-OQ" "--showHidden;-showHidden" )
        MIN_OCCURRENCES=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--bqsr-recal-file --input --output --disable-read-filter --disable-tool-default-read-filters --exclude-intervals --gatk-config-file --interval-exclusion-padding --interval-padding --interval-set-rule --QUIET --read-filter --read-index --read-validation-stringency --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --arguments_file --bam-partition-size --conf --disable-sequence-dictionary-validation --emit-original-quals --gcs-max-retries --global-qscore-prior --help --interval-merging-rule --intervals --num-reducers --preserve-qscores-less-than --program-name --quantize-quals --reference --sharded-output --spark-master --use-original-qualities --version --round-down-quantized --showHidden --static-quantized-quals )
        ALL_ARGUMENT_VALUE_TYPES=("String" "List[String]" "String" "List[String]" "boolean" "List[String]" "String" "int" "int" "IntervalSetRule" "Boolean" "List[String]" "List[String]" "ValidationStringency" "List[File]" "boolean" "boolean" "LogLevel" "List[File]" "long" "List[String]" "boolean" "boolean" "int" "double" "boolean" "IntervalMergingRule" "List[String]" "int" "int" "String" "int" "String" "boolean" "String" "Boolean" "boolean" "boolean" "boolean" "List[Integer]" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "CalcMetadataSpark" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--input --output --disable-read-filter --disable-tool-default-read-filters --exclude-intervals --gatk-config-file --interval-exclusion-padding --interval-padding --interval-set-rule --QUIET --read-filter --read-index --read-validation-stringency --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --arguments_file --bam-partition-size --conf --disable-sequence-dictionary-validation --gcs-max-retries --help --interval-merging-rule --intervals --num-reducers --program-name --reference --sharded-output --spark-master --version --write-as-binary --showHidden )
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=("--input;-I" "--output;-O" "--disable-read-filter;-DF" "--disable-tool-default-read-filters;-disable-tool-default-read-filters" "--exclude-intervals;-XL" "--interval-exclusion-padding;-ixp" "--interval-padding;-ip" "--interval-set-rule;-isr" "--read-filter;-RF" "--read-index;-read-index" "--read-validation-stringency;-VS" "--use-jdk-deflater;-jdk-deflater" "--use-jdk-inflater;-jdk-inflater" "--verbosity;-verbosity" "--conf;-conf" "--disable-sequence-dictionary-validation;-disable-sequence-dictionary-validation" "--gcs-max-retries;-gcs-retries" "--help;-h" "--interval-merging-rule;-imr" "--intervals;-L" "--reference;-R" "--showHidden;-showHidden" )
        MIN_OCCURRENCES=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--input --output --disable-read-filter --disable-tool-default-read-filters --exclude-intervals --gatk-config-file --interval-exclusion-padding --interval-padding --interval-set-rule --QUIET --read-filter --read-index --read-validation-stringency --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --arguments_file --bam-partition-size --conf --disable-sequence-dictionary-validation --gcs-max-retries --help --interval-merging-rule --intervals --num-reducers --program-name --reference --sharded-output --spark-master --version --write-as-binary --showHidden )
        ALL_ARGUMENT_VALUE_TYPES=("List[String]" "String" "List[String]" "boolean" "List[String]" "String" "int" "int" "IntervalSetRule" "Boolean" "List[String]" "List[String]" "ValidationStringency" "List[File]" "boolean" "boolean" "LogLevel" "List[File]" "long" "List[String]" "boolean" "int" "boolean" "IntervalMergingRule" "List[String]" "int" "String" "String" "boolean" "String" "boolean" "boolean" "boolean" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "SortSam" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--INPUT --OUTPUT --SORT_ORDER --COMPRESSION_LEVEL --CREATE_INDEX --CREATE_MD5_FILE --GA4GH_CLIENT_SECRETS --MAX_RECORDS_IN_RAM --QUIET --REFERENCE_SEQUENCE --TMP_DIR --USE_JDK_DEFLATER --USE_JDK_INFLATER --VALIDATION_STRINGENCY --VERBOSITY --arguments_file --help --version --showHidden )
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=("--INPUT;-I" "--OUTPUT;-O" "--SORT_ORDER;-SO" "--REFERENCE_SEQUENCE;-R" "--USE_JDK_DEFLATER;-use_jdk_deflater" "--USE_JDK_INFLATER;-use_jdk_inflater" "--help;-h" "--showHidden;-showHidden" )
        MIN_OCCURRENCES=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--INPUT --OUTPUT --SORT_ORDER --COMPRESSION_LEVEL --CREATE_INDEX --CREATE_MD5_FILE --GA4GH_CLIENT_SECRETS --MAX_RECORDS_IN_RAM --QUIET --REFERENCE_SEQUENCE --TMP_DIR --USE_JDK_DEFLATER --USE_JDK_INFLATER --VALIDATION_STRINGENCY --VERBOSITY --arguments_file --help --version --showHidden )
        ALL_ARGUMENT_VALUE_TYPES=("File" "File" "SortOrder" "int" "Boolean" "boolean" "String" "Integer" "Boolean" "File" "List[File]" "Boolean" "Boolean" "ValidationStringency" "LogLevel" "List[File]" "boolean" "boolean" "boolean" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "StructuralVariationDiscoveryPipelineSpark" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--aligner-index-image --contig-sam-file --input --kmers-to-ignore --output --reference --disable-read-filter --disable-tool-default-read-filters --exclude-intervals --gatk-config-file --interval-exclusion-padding --interval-padding --interval-set-rule --QUIET --read-filter --read-index --read-validation-stringency --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --adapter-sequence --allowed-short-fragment-overhang --arguments_file --assembled-contigs-output-order --assembly-imprecise-evidence-overlap-uncertainty --assembly-to-mapped-size-ratio-guess --bam-partition-size --breakpoint-evidence-dir --breakpoint-intervals --cleaner-max-copy-number --cleaner-max-intervals --cleaner-min-kmer-count --cnv-calls --conf --cross-contigs-to-ignore --disable-sequence-dictionary-validation --exclusion-interval-padding --exclusion-intervals --external-evidence --external-evidence-uncertainty --external-evidence-weight --fastq-dir --gcs-max-retries --help --imprecise-variant-evidence-threshold --include-mapping-location --interval-merging-rule --interval-only-assembly --intervals --kmer-intervals --kmer-max-dust-score --k-size --max-callable-imprecise-deletion-size --max-fastq-size --max-interval-coverage --max-tracked-fragment-length --min-align-length --min-coherent-evidence-count --min-evidence-count --min-evidence-mapq --min-evidence-match-length --min-kmers-per-interval --num-reducers --program-name --qname-intervals-for-assembly --qname-intervals-mapped --read-metadata --sharded-output --spark-master --target-link-file --truth-interval-padding --unfiltered-breakpoint-evidence-dir --version --write-gfas --exp-variants-out-dir --showHidden )
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=("--input;-I" "--output;-O" "--reference;-R" "--disable-read-filter;-DF" "--disable-tool-default-read-filters;-disable-tool-default-read-filters" "--exclude-intervals;-XL" "--interval-exclusion-padding;-ixp" "--interval-padding;-ip" "--interval-set-rule;-isr" "--read-filter;-RF" "--read-index;-read-index" "--read-validation-stringency;-VS" "--use-jdk-deflater;-jdk-deflater" "--use-jdk-inflater;-jdk-inflater" "--verbosity;-verbosity" "--assembled-contigs-output-order;-sort" "--conf;-conf" "--disable-sequence-dictionary-validation;-disable-sequence-dictionary-validation" "--gcs-max-retries;-gcs-retries" "--help;-h" "--interval-merging-rule;-imr" "--intervals;-L" "--showHidden;-showHidden" )
        MIN_OCCURRENCES=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--aligner-index-image --contig-sam-file --input --kmers-to-ignore --output --reference --disable-read-filter --disable-tool-default-read-filters --exclude-intervals --gatk-config-file --interval-exclusion-padding --interval-padding --interval-set-rule --QUIET --read-filter --read-index --read-validation-stringency --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --adapter-sequence --allowed-short-fragment-overhang --arguments_file --assembled-contigs-output-order --assembly-imprecise-evidence-overlap-uncertainty --assembly-to-mapped-size-ratio-guess --bam-partition-size --breakpoint-evidence-dir --breakpoint-intervals --cleaner-max-copy-number --cleaner-max-intervals --cleaner-min-kmer-count --cnv-calls --conf --cross-contigs-to-ignore --disable-sequence-dictionary-validation --exclusion-interval-padding --exclusion-intervals --external-evidence --external-evidence-uncertainty --external-evidence-weight --fastq-dir --gcs-max-retries --help --imprecise-variant-evidence-threshold --include-mapping-location --interval-merging-rule --interval-only-assembly --intervals --kmer-intervals --kmer-max-dust-score --k-size --max-callable-imprecise-deletion-size --max-fastq-size --max-interval-coverage --max-tracked-fragment-length --min-align-length --min-coherent-evidence-count --min-evidence-count --min-evidence-mapq --min-evidence-match-length --min-kmers-per-interval --num-reducers --program-name --qname-intervals-for-assembly --qname-intervals-mapped --read-metadata --sharded-output --spark-master --target-link-file --truth-interval-padding --unfiltered-breakpoint-evidence-dir --version --write-gfas --exp-variants-out-dir --showHidden )
        ALL_ARGUMENT_VALUE_TYPES=("String" "String" "List[String]" "String" "String" "String" "List[String]" "boolean" "List[String]" "String" "int" "int" "IntervalSetRule" "Boolean" "List[String]" "List[String]" "ValidationStringency" "List[File]" "boolean" "boolean" "LogLevel" "String" "int" "List[File]" "SortOrder" "int" "int" "long" "String" "String" "int" "int" "int" "String" "List[String]" "String" "boolean" "int" "String" "String" "int" "int" "String" "int" "boolean" "int" "boolean" "IntervalMergingRule" "boolean" "List[String]" "String" "int" "int" "int" "int" "int" "int" "Integer" "int" "int" "int" "int" "int" "int" "String" "String" "String" "String" "boolean" "String" "String" "int" "String" "boolean" "boolean" "String" "boolean" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "NonZeroReferenceLengthAlignmentReadFilter" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=()
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=()
        MIN_OCCURRENCES=()
        MAX_OCCURRENCES=()
        ALL_LEGAL_ARGUMENTS=()
        ALL_ARGUMENT_VALUE_TYPES=()

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "ValidateSamFile" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--INPUT --COMPRESSION_LEVEL --CREATE_INDEX --CREATE_MD5_FILE --GA4GH_CLIENT_SECRETS --MAX_RECORDS_IN_RAM --QUIET --REFERENCE_SEQUENCE --TMP_DIR --USE_JDK_DEFLATER --USE_JDK_INFLATER --VALIDATION_STRINGENCY --VERBOSITY --arguments_file --help --IGNORE --IGNORE_WARNINGS --INDEX_VALIDATION_STRINGENCY --IS_BISULFITE_SEQUENCED --MAX_OPEN_TEMP_FILES --MAX_OUTPUT --MODE --OUTPUT --SKIP_MATE_VALIDATION --VALIDATE_INDEX --version --showHidden )
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=("--INPUT;-I" "--REFERENCE_SEQUENCE;-R" "--USE_JDK_DEFLATER;-use_jdk_deflater" "--USE_JDK_INFLATER;-use_jdk_inflater" "--help;-h" "--IS_BISULFITE_SEQUENCED;-BISULFITE" "--MAX_OUTPUT;-MO" "--MODE;-M" "--OUTPUT;-O" "--SKIP_MATE_VALIDATION;-SMV" "--showHidden;-showHidden" )
        MIN_OCCURRENCES=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--INPUT --COMPRESSION_LEVEL --CREATE_INDEX --CREATE_MD5_FILE --GA4GH_CLIENT_SECRETS --MAX_RECORDS_IN_RAM --QUIET --REFERENCE_SEQUENCE --TMP_DIR --USE_JDK_DEFLATER --USE_JDK_INFLATER --VALIDATION_STRINGENCY --VERBOSITY --arguments_file --help --IGNORE --IGNORE_WARNINGS --INDEX_VALIDATION_STRINGENCY --IS_BISULFITE_SEQUENCED --MAX_OPEN_TEMP_FILES --MAX_OUTPUT --MODE --OUTPUT --SKIP_MATE_VALIDATION --VALIDATE_INDEX --version --showHidden )
        ALL_ARGUMENT_VALUE_TYPES=("File" "int" "Boolean" "boolean" "String" "Integer" "Boolean" "File" "List[File]" "Boolean" "Boolean" "ValidationStringency" "LogLevel" "List[File]" "boolean" "List[Type]" "boolean" "IndexValidationStringency" "boolean" "int" "Integer" "Mode" "File" "boolean" "boolean" "boolean" "boolean" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "CollectGcBiasMetrics" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--CHART_OUTPUT --INPUT --OUTPUT --SUMMARY_OUTPUT --COMPRESSION_LEVEL --CREATE_INDEX --CREATE_MD5_FILE --GA4GH_CLIENT_SECRETS --MAX_RECORDS_IN_RAM --QUIET --REFERENCE_SEQUENCE --TMP_DIR --USE_JDK_DEFLATER --USE_JDK_INFLATER --VALIDATION_STRINGENCY --VERBOSITY --ALSO_IGNORE_DUPLICATES --arguments_file --ASSUME_SORTED --help --IS_BISULFITE_SEQUENCED --METRIC_ACCUMULATION_LEVEL --MINIMUM_GENOME_FRACTION --SCAN_WINDOW_SIZE --STOP_AFTER --version --showHidden )
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=("--CHART_OUTPUT;-CHART" "--INPUT;-I" "--OUTPUT;-O" "--SUMMARY_OUTPUT;-S" "--REFERENCE_SEQUENCE;-R" "--USE_JDK_DEFLATER;-use_jdk_deflater" "--USE_JDK_INFLATER;-use_jdk_inflater" "--ALSO_IGNORE_DUPLICATES;-ALSO_IGNORE_DUPLICATES" "--ASSUME_SORTED;-AS" "--help;-h" "--IS_BISULFITE_SEQUENCED;-BS" "--METRIC_ACCUMULATION_LEVEL;-LEVEL" "--MINIMUM_GENOME_FRACTION;-MGF" "--SCAN_WINDOW_SIZE;-WINDOW_SIZE" "--showHidden;-showHidden" )
        MIN_OCCURRENCES=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--CHART_OUTPUT --INPUT --OUTPUT --SUMMARY_OUTPUT --COMPRESSION_LEVEL --CREATE_INDEX --CREATE_MD5_FILE --GA4GH_CLIENT_SECRETS --MAX_RECORDS_IN_RAM --QUIET --REFERENCE_SEQUENCE --TMP_DIR --USE_JDK_DEFLATER --USE_JDK_INFLATER --VALIDATION_STRINGENCY --VERBOSITY --ALSO_IGNORE_DUPLICATES --arguments_file --ASSUME_SORTED --help --IS_BISULFITE_SEQUENCED --METRIC_ACCUMULATION_LEVEL --MINIMUM_GENOME_FRACTION --SCAN_WINDOW_SIZE --STOP_AFTER --version --showHidden )
        ALL_ARGUMENT_VALUE_TYPES=("File" "File" "File" "File" "int" "Boolean" "boolean" "String" "Integer" "Boolean" "File" "List[File]" "Boolean" "Boolean" "ValidationStringency" "LogLevel" "boolean" "List[File]" "boolean" "boolean" "boolean" "Set[MetricAccumulationLevel]" "double" "int" "long" "boolean" "boolean" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "SplitVcfs" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--INDEL_OUTPUT --INPUT --SNP_OUTPUT --COMPRESSION_LEVEL --CREATE_INDEX --CREATE_MD5_FILE --GA4GH_CLIENT_SECRETS --MAX_RECORDS_IN_RAM --QUIET --REFERENCE_SEQUENCE --TMP_DIR --USE_JDK_DEFLATER --USE_JDK_INFLATER --VALIDATION_STRINGENCY --VERBOSITY --arguments_file --help --SEQUENCE_DICTIONARY --STRICT --version --showHidden )
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=("--INPUT;-I" "--REFERENCE_SEQUENCE;-R" "--USE_JDK_DEFLATER;-use_jdk_deflater" "--USE_JDK_INFLATER;-use_jdk_inflater" "--help;-h" "--SEQUENCE_DICTIONARY;-D" "--showHidden;-showHidden" )
        MIN_OCCURRENCES=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--INDEL_OUTPUT --INPUT --SNP_OUTPUT --COMPRESSION_LEVEL --CREATE_INDEX --CREATE_MD5_FILE --GA4GH_CLIENT_SECRETS --MAX_RECORDS_IN_RAM --QUIET --REFERENCE_SEQUENCE --TMP_DIR --USE_JDK_DEFLATER --USE_JDK_INFLATER --VALIDATION_STRINGENCY --VERBOSITY --arguments_file --help --SEQUENCE_DICTIONARY --STRICT --version --showHidden )
        ALL_ARGUMENT_VALUE_TYPES=("File" "File" "File" "int" "Boolean" "boolean" "String" "Integer" "Boolean" "File" "List[File]" "Boolean" "Boolean" "ValidationStringency" "LogLevel" "List[File]" "boolean" "File" "Boolean" "boolean" "boolean" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "LeftAlignIndels" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--input --OUTPUT --reference --add-output-sam-program-record --add-output-vcf-command-line --create-output-bam-index --create-output-bam-md5 --create-output-variant-index --create-output-variant-md5 --disable-read-filter --disable-sequence-dictionary-validation --disable-tool-default-read-filters --exclude-intervals --gatk-config-file --interval-exclusion-padding --interval-padding --interval-set-rule --lenient --QUIET --read-filter --read-index --read-validation-stringency --seconds-between-progress-updates --sequence-dictionary --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --arguments_file --cloud-index-prefetch-buffer --cloud-prefetch-buffer --disable-bam-index-caching --gcs-max-retries --help --interval-merging-rule --intervals --version --showHidden )
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=("--input;-I" "--reference;-R" "--add-output-sam-program-record;-add-output-sam-program-record" "--add-output-vcf-command-line;-add-output-vcf-command-line" "--create-output-bam-index;-OBI" "--create-output-bam-md5;-OBM" "--create-output-variant-index;-OVI" "--create-output-variant-md5;-OVM" "--disable-read-filter;-DF" "--disable-sequence-dictionary-validation;-disable-sequence-dictionary-validation" "--disable-tool-default-read-filters;-disable-tool-default-read-filters" "--exclude-intervals;-XL" "--interval-exclusion-padding;-ixp" "--interval-padding;-ip" "--interval-set-rule;-isr" "--lenient;-LE" "--read-filter;-RF" "--read-index;-read-index" "--read-validation-stringency;-VS" "--seconds-between-progress-updates;-seconds-between-progress-updates" "--sequence-dictionary;-sequence-dictionary" "--use-jdk-deflater;-jdk-deflater" "--use-jdk-inflater;-jdk-inflater" "--verbosity;-verbosity" "--cloud-index-prefetch-buffer;-CIPB" "--cloud-prefetch-buffer;-CPB" "--disable-bam-index-caching;-DBIC" "--gcs-max-retries;-gcs-retries" "--help;-h" "--interval-merging-rule;-imr" "--intervals;-L" "--showHidden;-showHidden" )
        MIN_OCCURRENCES=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--input --OUTPUT --reference --add-output-sam-program-record --add-output-vcf-command-line --create-output-bam-index --create-output-bam-md5 --create-output-variant-index --create-output-variant-md5 --disable-read-filter --disable-sequence-dictionary-validation --disable-tool-default-read-filters --exclude-intervals --gatk-config-file --interval-exclusion-padding --interval-padding --interval-set-rule --lenient --QUIET --read-filter --read-index --read-validation-stringency --seconds-between-progress-updates --sequence-dictionary --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --arguments_file --cloud-index-prefetch-buffer --cloud-prefetch-buffer --disable-bam-index-caching --gcs-max-retries --help --interval-merging-rule --intervals --version --showHidden )
        ALL_ARGUMENT_VALUE_TYPES=("List[String]" "File" "String" "boolean" "boolean" "boolean" "boolean" "boolean" "boolean" "List[String]" "boolean" "boolean" "List[String]" "String" "int" "int" "IntervalSetRule" "boolean" "Boolean" "List[String]" "List[String]" "ValidationStringency" "double" "String" "List[File]" "boolean" "boolean" "LogLevel" "List[File]" "int" "int" "boolean" "int" "boolean" "IntervalMergingRule" "List[String]" "boolean" "boolean" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "CreateHadoopBamSplittingIndex" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--input --gatk-config-file --QUIET --read-validation-stringency --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --arguments_file --create-bai --gcs-max-retries --help --output --splitting-index-granularity --version --showHidden )
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=("--input;-I" "--read-validation-stringency;-VS" "--use-jdk-deflater;-jdk-deflater" "--use-jdk-inflater;-jdk-inflater" "--verbosity;-verbosity" "--gcs-max-retries;-gcs-retries" "--help;-h" "--output;-O" "--showHidden;-showHidden" )
        MIN_OCCURRENCES=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--input --gatk-config-file --QUIET --read-validation-stringency --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --arguments_file --create-bai --gcs-max-retries --help --output --splitting-index-granularity --version --showHidden )
        ALL_ARGUMENT_VALUE_TYPES=("File" "String" "Boolean" "ValidationStringency" "List[File]" "boolean" "boolean" "LogLevel" "List[File]" "boolean" "int" "boolean" "File" "int" "boolean" "boolean" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "CrosscheckReadGroupFingerprints" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--HAPLOTYPE_MAP --INPUT --COMPRESSION_LEVEL --CREATE_INDEX --CREATE_MD5_FILE --GA4GH_CLIENT_SECRETS --MAX_RECORDS_IN_RAM --QUIET --REFERENCE_SEQUENCE --TMP_DIR --USE_JDK_DEFLATER --USE_JDK_INFLATER --VALIDATION_STRINGENCY --VERBOSITY --ALLOW_DUPLICATE_READS --arguments_file --CROSSCHECK_BY --CROSSCHECK_LIBRARIES --CROSSCHECK_SAMPLES --EXIT_CODE_WHEN_MISMATCH --EXPECT_ALL_GROUPS_TO_MATCH --EXPECT_ALL_READ_GROUPS_TO_MATCH --GENOTYPING_ERROR_RATE --help --LOD_THRESHOLD --LOSS_OF_HET_RATE --MATRIX_OUTPUT --NUM_THREADS --OUTPUT --OUTPUT_ERRORS_ONLY --SECOND_INPUT --version --showHidden )
        MUTUALLY_EXCLUSIVE_ARGS=("--EXPECT_ALL_READ_GROUPS_TO_MATCH;EXPECT_ALL_GROUPS_TO_MATCH" "--MATRIX_OUTPUT;SECOND_INPUT" "--SECOND_INPUT;MATRIX_OUTPUT,MO" )
        SYNONYMOUS_ARGS=("--HAPLOTYPE_MAP;-H" "--INPUT;-I" "--REFERENCE_SEQUENCE;-R" "--USE_JDK_DEFLATER;-use_jdk_deflater" "--USE_JDK_INFLATER;-use_jdk_inflater" "--help;-h" "--LOD_THRESHOLD;-LOD" "--MATRIX_OUTPUT;-MO" "--OUTPUT;-O" "--SECOND_INPUT;-SI" "--showHidden;-showHidden" )
        MIN_OCCURRENCES=(0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--HAPLOTYPE_MAP --INPUT --COMPRESSION_LEVEL --CREATE_INDEX --CREATE_MD5_FILE --GA4GH_CLIENT_SECRETS --MAX_RECORDS_IN_RAM --QUIET --REFERENCE_SEQUENCE --TMP_DIR --USE_JDK_DEFLATER --USE_JDK_INFLATER --VALIDATION_STRINGENCY --VERBOSITY --ALLOW_DUPLICATE_READS --arguments_file --CROSSCHECK_BY --CROSSCHECK_LIBRARIES --CROSSCHECK_SAMPLES --EXIT_CODE_WHEN_MISMATCH --EXPECT_ALL_GROUPS_TO_MATCH --EXPECT_ALL_READ_GROUPS_TO_MATCH --GENOTYPING_ERROR_RATE --help --LOD_THRESHOLD --LOSS_OF_HET_RATE --MATRIX_OUTPUT --NUM_THREADS --OUTPUT --OUTPUT_ERRORS_ONLY --SECOND_INPUT --version --showHidden )
        ALL_ARGUMENT_VALUE_TYPES=("File" "List[File]" "int" "Boolean" "boolean" "String" "Integer" "Boolean" "File" "List[File]" "Boolean" "Boolean" "ValidationStringency" "LogLevel" "boolean" "List[File]" "DataType" "boolean" "boolean" "int" "boolean" "boolean" "double" "boolean" "double" "double" "File" "int" "File" "boolean" "List[File]" "boolean" "boolean" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "CollectBaseDistributionByCycleSpark" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--disable-read-filter --disable-tool-default-read-filters --exclude-intervals --gatk-config-file --input --interval-exclusion-padding --interval-padding --interval-set-rule --QUIET --read-filter --read-index --read-validation-stringency --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --aligned-reads-only --arguments_file --bam-partition-size --chart --conf --disable-sequence-dictionary-validation --gcs-max-retries --help --interval-merging-rule --intervals --num-reducers --output --pf-reads-only --program-name --reference --sharded-output --spark-master --version --showHidden )
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=("--disable-read-filter;-DF" "--disable-tool-default-read-filters;-disable-tool-default-read-filters" "--exclude-intervals;-XL" "--input;-I" "--interval-exclusion-padding;-ixp" "--interval-padding;-ip" "--interval-set-rule;-isr" "--read-filter;-RF" "--read-index;-read-index" "--read-validation-stringency;-VS" "--use-jdk-deflater;-jdk-deflater" "--use-jdk-inflater;-jdk-inflater" "--verbosity;-verbosity" "--aligned-reads-only;-A" "--chart;-C" "--conf;-conf" "--disable-sequence-dictionary-validation;-disable-sequence-dictionary-validation" "--gcs-max-retries;-gcs-retries" "--help;-h" "--interval-merging-rule;-imr" "--intervals;-L" "--output;-O" "--pf-reads-only;-F" "--reference;-R" "--showHidden;-showHidden" )
        MIN_OCCURRENCES=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--disable-read-filter --disable-tool-default-read-filters --exclude-intervals --gatk-config-file --input --interval-exclusion-padding --interval-padding --interval-set-rule --QUIET --read-filter --read-index --read-validation-stringency --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --aligned-reads-only --arguments_file --bam-partition-size --chart --conf --disable-sequence-dictionary-validation --gcs-max-retries --help --interval-merging-rule --intervals --num-reducers --output --pf-reads-only --program-name --reference --sharded-output --spark-master --version --showHidden )
        ALL_ARGUMENT_VALUE_TYPES=("List[String]" "boolean" "List[String]" "String" "List[String]" "int" "int" "IntervalSetRule" "Boolean" "List[String]" "List[String]" "ValidationStringency" "List[File]" "boolean" "boolean" "LogLevel" "boolean" "List[File]" "long" "File" "List[String]" "boolean" "int" "boolean" "IntervalMergingRule" "List[String]" "int" "String" "boolean" "String" "String" "boolean" "String" "boolean" "boolean" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "CalculateGenotypePosteriors" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--output --variant --add-output-sam-program-record --add-output-vcf-command-line --create-output-bam-index --create-output-bam-md5 --create-output-variant-index --create-output-variant-md5 --disable-read-filter --disable-sequence-dictionary-validation --disable-tool-default-read-filters --exclude-intervals --gatk-config-file --input --interval-exclusion-padding --interval-padding --interval-set-rule --lenient --QUIET --read-filter --read-index --read-validation-stringency --seconds-between-progress-updates --sequence-dictionary --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --arguments_file --cloud-index-prefetch-buffer --cloud-prefetch-buffer --default-to-allele-count --de-novo-prior --disable-bam-index-caching --discovered-allele-count-priors-off --gcs-max-retries --global-prior --help --ignore-input-samples --interval-merging-rule --intervals --num-reference-samples-if-no-call --pedigree --reference --skip-family-priors --skip-population-priors --supporting-callsets --version --showHidden )
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=("--output;-O" "--variant;-V" "--add-output-sam-program-record;-add-output-sam-program-record" "--add-output-vcf-command-line;-add-output-vcf-command-line" "--create-output-bam-index;-OBI" "--create-output-bam-md5;-OBM" "--create-output-variant-index;-OVI" "--create-output-variant-md5;-OVM" "--disable-read-filter;-DF" "--disable-sequence-dictionary-validation;-disable-sequence-dictionary-validation" "--disable-tool-default-read-filters;-disable-tool-default-read-filters" "--exclude-intervals;-XL" "--input;-I" "--interval-exclusion-padding;-ixp" "--interval-padding;-ip" "--interval-set-rule;-isr" "--lenient;-LE" "--read-filter;-RF" "--read-index;-read-index" "--read-validation-stringency;-VS" "--seconds-between-progress-updates;-seconds-between-progress-updates" "--sequence-dictionary;-sequence-dictionary" "--use-jdk-deflater;-jdk-deflater" "--use-jdk-inflater;-jdk-inflater" "--verbosity;-verbosity" "--cloud-index-prefetch-buffer;-CIPB" "--cloud-prefetch-buffer;-CPB" "--disable-bam-index-caching;-DBIC" "--gcs-max-retries;-gcs-retries" "--help;-h" "--interval-merging-rule;-imr" "--intervals;-L" "--pedigree;-ped" "--reference;-R" "--supporting-callsets;-supporting" "--showHidden;-showHidden" )
        MIN_OCCURRENCES=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--output --variant --add-output-sam-program-record --add-output-vcf-command-line --create-output-bam-index --create-output-bam-md5 --create-output-variant-index --create-output-variant-md5 --disable-read-filter --disable-sequence-dictionary-validation --disable-tool-default-read-filters --exclude-intervals --gatk-config-file --input --interval-exclusion-padding --interval-padding --interval-set-rule --lenient --QUIET --read-filter --read-index --read-validation-stringency --seconds-between-progress-updates --sequence-dictionary --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --arguments_file --cloud-index-prefetch-buffer --cloud-prefetch-buffer --default-to-allele-count --de-novo-prior --disable-bam-index-caching --discovered-allele-count-priors-off --gcs-max-retries --global-prior --help --ignore-input-samples --interval-merging-rule --intervals --num-reference-samples-if-no-call --pedigree --reference --skip-family-priors --skip-population-priors --supporting-callsets --version --showHidden )
        ALL_ARGUMENT_VALUE_TYPES=("File" "String" "boolean" "boolean" "boolean" "boolean" "boolean" "boolean" "List[String]" "boolean" "boolean" "List[String]" "String" "List[String]" "int" "int" "IntervalSetRule" "boolean" "Boolean" "List[String]" "List[String]" "ValidationStringency" "double" "String" "List[File]" "boolean" "boolean" "LogLevel" "List[File]" "int" "int" "boolean" "double" "boolean" "boolean" "int" "double" "boolean" "boolean" "IntervalMergingRule" "List[String]" "int" "File" "String" "boolean" "boolean" "List[FeatureInput[VariantContext]]" "boolean" "boolean" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "NonZeroFragmentLengthReadFilter" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=()
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=()
        MIN_OCCURRENCES=()
        MAX_OCCURRENCES=()
        ALL_LEGAL_ARGUMENTS=()
        ALL_ARGUMENT_VALUE_TYPES=()

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "GenotypeSummaries" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=()
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=()
        MIN_OCCURRENCES=()
        MAX_OCCURRENCES=()
        ALL_LEGAL_ARGUMENTS=()
        ALL_ARGUMENT_VALUE_TYPES=()

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "CollectTargetedPcrMetrics" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--AMPLICON_INTERVALS --INPUT --OUTPUT --TARGET_INTERVALS --COMPRESSION_LEVEL --CREATE_INDEX --CREATE_MD5_FILE --GA4GH_CLIENT_SECRETS --MAX_RECORDS_IN_RAM --QUIET --REFERENCE_SEQUENCE --TMP_DIR --USE_JDK_DEFLATER --USE_JDK_INFLATER --VALIDATION_STRINGENCY --VERBOSITY --arguments_file --CLIP_OVERLAPPING_READS --COVERAGE_CAP --CUSTOM_AMPLICON_SET_NAME --help --METRIC_ACCUMULATION_LEVEL --MINIMUM_BASE_QUALITY --MINIMUM_MAPPING_QUALITY --NEAR_DISTANCE --PER_BASE_COVERAGE --PER_TARGET_COVERAGE --SAMPLE_SIZE --version --showHidden )
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=("--AMPLICON_INTERVALS;-AI" "--INPUT;-I" "--OUTPUT;-O" "--TARGET_INTERVALS;-TI" "--REFERENCE_SEQUENCE;-R" "--USE_JDK_DEFLATER;-use_jdk_deflater" "--USE_JDK_INFLATER;-use_jdk_inflater" "--COVERAGE_CAP;-covMax" "--CUSTOM_AMPLICON_SET_NAME;-N" "--help;-h" "--METRIC_ACCUMULATION_LEVEL;-LEVEL" "--MINIMUM_BASE_QUALITY;-Q" "--MINIMUM_MAPPING_QUALITY;-MQ" "--showHidden;-showHidden" )
        MIN_OCCURRENCES=(0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--AMPLICON_INTERVALS --INPUT --OUTPUT --TARGET_INTERVALS --COMPRESSION_LEVEL --CREATE_INDEX --CREATE_MD5_FILE --GA4GH_CLIENT_SECRETS --MAX_RECORDS_IN_RAM --QUIET --REFERENCE_SEQUENCE --TMP_DIR --USE_JDK_DEFLATER --USE_JDK_INFLATER --VALIDATION_STRINGENCY --VERBOSITY --arguments_file --CLIP_OVERLAPPING_READS --COVERAGE_CAP --CUSTOM_AMPLICON_SET_NAME --help --METRIC_ACCUMULATION_LEVEL --MINIMUM_BASE_QUALITY --MINIMUM_MAPPING_QUALITY --NEAR_DISTANCE --PER_BASE_COVERAGE --PER_TARGET_COVERAGE --SAMPLE_SIZE --version --showHidden )
        ALL_ARGUMENT_VALUE_TYPES=("File" "File" "File" "List[File]" "int" "Boolean" "boolean" "String" "Integer" "Boolean" "File" "List[File]" "Boolean" "Boolean" "ValidationStringency" "LogLevel" "List[File]" "boolean" "int" "String" "boolean" "Set[MetricAccumulationLevel]" "int" "int" "int" "File" "File" "int" "boolean" "boolean" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "CollectAllelicCounts" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--input --intervals --output --reference --add-output-sam-program-record --add-output-vcf-command-line --create-output-bam-index --create-output-bam-md5 --create-output-variant-index --create-output-variant-md5 --disable-read-filter --disable-sequence-dictionary-validation --disable-tool-default-read-filters --exclude-intervals --gatk-config-file --interval-exclusion-padding --interval-padding --interval-set-rule --lenient --QUIET --read-filter --read-index --read-validation-stringency --seconds-between-progress-updates --sequence-dictionary --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --arguments_file --cloud-index-prefetch-buffer --cloud-prefetch-buffer --disable-bam-index-caching --gcs-max-retries --help --interval-merging-rule --maxDepthPerSample --minimum-base-quality --version --showHidden )
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=("--input;-I" "--intervals;-L" "--output;-O" "--reference;-R" "--add-output-sam-program-record;-add-output-sam-program-record" "--add-output-vcf-command-line;-add-output-vcf-command-line" "--create-output-bam-index;-OBI" "--create-output-bam-md5;-OBM" "--create-output-variant-index;-OVI" "--create-output-variant-md5;-OVM" "--disable-read-filter;-DF" "--disable-sequence-dictionary-validation;-disable-sequence-dictionary-validation" "--disable-tool-default-read-filters;-disable-tool-default-read-filters" "--exclude-intervals;-XL" "--interval-exclusion-padding;-ixp" "--interval-padding;-ip" "--interval-set-rule;-isr" "--lenient;-LE" "--read-filter;-RF" "--read-index;-read-index" "--read-validation-stringency;-VS" "--seconds-between-progress-updates;-seconds-between-progress-updates" "--sequence-dictionary;-sequence-dictionary" "--use-jdk-deflater;-jdk-deflater" "--use-jdk-inflater;-jdk-inflater" "--verbosity;-verbosity" "--cloud-index-prefetch-buffer;-CIPB" "--cloud-prefetch-buffer;-CPB" "--disable-bam-index-caching;-DBIC" "--gcs-max-retries;-gcs-retries" "--help;-h" "--interval-merging-rule;-imr" "--maxDepthPerSample;-maxDepthPerSample" "--showHidden;-showHidden" )
        MIN_OCCURRENCES=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--input --intervals --output --reference --add-output-sam-program-record --add-output-vcf-command-line --create-output-bam-index --create-output-bam-md5 --create-output-variant-index --create-output-variant-md5 --disable-read-filter --disable-sequence-dictionary-validation --disable-tool-default-read-filters --exclude-intervals --gatk-config-file --interval-exclusion-padding --interval-padding --interval-set-rule --lenient --QUIET --read-filter --read-index --read-validation-stringency --seconds-between-progress-updates --sequence-dictionary --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --arguments_file --cloud-index-prefetch-buffer --cloud-prefetch-buffer --disable-bam-index-caching --gcs-max-retries --help --interval-merging-rule --maxDepthPerSample --minimum-base-quality --version --showHidden )
        ALL_ARGUMENT_VALUE_TYPES=("List[String]" "List[String]" "File" "String" "boolean" "boolean" "boolean" "boolean" "boolean" "boolean" "List[String]" "boolean" "boolean" "List[String]" "String" "int" "int" "IntervalSetRule" "boolean" "Boolean" "List[String]" "List[String]" "ValidationStringency" "double" "String" "List[File]" "boolean" "boolean" "LogLevel" "List[File]" "int" "int" "boolean" "int" "boolean" "IntervalMergingRule" "int" "int" "boolean" "boolean" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "StrandOddsRatio" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=()
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=()
        MIN_OCCURRENCES=()
        MAX_OCCURRENCES=()
        ALL_LEGAL_ARGUMENTS=()
        ALL_ARGUMENT_VALUE_TYPES=()

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "BwaMemIndexImageCreator" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--input --gatk-config-file --QUIET --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --arguments_file --gcs-max-retries --help --output --version --showHidden )
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=("--input;-I" "--use-jdk-deflater;-jdk-deflater" "--use-jdk-inflater;-jdk-inflater" "--verbosity;-verbosity" "--gcs-max-retries;-gcs-retries" "--help;-h" "--output;-O" "--showHidden;-showHidden" )
        MIN_OCCURRENCES=(0 0 0 0 0 0 0 0 0 0 0 0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--input --gatk-config-file --QUIET --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --arguments_file --gcs-max-retries --help --output --version --showHidden )
        ALL_ARGUMENT_VALUE_TYPES=("String" "String" "Boolean" "List[File]" "boolean" "boolean" "LogLevel" "List[File]" "int" "boolean" "String" "boolean" "boolean" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "PlotModeledSegments" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--output --output-prefix --segments --sequence-dictionary --gatk-config-file --QUIET --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --allelic-counts --arguments_file --denoised-copy-ratios --gcs-max-retries --help --minimum-contig-length --version --showHidden )
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=("--output;-O" "--sequence-dictionary;-sequence-dictionary" "--use-jdk-deflater;-jdk-deflater" "--use-jdk-inflater;-jdk-inflater" "--verbosity;-verbosity" "--gcs-max-retries;-gcs-retries" "--help;-h" "--showHidden;-showHidden" )
        MIN_OCCURRENCES=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--output --output-prefix --segments --sequence-dictionary --gatk-config-file --QUIET --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --allelic-counts --arguments_file --denoised-copy-ratios --gcs-max-retries --help --minimum-contig-length --version --showHidden )
        ALL_ARGUMENT_VALUE_TYPES=("String" "String" "File" "File" "String" "Boolean" "List[File]" "boolean" "boolean" "LogLevel" "File" "List[File]" "File" "int" "boolean" "int" "boolean" "boolean" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "RemoveNearbyIndels" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--output --variant --add-output-sam-program-record --add-output-vcf-command-line --create-output-bam-index --create-output-bam-md5 --create-output-variant-index --create-output-variant-md5 --disable-read-filter --disable-sequence-dictionary-validation --disable-tool-default-read-filters --exclude-intervals --gatk-config-file --input --interval-exclusion-padding --interval-padding --interval-set-rule --lenient --QUIET --read-filter --read-index --read-validation-stringency --seconds-between-progress-updates --sequence-dictionary --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --arguments_file --cloud-index-prefetch-buffer --cloud-prefetch-buffer --disable-bam-index-caching --gcs-max-retries --help --interval-merging-rule --intervals --min-indel-spacing --reference --version --showHidden )
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=("--output;-O" "--variant;-V" "--add-output-sam-program-record;-add-output-sam-program-record" "--add-output-vcf-command-line;-add-output-vcf-command-line" "--create-output-bam-index;-OBI" "--create-output-bam-md5;-OBM" "--create-output-variant-index;-OVI" "--create-output-variant-md5;-OVM" "--disable-read-filter;-DF" "--disable-sequence-dictionary-validation;-disable-sequence-dictionary-validation" "--disable-tool-default-read-filters;-disable-tool-default-read-filters" "--exclude-intervals;-XL" "--input;-I" "--interval-exclusion-padding;-ixp" "--interval-padding;-ip" "--interval-set-rule;-isr" "--lenient;-LE" "--read-filter;-RF" "--read-index;-read-index" "--read-validation-stringency;-VS" "--seconds-between-progress-updates;-seconds-between-progress-updates" "--sequence-dictionary;-sequence-dictionary" "--use-jdk-deflater;-jdk-deflater" "--use-jdk-inflater;-jdk-inflater" "--verbosity;-verbosity" "--cloud-index-prefetch-buffer;-CIPB" "--cloud-prefetch-buffer;-CPB" "--disable-bam-index-caching;-DBIC" "--gcs-max-retries;-gcs-retries" "--help;-h" "--interval-merging-rule;-imr" "--intervals;-L" "--min-indel-spacing;-min-indel-spacing" "--reference;-R" "--showHidden;-showHidden" )
        MIN_OCCURRENCES=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--output --variant --add-output-sam-program-record --add-output-vcf-command-line --create-output-bam-index --create-output-bam-md5 --create-output-variant-index --create-output-variant-md5 --disable-read-filter --disable-sequence-dictionary-validation --disable-tool-default-read-filters --exclude-intervals --gatk-config-file --input --interval-exclusion-padding --interval-padding --interval-set-rule --lenient --QUIET --read-filter --read-index --read-validation-stringency --seconds-between-progress-updates --sequence-dictionary --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --arguments_file --cloud-index-prefetch-buffer --cloud-prefetch-buffer --disable-bam-index-caching --gcs-max-retries --help --interval-merging-rule --intervals --min-indel-spacing --reference --version --showHidden )
        ALL_ARGUMENT_VALUE_TYPES=("String" "String" "boolean" "boolean" "boolean" "boolean" "boolean" "boolean" "List[String]" "boolean" "boolean" "List[String]" "String" "List[String]" "int" "int" "IntervalSetRule" "boolean" "Boolean" "List[String]" "List[String]" "ValidationStringency" "double" "String" "List[File]" "boolean" "boolean" "LogLevel" "List[File]" "int" "int" "boolean" "int" "boolean" "IntervalMergingRule" "List[String]" "int" "String" "boolean" "boolean" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "PreprocessIntervals" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=(--output --reference --add-output-sam-program-record --add-output-vcf-command-line --create-output-bam-index --create-output-bam-md5 --create-output-variant-index --create-output-variant-md5 --disable-read-filter --disable-sequence-dictionary-validation --disable-tool-default-read-filters --exclude-intervals --gatk-config-file --input --interval-exclusion-padding --interval-padding --interval-set-rule --lenient --QUIET --read-filter --read-index --read-validation-stringency --seconds-between-progress-updates --sequence-dictionary --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --arguments_file --bin-length --cloud-index-prefetch-buffer --cloud-prefetch-buffer --disable-bam-index-caching --gcs-max-retries --help --interval-merging-rule --intervals --padding --version --showHidden )
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=("--output;-O" "--reference;-R" "--add-output-sam-program-record;-add-output-sam-program-record" "--add-output-vcf-command-line;-add-output-vcf-command-line" "--create-output-bam-index;-OBI" "--create-output-bam-md5;-OBM" "--create-output-variant-index;-OVI" "--create-output-variant-md5;-OVM" "--disable-read-filter;-DF" "--disable-sequence-dictionary-validation;-disable-sequence-dictionary-validation" "--disable-tool-default-read-filters;-disable-tool-default-read-filters" "--exclude-intervals;-XL" "--input;-I" "--interval-exclusion-padding;-ixp" "--interval-padding;-ip" "--interval-set-rule;-isr" "--lenient;-LE" "--read-filter;-RF" "--read-index;-read-index" "--read-validation-stringency;-VS" "--seconds-between-progress-updates;-seconds-between-progress-updates" "--sequence-dictionary;-sequence-dictionary" "--use-jdk-deflater;-jdk-deflater" "--use-jdk-inflater;-jdk-inflater" "--verbosity;-verbosity" "--cloud-index-prefetch-buffer;-CIPB" "--cloud-prefetch-buffer;-CPB" "--disable-bam-index-caching;-DBIC" "--gcs-max-retries;-gcs-retries" "--help;-h" "--interval-merging-rule;-imr" "--intervals;-L" "--showHidden;-showHidden" )
        MIN_OCCURRENCES=(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 )
        MAX_OCCURRENCES=(2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 2147483647 )
        ALL_LEGAL_ARGUMENTS=(--output --reference --add-output-sam-program-record --add-output-vcf-command-line --create-output-bam-index --create-output-bam-md5 --create-output-variant-index --create-output-variant-md5 --disable-read-filter --disable-sequence-dictionary-validation --disable-tool-default-read-filters --exclude-intervals --gatk-config-file --input --interval-exclusion-padding --interval-padding --interval-set-rule --lenient --QUIET --read-filter --read-index --read-validation-stringency --seconds-between-progress-updates --sequence-dictionary --TMP_DIR --use-jdk-deflater --use-jdk-inflater --verbosity --arguments_file --bin-length --cloud-index-prefetch-buffer --cloud-prefetch-buffer --disable-bam-index-caching --gcs-max-retries --help --interval-merging-rule --intervals --padding --version --showHidden )
        ALL_ARGUMENT_VALUE_TYPES=("File" "String" "boolean" "boolean" "boolean" "boolean" "boolean" "boolean" "List[String]" "boolean" "boolean" "List[String]" "String" "List[String]" "int" "int" "IntervalSetRule" "boolean" "Boolean" "List[String]" "List[String]" "ValidationStringency" "double" "String" "List[File]" "boolean" "boolean" "LogLevel" "List[File]" "int" "int" "int" "boolean" "int" "boolean" "IntervalMergingRule" "List[String]" "int" "boolean" "boolean" )

        # Complete the arguments for this tool:
        _gatk_handleArgs
    elif [[ ${toolName} == "GoodCigarReadFilter" ]] ; then

        # Set up the completion information for this tool:
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=()
        MUTUALLY_EXCLUSIVE_ARGS=()
        SYNONYMOUS_ARGS=()
        MIN_OCCURRENCES=()
        MAX_OCCURRENCES=()
        ALL_LEGAL_ARGUMENTS=()
        ALL_ARGUMENT_VALUE_TYPES=()

        # Complete the arguments for this tool:
        _gatk_handleArgs

    # We have no postfix options or tool options.
    # We now must complete any prefix options and the tools themselves.
    # These are defined at the top.
    else
        NUM_POSITIONAL_ARGUMENTS=0
        POSITIONAL_ARGUMENT_TYPE=()
        DEPENDENT_ARGUMENTS=()
        NORMAL_COMPLETION_ARGUMENTS=("${CS_PREFIX_OPTIONS_NORMAL_COMPLETION_ARGUMENTS[@]}")
        MUTUALLY_EXCLUSIVE_ARGS=("${CS_PREFIX_OPTIONS_MUTUALLY_EXCLUSIVE_ARGS[@]}")
        SYNONYMOUS_ARGS=("${CS_PREFIX_OPTIONS_SYNONYMOUS_ARGS[@]}")
        MIN_OCCURRENCES=("${CS_PREFIX_OPTIONS_MIN_OCCURRENCES[@]}")
        MAX_OCCURRENCES=("${CS_PREFIX_OPTIONS_MAX_OCCURRENCES[@]}")
        ALL_LEGAL_ARGUMENTS=("${CS_PREFIX_OPTIONS_ALL_LEGAL_ARGUMENTS[@]}")
        ALL_ARGUMENT_VALUE_TYPES=("${CS_PREFIX_OPTIONS_ALL_ARGUMENT_VALUE_TYPES[@]}")

        # Complete the arguments for the prefix arguments and tools:
        _gatk_handleArgs PREFIX_OPTIONS
    fi
}

complete -o default -F _gatk_masterCompletionFunction ${CALLER_SCRIPT_NAME}



