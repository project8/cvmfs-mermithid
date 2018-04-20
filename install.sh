#!/bin/bash

source /cvmfs/hep.pnnl.gov/project8/mermithid/${MERMITHIDBRANCH}/setup.sh

echo "Environment variables after installing python:"
env
echo `which python3`
echo `python3 -V`

echo `gcc --version`
echo `python3 --version`

echo `which cc`
echo `which g++`
echo `which ld`

echo "LD_LIBRARY_PATH: $LD_LIBRARY_PATH"
echo "LIBRARY_PATH: $LIBRARY_PATH"
echo "LIBDIR: $LIBDIR"
echo "PYTHONPATH: $PYTHONPATH"
echo "Library search path:"
echo `ldconfig -v 2>/dev/null | grep -v ^$'\t'`

echo "Installing Dependencies"
mkdir -p ${P8MERMITHIDBASEDIR}/src/mermithid/my_build
cd ${P8MERMITHIDBASEDIR}/src/mermithid/my_build
ls ../
cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX:PATH=${P8MERMITHIDBASEDIR} \
      -DCMAKE_SKIP_INSTALL_RPATH:BOOL=True \
      -DCicada_ADD_CICADA_PY=True ..
cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX:PATH=${P8MERMITHIDBASEDIR} \
      -DCMAKE_SKIP_INSTALL_RPATH:BOOL=True \
      -DCicada_ADD_CICADA_PY=True ..
make -j3
make install

cd ..

echo "Installing Mermithid"
pip3 install --prefix=${P8MERMITHIDBASEDIR} morpho/. # install a customized version of morpho until we have a morpho2 release
pip3 install --prefix=${P8MERMITHIDBASEDIR} .

# Testing if morpho is working
# cd examples
# morpho -c morpho_test/scripts/morpho_linear_fit.yaml 

##########
# WARNING
# For some reason, it is bad to remove the sources (else ROOT cannot find the headers...).
# Don't remove src then!
# rm -rf ${P8MERMITHIDDIR}/src

echo "Removing old 'current' soft link"
rm /cvmfs/hep.pnnl.gov/project8/mermithid/current
echo "Adding new 'current' soft link"
ln -s ${P8MERMITHIDBASEDIR} /cvmfs/hep.pnnl.gov/project8/mermithid/current
