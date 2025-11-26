FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive
ENV DISPLAY=:0
ENV HOME=/home/user
ENV PERSIST=/persist

RUN apt update && apt install -y \
    xfce4 \
    xfce4-goodies \
    tightvncserver \
    novnc \
    websockify \
    supervisor \
    sudo \
    nano \
    wget \
    curl \
    git \
    unzip

# Create user
RUN useradd -m user && \
    echo "user:user" | chpasswd && \
    adduser user sudo

# Setup directories
RUN mkdir -p /persist && chown -R user:user /persist
RUN mkdir -p /home/user/.vnc

# Copy scripts
COPY startup.sh /home/user/.vnc/startup.sh
COPY run.sh /run.sh
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY sync-persist.sh /usr/local/bin/sync-persist.sh

RUN chmod +x /home/user/.vnc/startup.sh /run.sh /usr/local/bin/sync-persist.sh

# Setup noVNC
RUN mkdir -p /opt/novnc
RUN cp -r /usr/share/novnc/* /opt/novnc

EXPOSE 8080
CMD ["/run.sh"]
