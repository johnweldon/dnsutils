FROM debian:stable-slim

RUN apt-get update && apt-get install -y \
      ack \
      curl \
      dnsutils \
      iproute2 \
      iputils-ping \
      mtr \
      netcat \
      nmap \
      python3 \
      tcpdump \
      traceroute \
      vim \
    && rm -rf /var/lib/apt/lists/*

RUN curl -sfL https://git.io/chezmoi | sh

ADD config/chezmoi.toml /tmp/chezmoi.toml
RUN chezmoi init -c /tmp/chezmoi.toml --apply --one-shot --no-tty https://github.com/jw4/dotfiles.chezmoi

CMD [ "-c", "echo 'sleeping. for interactive use pass -i to run or exec args'; trap : TERM INT; sleep infinity & wait"]

ENTRYPOINT ["/bin/bash", "-i"]
