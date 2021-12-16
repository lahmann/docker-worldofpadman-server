FROM centos:centos7

EXPOSE 27960/UDP

# check https://worldofpadman.net/download/ for newer releases
ARG WOP_URL="https://www.moddb.com/downloads/mirror/224119/115/4f3ff764bb16262d8128c9ef3c34f71e"
ARG WOP_SHA1_HASH="C80BBA2CB58A85953C42B9CFFC1A9C324005BF1D"

# download and upack World of Padman full release
RUN echo "Downloading World of Padman 1.6.2" && \
        mkdir --parents /downloads && \
        curl -SL "${WOP_URL}" --progress-bar -o /downloads/wop-full-release.zip && \
    echo "Validating download against last known hash" && \
        echo "${WOP_SHA1_HASH} /downloads/wop-full-release.zip" | sha1sum -c - && \
    echo "Extracting WoP files" && \
        yum -y install unzip && \
        unzip -x /downloads/wop-full-release.zip -d /app && \
    echo "WoP 1.6.2 cleanup" && \
        mv /app/worldofpadman-1-6-2/* /app && \
        rmdir /app/worldofpadman-1-6-2 && \
        chmod a+x /app/wopded-linux.x86_64 && \
    echo "Cleaning up" && \
        rm -rf /downloads;

# config files located in Dockerfile folder will overwrite default configs 
ADD *.cfg /app/wop/

WORKDIR /app

# for new commands and variables see https://github.com/PadWorld-Entertainment/wop-engine
CMD ./wopded-linux.x86_64 \
	+set dedicated 1 \
	+set net_port 27960 \
	+set net_port6 27960 \
	+set com_hunkMegs 256 \
	+exec server-settings.cfg
