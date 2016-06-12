FROM debian:wheezy

RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF && \
  echo "deb http://download.mono-project.com/repo/debian wheezy main" > /etc/apt/sources.list.d/mono-xamarin.list && \
  apt-key adv --keyserver keyserver.ubuntu.com --recv-keys FDA5DFFC && \
  echo "deb http://apt.sonarr.tv/ master main" > /etc/apt/sources.list.d/sonarr.list && \
  apt-get update && \
  apt-get install -y \
  mono-devel \
  nzbdrone \
  mediainfo && \
  rm -rf /var/lib/apt/lists/* && \
  apt-get clean

VOLUME ["/data/media"]
VOLUME ["/data/completed"]
VOLUME ["/config"]

EXPOSE 8989

CMD ["/usr/bin/mono", "/opt/NzbDrone/NzbDrone.exe", "-no-browser", "-data=/config"]
