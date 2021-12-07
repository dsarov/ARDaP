# PhenoDB Test

It is not necessary to test the validity of a database that has just been
cloned. The main reason for running tests are to test a database that has been
altered. The tests run are by no mean exhaustive and will not guarantee a valid
database.

This file will test the validity of the databases installed in the default
locations. These are:
- [resfinder app dir]/db_resfinder
- [resfinder app dir]/db_pointfinder
Where [resfinder app dir] is the root directory of the ResFinder application.
You will find the "run_resfinder.py" file in this directory.

Run the following command to test validity of databases.

```bash

python3 -m doctest database_test.md

```

*Note*: Change the database locations to be tested by changing the first three
lines of the python code below in this file.

```python

>>> db_resfinder = "db_resfinder/"
>>> db_pointfinder = "db_pointfinder/"
```

## Test phenotype.txt and resistens-overview.txt files

```python

>>> from cge.phenotype2genotype.res_profile import PhenoDB

>>> phenodb = PhenoDB(
...    abclassdef_file="{}antibiotic_classes.txt".format(db_resfinder),
...    acquired_file="{}phenotypes.txt".format(db_resfinder),
...    point_file="{}campylobacter/resistens-overview.txt".format(db_pointfinder),

>>> phenodb = PhenoDB(
...    abclassdef_file="{}antibiotic_classes.txt".format(db_resfinder),
...    point_file="{}enterococcus_faecalis/resistens-overview.txt".format(db_pointfinder))

>>> phenodb = PhenoDB(
...    abclassdef_file="{}antibiotic_classes.txt".format(db_resfinder),
...    point_file="{}enterococcus_faecium/resistens-overview.txt".format(db_pointfinder))

>>> phenodb = PhenoDB(
...    abclassdef_file="{}antibiotic_classes.txt".format(db_resfinder),
...    point_file="{}escherichia_coli/resistens-overview.txt".format(db_pointfinder))

>>> phenodb = PhenoDB(
...    abclassdef_file="{}antibiotic_classes.txt".format(db_resfinder),
...    point_file="{}helicobacter_pylori/resistens-overview.txt".format(db_pointfinder))

>>> phenodb = PhenoDB(
...    abclassdef_file="{}antibiotic_classes.txt".format(db_resfinder),
...    point_file="{}klebsiella/resistens-overview.txt".format(db_pointfinder))

>>> phenodb = PhenoDB(
...    abclassdef_file="{}antibiotic_classes.txt".format(db_resfinder),
...    point_file="{}mycobacterium_tuberculosis/resistens-overview.txt".format(db_pointfinder))

>>> phenodb = PhenoDB(
...    abclassdef_file="{}antibiotic_classes.txt".format(db_resfinder),
...    point_file="{}neisseria_gonorrhoeae/resistens-overview.txt".format(db_pointfinder))

>>> phenodb = PhenoDB(
...    abclassdef_file="{}antibiotic_classes.txt".format(db_resfinder),
...    point_file="{}plasmodium_falciparum/resistens-overview.txt".format(db_pointfinder))

>>> phenodb = PhenoDB(
...    abclassdef_file="{}antibiotic_classes.txt".format(db_resfinder),
...    point_file="{}salmonella/resistens-overview.txt".format(db_pointfinder))

>>> phenodb = PhenoDB(
...    abclassdef_file="{}antibiotic_classes.txt".format(db_resfinder),
...    point_file="{}staphylococcus_aureus/resistens-overview.txt".format(db_pointfinder))


```
