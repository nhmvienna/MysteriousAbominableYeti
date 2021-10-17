##### In this excercise, we will reconstruct a phylogeny of 12s rRNA sequences of a diverse set of 14 mammalian samples and include the unknown DNA sample from Nepal

# In the previous excercise, you have downloaded the Git Repository "MysteriousAbominableYeti" to your home directory. Let's first explore what we can find in this Repository.

# with the command "cd" you can move around directories. You are still in your home directory, let's explore the new Repository. Remember, you can use the Tab key to autocomplete file and foldernames in UNIX. Let's try it. Type the following in the terminal window and press the tab key. What happens?

cd Mys

# this should be autocompleted to

cd MysteriousAbominableYeti

# now press "Enter". You will realize that the commandline has changed. The text in the square brackets now ends with "MysteriousAbominableYeti", which indicates that you are within this folder. Explore the content of "MysteriousAbominableYeti" with "ls -l"

ls -l

# This commands lists the three folders ".bckup", "data" and shell that you have already seen in the left panel of the ATOM editor.

## (1) as a first excercise, we will concatenate the multifasta file containing the mammalian samples with the sequence of the unknown hair sample from Nepal. The UNIX command to combine two or multiple files line by line is called "cat". We use it to concatenate "Mammals_12s.fasta" and "Nepal_hair_12s.fa". The operator ">" tells "cat" to store the output in a new file called "Complete_12s.fa"

cat ~/MysteriousAbominableYeti/data/Mammals_12s.fa ~/MysteriousAbominableYeti/data/Nepal_hair_12s.fa \
  > ~/MysteriousAbominableYeti/data/Complete_12s.fa

## 2) In a second step, we will produce a multiple alignment of the 15 samples. We will use the program mafft for this. Let's see if mafft is already available. Type "mafft" in the commandline

mafft

# the repsonse by shell: "bash: mafft: Befehl nicht gefunden..." indicate that the shell is not able to find the program "mafft". we need to tell shell to load the installation path of mafft into it's environment first. This can be done with the distribution manager conda:

conda activate mafft-7.487

# Note that the commandline now shows in parantheses that the "base" environment has changed to the "mafft-7.487" environment. If you now type "mafft" again, you will see that mafft has been correctly loaded and awaits input. you can kill this process with the shortcut "ctrl"+"c"

# now you could start the multiple alignment directly from the commandline using the following command.

# mafft --auto ~/MysteriousAbominableYeti/data/Complete_12s.fa > ~/MysteriousAbominableYeti/results/mafft/Complete_12s_mafft.fa

# HOWEVER, we should develop the habit of using the OpenPBS job scheduler for computationally demanding tasks like multiple alignments, etc. Please read the OpenPBS tutorial at https://github.com/nhmvienna/FirstSteps/blob/main/Bioinformatics/OpenPBS.md carefully for more details.

# In brief, you need to write a short Shellscript that tells OpenPBS what to do and which resources to provide for your task. First, you need to provide the so called SheBang line, which tells where the shell is located: #!/bin/sh, then you can provide the name of the task with #PBS -N <name>, the output for the log files #PBS -o <outputfile> and the resources, for example #PBS -l select=1:ncpus=20:mem=200gb i.e. use a maximum of 20 cores and 200GB of RAM. After that, you need to load the software dependencies (see https://github.com/nhmvienna/FirstSteps/blob/main/Bioinformatics/SoftwareList.md for all installed software). Then finally, you continue with the commands for your analyses. Below, is an example of such a shell script to run the mafft command. Note, that the "echo" commands prints the lines to a new file. Everything between the first and last three single quotes is written to the new file, irrespective of linebreaks in between. You can generate the below shellscript by highlighting the whole code and then execute it with the key combination "ctrl"+"enter"

echo '''
#!/bin/sh

## name of Job
#PBS -N MAFFT_Yeti

## Redirect output stream to this file.
#PBS -o ~/MysteriousAbominableYeti/results/mafft/log.txt

## Stream Standard Output AND Standard Error to outputfile (see above)
#PBS -j oe

## Select a maximum of 20 cores and 200gb of RAM
#PBS -l select=1:ncpus=20:mem=200gb

######## load dependencies #######

# first load mafft into your environemt
source /opt/anaconda3/etc/profile.d/conda.sh
conda activate mafft-7.487

######## run analyses #######

# now make a mafft output directory in the results folder
mkdir -p ~/MysteriousAbominableYeti/results/mafft

# now run mafft
mafft --auto ~/MysteriousAbominableYeti/data/Complete_12s.fa \
> ~/MysteriousAbominableYeti/results/mafft/Complete_12s_mafft.fa
''' > ~/MysteriousAbominableYeti/shell/mafft.sh

### Now, you can submit this Shellscript to OpenPBS using the "qsub" command.

qsub ~/MysteriousAbominableYeti/shell/mafft.sh

## if everthing worked as expected, you should see a new folder "results" which contains a subfolder "mafft". In there, you will find the alignment in fasta format. You can preview the file with the less command.

less ~/MysteriousAbominableYeti/results/mafft/Complete_12s_mafft.fa

## you can navigate through the file using the up- and down arrow keys and exit by typing "q". You'll notice that the samples have different length which results in multiple gaps at the beginning and the end of the alignment in samples which shorter sequences.

## You can now use the program Gblocks to truncate the alignment and remove these overhangs. Now that you know how OpenPBS shell scripts work, you can generate and execute the command as above. Go through the file and make sure that you understand all the commands. Note that Gblocks adds the extension -gb to the truncated alignment file.

## Gblocks
echo '''
#!/bin/sh

## name of Job
#PBS -N MAFFT_Yeti

## Redirect output stream to this file.
#PBS -o ~/MysteriousAbominableYeti/results/mafft/log2.txt

## Stream Standard Output AND Standard Error to outputfile (see above)
#PBS -j oe

## Select a maximum of 20 cores and 200gb of RAM
#PBS -l select=1:ncpus=20:mem=200gb

######## load dependencies #######

# first load Gblocks into your environemt
module load Alignment/Gblocks-0.91b

######## run analyses #######

## now run Gblocks
Gblocks ~/MysteriousAbominableYeti/results/mafft/Complete_12s_mafft.fa -e=-gb

''' > ~/MysteriousAbominableYeti/shell/gblocks.sh

qsub ~/MysteriousAbominableYeti/shell/gblocks.sh

# Now, we are ready to calculate a maximum likelihood tree using RAxML. This is a three-step process. First, you calculate an maximum likelihood tree using the GTR-Gamma substitution model (for the sake of simplicity), then you perform up to 1000 rounds bootstrapping based on the starting tree. Finally, you reconcile the best tree based on the bootstrapping. In all cases, we use the Platypus as the outgroup. Note, that we set the maximum number of cores to 20 (-t 20) which corresponds to the settings for OpenPBS (#PBS -l select=1:ncpus=20:mem=200gb).

echo '''
#!/bin/sh

## name of Job
#PBS -N MAFFT_Yeti

## Redirect output stream to this file.
#PBS -o ~/MysteriousAbominableYeti/results/RAxML/log.txt

## Stream Standard Output AND Standard Error to outputfile (see above)
#PBS -j oe

## Select a maximum of 20 cores and 200gb of RAM
#PBS -l select=1:ncpus=20:mem=200gb

######## load dependencies #######

module load Phylogeny/RAxML-2.8.10

######## run analyses #######

mkdir -p ~/MysteriousAbominableYeti/results/RAxML
cd ~/MysteriousAbominableYeti/results/RAxML

# Now, run raxml against the aligned and trimmed FASTA file generated by mafft and gblocks
raxmlHPC-PTHREADS-SSE3 \
  -m GTRGAMMA \
  -N 20 \
  -p 772374015 \
  -n BEST \
  -s ~/MysteriousAbominableYeti/data/Complete_12s_mafft.fa-gb \
  -o Ornithorhynchus_anatinus \
  -T 20

raxmlHPC-PTHREADS-SSE3 \
  -m GTRGAMMA \
  -N autoMRE \
  -p 772374015 \
  -b 444353738 \
  -n bootrep \
  -s ~/MysteriousAbominableYeti/data/Complete_12s_mafft.fa-gb \
  -o Ornithorhynchus_anatinus \
  -T 20

# Now, reconcile the best ML tree w/ the bootreps:
raxmlHPC-SSE3 -f b \
  -m GTRGAMMA \
  -t RAxML_bestTree.BEST \
  -z RAxML_bootstrap.bootrep \
  -n Yeti_phylogeny -o Ornithorhynchus_anatinus

''' > ~/MysteriousAbominableYeti/shell/raxml.sh

qsub ~/MysteriousAbominableYeti/shell/raxml.sh

### Now, we have a tree in NEWICK format with bootstrap values (~/MysteriousAbominableYeti/results/RAxML/RAxML_bipartitions.Yeti_phylogeny), which we can plot with R. I have written this script, which can be used to plot the tree using the ggtree package. First make a new directory called "scripts", where we will store this R script.

mkdir ~/MysteriousAbominableYeti/scripts

echo '''
    library("ggtree")
    library("ggplot2")

    Mammals<-read.tree("~/MysteriousAbominableYeti/results/RAxML/RAxML_bipartitions.Yeti_phylogeny")

    Mammals.tree <- ggtree(Mammals)+
      theme_tree2()+
      theme_bw()+
      geom_tiplab(size =6,
            fontface="bold")+
      ggplot2::xlim(0, 0.5)+
      xlab("av. subst./site") +
      geom_nodelab(color="red",
            fontface="bold",
            size =6)+
      theme(axis.title.y=element_blank(),
            axis.text.y=element_blank(),
            axis.ticks.y=element_blank(),
            axis.title.x = element_text(size = 20, angle = 00),
            axis.text=element_text(size=18),
            strip.text =element_text(size=20))

    ggsave(filename="~/MysteriousAbominableYeti/results/Yeti_phylogeny.pdf",
            Mammals.tree ,
            width=12,
            height=8)
    ggsave(filename="~/MysteriousAbominableYeti/results/Yeti_phylogeny.png",
            Mammals.tree ,
            width=12,
            height=8)
''' > ~/MysteriousAbominableYeti/scripts/Yeti_phylogeny.r

## Now we can finally execute the R script using the Rscript command.

Rscript ~/MysteriousAbominableYeti/scripts/Yeti_phylogeny.r
