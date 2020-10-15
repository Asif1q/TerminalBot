FROM ubuntu:18.04
WORKDIR /app
RUN apt-get update
ENV TZ Asia/Kolkata
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get -qq install -y gnupg2 wget git
RUN wget -q -O - https://mkvtoolnix.download/gpg-pub-moritzbunkus.txt | apt-key add -
RUN sh -c 'echo "deb https://mkvtoolnix.download/ubuntu/ bionic main" >> /etc/apt/sources.list.d/bunkus.org.list'
RUN apt-get update
RUN apt-get -qq install -y python3 python3-pip apt-transport-https \
    ffmpeg coreutils \
    mkvtoolnix p7zip megatools \
    mediainfo \
    rar unrar zip unzip \
    rclone aria2 \
    curl pv jq
RUN git clone https://github.com/SpEcHiDe/TerminalBot.git -b Pyrogram /app
RUN echo "🥺"
RUN pip3 install youtube-dlc
RUN pip3 install --no-cache-dir -r requirements.txt
CMD ["python3", "-m", "termbot"]
