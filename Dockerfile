# Sử dụng base image Debian
FROM debian:latest

# Cài đặt các gói phụ thuộc và Xpra
RUN apt-get update && \
    sudo apt upgrade && \
    apt-get install -y wget gnupg2 && \
    sudo apt install xfce4 xfce4-goodies dbus-x11 xpra && \
    xpra start-desktop --pulseaudio=yes --bind-tcp=0.0.0.0:14500 --start-child=xfce4-session --systemd-run=no --exit-with-children --daemon=no


# Expose the necessary ports for Xpra
EXPOSE 10000

# Start Xpra server
CMD ["xpra", "start", ":10000", "--bind-tcp=0.0.0.0:14500", "--start-child=xterm"]
