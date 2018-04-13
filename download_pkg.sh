#!/bin/bash

source /cvmfs/hep.pnnl.gov/project8/mermithid/${MERMITHIDBRANCH}/setup.sh

########################################################################
#
# collect source distributions for all submodules
#
########################################################################

# GITHUB TOKEN
export GITHUB_TOKEN=da54a35461cf3993743a6772f88959a6d2a4ad8b
export GITHUB_USER=project8-machine

export MERMITHID_BRANCH=b98fc5c6537957c04c26511956f78e7145cfef7a
export MORPHO_BRANCH=86d103aee5dae8014df15132176066d9a795809b
export PHYLLOXERA_BRANCH=3269d07aca9b993b13a1fed0d5577b3f360828cf
export CICADA_BRANCH=d632b0fc5d4c42e9f0b76ad47cea69abd39aee72
export SCARAB_BRANCH=396f6a58d78c85ca67c83984a78e47576ecfbac7
export RAPIDJSON_BRANCH=5de06bfa37495b529dc00139f1b138a526fff27a
export YAMLCPP_BRANCH=3757b2023b71d183a341677feee693c71c2e0766

export MERMITHID_URL=https://github.com/project8/mermithid/archive/${MERMITHID_BRANCH}.zip
export MORPHO_URL=https://github.com/project8/morpho/archive/${MORPHO_BRANCH}.zip
export PHYLLOXERA_URL=https://github.com/project8/phylloxera/archive/${PHYLLOXERA_BRANCH}.zip
export CICADA_URL=https://github.com/project8/cicada/archive/${CICADA_BRANCH}.zip
echo $CICADA_URL
export SCARAB_URL=https://github.com/project8/scarab/archive/${SCARAB_BRANCH}.zip
export RAPIDJSON_URL=https://github.com/Tencent/rapidjson/archive/${RAPIDJSON_BRANCH}.zip
export YAMLCPP_URL=https://github.com/jbeder/yaml-cpp/archive/${YAMLCPP_BRANCH}.zip

# get into the parent directory for all the source code and build proucts
cd ${P8MERMITHIDBASEDIR}
mkdir src
cd src/
pwd

# Because Git does not exist, we have to download manually all items and put them at the right place. 
# How annoying...
echo "Prepare Mermithid"
wget -O mermithid-${MERMITHID_BRANCH}.zip ${MERMITHID_URL} --output-file=wget_log.txt --tries=3
unzip -q mermithid-${MERMITHID_BRANCH}.zip
rm mermithid-${MERMITHID_BRANCH}.zip
mv mermithid-${MERMITHID_BRANCH} mermithid

echo "Prepare Scarab"
wget -O scarab-${SCARAB_BRANCH}.zip ${SCARAB_URL} --output-file=wget_log.txt --tries=3
unzip -q scarab-${SCARAB_BRANCH}.zip
rm scarab-${SCARAB_BRANCH}.zip
mv scarab-${SCARAB_BRANCH} Scarab
echo "Rapidjson for Scarab"
wget -O rapidjson-${RAPIDJSON_BRANCH}.zip ${RAPIDJSON_URL} --output-file=wget_log.txt --tries=3
unzip -q rapidjson-${RAPIDJSON_BRANCH}.zip
rm rapidjson-${RAPIDJSON_BRANCH}.zip
mv rapidjson-${RAPIDJSON_BRANCH} rapidjson
mkdir -p Scarab/library/param/codec/json
mv rapidjson Scarab/library/param/codec/json
rm -rf rapidjson
echo "yaml-cpp for Scarab"
wget -O yaml-cpp-${YAMLCPP_BRANCH}.zip ${YAMLCPP_URL} --output-file=wget_log.txt --tries=3
unzip -q yaml-cpp-${YAMLCPP_BRANCH}.zip
rm yaml-cpp-${YAMLCPP_BRANCH}.zip
mv yaml-cpp-${YAMLCPP_BRANCH} yaml-cpp
mkdir -p Scarab/library/param/codec/yaml
mv yaml-cpp Scarab/library/param/codec/yaml
rm -rf yaml-cpp
echo "Scarab is ready!"

echo "Prepare Phylloxera"
wget -O phylloxera-${PHYLLOXERA_BRANCH}.zip ${PHYLLOXERA_URL} --output-file=wget_log.txt --tries=3
unzip -q phylloxera-${PHYLLOXERA_BRANCH}.zip
rm phylloxera-${PHYLLOXERA_BRANCH}.zip
mv phylloxera-${PHYLLOXERA_BRANCH} Phylloxera
cp -r Scarab Phylloxera
mv Phylloxera mermithid
echo "Phylloxera is done!"

echo "Prepare Cicada"
wget -O cicada-${CICADA_BRANCH}.zip ${CICADA_URL} --output-file=wget_log.txt --tries=3
unzip -q cicada-${CICADA_BRANCH}.zip
rm cicada-${CICADA_BRANCH}.zip
mv cicada-${CICADA_BRANCH} Cicada
cp -r Scarab Cicada
mv Cicada mermithid
echo "Cicada is done!"

echo "Prepare morpho"
wget -O morpho-${MORPHO_BRANCH}.zip ${MORPHO_URL} --output-file=wget_log.txt --tries=3
unzip -q morpho-${MORPHO_BRANCH}.zip
rm morpho-${MORPHO_BRANCH}.zip
mv morpho-${MORPHO_BRANCH} morpho
# cp -r Scarab Cicada
mv morpho mermithid
echo "Morpho is done!"

echo "Cleaning up Scarab..."
rm -rf Scarab

cd ../
ls



