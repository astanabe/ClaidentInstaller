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
# download and install DAIRYdb reference database
if ! test -e .dairydb; then
mkdir -p $PREFIX/share/claident/uchimedb || sudo mkdir -p $PREFIX/share/claident/uchimedb || exit $?
wget -c https://github.com/marcomeola/DAIRYdb/raw/master/DAIRYdb_v1.2.0_20190222/DAIRYdb_v1.2.0_20190222_blast/DAIRYdb_v1.2.0_20190222_blast.fasta -O DAIRYdb_v1.2.0_blast.fasta || exit $?
$PREFIX/share/claident/bin/vsearch --threads 4 --notrunclabels --label_suffix revcomp --fastx_revcomp DAIRYdb_v1.2.0_blast.fasta --fastaout DAIRYdb_v1.2.0_blast_rc.fasta || exit $?
cat DAIRYdb_v1.2.0_blast.fasta DAIRYdb_v1.2.0_blast_rc.fasta > dairydb1.2.0.fasta || exit $?
rm -f DAIRYdb_v1.2.0_blast.fasta DAIRYdb_v1.2.0_blast_rc.fasta || exit $?
mv dairydb1.2.0.fasta $PREFIX/share/claident/uchimedb/ || sudo mv dairydb1.2.0.fasta $PREFIX/share/claident/uchimedb/ || exit $?
echo 'The DAIRYdb v1.2.0 database for UCHIME were installed correctly!'
touch .dairydb || exit $?
fi
# download and install SILVA reference databases
if ! test -e .silva; then
mkdir -p $PREFIX/share/claident/uchimedb || sudo mkdir -p $PREFIX/share/claident/uchimedb || exit $?
wget -c https://www.arb-silva.de/fileadmin/silva_databases/release_132/Exports/SILVA_132_LSURef_tax_silva.fasta.gz || exit $?
wget -c https://www.arb-silva.de/fileadmin/silva_databases/release_132/Exports/SILVA_132_LSURef_tax_silva.fasta.gz.md5 || exit $?
md5sum -c SILVA_132_LSURef_tax_silva.fasta.gz.md5 || exit $?
rm SILVA_132_LSURef_tax_silva.fasta.gz.md5 || exit $?
gzip -d SILVA_132_LSURef_tax_silva.fasta.gz || exit $?
$PREFIX/share/claident/bin/vsearch --threads 4 --notrunclabels --label_suffix revcomp --fastx_revcomp SILVA_132_LSURef_tax_silva.fasta --fastaout SILVA_132_LSURef_tax_silva_rc.fasta || exit $?
cat SILVA_132_LSURef_tax_silva.fasta SILVA_132_LSURef_tax_silva_rc.fasta > silva132LSUref.fasta || exit $?
rm -f SILVA_132_LSURef_tax_silva.fasta SILVA_132_LSURef_tax_silva_rc.fasta || exit $?
mv silva132LSUref.fasta $PREFIX/share/claident/uchimedb/ || sudo mv silva132LSUref.fasta $PREFIX/share/claident/uchimedb/ || exit $?
wget -c https://www.arb-silva.de/fileadmin/silva_databases/release_132/Exports/SILVA_132_SSURef_tax_silva.fasta.gz || exit $?
wget -c https://www.arb-silva.de/fileadmin/silva_databases/release_132/Exports/SILVA_132_SSURef_tax_silva.fasta.gz.md5 || exit $?
md5sum -c SILVA_132_SSURef_tax_silva.fasta.gz.md5 || exit $?
rm SILVA_132_SSURef_tax_silva.fasta.gz.md5 || exit $?
gzip -d SILVA_132_SSURef_tax_silva.fasta.gz || exit $?
$PREFIX/share/claident/bin/vsearch --threads 4 --notrunclabels --label_suffix revcomp --fastx_revcomp SILVA_132_SSURef_tax_silva.fasta --fastaout SILVA_132_SSURef_tax_silva_rc.fasta || exit $?
cat SILVA_132_SSURef_tax_silva.fasta SILVA_132_SSURef_tax_silva_rc.fasta > silva132SSUref.fasta || exit $?
rm -f SILVA_132_SSURef_tax_silva.fasta SILVA_132_SSURef_tax_silva_rc.fasta || exit $?
mv silva132SSUref.fasta $PREFIX/share/claident/uchimedb/ || sudo mv silva132SSUref.fasta $PREFIX/share/claident/uchimedb/ || exit $?
echo 'The SILVA release 132 database for UCHIME were installed correctly!'
touch .silva || exit $?
fi
# download and install UNITE UCHIME reference databases
if ! test -e .unite; then
mkdir -p $PREFIX/share/claident/uchimedb || sudo mkdir -p $PREFIX/share/claident/uchimedb || exit $?
wget -c https://unite.ut.ee/sh_files/uchime_reference_dataset_28.06.2017.zip || exit $?
unzip -qq uchime_reference_dataset_28.06.2017.zip || exit $?
cd uchime_reference_dataset_28.06.2017 || exit $?
perl -i -npe 's/×/XX/g' uchime_reference_dataset_28.06.2017.fasta
perl -i -npe 's/×/XX/g' untrimmed_sequences/uchime_reference_dataset_untrimmed_28.06.2017.fasta
perl -i -npe 's/×/XX/g' ITS1_ITS2_datasets/uchime_reference_dataset_ITS1_28.06.2017.fasta
perl -i -npe 's/×/XX/g' ITS1_ITS2_datasets/uchime_reference_dataset_ITS2_28.06.2017.fasta
$PREFIX/share/claident/bin/vsearch --threads 4 --notrunclabels --label_suffix revcomp --fastx_revcomp uchime_reference_dataset_28.06.2017.fasta --fastaout uchime_reference_dataset_28.06.2017.rc.fasta || exit $?
cat uchime_reference_dataset_28.06.2017.fasta uchime_reference_dataset_28.06.2017.rc.fasta > unite20170628.fasta || exit $?
mv unite20170628.fasta $PREFIX/share/claident/uchimedb/ || sudo mv unite20170628.fasta $PREFIX/share/claident/uchimedb/ || exit $?
$PREFIX/share/claident/bin/vsearch --threads 4 --notrunclabels --label_suffix revcomp --fastx_revcomp untrimmed_sequences/uchime_reference_dataset_untrimmed_28.06.2017.fasta --fastaout untrimmed_sequences/uchime_reference_dataset_untrimmed_28.06.2017.rc.fasta || exit $?
cat untrimmed_sequences/uchime_reference_dataset_untrimmed_28.06.2017.fasta untrimmed_sequences/uchime_reference_dataset_untrimmed_28.06.2017.rc.fasta > unite20170628untrim.fasta || exit $?
mv unite20170628untrim.fasta $PREFIX/share/claident/uchimedb/ || sudo mv unite20170628untrim.fasta $PREFIX/share/claident/uchimedb/ || exit $?
$PREFIX/share/claident/bin/vsearch --threads 4 --notrunclabels --label_suffix revcomp --fastx_revcomp ITS1_ITS2_datasets/uchime_reference_dataset_ITS1_28.06.2017.fasta --fastaout ITS1_ITS2_datasets/uchime_reference_dataset_ITS1_28.06.2017.rc.fasta || exit $?
cat ITS1_ITS2_datasets/uchime_reference_dataset_ITS1_28.06.2017.fasta ITS1_ITS2_datasets/uchime_reference_dataset_ITS1_28.06.2017.rc.fasta > unite20170628its1.fasta || exit $?
mv unite20170628its1.fasta $PREFIX/share/claident/uchimedb/ || sudo mv unite20170628its1.fasta $PREFIX/share/claident/uchimedb/ || exit $?
$PREFIX/share/claident/bin/vsearch --threads 4 --notrunclabels --label_suffix revcomp --fastx_revcomp ITS1_ITS2_datasets/uchime_reference_dataset_ITS2_28.06.2017.fasta --fastaout ITS1_ITS2_datasets/uchime_reference_dataset_ITS2_28.06.2017.rc.fasta || exit $?
cat ITS1_ITS2_datasets/uchime_reference_dataset_ITS2_28.06.2017.fasta ITS1_ITS2_datasets/uchime_reference_dataset_ITS2_28.06.2017.rc.fasta > unite20170628its2.fasta || exit $?
mv unite20170628its2.fasta $PREFIX/share/claident/uchimedb/ || sudo mv unite20170628its2.fasta $PREFIX/share/claident/uchimedb/ || exit $?
cd .. || exit $?
rm -rf uchime_reference_dataset_28.06.2017 || exit $?
rm -f uchime_reference_dataset_28.06.2017.zip || exit $?
echo 'The UNITE databases for UCHIME were installed correctly!'
touch .unite || exit $?
fi
# download and install Claident Databases for UCHIME
if ! test -e .cdu; then
mkdir -p $PREFIX/share/claident/uchimedb || sudo mkdir -p $PREFIX/share/claident/uchimedb || exit $?
wget -c https://www.claident.org/uchimedb/20190427/cdu_20190427.tar.xz || exit $?
wget -c https://www.claident.org/uchimedb/20190427/cdu_20190427.tar.xz.sha256 || exit $?
sha256sum -c cdu_20190427.tar.xz.sha256 || exit $?
rm cdu_20190427.tar.xz.sha256 || exit $?
tar -xJf cdu_20190427.tar.xz || exit $?
mv cdu12s.fasta cdu16s.fasta cducox1.fasta cducytb.fasta cdudloop.fasta cdumatk.fasta cdurbcl.fasta cdutrnhpsba.fasta $PREFIX/share/claident/uchimedb/ || sudo mv cdu12s.fasta cdu16s.fasta cducox1.fasta cducytb.fasta cdudloop.fasta cdumatk.fasta cdurbcl.fasta cdutrnhpsba.fasta $PREFIX/share/claident/uchimedb/ || exit $?
rm -f cdu_20190427.tar.xz || exit $?
echo 'The Claident Databases for UCHIME were installed correctly!'
touch .cdu || exit $?
fi
echo 'You do not need to care about error messages.'
