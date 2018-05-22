#!/bin/bash

source /cvmfs/hep.pnnl.gov/project8/mermithid/current/setup.sh

ls /cvmfs/hep.pnnl.gov/project8/mermithid/v0.0.3
ls /cvmfs/hep.pnnl.gov/project8/mermithid/v0.0.3/src
ls /cvmfs/hep.pnnl.gov/project8/mermithid/v0.0.3/src/mermithid
ls /cvmfs/hep.pnnl.gov/project8/mermithid/v0.0.3/src/mermithid/tests

cd ${P8MERMITHIDBASEDIR}/src/mermithid/tests
mkdir ${P8MERMITHIDBASEDIR}/src/mermithid/tests/plots
python3 IO_test.py
python3 Tritium_test.py

