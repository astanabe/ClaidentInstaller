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
# download and install UNITE UCHIME reference databases
if ! test -e .unite; then
mkdir -p $PREFIX/share/claident/uchimedb || exit $?
wget -c https://unite.ut.ee/sh_files/uchime_reference_dataset_01.12.2016.zip || exit $?
unzip -qq uchime_reference_dataset_01.12.2016.zip || exit $?
cd uchime_reference_dataset_01.12.2016 || exit $?
mv uchime_reference_dataset_01.12.2016.fasta $PREFIX/share/claident/uchimedb/unite20161201.fasta || exit $?
mv untrimmed_ITS_sequences/uchime_reference_dataset_untrimmed_01.12.2016.fasta $PREFIX/share/claident/uchimedb/unite20161201untrim.fasta || exit $?
mv ITS1_ITS2_datasets/uchime_reference_dataset_01.12.2016.ITS1.fasta $PREFIX/share/claident/uchimedb/unite20161201its1.fasta || exit $?
mv ITS1_ITS2_datasets/uchime_reference_dataset_01.12.2016.ITS2.fasta $PREFIX/share/claident/uchimedb/unite20161201its2.fasta || exit $?
cd .. || exit $?
rm -rf uchime_reference_dataset_01.12.2016 || exit $?
rm -f uchime_reference_dataset_01.12.2016.zip || exit $?
echo 'The UNITE databases for UCHIME were installed correctly!'
touch .unite || exit $?
fi
echo 'You do not need to care about error messages.'
