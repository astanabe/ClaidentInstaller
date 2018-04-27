if test -z $PREFIX; then
export PREFIX=/usr/local || exit $?
fi
# download and install RDP UCHIME reference database
if ! test -e .rdp; then
mkdir -p $PREFIX/share/claident/uchimedb || exit $?
wget -c http://drive5.com/uchime/rdp_gold.fa || exit $?
mv rdp_gold.fa $PREFIX/share/claident/uchimedb/rdpgoldv9.fasta || exit $?
echo 'The RDP v9 database for UCHIME was installed correctly!'
touch .rdp || exit $?
fi
# download and install SILVA reference databases
if ! test -e .silva; then
mkdir -p $PREFIX/share/claident/uchimedb || exit $?
wget -c https://www.arb-silva.de/fileadmin/silva_databases/release_132/Exports/SILVA_132_LSURef_tax_silva.fasta.gz || exit $?
wget -c https://www.arb-silva.de/fileadmin/silva_databases/release_132/Exports/SILVA_132_LSURef_tax_silva.fasta.gz.md5 || exit $?
md5sum -c SILVA_132_LSURef_tax_silva.fasta.gz.md5 || exit $?
rm SILVA_132_LSURef_tax_silva.fasta.gz.md5 || exit $?
gzip -d SILVA_132_LSURef_tax_silva.fasta.gz || exit $?
$PREFIX/share/claident/bin/vsearch --threads 4 --notrunclabels --label_suffix revcomp --fastx_revcomp SILVA_132_LSURef_tax_silva.fasta --fastaout SILVA_132_LSURef_tax_silva_rc.fasta || exit $?
cat SILVA_132_LSURef_tax_silva.fasta SILVA_132_LSURef_tax_silva_rc.fasta > silva132LSUref.fasta || exit $?
rm -f SILVA_132_LSURef_tax_silva.fasta SILVA_132_LSURef_tax_silva_rc.fasta || exit $?
mv silva132LSUref.fasta $PREFIX/share/claident/uchimedb/ || exit $?
wget -c https://www.arb-silva.de/fileadmin/silva_databases/release_132/Exports/SILVA_132_SSURef_Nr99_tax_silva.fasta.gz || exit $?
wget -c https://www.arb-silva.de/fileadmin/silva_databases/release_132/Exports/SILVA_132_SSURef_Nr99_tax_silva.fasta.gz.md5 || exit $?
md5sum -c SILVA_132_SSURef_Nr99_tax_silva.fasta.gz.md5 || exit $?
rm SILVA_132_SSURef_Nr99_tax_silva.fasta.gz.md5 || exit $
gzip -d SILVA_132_SSURef_Nr99_tax_silva.fasta.gz || exit $?
$PREFIX/share/claident/bin/vsearch --threads 4 --notrunclabels --label_suffix revcomp --fastx_revcomp SILVA_132_SSURef_Nr99_tax_silva.fasta --fastaout SILVA_132_SSURef_Nr99_tax_silva_rc.fasta || exit $?
cat SILVA_132_SSURef_Nr99_tax_silva.fasta SILVA_132_SSURef_Nr99_tax_silva_rc.fasta > silva132SSUrefnr99.fasta || exit $?
rm -f SILVA_132_SSURef_Nr99_tax_silva.fasta SILVA_132_SSURef_Nr99_tax_silva_rc.fasta || exit $?
mv silva132SSUrefnr99.fasta $PREFIX/share/claident/uchimedb/ || exit $?
echo 'The SILVA release 132 database for UCHIME were installed correctly!'
touch .silva || exit $?
fi
# download and install UNITE UCHIME reference databases
if ! test -e .unite; then
mkdir -p $PREFIX/share/claident/uchimedb || exit $?
wget -c https://unite.ut.ee/sh_files/uchime_reference_dataset_28.06.2017.zip || exit $?
unzip -qq uchime_reference_dataset_28.06.2017.zip || exit $?
cd uchime_reference_dataset_28.06.2017 || exit $?
$PREFIX/share/claident/bin/vsearch --threads 4 --notrunclabels --label_suffix revcomp --fastx_revcomp uchime_reference_dataset_28.06.2017.fasta --fastaout uchime_reference_dataset_28.06.2017.rc.fasta || exit $?
cat uchime_reference_dataset_28.06.2017.fasta uchime_reference_dataset_28.06.2017.rc.fasta > unite20161201.fasta || exit $?
mv unite20161201.fasta $PREFIX/share/claident/uchimedb/ || exit $?
$PREFIX/share/claident/bin/vsearch --threads 4 --notrunclabels --label_suffix revcomp --fastx_revcomp untrimmed_ITS_sequences/uchime_reference_dataset_untrimmed_28.06.2017.fasta --fastaout untrimmed_ITS_sequences/uchime_reference_dataset_untrimmed_28.06.2017.rc.fasta || exit $?
cat untrimmed_ITS_sequences/uchime_reference_dataset_untrimmed_28.06.2017.fasta untrimmed_ITS_sequences/uchime_reference_dataset_untrimmed_28.06.2017.rc.fasta > unite20161201untrim.fasta || exit $?
mv unite20161201untrim.fasta $PREFIX/share/claident/uchimedb/ || exit $?
$PREFIX/share/claident/bin/vsearch --threads 4 --notrunclabels --label_suffix revcomp --fastx_revcomp ITS1_ITS2_datasets/uchime_reference_dataset_28.06.2017.ITS1.fasta --fastaout ITS1_ITS2_datasets/uchime_reference_dataset_28.06.2017.ITS1.rc.fasta || exit $?
cat ITS1_ITS2_datasets/uchime_reference_dataset_28.06.2017.ITS1.fasta ITS1_ITS2_datasets/uchime_reference_dataset_28.06.2017.ITS1.rc.fasta > unite20161201its1.fasta || exit $?
mv unite20161201its1.fasta $PREFIX/share/claident/uchimedb/ || exit $?
$PREFIX/share/claident/bin/vsearch --threads 4 --notrunclabels --label_suffix revcomp --fastx_revcomp ITS1_ITS2_datasets/uchime_reference_dataset_28.06.2017.ITS2.fasta --fastaout ITS1_ITS2_datasets/uchime_reference_dataset_28.06.2017.ITS2.rc.fasta || exit $?
cat ITS1_ITS2_datasets/uchime_reference_dataset_28.06.2017.ITS2.fasta ITS1_ITS2_datasets/uchime_reference_dataset_28.06.2017.ITS2.rc.fasta > unite20161201its2.fasta || exit $?
mv unite20161201its2.fasta $PREFIX/share/claident/uchimedb/ || exit $?
cd .. || exit $?
rm -rf uchime_reference_dataset_28.06.2017 || exit $?
rm -f uchime_reference_dataset_28.06.2017.zip || exit $?
echo 'The UNITE databases for UCHIME were installed correctly!'
touch .unite || exit $?
fi
# download and install Claident Databases for UCHIME
if ! test -e .cdu; then
mkdir -p $PREFIX/share/claident/uchimedb || exit $?
wget -c https://claident.est.ryukoku.ac.jp/uchimedb20180412/cdu_20180412.tar.xz || exit $?
wget -c https://claident.est.ryukoku.ac.jp/uchimedb20180412/cdu_20180412.tar.xz.sha256 || exit $?
sha256sum -c cdu_20180412.tar.xz.sha256 || exit $?
rm cdu_20180412.tar.xz.sha256 || exit $?
tar -xJf cdu_20180412.tar.xz || exit $?
mv cdu12s.fasta cdu16s.fasta cducox1.fasta cducytb.fasta cdudloop.fasta cdumatk.fasta cdurbcl.fasta cdutrnhpsba.fasta $PREFIX/share/claident/uchimedb/ || exit $?
rm -f cdu_20180412.tar.xz || exit $?
echo 'The Claident Databases for UCHIME were installed correctly!'
touch .cdu || exit $?
fi
echo 'You do not need to care about error messages.'
