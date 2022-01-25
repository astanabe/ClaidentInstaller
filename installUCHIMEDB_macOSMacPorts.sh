if test -z $PREFIX; then
export PREFIX=/usr/local || exit $?
fi
# download and install RDP UCHIME reference database
if ! test -e .rdp; then
mkdir -p $PREFIX/share/claident/uchimedb 2> /dev/null || sudo mkdir -p $PREFIX/share/claident/uchimedb || exit $?
wget -nv -c http://drive5.com/uchime/rdp_gold.fa -O rdpgoldv9.fasta || exit $?
$PREFIX/share/claident/bin/vsearch --dbmask none --makeudb_usearch rdpgoldv9.fasta --output rdpgoldv9.udb || exit $?
chmod 644 rdpgoldv9.fasta rdpgoldv9.udb || exit $?
mv -f rdpgoldv9.fasta rdpgoldv9.udb $PREFIX/share/claident/uchimedb/ 2> /dev/null || sudo mv -f rdpgoldv9.fasta rdpgoldv9.udb $PREFIX/share/claident/uchimedb/ || exit $?
echo 'The RDP v9 database for UCHIME was installed correctly!'
touch .rdp || exit $?
fi
# download and install DAIRYdb reference database
if ! test -e .dairydb; then
mkdir -p $PREFIX/share/claident/uchimedb 2> /dev/null || sudo mkdir -p $PREFIX/share/claident/uchimedb || exit $?
wget -nv -c 'https://nextcloud.inrae.fr/s/5ne3ooAsM7zQtcW/download?path=/DDB_2.0/blast&files=DAIRYdb_v2.0_20210401_blast.fasta' -O DAIRYdb_v2.0_20210401_blast.fasta || exit $?
$PREFIX/share/claident/bin/vsearch --notrunclabels --label_suffix revcomp --fastx_revcomp DAIRYdb_v2.0_20210401_blast.fasta --fastaout DAIRYdb_v2.0_20210401_blast_rc.fasta || exit $?
cat DAIRYdb_v2.0_20210401_blast.fasta DAIRYdb_v2.0_20210401_blast_rc.fasta > dairydb2.0.fasta || exit $?
$PREFIX/share/claident/bin/vsearch --dbmask none --makeudb_usearch dairydb2.0.fasta --output dairydb2.0.udb || exit $?
chmod 644 dairydb2.0.fasta dairydb2.0.udb || exit $?
mv -f dairydb2.0.fasta dairydb2.0.udb $PREFIX/share/claident/uchimedb/ 2> /dev/null || sudo mv -f dairydb2.0.fasta dairydb2.0.udb $PREFIX/share/claident/uchimedb/ || exit $?
rm -f DAIRYdb_v2.0_20210401_blast.fasta DAIRYdb_v2.0_20210401_blast_rc.fasta || exit $?
echo 'The DAIRYdb v2.0 database for UCHIME were installed correctly!'
touch .dairydb || exit $?
fi
# download and install SILVA reference databases
if ! test -e .silva; then
mkdir -p $PREFIX/share/claident/uchimedb 2> /dev/null || sudo mkdir -p $PREFIX/share/claident/uchimedb || exit $?
wget -nv -c https://www.arb-silva.de/fileadmin/silva_databases/release_138_1/Exports/SILVA_138.1_LSURef_tax_silva.fasta.gz || exit $?
wget -nv -c https://www.arb-silva.de/fileadmin/silva_databases/release_138_1/Exports/SILVA_138.1_LSURef_tax_silva.fasta.gz.md5 || exit $?
gmd5sum -c SILVA_138.1_LSURef_tax_silva.fasta.gz.md5 || exit $?
rm -f SILVA_138.1_LSURef_tax_silva.fasta.gz.md5 || exit $?
gzip -d SILVA_138.1_LSURef_tax_silva.fasta.gz || exit $?
$PREFIX/share/claident/bin/vsearch --notrunclabels --label_suffix revcomp --fastx_revcomp SILVA_138.1_LSURef_tax_silva.fasta --fastaout SILVA_138.1_LSURef_tax_silva_rc.fasta || exit $?
cat SILVA_138.1_LSURef_tax_silva.fasta SILVA_138.1_LSURef_tax_silva_rc.fasta > silva138.1LSUref.fasta || exit $?
$PREFIX/share/claident/bin/vsearch --dbmask none --makeudb_usearch silva138.1LSUref.fasta --output silva138.1LSUref.udb || exit $?
chmod 644 silva138.1LSUref.fasta silva138.1LSUref.udb || exit $?
mv -f silva138.1LSUref.fasta silva138.1LSUref.udb $PREFIX/share/claident/uchimedb/ 2> /dev/null || sudo mv -f silva138.1LSUref.fasta silva138.1LSUref.udb $PREFIX/share/claident/uchimedb/ || exit $?
rm -f SILVA_138.1_LSURef_tax_silva.fasta SILVA_138.1_LSURef_tax_silva_rc.fasta || exit $?
wget -nv -c https://www.arb-silva.de/fileadmin/silva_databases/release_138_1/Exports/SILVA_138.1_SSURef_tax_silva.fasta.gz || exit $?
wget -nv -c https://www.arb-silva.de/fileadmin/silva_databases/release_138_1/Exports/SILVA_138.1_SSURef_tax_silva.fasta.gz.md5 || exit $?
gmd5sum -c SILVA_138.1_SSURef_tax_silva.fasta.gz.md5 || exit $?
rm -f SILVA_138.1_SSURef_tax_silva.fasta.gz.md5 || exit $?
gzip -d SILVA_138.1_SSURef_tax_silva.fasta.gz || exit $?
$PREFIX/share/claident/bin/vsearch --notrunclabels --label_suffix revcomp --fastx_revcomp SILVA_138.1_SSURef_tax_silva.fasta --fastaout SILVA_138.1_SSURef_tax_silva_rc.fasta || exit $?
cat SILVA_138.1_SSURef_tax_silva.fasta SILVA_138.1_SSURef_tax_silva_rc.fasta > silva138.1SSUref.fasta || exit $?
$PREFIX/share/claident/bin/vsearch --dbmask none --makeudb_usearch silva138.1SSUref.fasta --output silva138.1SSUref.udb || exit $?
chmod 644 silva138.1SSUref.fasta silva138.1SSUref.udb || exit $?
mv -f silva138.1SSUref.fasta silva138.1SSUref.udb $PREFIX/share/claident/uchimedb/ 2> /dev/null || sudo mv -f silva138.1SSUref.fasta silva138.1SSUref.udb $PREFIX/share/claident/uchimedb/ || exit $?
rm -f SILVA_138.1_SSURef_tax_silva.fasta SILVA_138.1_SSURef_tax_silva_rc.fasta || exit $?
echo 'The SILVA release 138.1 database for UCHIME were installed correctly!'
touch .silva || exit $?
fi
# download and install UNITE UCHIME reference databases
if ! test -e .unite; then
mkdir -p $PREFIX/share/claident/uchimedb 2> /dev/null || sudo mkdir -p $PREFIX/share/claident/uchimedb || exit $?
wget -nv -c https://unite.ut.ee/sh_files/uchime_reference_dataset_28.06.2017.zip || exit $?
unzip -qq uchime_reference_dataset_28.06.2017.zip || exit $?
cd uchime_reference_dataset_28.06.2017 || exit $?
perl -i -npe 's/×/XX/g' uchime_reference_dataset_28.06.2017.fasta || exit $?
perl -i -npe 's/×/XX/g' untrimmed_sequences/uchime_reference_dataset_untrimmed_28.06.2017.fasta || exit $?
perl -i -npe 's/×/XX/g' ITS1_ITS2_datasets/uchime_reference_dataset_ITS1_28.06.2017.fasta || exit $?
perl -i -npe 's/×/XX/g' ITS1_ITS2_datasets/uchime_reference_dataset_ITS2_28.06.2017.fasta || exit $?
$PREFIX/share/claident/bin/vsearch --notrunclabels --label_suffix revcomp --fastx_revcomp uchime_reference_dataset_28.06.2017.fasta --fastaout uchime_reference_dataset_28.06.2017.rc.fasta || exit $?
cat uchime_reference_dataset_28.06.2017.fasta uchime_reference_dataset_28.06.2017.rc.fasta > unite20170628.fasta || exit $?
$PREFIX/share/claident/bin/vsearch --dbmask none --makeudb_usearch unite20170628.fasta --output unite20170628.udb || exit $?
chmod 644 unite20170628.fasta unite20170628.udb || exit $?
mv -f unite20170628.fasta unite20170628.udb $PREFIX/share/claident/uchimedb/ 2> /dev/null || sudo mv -f unite20170628.fasta unite20170628.udb $PREFIX/share/claident/uchimedb/ || exit $?
$PREFIX/share/claident/bin/vsearch --notrunclabels --label_suffix revcomp --fastx_revcomp untrimmed_sequences/uchime_reference_dataset_untrimmed_28.06.2017.fasta --fastaout untrimmed_sequences/uchime_reference_dataset_untrimmed_28.06.2017.rc.fasta || exit $?
cat untrimmed_sequences/uchime_reference_dataset_untrimmed_28.06.2017.fasta untrimmed_sequences/uchime_reference_dataset_untrimmed_28.06.2017.rc.fasta > unite20170628untrim.fasta || exit $?
$PREFIX/share/claident/bin/vsearch --dbmask none --makeudb_usearch unite20170628untrim.fasta --output unite20170628untrim.udb || exit $?
chmod 644 unite20170628untrim.fasta unite20170628untrim.udb || exit $?
mv -f unite20170628untrim.fasta unite20170628untrim.udb $PREFIX/share/claident/uchimedb/ 2> /dev/null || sudo mv -f unite20170628untrim.fasta unite20170628untrim.udb $PREFIX/share/claident/uchimedb/ || exit $?
$PREFIX/share/claident/bin/vsearch --notrunclabels --label_suffix revcomp --fastx_revcomp ITS1_ITS2_datasets/uchime_reference_dataset_ITS1_28.06.2017.fasta --fastaout ITS1_ITS2_datasets/uchime_reference_dataset_ITS1_28.06.2017.rc.fasta || exit $?
cat ITS1_ITS2_datasets/uchime_reference_dataset_ITS1_28.06.2017.fasta ITS1_ITS2_datasets/uchime_reference_dataset_ITS1_28.06.2017.rc.fasta > unite20170628its1.fasta || exit $?
$PREFIX/share/claident/bin/vsearch --dbmask none --makeudb_usearch unite20170628its1.fasta --output unite20170628its1.udb || exit $?
chmod 644 unite20170628its1.fasta unite20170628its1.udb || exit $?
mv -f unite20170628its1.fasta unite20170628its1.udb $PREFIX/share/claident/uchimedb/ 2> /dev/null || sudo mv -f unite20170628its1.fasta unite20170628its1.udb $PREFIX/share/claident/uchimedb/ || exit $?
$PREFIX/share/claident/bin/vsearch --notrunclabels --label_suffix revcomp --fastx_revcomp ITS1_ITS2_datasets/uchime_reference_dataset_ITS2_28.06.2017.fasta --fastaout ITS1_ITS2_datasets/uchime_reference_dataset_ITS2_28.06.2017.rc.fasta || exit $?
cat ITS1_ITS2_datasets/uchime_reference_dataset_ITS2_28.06.2017.fasta ITS1_ITS2_datasets/uchime_reference_dataset_ITS2_28.06.2017.rc.fasta > unite20170628its2.fasta || exit $?
$PREFIX/share/claident/bin/vsearch --dbmask none --makeudb_usearch unite20170628its2.fasta --output unite20170628its2.udb || exit $?
chmod 644 unite20170628its2.fasta unite20170628its2.udb || exit $?
mv -f unite20170628its2.fasta unite20170628its2.udb $PREFIX/share/claident/uchimedb/ 2> /dev/null || sudo mv -f unite20170628its2.fasta unite20170628its2.udb $PREFIX/share/claident/uchimedb/ || exit $?
cd .. || exit $?
rm -rf uchime_reference_dataset_28.06.2017 || exit $?
rm -f uchime_reference_dataset_28.06.2017.zip || exit $?
echo 'The UNITE databases for UCHIME were installed correctly!'
touch .unite || exit $?
fi
# download and install Claident Databases for UCHIME
if ! test -e .cdu; then
mkdir -p $PREFIX/share/claident/uchimedb 2> /dev/null || sudo mkdir -p $PREFIX/share/claident/uchimedb || exit $?
wget -nv -c https://www.claident.org/uchimedb/20211019/cdu_20211019.tar.xz || exit $?
wget -nv -c https://www.claident.org/uchimedb/20211019/cdu_20211019.tar.xz.sha256 || exit $?
gsha256sum -c cdu_20211019.tar.xz.sha256 || exit $?
rm -f cdu_20211019.tar.xz.sha256 || exit $?
gnutar -xJf cdu_20211019.tar.xz || exit $?
for db in cdu12s cdu16s cducox1 cducytb cdudloop cdumatk cdurbcl cdutrnhpsba
do
$PREFIX/share/claident/bin/vsearch --dbmask none --makeudb_usearch $db.fasta --output $db.udb || exit $?
chmod 644 $db.fasta $db.udb || exit $?
mv -f $db.fasta $db.udb $PREFIX/share/claident/uchimedb/ 2> /dev/null || sudo mv -f $db.fasta $db.udb $PREFIX/share/claident/uchimedb/ || exit $?
done
rm -f cdu_20211019.tar.xz || exit $?
echo 'The Claident Databases for UCHIME were installed correctly!'
touch .cdu || exit $?
fi
echo 'You do not need to care about error messages.'
