if test -z $PREFIX; then
export PREFIX=/usr/local || exit $?
fi
# download, check, and install BLAST and taxonomy databases
if ! test -e .taxdb; then
wget -nv -c https://www.claident.org/TAXDBURL.txt.xz || exit $?
rm -f TAXDBURL.txt || exit $?
xz -d TAXDBURL.txt.xz || exit $?
wget -nv --limit-rate=10m -c -i TAXDBURL.txt || exit $?
rm -f TAXDBURL.txt || exit $?
ls *.sha256 | xargs -L 1 -P 4 -I {} sh -c 'gsha256sum -c {} || exit $?' || exit $?
ls *.tar.xz | xargs -L 1 -P 4 -I {} sh -c 'gnutar -xJf {} || exit $?' || exit $?
mkdir -p $PREFIX/share/claident/taxdb 2> /dev/null || sudo mkdir -p $PREFIX/share/claident/taxdb || exit $?
rm -f $PREFIX/share/claident/taxdb/animals_COX1_genus.taxdb 2> /dev/null || sudo rm -f $PREFIX/share/claident/taxdb/animals_COX1_genus.taxdb
rm -f $PREFIX/share/claident/taxdb/animals_COX1_species_wsp.taxdb 2> /dev/null || sudo rm -f $PREFIX/share/claident/taxdb/animals_COX1_species_wsp.taxdb
rm -f $PREFIX/share/claident/taxdb/animals_COX1_species.taxdb 2> /dev/null || sudo rm -f $PREFIX/share/claident/taxdb/animals_COX1_species.taxdb
rm -f $PREFIX/share/claident/taxdb/animals_COX1_species_wosp.taxdb 2> /dev/null || sudo rm -f $PREFIX/share/claident/taxdb/animals_COX1_species_wosp.taxdb
rm -f $PREFIX/share/claident/taxdb/animals_COX1_genus_man.taxdb 2> /dev/null || sudo rm -f $PREFIX/share/claident/taxdb/animals_COX1_genus_man.taxdb
rm -f $PREFIX/share/claident/taxdb/animals_COX1_species_wsp_man.taxdb 2> /dev/null || sudo rm -f $PREFIX/share/claident/taxdb/animals_COX1_species_wsp_man.taxdb
rm -f $PREFIX/share/claident/taxdb/animals_COX1_species_man.taxdb 2> /dev/null || sudo rm -f $PREFIX/share/claident/taxdb/animals_COX1_species_man.taxdb
rm -f $PREFIX/share/claident/taxdb/animals_COX1_species_wosp_man.taxdb 2> /dev/null || sudo rm -f $PREFIX/share/claident/taxdb/animals_COX1_species_wosp_man.taxdb
rm -f $PREFIX/share/claident/taxdb/animals_mt_genus.taxdb 2> /dev/null || sudo rm -f $PREFIX/share/claident/taxdb/animals_mt_genus.taxdb
rm -f $PREFIX/share/claident/taxdb/animals_mt_species_wsp.taxdb 2> /dev/null || sudo rm -f $PREFIX/share/claident/taxdb/animals_mt_species_wsp.taxdb
rm -f $PREFIX/share/claident/taxdb/animals_mt_species.taxdb 2> /dev/null || sudo rm -f $PREFIX/share/claident/taxdb/animals_mt_species.taxdb
rm -f $PREFIX/share/claident/taxdb/animals_mt_species_wosp.taxdb 2> /dev/null || sudo rm -f $PREFIX/share/claident/taxdb/animals_mt_species_wosp.taxdb
rm -f $PREFIX/share/claident/taxdb/animals_mt_genus_man.taxdb 2> /dev/null || sudo rm -f $PREFIX/share/claident/taxdb/animals_mt_genus_man.taxdb
rm -f $PREFIX/share/claident/taxdb/animals_mt_species_wsp_man.taxdb 2> /dev/null || sudo rm -f $PREFIX/share/claident/taxdb/animals_mt_species_wsp_man.taxdb
rm -f $PREFIX/share/claident/taxdb/animals_mt_species_man.taxdb 2> /dev/null || sudo rm -f $PREFIX/share/claident/taxdb/animals_mt_species_man.taxdb
rm -f $PREFIX/share/claident/taxdb/animals_mt_species_wosp_man.taxdb 2> /dev/null || sudo rm -f $PREFIX/share/claident/taxdb/animals_mt_species_wosp_man.taxdb
rm -f $PREFIX/share/claident/taxdb/eukaryota_LSU_genus.taxdb 2> /dev/null || sudo rm -f $PREFIX/share/claident/taxdb/eukaryota_LSU_genus.taxdb
rm -f $PREFIX/share/claident/taxdb/eukaryota_LSU_species_wsp.taxdb 2> /dev/null || sudo rm -f $PREFIX/share/claident/taxdb/eukaryota_LSU_species_wsp.taxdb
rm -f $PREFIX/share/claident/taxdb/eukaryota_LSU_species.taxdb 2> /dev/null || sudo rm -f $PREFIX/share/claident/taxdb/eukaryota_LSU_species.taxdb
rm -f $PREFIX/share/claident/taxdb/eukaryota_LSU_species_wosp.taxdb 2> /dev/null || sudo rm -f $PREFIX/share/claident/taxdb/eukaryota_LSU_species_wosp.taxdb
rm -f $PREFIX/share/claident/taxdb/eukaryota_LSU_genus_man.taxdb 2> /dev/null || sudo rm -f $PREFIX/share/claident/taxdb/eukaryota_LSU_genus_man.taxdb
rm -f $PREFIX/share/claident/taxdb/eukaryota_LSU_species_wsp_man.taxdb 2> /dev/null || sudo rm -f $PREFIX/share/claident/taxdb/eukaryota_LSU_species_wsp_man.taxdb
rm -f $PREFIX/share/claident/taxdb/eukaryota_LSU_species_man.taxdb 2> /dev/null || sudo rm -f $PREFIX/share/claident/taxdb/eukaryota_LSU_species_man.taxdb
rm -f $PREFIX/share/claident/taxdb/eukaryota_LSU_species_wosp_man.taxdb 2> /dev/null || sudo rm -f $PREFIX/share/claident/taxdb/eukaryota_LSU_species_wosp_man.taxdb
rm -f $PREFIX/share/claident/taxdb/eukaryota_SSU_genus.taxdb 2> /dev/null || sudo rm -f $PREFIX/share/claident/taxdb/eukaryota_SSU_genus.taxdb
rm -f $PREFIX/share/claident/taxdb/eukaryota_SSU_species_wsp.taxdb 2> /dev/null || sudo rm -f $PREFIX/share/claident/taxdb/eukaryota_SSU_species_wsp.taxdb
rm -f $PREFIX/share/claident/taxdb/eukaryota_SSU_species.taxdb 2> /dev/null || sudo rm -f $PREFIX/share/claident/taxdb/eukaryota_SSU_species.taxdb
rm -f $PREFIX/share/claident/taxdb/eukaryota_SSU_species_wosp.taxdb 2> /dev/null || sudo rm -f $PREFIX/share/claident/taxdb/eukaryota_SSU_species_wosp.taxdb
rm -f $PREFIX/share/claident/taxdb/eukaryota_SSU_genus_man.taxdb 2> /dev/null || sudo rm -f $PREFIX/share/claident/taxdb/eukaryota_SSU_genus_man.taxdb
rm -f $PREFIX/share/claident/taxdb/eukaryota_SSU_species_wsp_man.taxdb 2> /dev/null || sudo rm -f $PREFIX/share/claident/taxdb/eukaryota_SSU_species_wsp_man.taxdb
rm -f $PREFIX/share/claident/taxdb/eukaryota_SSU_species_man.taxdb 2> /dev/null || sudo rm -f $PREFIX/share/claident/taxdb/eukaryota_SSU_species_man.taxdb
rm -f $PREFIX/share/claident/taxdb/eukaryota_SSU_species_wosp_man.taxdb 2> /dev/null || sudo rm -f $PREFIX/share/claident/taxdb/eukaryota_SSU_species_wosp_man.taxdb
rm -f $PREFIX/share/claident/taxdb/fungi_all_genus.taxdb 2> /dev/null || sudo rm -f $PREFIX/share/claident/taxdb/fungi_all_genus.taxdb
rm -f $PREFIX/share/claident/taxdb/fungi_all_species_wsp.taxdb 2> /dev/null || sudo rm -f $PREFIX/share/claident/taxdb/fungi_all_species_wsp.taxdb
rm -f $PREFIX/share/claident/taxdb/fungi_all_species.taxdb 2> /dev/null || sudo rm -f $PREFIX/share/claident/taxdb/fungi_all_species.taxdb
rm -f $PREFIX/share/claident/taxdb/fungi_all_species_wosp.taxdb 2> /dev/null || sudo rm -f $PREFIX/share/claident/taxdb/fungi_all_species_wosp.taxdb
rm -f $PREFIX/share/claident/taxdb/fungi_all_genus_man.taxdb 2> /dev/null || sudo rm -f $PREFIX/share/claident/taxdb/fungi_all_genus_man.taxdb
rm -f $PREFIX/share/claident/taxdb/fungi_all_species_wsp_man.taxdb 2> /dev/null || sudo rm -f $PREFIX/share/claident/taxdb/fungi_all_species_wsp_man.taxdb
rm -f $PREFIX/share/claident/taxdb/fungi_all_species_man.taxdb 2> /dev/null || sudo rm -f $PREFIX/share/claident/taxdb/fungi_all_species_man.taxdb
rm -f $PREFIX/share/claident/taxdb/fungi_all_species_wosp_man.taxdb 2> /dev/null || sudo rm -f $PREFIX/share/claident/taxdb/fungi_all_species_wosp_man.taxdb
rm -f $PREFIX/share/claident/taxdb/fungi_ITS_genus.taxdb 2> /dev/null || sudo rm -f $PREFIX/share/claident/taxdb/fungi_ITS_genus.taxdb
rm -f $PREFIX/share/claident/taxdb/fungi_ITS_species_wsp.taxdb 2> /dev/null || sudo rm -f $PREFIX/share/claident/taxdb/fungi_ITS_species_wsp.taxdb
rm -f $PREFIX/share/claident/taxdb/fungi_ITS_species.taxdb 2> /dev/null || sudo rm -f $PREFIX/share/claident/taxdb/fungi_ITS_species.taxdb
rm -f $PREFIX/share/claident/taxdb/fungi_ITS_species_wosp.taxdb 2> /dev/null || sudo rm -f $PREFIX/share/claident/taxdb/fungi_ITS_species_wosp.taxdb
rm -f $PREFIX/share/claident/taxdb/fungi_ITS_genus_man.taxdb 2> /dev/null || sudo rm -f $PREFIX/share/claident/taxdb/fungi_ITS_genus_man.taxdb
rm -f $PREFIX/share/claident/taxdb/fungi_ITS_species_wsp_man.taxdb 2> /dev/null || sudo rm -f $PREFIX/share/claident/taxdb/fungi_ITS_species_wsp_man.taxdb
rm -f $PREFIX/share/claident/taxdb/fungi_ITS_species_man.taxdb 2> /dev/null || sudo rm -f $PREFIX/share/claident/taxdb/fungi_ITS_species_man.taxdb
rm -f $PREFIX/share/claident/taxdb/fungi_ITS_species_wosp_man.taxdb 2> /dev/null || sudo rm -f $PREFIX/share/claident/taxdb/fungi_ITS_species_wosp_man.taxdb
rm -f $PREFIX/share/claident/taxdb/plants_cp_genus.taxdb 2> /dev/null || sudo rm -f $PREFIX/share/claident/taxdb/plants_cp_genus.taxdb
rm -f $PREFIX/share/claident/taxdb/plants_cp_species_wsp.taxdb 2> /dev/null || sudo rm -f $PREFIX/share/claident/taxdb/plants_cp_species_wsp.taxdb
rm -f $PREFIX/share/claident/taxdb/plants_cp_species.taxdb 2> /dev/null || sudo rm -f $PREFIX/share/claident/taxdb/plants_cp_species.taxdb
rm -f $PREFIX/share/claident/taxdb/plants_cp_species_wosp.taxdb 2> /dev/null || sudo rm -f $PREFIX/share/claident/taxdb/plants_cp_species_wosp.taxdb
rm -f $PREFIX/share/claident/taxdb/plants_cp_genus_man.taxdb 2> /dev/null || sudo rm -f $PREFIX/share/claident/taxdb/plants_cp_genus_man.taxdb
rm -f $PREFIX/share/claident/taxdb/plants_cp_species_wsp_man.taxdb 2> /dev/null || sudo rm -f $PREFIX/share/claident/taxdb/plants_cp_species_wsp_man.taxdb
rm -f $PREFIX/share/claident/taxdb/plants_cp_species_man.taxdb 2> /dev/null || sudo rm -f $PREFIX/share/claident/taxdb/plants_cp_species_man.taxdb
rm -f $PREFIX/share/claident/taxdb/plants_cp_species_wosp_man.taxdb 2> /dev/null || sudo rm -f $PREFIX/share/claident/taxdb/plants_cp_species_wosp_man.taxdb
rm -f $PREFIX/share/claident/taxdb/plants_matK_genus.taxdb 2> /dev/null || sudo rm -f $PREFIX/share/claident/taxdb/plants_matK_genus.taxdb
rm -f $PREFIX/share/claident/taxdb/plants_matK_species_wsp.taxdb 2> /dev/null || sudo rm -f $PREFIX/share/claident/taxdb/plants_matK_species_wsp.taxdb
rm -f $PREFIX/share/claident/taxdb/plants_matK_species.taxdb 2> /dev/null || sudo rm -f $PREFIX/share/claident/taxdb/plants_matK_species.taxdb
rm -f $PREFIX/share/claident/taxdb/plants_matK_species_wosp.taxdb 2> /dev/null || sudo rm -f $PREFIX/share/claident/taxdb/plants_matK_species_wosp.taxdb
rm -f $PREFIX/share/claident/taxdb/plants_matK_genus_man.taxdb 2> /dev/null || sudo rm -f $PREFIX/share/claident/taxdb/plants_matK_genus_man.taxdb
rm -f $PREFIX/share/claident/taxdb/plants_matK_species_wsp_man.taxdb 2> /dev/null || sudo rm -f $PREFIX/share/claident/taxdb/plants_matK_species_wsp_man.taxdb
rm -f $PREFIX/share/claident/taxdb/plants_matK_species_man.taxdb 2> /dev/null || sudo rm -f $PREFIX/share/claident/taxdb/plants_matK_species_man.taxdb
rm -f $PREFIX/share/claident/taxdb/plants_matK_species_wosp_man.taxdb 2> /dev/null || sudo rm -f $PREFIX/share/claident/taxdb/plants_matK_species_wosp_man.taxdb
rm -f $PREFIX/share/claident/taxdb/plants_rbcL_genus.taxdb 2> /dev/null || sudo rm -f $PREFIX/share/claident/taxdb/plants_rbcL_genus.taxdb
rm -f $PREFIX/share/claident/taxdb/plants_rbcL_species_wsp.taxdb 2> /dev/null || sudo rm -f $PREFIX/share/claident/taxdb/plants_rbcL_species_wsp.taxdb
rm -f $PREFIX/share/claident/taxdb/plants_rbcL_species.taxdb 2> /dev/null || sudo rm -f $PREFIX/share/claident/taxdb/plants_rbcL_species.taxdb
rm -f $PREFIX/share/claident/taxdb/plants_rbcL_species_wosp.taxdb 2> /dev/null || sudo rm -f $PREFIX/share/claident/taxdb/plants_rbcL_species_wosp.taxdb
rm -f $PREFIX/share/claident/taxdb/plants_rbcL_genus_man.taxdb 2> /dev/null || sudo rm -f $PREFIX/share/claident/taxdb/plants_rbcL_genus_man.taxdb
rm -f $PREFIX/share/claident/taxdb/plants_rbcL_species_wsp_man.taxdb 2> /dev/null || sudo rm -f $PREFIX/share/claident/taxdb/plants_rbcL_species_wsp_man.taxdb
rm -f $PREFIX/share/claident/taxdb/plants_rbcL_species_man.taxdb 2> /dev/null || sudo rm -f $PREFIX/share/claident/taxdb/plants_rbcL_species_man.taxdb
rm -f $PREFIX/share/claident/taxdb/plants_rbcL_species_wosp_man.taxdb 2> /dev/null || sudo rm -f $PREFIX/share/claident/taxdb/plants_rbcL_species_wosp_man.taxdb
rm -f $PREFIX/share/claident/taxdb/plants_trnH-psbA_genus.taxdb 2> /dev/null || sudo rm -f $PREFIX/share/claident/taxdb/plants_trnH-psbA_genus.taxdb
rm -f $PREFIX/share/claident/taxdb/plants_trnH-psbA_species_wsp.taxdb 2> /dev/null || sudo rm -f $PREFIX/share/claident/taxdb/plants_trnH-psbA_species_wsp.taxdb
rm -f $PREFIX/share/claident/taxdb/plants_trnH-psbA_species.taxdb 2> /dev/null || sudo rm -f $PREFIX/share/claident/taxdb/plants_trnH-psbA_species.taxdb
rm -f $PREFIX/share/claident/taxdb/plants_trnH-psbA_species_wosp.taxdb 2> /dev/null || sudo rm -f $PREFIX/share/claident/taxdb/plants_trnH-psbA_species_wosp.taxdb
rm -f $PREFIX/share/claident/taxdb/plants_trnH-psbA_genus_man.taxdb 2> /dev/null || sudo rm -f $PREFIX/share/claident/taxdb/plants_trnH-psbA_genus_man.taxdb
rm -f $PREFIX/share/claident/taxdb/plants_trnH-psbA_species_wsp_man.taxdb 2> /dev/null || sudo rm -f $PREFIX/share/claident/taxdb/plants_trnH-psbA_species_wsp_man.taxdb
rm -f $PREFIX/share/claident/taxdb/plants_trnH-psbA_species_man.taxdb 2> /dev/null || sudo rm -f $PREFIX/share/claident/taxdb/plants_trnH-psbA_species_man.taxdb
rm -f $PREFIX/share/claident/taxdb/plants_trnH-psbA_species_wosp_man.taxdb 2> /dev/null || sudo rm -f $PREFIX/share/claident/taxdb/plants_trnH-psbA_species_wosp_man.taxdb
rm -f $PREFIX/share/claident/taxdb/prokaryota_16S_genus.taxdb 2> /dev/null || sudo rm -f $PREFIX/share/claident/taxdb/prokaryota_16S_genus.taxdb
rm -f $PREFIX/share/claident/taxdb/prokaryota_16S_species_wsp.taxdb 2> /dev/null || sudo rm -f $PREFIX/share/claident/taxdb/prokaryota_16S_species_wsp.taxdb
rm -f $PREFIX/share/claident/taxdb/prokaryota_16S_species.taxdb 2> /dev/null || sudo rm -f $PREFIX/share/claident/taxdb/prokaryota_16S_species.taxdb
rm -f $PREFIX/share/claident/taxdb/prokaryota_16S_species_wosp.taxdb 2> /dev/null || sudo rm -f $PREFIX/share/claident/taxdb/prokaryota_16S_species_wosp.taxdb
rm -f $PREFIX/share/claident/taxdb/prokaryota_16S_genus_man.taxdb 2> /dev/null || sudo rm -f $PREFIX/share/claident/taxdb/prokaryota_16S_genus_man.taxdb
rm -f $PREFIX/share/claident/taxdb/prokaryota_16S_species_wsp_man.taxdb 2> /dev/null || sudo rm -f $PREFIX/share/claident/taxdb/prokaryota_16S_species_wsp_man.taxdb
rm -f $PREFIX/share/claident/taxdb/prokaryota_16S_species_man.taxdb 2> /dev/null || sudo rm -f $PREFIX/share/claident/taxdb/prokaryota_16S_species_man.taxdb
rm -f $PREFIX/share/claident/taxdb/prokaryota_16S_species_wosp_man.taxdb 2> /dev/null || sudo rm -f $PREFIX/share/claident/taxdb/prokaryota_16S_species_wosp_man.taxdb
rm -f $PREFIX/share/claident/taxdb/prokaryota_all_genus.taxdb 2> /dev/null || sudo rm -f $PREFIX/share/claident/taxdb/prokaryota_all_genus.taxdb
rm -f $PREFIX/share/claident/taxdb/prokaryota_all_species_wsp.taxdb 2> /dev/null || sudo rm -f $PREFIX/share/claident/taxdb/prokaryota_all_species_wsp.taxdb
rm -f $PREFIX/share/claident/taxdb/prokaryota_all_species.taxdb 2> /dev/null || sudo rm -f $PREFIX/share/claident/taxdb/prokaryota_all_species.taxdb
rm -f $PREFIX/share/claident/taxdb/prokaryota_all_species_wosp.taxdb 2> /dev/null || sudo rm -f $PREFIX/share/claident/taxdb/prokaryota_all_species_wosp.taxdb
rm -f $PREFIX/share/claident/taxdb/prokaryota_all_genus_man.taxdb 2> /dev/null || sudo rm -f $PREFIX/share/claident/taxdb/prokaryota_all_genus_man.taxdb
rm -f $PREFIX/share/claident/taxdb/prokaryota_all_species_wsp_man.taxdb 2> /dev/null || sudo rm -f $PREFIX/share/claident/taxdb/prokaryota_all_species_wsp_man.taxdb
rm -f $PREFIX/share/claident/taxdb/prokaryota_all_species_man.taxdb 2> /dev/null || sudo rm -f $PREFIX/share/claident/taxdb/prokaryota_all_species_man.taxdb
rm -f $PREFIX/share/claident/taxdb/prokaryota_all_species_wosp_man.taxdb 2> /dev/null || sudo rm -f $PREFIX/share/claident/taxdb/prokaryota_all_species_wosp_man.taxdb
rm -f $PREFIX/share/claident/taxdb/semiall_class.taxdb 2> /dev/null || sudo rm -f $PREFIX/share/claident/taxdb/semiall_class.taxdb
rm -f $PREFIX/share/claident/taxdb/semiall_order.taxdb 2> /dev/null || sudo rm -f $PREFIX/share/claident/taxdb/semiall_order.taxdb
rm -f $PREFIX/share/claident/taxdb/semiall_family.taxdb 2> /dev/null || sudo rm -f $PREFIX/share/claident/taxdb/semiall_family.taxdb
rm -f $PREFIX/share/claident/taxdb/semiall_genus.taxdb 2> /dev/null || sudo rm -f $PREFIX/share/claident/taxdb/semiall_genus.taxdb
rm -f $PREFIX/share/claident/taxdb/semiall_species_wsp.taxdb 2> /dev/null || sudo rm -f $PREFIX/share/claident/taxdb/semiall_species_wsp.taxdb
rm -f $PREFIX/share/claident/taxdb/semiall_species.taxdb 2> /dev/null || sudo rm -f $PREFIX/share/claident/taxdb/semiall_species.taxdb
rm -f $PREFIX/share/claident/taxdb/semiall_species_wosp.taxdb 2> /dev/null || sudo rm -f $PREFIX/share/claident/taxdb/semiall_species_wosp.taxdb
rm -f $PREFIX/share/claident/taxdb/overall_class.taxdb 2> /dev/null || sudo rm -f $PREFIX/share/claident/taxdb/overall_class.taxdb
rm -f $PREFIX/share/claident/taxdb/overall_order.taxdb 2> /dev/null || sudo rm -f $PREFIX/share/claident/taxdb/overall_order.taxdb
rm -f $PREFIX/share/claident/taxdb/overall_family.taxdb 2> /dev/null || sudo rm -f $PREFIX/share/claident/taxdb/overall_family.taxdb
rm -f $PREFIX/share/claident/taxdb/overall_genus.taxdb 2> /dev/null || sudo rm -f $PREFIX/share/claident/taxdb/overall_genus.taxdb
rm -f $PREFIX/share/claident/taxdb/overall_species_wsp.taxdb 2> /dev/null || sudo rm -f $PREFIX/share/claident/taxdb/overall_species_wsp.taxdb
rm -f $PREFIX/share/claident/taxdb/overall_species.taxdb 2> /dev/null || sudo rm -f $PREFIX/share/claident/taxdb/overall_species.taxdb
rm -f $PREFIX/share/claident/taxdb/overall_species_wosp.taxdb 2> /dev/null || sudo rm -f $PREFIX/share/claident/taxdb/overall_species_wosp.taxdb
rm -f $PREFIX/share/claident/taxdb/overall_genus_man.taxdb 2> /dev/null || sudo rm -f $PREFIX/share/claident/taxdb/overall_genus_man.taxdb
rm -f $PREFIX/share/claident/taxdb/overall_species_wsp_man.taxdb 2> /dev/null || sudo rm -f $PREFIX/share/claident/taxdb/overall_species_wsp_man.taxdb
rm -f $PREFIX/share/claident/taxdb/overall_species_man.taxdb 2> /dev/null || sudo rm -f $PREFIX/share/claident/taxdb/overall_species_man.taxdb
rm -f $PREFIX/share/claident/taxdb/overall_species_wosp_man.taxdb 2> /dev/null || sudo rm -f $PREFIX/share/claident/taxdb/overall_species_wosp_man.taxdb
chmod 666 *.taxdb 2> /dev/null || sudo chmod 666 *.taxdb || exit $?
mv -f *.taxdb $PREFIX/share/claident/taxdb/ 2> /dev/null || sudo mv -f *.taxdb $PREFIX/share/claident/taxdb/ || exit $?
rm *.sha256 || exit $?
rm *.tar.xz || exit $?
touch .taxdb || exit $?
echo 'The taxonomy databases were installed correctly!'
fi
# download, check, and install BLAST databases
if ! test -e .blastdb; then
wget -nv -c https://www.claident.org/BLASTDBURL.txt.xz || exit $?
rm -f BLASTDBURL.txt || exit $?
xz -d BLASTDBURL.txt.xz || exit $?
wget -nv --limit-rate=10m -c -i BLASTDBURL.txt || exit $?
rm -f BLASTDBURL.txt || exit $?
ls *.sha256 | xargs -L 1 -P 4 -I {} sh -c 'gsha256sum -c {} || exit $?' || exit $?
ls *.tar.xz | xargs -L 1 -P 4 -I {} sh -c 'gnutar -xJf {} || exit $?' || exit $?
mkdir -p $PREFIX/share/claident/blastdb 2> /dev/null || sudo mkdir -p $PREFIX/share/claident/blastdb || exit $?
rm -f $PREFIX/share/claident/blastdb/animals_COX1_genus.* 2> /dev/null || sudo rm -f $PREFIX/share/claident/blastdb/animals_COX1_genus.*
rm -f $PREFIX/share/claident/blastdb/animals_COX1_species_wsp.* 2> /dev/null || sudo rm -f $PREFIX/share/claident/blastdb/animals_COX1_species_wsp.*
rm -f $PREFIX/share/claident/blastdb/animals_COX1_species.* 2> /dev/null || sudo rm -f $PREFIX/share/claident/blastdb/animals_COX1_species.*
rm -f $PREFIX/share/claident/blastdb/animals_COX1_species_wosp.* 2> /dev/null || sudo rm -f $PREFIX/share/claident/blastdb/animals_COX1_species_wosp.*
rm -f $PREFIX/share/claident/blastdb/animals_COX1_genus_man.* 2> /dev/null || sudo rm -f $PREFIX/share/claident/blastdb/animals_COX1_genus_man.*
rm -f $PREFIX/share/claident/blastdb/animals_COX1_species_wsp_man.* 2> /dev/null || sudo rm -f $PREFIX/share/claident/blastdb/animals_COX1_species_wsp_man.*
rm -f $PREFIX/share/claident/blastdb/animals_COX1_species_man.* 2> /dev/null || sudo rm -f $PREFIX/share/claident/blastdb/animals_COX1_species_man.*
rm -f $PREFIX/share/claident/blastdb/animals_COX1_species_wosp_man.* 2> /dev/null || sudo rm -f $PREFIX/share/claident/blastdb/animals_COX1_species_wosp_man.*
rm -f $PREFIX/share/claident/blastdb/animals_mt_genus.* 2> /dev/null || sudo rm -f $PREFIX/share/claident/blastdb/animals_mt_genus.*
rm -f $PREFIX/share/claident/blastdb/animals_mt_species_wsp.* 2> /dev/null || sudo rm -f $PREFIX/share/claident/blastdb/animals_mt_species_wsp.*
rm -f $PREFIX/share/claident/blastdb/animals_mt_species.* 2> /dev/null || sudo rm -f $PREFIX/share/claident/blastdb/animals_mt_species.*
rm -f $PREFIX/share/claident/blastdb/animals_mt_species_wosp.* 2> /dev/null || sudo rm -f $PREFIX/share/claident/blastdb/animals_mt_species_wosp.*
rm -f $PREFIX/share/claident/blastdb/animals_mt_genus_man.* 2> /dev/null || sudo rm -f $PREFIX/share/claident/blastdb/animals_mt_genus_man.*
rm -f $PREFIX/share/claident/blastdb/animals_mt_species_wsp_man.* 2> /dev/null || sudo rm -f $PREFIX/share/claident/blastdb/animals_mt_species_wsp_man.*
rm -f $PREFIX/share/claident/blastdb/animals_mt_species_man.* 2> /dev/null || sudo rm -f $PREFIX/share/claident/blastdb/animals_mt_species_man.*
rm -f $PREFIX/share/claident/blastdb/animals_mt_species_wosp_man.* 2> /dev/null || sudo rm -f $PREFIX/share/claident/blastdb/animals_mt_species_wosp_man.*
rm -f $PREFIX/share/claident/blastdb/eukaryota_LSU_genus.* 2> /dev/null || sudo rm -f $PREFIX/share/claident/blastdb/eukaryota_LSU_genus.*
rm -f $PREFIX/share/claident/blastdb/eukaryota_LSU_species_wsp.* 2> /dev/null || sudo rm -f $PREFIX/share/claident/blastdb/eukaryota_LSU_species_wsp.*
rm -f $PREFIX/share/claident/blastdb/eukaryota_LSU_species.* 2> /dev/null || sudo rm -f $PREFIX/share/claident/blastdb/eukaryota_LSU_species.*
rm -f $PREFIX/share/claident/blastdb/eukaryota_LSU_species_wosp.* 2> /dev/null || sudo rm -f $PREFIX/share/claident/blastdb/eukaryota_LSU_species_wosp.*
rm -f $PREFIX/share/claident/blastdb/eukaryota_LSU_genus_man.* 2> /dev/null || sudo rm -f $PREFIX/share/claident/blastdb/eukaryota_LSU_genus_man.*
rm -f $PREFIX/share/claident/blastdb/eukaryota_LSU_species_wsp_man.* 2> /dev/null || sudo rm -f $PREFIX/share/claident/blastdb/eukaryota_LSU_species_wsp_man.*
rm -f $PREFIX/share/claident/blastdb/eukaryota_LSU_species_man.* 2> /dev/null || sudo rm -f $PREFIX/share/claident/blastdb/eukaryota_LSU_species_man.*
rm -f $PREFIX/share/claident/blastdb/eukaryota_LSU_species_wosp_man.* 2> /dev/null || sudo rm -f $PREFIX/share/claident/blastdb/eukaryota_LSU_species_wosp_man.*
rm -f $PREFIX/share/claident/blastdb/eukaryota_SSU_genus.* 2> /dev/null || sudo rm -f $PREFIX/share/claident/blastdb/eukaryota_SSU_genus.*
rm -f $PREFIX/share/claident/blastdb/eukaryota_SSU_species_wsp.* 2> /dev/null || sudo rm -f $PREFIX/share/claident/blastdb/eukaryota_SSU_species_wsp.*
rm -f $PREFIX/share/claident/blastdb/eukaryota_SSU_species.* 2> /dev/null || sudo rm -f $PREFIX/share/claident/blastdb/eukaryota_SSU_species.*
rm -f $PREFIX/share/claident/blastdb/eukaryota_SSU_species_wosp.* 2> /dev/null || sudo rm -f $PREFIX/share/claident/blastdb/eukaryota_SSU_species_wosp.*
rm -f $PREFIX/share/claident/blastdb/eukaryota_SSU_genus_man.* 2> /dev/null || sudo rm -f $PREFIX/share/claident/blastdb/eukaryota_SSU_genus_man.*
rm -f $PREFIX/share/claident/blastdb/eukaryota_SSU_species_wsp_man.* 2> /dev/null || sudo rm -f $PREFIX/share/claident/blastdb/eukaryota_SSU_species_wsp_man.*
rm -f $PREFIX/share/claident/blastdb/eukaryota_SSU_species_man.* 2> /dev/null || sudo rm -f $PREFIX/share/claident/blastdb/eukaryota_SSU_species_man.*
rm -f $PREFIX/share/claident/blastdb/eukaryota_SSU_species_wosp_man.* 2> /dev/null || sudo rm -f $PREFIX/share/claident/blastdb/eukaryota_SSU_species_wosp_man.*
rm -f $PREFIX/share/claident/blastdb/fungi_all_genus.* 2> /dev/null || sudo rm -f $PREFIX/share/claident/blastdb/fungi_all_genus.*
rm -f $PREFIX/share/claident/blastdb/fungi_all_species_wsp.* 2> /dev/null || sudo rm -f $PREFIX/share/claident/blastdb/fungi_all_species_wsp.*
rm -f $PREFIX/share/claident/blastdb/fungi_all_species.* 2> /dev/null || sudo rm -f $PREFIX/share/claident/blastdb/fungi_all_species.*
rm -f $PREFIX/share/claident/blastdb/fungi_all_species_wosp.* 2> /dev/null || sudo rm -f $PREFIX/share/claident/blastdb/fungi_all_species_wosp.*
rm -f $PREFIX/share/claident/blastdb/fungi_all_genus_man.* 2> /dev/null || sudo rm -f $PREFIX/share/claident/blastdb/fungi_all_genus_man.*
rm -f $PREFIX/share/claident/blastdb/fungi_all_species_wsp_man.* 2> /dev/null || sudo rm -f $PREFIX/share/claident/blastdb/fungi_all_species_wsp_man.*
rm -f $PREFIX/share/claident/blastdb/fungi_all_species_man.* 2> /dev/null || sudo rm -f $PREFIX/share/claident/blastdb/fungi_all_species_man.*
rm -f $PREFIX/share/claident/blastdb/fungi_all_species_wosp_man.* 2> /dev/null || sudo rm -f $PREFIX/share/claident/blastdb/fungi_all_species_wosp_man.*
rm -f $PREFIX/share/claident/blastdb/fungi_ITS_genus_man.* 2> /dev/null || sudo rm -f $PREFIX/share/claident/blastdb/fungi_ITS_genus_man.*
rm -f $PREFIX/share/claident/blastdb/fungi_ITS_species_wsp_man.* 2> /dev/null || sudo rm -f $PREFIX/share/claident/blastdb/fungi_ITS_species_wsp_man.*
rm -f $PREFIX/share/claident/blastdb/fungi_ITS_species_man.* 2> /dev/null || sudo rm -f $PREFIX/share/claident/blastdb/fungi_ITS_species_man.*
rm -f $PREFIX/share/claident/blastdb/fungi_ITS_species_wosp_man.* 2> /dev/null || sudo rm -f $PREFIX/share/claident/blastdb/fungi_ITS_species_wosp_man.*
rm -f $PREFIX/share/claident/blastdb/plants_cp_genus.* 2> /dev/null || sudo rm -f $PREFIX/share/claident/blastdb/plants_cp_genus.*
rm -f $PREFIX/share/claident/blastdb/plants_cp_species_wsp.* 2> /dev/null || sudo rm -f $PREFIX/share/claident/blastdb/plants_cp_species_wsp.*
rm -f $PREFIX/share/claident/blastdb/plants_cp_species.* 2> /dev/null || sudo rm -f $PREFIX/share/claident/blastdb/plants_cp_species.*
rm -f $PREFIX/share/claident/blastdb/plants_cp_species_wosp.* 2> /dev/null || sudo rm -f $PREFIX/share/claident/blastdb/plants_cp_species_wosp.*
rm -f $PREFIX/share/claident/blastdb/plants_cp_genus_man.* 2> /dev/null || sudo rm -f $PREFIX/share/claident/blastdb/plants_cp_genus_man.*
rm -f $PREFIX/share/claident/blastdb/plants_cp_species_wsp_man.* 2> /dev/null || sudo rm -f $PREFIX/share/claident/blastdb/plants_cp_species_wsp_man.*
rm -f $PREFIX/share/claident/blastdb/plants_cp_species_man.* 2> /dev/null || sudo rm -f $PREFIX/share/claident/blastdb/plants_cp_species_man.*
rm -f $PREFIX/share/claident/blastdb/plants_cp_species_wosp_man.* 2> /dev/null || sudo rm -f $PREFIX/share/claident/blastdb/plants_cp_species_wosp_man.*
rm -f $PREFIX/share/claident/blastdb/plants_matK_genus.* 2> /dev/null || sudo rm -f $PREFIX/share/claident/blastdb/plants_matK_genus.*
rm -f $PREFIX/share/claident/blastdb/plants_matK_species_wsp.* 2> /dev/null || sudo rm -f $PREFIX/share/claident/blastdb/plants_matK_species_wsp.*
rm -f $PREFIX/share/claident/blastdb/plants_matK_species.* 2> /dev/null || sudo rm -f $PREFIX/share/claident/blastdb/plants_matK_species.*
rm -f $PREFIX/share/claident/blastdb/plants_matK_species_wosp.* 2> /dev/null || sudo rm -f $PREFIX/share/claident/blastdb/plants_matK_species_wosp.*
rm -f $PREFIX/share/claident/blastdb/plants_matK_genus_man.* 2> /dev/null || sudo rm -f $PREFIX/share/claident/blastdb/plants_matK_genus_man.*
rm -f $PREFIX/share/claident/blastdb/plants_matK_species_wsp_man.* 2> /dev/null || sudo rm -f $PREFIX/share/claident/blastdb/plants_matK_species_wsp_man.*
rm -f $PREFIX/share/claident/blastdb/plants_matK_species_man.* 2> /dev/null || sudo rm -f $PREFIX/share/claident/blastdb/plants_matK_species_man.*
rm -f $PREFIX/share/claident/blastdb/plants_matK_species_wosp_man.* 2> /dev/null || sudo rm -f $PREFIX/share/claident/blastdb/plants_matK_species_wosp_man.*
rm -f $PREFIX/share/claident/blastdb/plants_rbcL_genus.* 2> /dev/null || sudo rm -f $PREFIX/share/claident/blastdb/plants_rbcL_genus.*
rm -f $PREFIX/share/claident/blastdb/plants_rbcL_species_wsp.* 2> /dev/null || sudo rm -f $PREFIX/share/claident/blastdb/plants_rbcL_species_wsp.*
rm -f $PREFIX/share/claident/blastdb/plants_rbcL_species.* 2> /dev/null || sudo rm -f $PREFIX/share/claident/blastdb/plants_rbcL_species.*
rm -f $PREFIX/share/claident/blastdb/plants_rbcL_species_wosp.* 2> /dev/null || sudo rm -f $PREFIX/share/claident/blastdb/plants_rbcL_species_wosp.*
rm -f $PREFIX/share/claident/blastdb/plants_rbcL_genus_man.* 2> /dev/null || sudo rm -f $PREFIX/share/claident/blastdb/plants_rbcL_genus_man.*
rm -f $PREFIX/share/claident/blastdb/plants_rbcL_species_wsp_man.* 2> /dev/null || sudo rm -f $PREFIX/share/claident/blastdb/plants_rbcL_species_wsp_man.*
rm -f $PREFIX/share/claident/blastdb/plants_rbcL_species_man.* 2> /dev/null || sudo rm -f $PREFIX/share/claident/blastdb/plants_rbcL_species_man.*
rm -f $PREFIX/share/claident/blastdb/plants_rbcL_species_wosp_man.* 2> /dev/null || sudo rm -f $PREFIX/share/claident/blastdb/plants_rbcL_species_wosp_man.*
rm -f $PREFIX/share/claident/blastdb/plants_trnH-psbA_genus.* 2> /dev/null || sudo rm -f $PREFIX/share/claident/blastdb/plants_trnH-psbA_genus.*
rm -f $PREFIX/share/claident/blastdb/plants_trnH-psbA_species_wsp.* 2> /dev/null || sudo rm -f $PREFIX/share/claident/blastdb/plants_trnH-psbA_species_wsp.*
rm -f $PREFIX/share/claident/blastdb/plants_trnH-psbA_species.* 2> /dev/null || sudo rm -f $PREFIX/share/claident/blastdb/plants_trnH-psbA_species.*
rm -f $PREFIX/share/claident/blastdb/plants_trnH-psbA_species_wosp.* 2> /dev/null || sudo rm -f $PREFIX/share/claident/blastdb/plants_trnH-psbA_species_wosp.*
rm -f $PREFIX/share/claident/blastdb/plants_trnH-psbA_genus_man.* 2> /dev/null || sudo rm -f $PREFIX/share/claident/blastdb/plants_trnH-psbA_genus_man.*
rm -f $PREFIX/share/claident/blastdb/plants_trnH-psbA_species_wsp_man.* 2> /dev/null || sudo rm -f $PREFIX/share/claident/blastdb/plants_trnH-psbA_species_wsp_man.*
rm -f $PREFIX/share/claident/blastdb/plants_trnH-psbA_species_man.* 2> /dev/null || sudo rm -f $PREFIX/share/claident/blastdb/plants_trnH-psbA_species_man.*
rm -f $PREFIX/share/claident/blastdb/plants_trnH-psbA_species_wosp_man.* 2> /dev/null || sudo rm -f $PREFIX/share/claident/blastdb/plants_trnH-psbA_species_wosp_man.*
rm -f $PREFIX/share/claident/blastdb/prokaryota_16S_genus.* 2> /dev/null || sudo rm -f $PREFIX/share/claident/blastdb/prokaryota_16S_genus.*
rm -f $PREFIX/share/claident/blastdb/prokaryota_16S_species_wsp.* 2> /dev/null || sudo rm -f $PREFIX/share/claident/blastdb/prokaryota_16S_species_wsp.*
rm -f $PREFIX/share/claident/blastdb/prokaryota_16S_species.* 2> /dev/null || sudo rm -f $PREFIX/share/claident/blastdb/prokaryota_16S_species.*
rm -f $PREFIX/share/claident/blastdb/prokaryota_16S_species_wosp.* 2> /dev/null || sudo rm -f $PREFIX/share/claident/blastdb/prokaryota_16S_species_wosp.*
rm -f $PREFIX/share/claident/blastdb/prokaryota_16S_genus_man.* 2> /dev/null || sudo rm -f $PREFIX/share/claident/blastdb/prokaryota_16S_genus_man.*
rm -f $PREFIX/share/claident/blastdb/prokaryota_16S_species_wsp_man.* 2> /dev/null || sudo rm -f $PREFIX/share/claident/blastdb/prokaryota_16S_species_wsp_man.*
rm -f $PREFIX/share/claident/blastdb/prokaryota_16S_species_man.* 2> /dev/null || sudo rm -f $PREFIX/share/claident/blastdb/prokaryota_16S_species_man.*
rm -f $PREFIX/share/claident/blastdb/prokaryota_16S_species_wosp_man.* 2> /dev/null || sudo rm -f $PREFIX/share/claident/blastdb/prokaryota_16S_species_wosp_man.*
rm -f $PREFIX/share/claident/blastdb/prokaryota_all_genus.* 2> /dev/null || sudo rm -f $PREFIX/share/claident/blastdb/prokaryota_all_genus.*
rm -f $PREFIX/share/claident/blastdb/prokaryota_all_species_wsp.* 2> /dev/null || sudo rm -f $PREFIX/share/claident/blastdb/prokaryota_all_species_wsp.*
rm -f $PREFIX/share/claident/blastdb/prokaryota_all_species.* 2> /dev/null || sudo rm -f $PREFIX/share/claident/blastdb/prokaryota_all_species.*
rm -f $PREFIX/share/claident/blastdb/prokaryota_all_species_wosp.* 2> /dev/null || sudo rm -f $PREFIX/share/claident/blastdb/prokaryota_all_species_wosp.*
rm -f $PREFIX/share/claident/blastdb/prokaryota_all_genus_man.* 2> /dev/null || sudo rm -f $PREFIX/share/claident/blastdb/prokaryota_all_genus_man.*
rm -f $PREFIX/share/claident/blastdb/prokaryota_all_species_wsp_man.* 2> /dev/null || sudo rm -f $PREFIX/share/claident/blastdb/prokaryota_all_species_wsp_man.*
rm -f $PREFIX/share/claident/blastdb/prokaryota_all_species_man.* 2> /dev/null || sudo rm -f $PREFIX/share/claident/blastdb/prokaryota_all_species_man.*
rm -f $PREFIX/share/claident/blastdb/prokaryota_all_species_wosp_man.* 2> /dev/null || sudo rm -f $PREFIX/share/claident/blastdb/prokaryota_all_species_wosp_man.*
rm -f $PREFIX/share/claident/blastdb/semiall_class.* 2> /dev/null || sudo rm -f $PREFIX/share/claident/blastdb/semiall_class.*
rm -f $PREFIX/share/claident/blastdb/semiall_order.* 2> /dev/null || sudo rm -f $PREFIX/share/claident/blastdb/semiall_order.*
rm -f $PREFIX/share/claident/blastdb/semiall_family.* 2> /dev/null || sudo rm -f $PREFIX/share/claident/blastdb/semiall_family.*
rm -f $PREFIX/share/claident/blastdb/semiall_genus.* 2> /dev/null || sudo rm -f $PREFIX/share/claident/blastdb/semiall_genus.*
rm -f $PREFIX/share/claident/blastdb/semiall_species_wsp.* 2> /dev/null || sudo rm -f $PREFIX/share/claident/blastdb/semiall_species_wsp.*
rm -f $PREFIX/share/claident/blastdb/semiall_species.* 2> /dev/null || sudo rm -f $PREFIX/share/claident/blastdb/semiall_species.*
rm -f $PREFIX/share/claident/blastdb/semiall_species_wosp.* 2> /dev/null || sudo rm -f $PREFIX/share/claident/blastdb/semiall_species_wosp.*
rm -f $PREFIX/share/claident/blastdb/overall_class.* 2> /dev/null || sudo rm -f $PREFIX/share/claident/blastdb/overall_class.*
rm -f $PREFIX/share/claident/blastdb/overall_order.* 2> /dev/null || sudo rm -f $PREFIX/share/claident/blastdb/overall_order.*
rm -f $PREFIX/share/claident/blastdb/overall_family.* 2> /dev/null || sudo rm -f $PREFIX/share/claident/blastdb/overall_family.*
rm -f $PREFIX/share/claident/blastdb/overall_genus.* 2> /dev/null || sudo rm -f $PREFIX/share/claident/blastdb/overall_genus.*
rm -f $PREFIX/share/claident/blastdb/overall_species_wsp.* 2> /dev/null || sudo rm -f $PREFIX/share/claident/blastdb/overall_species_wsp.*
rm -f $PREFIX/share/claident/blastdb/overall_species.* 2> /dev/null || sudo rm -f $PREFIX/share/claident/blastdb/overall_species.*
rm -f $PREFIX/share/claident/blastdb/overall_species_wosp.* 2> /dev/null || sudo rm -f $PREFIX/share/claident/blastdb/overall_species_wosp.*
rm -f $PREFIX/share/claident/blastdb/overall_genus_man.* 2> /dev/null || sudo rm -f $PREFIX/share/claident/blastdb/overall_genus_man.*
rm -f $PREFIX/share/claident/blastdb/overall_species_wsp_man.* 2> /dev/null || sudo rm -f $PREFIX/share/claident/blastdb/overall_species_wsp_man.*
rm -f $PREFIX/share/claident/blastdb/overall_species_man.* 2> /dev/null || sudo rm -f $PREFIX/share/claident/blastdb/overall_species_man.*
rm -f $PREFIX/share/claident/blastdb/overall_species_wosp_man.* 2> /dev/null || sudo rm -f $PREFIX/share/claident/blastdb/overall_species_wosp_man.*
mv -f overall_class.??.n?? $PREFIX/share/claident/blastdb/ 2> /dev/null || sudo mv -f overall_class.??.n?? $PREFIX/share/claident/blastdb/ || exit $?
mv -f *.bsl *.nal $PREFIX/share/claident/blastdb/ 2> /dev/null || sudo mv -f *.bsl *.nal $PREFIX/share/claident/blastdb/ || exit $?
rm -f *.sha256 || exit $?
rm -f *.tar.xz || exit $?
touch .blastdb || exit $?
echo 'The BLAST databases were installed correctly!'
fi
echo 'You do not need to care about error messages.'
