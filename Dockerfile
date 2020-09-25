FROM debian:stable-slim

RUN apt-get update && apt-get install -y \
      ack \
      curl \
      dnsutils \
      git \
      iproute2 \
      iputils-ping \
      mtr \
      netcat \
      nmap \
      python3 \
      tcpdump \
      traceroute \
      vim \
    && rm -rf /var/lib/apt/lists/* \
    && curl -sfL https://git.io/chezmoi | sh \
    && chezmoi init https://github.com/johnweldon/dotfiles.chezmoi \
    && chezmoi apply

CMD [ "-c", "echo 'sleeping. for interactive use pass -i to run or exec args'; trap : TERM INT; sleep infinity & wait"]

ENTRYPOINT ["/bin/bash", "-i"]
