FROM jamesmith0817/sunshineai-debian-bookworm
# FROM debian:latest
# COPY sources.list /etc/apt/sources.list
COPY pip.conf /root/.config/pip/pip.conf
RUN apt update && apt full-upgrade -y && apt install tree sudo htop wget* curl* build-e* qbittorrent-* transmission-* aria* -y 
RUN mkdir -vp "/DATA" 
RUN mkdir -vp "/DATA/AppData"  
RUN mkdir -vp "/DATA/Documents" 
RUN mkdir -vp "/DATA/Downloads" 
RUN mkdir -vp "/DATA/Gallery" 
RUN mkdir -vp "/DATA/Compressed" 
RUN mkdir -vp "/DATA/Desktop" 
RUN mkdir -vp "/DATA/Games" 
RUN mkdir -vp "/DATA/General" 
RUN mkdir -vp "/DATA/ISOS"
RUN mkdir -vp "/DATA/Media" 
RUN mkdir -vp "/DATA/Others" 
RUN mkdir -vp "/DATA/Programs" 
RUN mkdir -vp "/DATA/Public" 
RUN mkdir -vp "/DATA/Templates" 
RUN mkdir -vp "/DATA/Tools"
RUN mkdir -vp "/DATA/Torrents" 
RUN mkdir -vp "/DATA/Videos" 
RUN mkdir -vp "/DATA/Media/Movies" 
RUN mkdir -vp "/DATA/Media/Music" 
RUN mkdir -vp "/DATA/Media/TV_Shows"
RUN tree /DATA 
RUN mkdir -vp "/home/minio" 
RUN mkdir -vp "/home/minio/appdata"  
RUN mkdir -vp "/home/minio/documents" 
RUN mkdir -vp "/home/minio/downloads" 
RUN mkdir -vp "/home/minio/gallery" 
RUN mkdir -vp "/home/minio/compressed" 
RUN mkdir -vp "/home/minio/desktop" 
RUN mkdir -vp "/home/minio/games" 
RUN mkdir -vp "/home/minio/general" 
RUN mkdir -vp "/home/minio/isos"
RUN mkdir -vp "/home/minio/media" 
RUN mkdir -vp "/home/minio/others" 
RUN mkdir -vp "/home/minio/programs" 
RUN mkdir -vp "/home/minio/public" 
RUN mkdir -vp "/home/minio/templates" 
RUN mkdir -vp "/home/minio/tools"
RUN mkdir -vp "/home/minio/torrents" 
RUN mkdir -vp "/home/minio/videos" 
RUN mkdir -vp "/home/minio/media/movies" 
RUN mkdir -vp "/home/minio/media/music" 
RUN mkdir -vp "/home/minio/media/tv_shows"
RUN tree /home/minio
RUN echo "Create Folder Complete !!!" 
RUN apt update && \
    apt install supervisor* libturbojpeg* ffmpeg -y 
ENV MINIO_ROOT_USER=admin
ENV MINIO_ROOT_PASSWORD=password
RUN apt install dumb-init systemd firefox* -y
RUN apt install dumb-init systemd -y
RUN sudo adduser cloudreve --quiet --disabled-login --disabled-password --home /home/cloudreve --gecos ""
RUN sudo adduser alist --quiet --disabled-login --disabled-password --home /home/alist  --gecos ""
RUN sudo adduser homeassistant --quiet --disabled-login --disabled-password --home /home/homeassistant --gecos ""
RUN sudo adduser minio --quiet --disabled-login --disabled-password --home /home/minio --gecos ""
RUN wget "https://github.com/cloudreve/Cloudreve/releases/download/3.8.3/cloudreve_3.8.3_linux_amd64.tar.gz" -O cloudreve.tar.gz
RUN tar -zxvf cloudreve.tar.gz -C /home/cloudreve/ && rm -rf cloudreve.tar.gz
RUN tree /home/cloudreve/
RUN chmod +x /home/cloudreve/cloudreve
RUN wget "https://github.com/AlistGo/alist/releases/download/v3.41.0/alist-linux-amd64.tar.gz" -O alist-linux-amd64.tar.gz
RUN tar -zxvf alist-linux-amd64.tar.gz -C /home/alist/ && rm -rf alist-linux-amd64.tar.gz && ln -s /home/alist/alist  /usr/bin/alist
RUN tree /home/alist/
RUN chmod +x /home/alist/alist
RUN mkdir -vp /etc/supervisor/conf.d/
# RUN wget "https://dl.minio.org.cn/server/minio/release/linux-amd64/minio" -O /home/minio/minio
RUN wget "https://dl.min.io/server/minio/release/linux-amd64/minio" -O /home/minio/minio
RUN chmod +x /home/minio/minio
# RUN mkdir -vp /home/minio/{appdata,compressed,desktop,documents,downloads,gallery,games,general,isos,license,media/{movies,music,tv_shows},others,programs,public,templates,test,tools,torrents,videos}
COPY supervisord.conf /etc/supervisor/
COPY cloudreve.conf /etc/supervisor/conf.d/
# COPY homeassistant.conf /etc/supervisor/conf.d/
COPY open-webui.conf /etc/supervisor/conf.d/
COPY alist.conf /etc/supervisor/conf.d/
COPY ollama.conf /etc/supervisor/conf.d/
# COPY mysql.conf /etc/supervisor/conf.d/
COPY aria2.conf /etc/supervisor/conf.d/
COPY minio.conf /etc/supervisor/conf.d/
COPY supervisord /etc/init.d/
# RUN chmod +x /etc/init.d/supervisord
RUN mkdir -vp /run/systemd 
STOPSIGNAL SIGRTMIN+3
EXPOSE 8123
EXPOSE 3389
EXPOSE 5244
EXPOSE 5212
ENTRYPOINT [ "/bin/bash", "-c" ]
CMD [ "/usr/bin/supervisord -c /etc/supervisor/supervisord.conf && service transmission-daemon start && bash" ]