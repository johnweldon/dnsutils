FROM debian:stable-slim

RUN apt-get update && apt-get install -y \
      ack \
      curl \
      dnsutils \
      git \
      iproute2 \
      netcat \
      python3 \
      vim \
    && rm -rf /var/lib/apt/lists/* \
    && curl -sfL https://git.io/chezmoi | sh \
    && chezmoi init https://github.com/johnweldon/dotfiles.chezmoi \
    && chezmoi apply

CMD exec /bin/bash -c "trap : TERM INT; sleep infinity & wait"
