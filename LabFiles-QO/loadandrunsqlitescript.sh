#!/bin/bash

# loadandrunsqlitescript.sh <database> <script> <output> <log>
#
#  loads the database $2 into sqlite3, making it current, and 
#  causes sqlite3 to executes the SQLite script $3 on $2
#  *overwriting* the output onto output file $4 and
#  *appending* the timings into log file $5,
#  timing out at $1 minutes
#
# one may wish to:
#
#  ln -s loadandrunsqlitescript.sh tlarss.sh
#
# then, example invocation:
#
#  . tlarss.sh 2 my.db my.sql my.out my.log
#
# then, after two invocations as above, example log:
#
#  Sun 16 Oct 15:36:51 BST 2016
#  E-C07KILF503.it.manchester.ac.uk 2 my.db my.sql my.out
#  1.60user 0.06system 0:10.67elapsed 15%CPU (0avgtext+0avgdata 2428maxresident)k
#  5336inputs+194824outputs (0major+698minor)pagefaults 0swaps
#  Sun 16 Oct 15:40:37 BST 2016
#  E-C07KILF503.it.manchester.ac.uk 2 my.db my.sql my.out
#  2.34user 0.07system 0:11.73elapsed 20%CPU (0avgtext+0avgdata 2420maxresident)k
#  5336inputs+194840outputs (0major+696minor)pagefaults 0swaps

(
 now=date
 $now >$3
 $now >>$4
 echo $HOSTNAME $1 $2 $3 >>$3
 echo $HOSTNAME $1 $2 $3 >>$4
 time sqlite3 $1 >>$3 < $2
) 2>>$4
