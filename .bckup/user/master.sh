## add new test users for the course
#
# Iris Fischer
# Min Chai
# Marcia Sittenthaler
# Tanja Schuster
# Martin Schwentner
# Sandra Kirchner
# Niko Helmer
# Christoph Leeb
# Pedro Frade
# Luise Kruckenhauser
# Andreas Kroh
# Anja Palandacic
# Oliver Macek
# Christian Bräuchler
# Martin Kapun
# Susi Reier
# Hannah Schubert
# Stefan Prost

sudo -s

for name in ifischer mchai msittenthaler tschuster mschwentner skirchner nhelmer cleeb pfrade lkruckenhauser akroh apalandacic omacek cbraeuchler mkapun sreier hschubert sprost

do

  sh /media/inter/mkapun/projects/MysteriousAbominableYeti/.bckup/user/SetupTempUser.sh ${name}

done
