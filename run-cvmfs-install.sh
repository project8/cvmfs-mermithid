#!/bin/bash

# get the location of this script
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# call the setup script to establish all necessary environment variables
source ${SCRIPT_DIR}/setup.sh

# create the mermithid build directory
mkdir -p ${P8MERMITHIDBASEDIR}

# copy in the setup and install scripts
mv ${SCRIPT_DIR}/setup.sh ${P8MERMITHIDBASEDIR}/setup.sh
mv ${SCRIPT_DIR}/download_pkg.sh ${P8MERMITHIDBASEDIR}/download_pkg.sh
mv ${SCRIPT_DIR}/install.sh ${P8MERMITHIDBASEDIR}/install.sh

# setup the environment and run the install script
${P8MERMITHIDBASEDIR}/download_pkg.sh
${P8MERMITHIDBASEDIR}/install.sh
