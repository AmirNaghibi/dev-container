FROM alpine:latest

WORKDIR /root

RUN apk add --no-cache \
    git \
    curl \
    zsh \
    vim

RUN zsh && \ 
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" && \
    git clone --depth 1 "https://github.com/romkatv/powerlevel10k.git" /root/.oh-my-zsh/themes/powerlevel10k && \
    git clone --depth 1 "https://github.com/zsh-users/zsh-autosuggestions.git" /root/.oh-my-zsh/plugins/zsh-autosuggestions && \
    rm /root/.zshrc

COPY .zshrc /root
COPY .vimrc /root