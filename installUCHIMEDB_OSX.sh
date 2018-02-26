if test -z $PREFIX; then
export PREFIX=/usr/local || exit $?
fi
# download and install RDP UCHIME reference database
if ! test -e .rdp; then
mkdir -p $PREFIX/share/claident/uchimedb || sudo mkdir -p $PREFIX/share/claident/uchimedb || exit $?
wget -c http://drive5.com/uchime/rdp_gold.fa || exit $?
mv rdp_gold.fa $PREFIX/share/claident/uchimedb/rdpgoldv9.fasta || sudo mv rdp_gold.fa $PREFIX/share/claident/uchimedb/rdpgoldv9.fasta || exit $?
echo 'The RDP v9 database for UCHIME was installed correctly!'
touch .rdp || exit $?
fi
# download and install SILVA reference databases
if ! test -e .silva; then
mkdir -p $PREFIX/share/claident/uchimedb || sudo mkdir -p $PREFIX/share/claident/uchimedb || exit $?
wget -c https://www.arb-silva.de/fileadmin/silva_databases/release_128/Exports/SILVA_128_LSURef_tax_silva.fasta.gz || exit $?
gzip -d SILVA_128_LSURef_tax_silva.fasta.gz || exit $?
$PREFIX/share/claident/bin/vsearch --threads 4 --notrunclabels --label_suffix revcomp --fastx_revcomp SILVA_128_LSURef_tax_silva.fasta --fastaout SILVA_128_LSURef_tax_silva_rc.fasta || exit $?
cat SILVA_128_LSURef_tax_silva.fasta SILVA_128_LSURef_tax_silva_rc.fasta > silva128LSUref.fasta || exit $?
rm -f SILVA_128_LSURef_tax_silva.fasta SILVA_128_LSURef_tax_silva_rc.fasta || exit $?
mv silva128LSUref.fasta $PREFIX/share/claident/uchimedb/ || sudo mv silva128LSUref.fasta $PREFIX/share/claident/uchimedb/ || exit $?
wget -c https://www.arb-silva.de/fileadmin/silva_databases/release_128/Exports/SILVA_128_SSURef_Nr99_tax_silva.fasta.gz || exit $?
gzip -d SILVA_128_SSURef_Nr99_tax_silva.fasta.gz || exit $?
$PREFIX/share/claident/bin/vsearch --threads 4 --notrunclabels --label_suffix revcomp --fastx_revcomp SILVA_128_SSURef_Nr99_tax_silva.fasta --fastaout SILVA_128_SSURef_Nr99_tax_silva_rc.fasta || exit $?
cat SILVA_128_SSURef_Nr99_tax_silva.fasta SILVA_128_SSURef_Nr99_tax_silva_rc.fasta > silva128SSUrefnr99.fasta || exit $?
rm -f SILVA_128_SSURef_Nr99_tax_silva.fasta SILVA_128_SSURef_Nr99_tax_silva_rc.fasta || exit $?
mv silva128SSUrefnr99.fasta $PREFIX/share/claident/uchimedb/ || sudo mv silva128SSUrefnr99.fasta $PREFIX/share/claident/uchimedb/ || exit $?
echo 'The SILVA release 128 database for UCHIME were installed correctly!'
touch .silva || exit $?
fi
# download and install UNITE UCHIME reference databases
if ! test -e .unite; then
mkdir -p $PREFIX/share/claident/uchimedb || sudo mkdir -p $PREFIX/share/claident/uchimedb || exit $?
wget -c https://unite.ut.ee/sh_files/uchime_reference_dataset_01.12.2016.zip || exit $?
unzip -qq uchime_reference_dataset_01.12.2016.zip || exit $?
cd uchime_reference_dataset_01.12.2016 || exit $?
$PREFIX/share/claident/bin/vsearch --threads 4 --notrunclabels --label_suffix revcomp --fastx_revcomp uchime_reference_dataset_01.12.2016.fasta --fastaout uchime_reference_dataset_01.12.2016.rc.fasta || exit $?
cat uchime_reference_dataset_01.12.2016.fasta uchime_reference_dataset_01.12.2016.rc.fasta > unite20161201.fasta || exit $?
mv unite20161201.fasta $PREFIX/share/claident/uchimedb/ || sudo mv unite20161201.fasta $PREFIX/share/claident/uchimedb/ || exit $?
$PREFIX/share/claident/bin/vsearch --threads 4 --notrunclabels --label_suffix revcomp --fastx_revcomp untrimmed_ITS_sequences/uchime_reference_dataset_untrimmed_01.12.2016.fasta --fastaout untrimmed_ITS_sequences/uchime_reference_dataset_untrimmed_01.12.2016.rc.fasta || exit $?
cat untrimmed_ITS_sequences/uchime_reference_dataset_untrimmed_01.12.2016.fasta untrimmed_ITS_sequences/uchime_reference_dataset_untrimmed_01.12.2016.rc.fasta > unite20161201untrim.fasta || exit $?
mv unite20161201untrim.fasta $PREFIX/share/claident/uchimedb/ || sudo mv unite20161201untrim.fasta $PREFIX/share/claident/uchimedb/ || exit $?
$PREFIX/share/claident/bin/vsearch --threads 4 --notrunclabels --label_suffix revcomp --fastx_revcomp ITS1_ITS2_datasets/uchime_reference_dataset_01.12.2016.ITS1.fasta --fastaout ITS1_ITS2_datasets/uchime_reference_dataset_01.12.2016.ITS1.rc.fasta || exit $?
cat ITS1_ITS2_datasets/uchime_reference_dataset_01.12.2016.ITS1.fasta ITS1_ITS2_datasets/uchime_reference_dataset_01.12.2016.ITS1.rc.fasta > unite20161201its1.fasta || exit $?
mv unite20161201its1.fasta $PREFIX/share/claident/uchimedb/ || sudo mv unite20161201its1.fasta $PREFIX/share/claident/uchimedb/ || exit $?
$PREFIX/share/claident/bin/vsearch --threads 4 --notrunclabels --label_suffix revcomp --fastx_revcomp ITS1_ITS2_datasets/uchime_reference_dataset_01.12.2016.ITS2.fasta --fastaout ITS1_ITS2_datasets/uchime_reference_dataset_01.12.2016.ITS2.rc.fasta || exit $?
cat ITS1_ITS2_datasets/uchime_reference_dataset_01.12.2016.ITS2.fasta ITS1_ITS2_datasets/uchime_reference_dataset_01.12.2016.ITS2.rc.fasta > unite20161201its2.fasta || exit $?
mv unite20161201its2.fasta $PREFIX/share/claident/uchimedb/ || sudo mv unite20161201its2.fasta $PREFIX/share/claident/uchimedb/ || exit $?
cd .. || exit $?
rm -rf uchime_reference_dataset_01.12.2016 || exit $?
rm -f uchime_reference_dataset_01.12.2016.zip || exit $?
echo 'The UNITE databases for UCHIME were installed correctly!'
touch .unite || exit $?
fi
# download and install Claident Databases for UCHIME
if ! test -e .cdu; then
mkdir -p $PREFIX/share/claident/uchimedb || sudo mkdir -p $PREFIX/share/claident/uchimedb || exit $?
wget -c https://claident.est.ryukoku.ac.jp/uchimedb20170513/cdu_20170513.tar.xz || exit $?
gnutar -xJf cdu_20170513.tar.xz || exit $?
mv cdu12s.fasta cducox1.fasta cducytb.fasta cdumatk.fasta cdurbcl.fasta cdutrnhpsba.fasta $PREFIX/share/claident/uchimedb/ || sudo mv cdu12s.fasta cducox1.fasta cducytb.fasta cdumatk.fasta cdurbcl.fasta cdutrnhpsba.fasta $PREFIX/share/claident/uchimedb/ || exit $?
rm -f cdu_20170513.tar.xz || exit $?
echo 'The Claident Databases for UCHIME were installed correctly!'
touch .cdu || exit $?
fi
echo 'You do not need to care about error messages.'
