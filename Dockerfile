# Sử dụng base image Debian
FROM debian:latest

# Cài đặt các gói phụ thuộc và Xpra
RUN apt-get update && \
    apt-get install -y wget gnupg2 && \
    wget -q https://xpra.org/gpg.asc -O- | apt-key add - && \
    echo "deb https://xpra.org/ buster main" > /etc/apt/sources.list.d/xpra.list && \
    apt-get update && \
    apt-get install -y xpra

# Expose the necessary ports for Xpra
EXPOSE 10000

# Start Xpra server
CMD ["xpra", "start", ":10000", "--bind-tcp=0.0.0.0:10000", "--start-child=xterm"]