FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

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
    curl

# Create user
RUN useradd -m user && \
    echo "user:user" | chpasswd && \
    adduser user sudo

# Setup VNC
RUN mkdir -p /home/user/.vnc
COPY startup.sh /home/user/.vnc/startup.sh
RUN chmod +x /home/user/.vnc/startup.sh && chown -R user:user /home/user/.vnc

# Setup noVNC
RUN mkdir -p /opt/novnc
RUN cp -r /usr/share/novnc/* /opt/novnc

# Copy supervisor config
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Add run script
COPY run.sh /run.sh
RUN chmod +x /run.sh

# Persistent directory
RUN mkdir -p /persist && chown -R user:user /persist
VOLUME ["/persist"]

EXPOSE 8080
CMD ["/run.sh"]
