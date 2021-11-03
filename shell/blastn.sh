
    #!/bin/sh

    ## name of Job
    #PBS -N BLASTN_Yeti

    ## Redirect output stream to this file.
    #PBS -o /media/inter/mkapun/projects/MinION_TestRuns/results/lambda/BLAST/lambda_100kb_log.txt

    ## Stream Standard Output AND Standard Error to outputfile (see above)
    #PBS -j oe

    ## Select a maximum of 20 cores and 200gb of RAM
    #PBS -l select=1:ncpus=100:mem=200gb

    ######## load dependencies #######

    module load Alignment/ncbi-BLAST-2.12.0

    ######## run analyses #######

    blastn \
      -num_threads 100 \
      -evalue 1e-100 \
      -outfmt "6 qseqid sseqid sscinames slen qlen pident length mismatch gapopen qstart qend sstart send evalue bitscore" \
      -db /media/scratch/NCBI_nt_DB_210714/nt \
      -query /media/inter/mkapun/projects/MinION_TestRuns/results/lambda/BLAST/lambda_100kb.fa \
      > /media/inter/mkapun/projects/MinION_TestRuns/results/lambda/BLAST/lambda_100kb_blastn.txt


