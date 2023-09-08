FROM alpine:latest

WORKDIR /workspace

COPY --chown=root:root ./usr/local/bin/rust-setup /usr/local/bin/rust-setup

RUN apk update && apk upgrade
RUN apk add --no-cache bash git openssh gnupg
RUN apk add --no-cache abuild bc binutils build-base ncurses-dev
RUN apk add --no-cache sed bison flex ca-certificates wget
RUN apk add --no-cache rustup clang lld clang-dev llvm llvm-dev

RUN rustup-init -q -y

ENV PATH="/root/.cargo/bin:$PATH"

ENTRYPOINT ["/bin/bash"]
