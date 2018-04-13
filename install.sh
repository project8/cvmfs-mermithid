#!/bin/bash

export P8MERMITHIDDIR=/cvmfs/hep.pnnl.gov/project8/mermithid/${MERMITHIDBRANCH}
source ${P8MERMITHIDDIR}/setup.sh

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
mkdir -p ${P8MERMITHIDDIR}/src/mermithid/my_build
cd ${P8MERMITHIDDIR}/src/mermithid/my_build
ls ../
cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX:PATH=${P8MERMITHIDDIR} -DCMAKE_SKIP_INSTALL_RPATH:BOOL=True ..
cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX:PATH=${P8MERMITHIDDIR} -DCMAKE_SKIP_INSTALL_RPATH:BOOL=True ..
make -j3
make install

echo "Installing Mermithid"
cd ../
wget https://bootstrap.pypa.io/get-pip.py
python3  get-pip.py --prefix=${P8DEPMERMITHIDBASEDIR} morpho/. # install a customized version of morpho until we have a morpho2 release
python3  get-pip.py --prefix=${P8DEPMERMITHIDBASEDIR} .

# Testing if morpho is working
# cd examples
# morpho -c morpho_test/scripts/morpho_linear_fit.yaml 

rm -rf ${P8MERMITHIDDIR}/src

echo "Removing old 'current' soft link"
rm /cvmfs/hep.pnnl.gov/project8/mermithid/current
echo "Adding new 'current' soft link"
ln -s ${P8MERMITHIDDIR} /cvmfs/hep.pnnl.gov/project8/mermithid/current
