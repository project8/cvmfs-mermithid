FROM project8/cvmfs-dependencies-mermithid:build-2018-04-26

run mkdir -p /tmp_install

ADD ./setup.sh /tmp_install/setup.sh
ADD ./download_pkg.sh /tmp_install/download_pkg.sh
ADD ./install.sh /tmp_install/install.sh
ADD ./run-cvmfs-install.sh /tmp_install/run-cvmfs-install.sh

RUN cd /tmp_install && \
    ls && \
    source /opt/rh/devtoolset-3/enable && \
    ./run-cvmfs-install.sh && \
    rm -rf /tmp_install
