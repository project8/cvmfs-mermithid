#!/bin/bash

source /cvmfs/hep.pnnl.gov/project8/mermithid/current/setup.sh

ls ${P8MERMITHIDBASEDIR}
ls ${P8MERMITHIDBASEDIR}/src
ls ${P8MERMITHIDBASEDIR}/src/mermithid
ls ${P8MERMITHIDBASEDIR}/src/mermithid/tests

cd ${P8MERMITHIDBASEDIR}/src/mermithid/tests
mkdir ${P8MERMITHIDBASEDIR}/src/mermithid/tests/plots
python3 IO_test.py
python3 Tritium_test.py

