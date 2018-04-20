FROM project8/cvmfs-dependencies-mermithid:build-2018-04-20

run mkdir -p /tmp_install

COPY ./setup.sh /tmp_install/setup.sh
COPY ./download_pkg.sh /tmp_install/download_pkg.sh
COPY ./install.sh /tmp_install/install.sh
COPY ./run-cvmfs-install.sh /tmp_install/run-cvmfs-install.sh

RUN cd /tmp_install && \
    ls && \
    source /opt/rh/devtoolset-3/enable && \
    source /tmp_install/run-cvmfs-install.sh && \
    rm -rf /tmp_install
