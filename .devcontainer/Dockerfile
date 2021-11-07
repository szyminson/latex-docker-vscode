FROM debian:bullseye

WORKDIR /tmp

ARG TEX_DIR=/usr/local/texlive/year
ENV TEX_PATH=$TEX_DIR
ENV TEX_BIN=$TEX_DIR/bin/x86_64-linux

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install wget libpath-tiny-perl -y

RUN wget -q https://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz && \
    tar -xzf install-tl-unx.tar.gz && \
    rm -f install-tl-unx.tar.gz

RUN cd install-tl* && \
    echo 'selected_scheme scheme-small' > tmp.profile && \
    echo "TEXDIR $TEX_DIR" >> tmp.profile && \
    ./install-tl --profile=tmp.profile && \
    rm -rf tmp.profile

RUN apt-get install git unzip vim sudo build-essential -y && \
    cpan -i App::cpanminus && \
    cpanm YAML::Tiny && \
    cpanm File::HomeDir && \
    cpanm Unicode::GCString

RUN echo 'export PATH=$TEX_BIN:$PATH' >> /root/.bashrc && \
    $TEX_BIN/tlmgr install latexmk latexindent

ARG USERNAME=latex
ARG USER_UID=1000
ARG USER_GID=$USER_UID
ARG TEX_PACKAGES=

RUN addgroup --gid $USER_GID $USERNAME && \
    adduser --uid $USER_UID --ingroup $USERNAME --gecos '' \
    --disabled-password --home /home/$USERNAME $USERNAME

RUN echo "$USERNAME ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers.d/latex && \
    echo 'export PATH=$TEX_BIN:$PATH' >> /home/$USERNAME/.bashrc && \
    echo 'export LANG=C' >> /home/$USERNAME/.bashrc && \
    echo 'alias sudo="sudo -E env PATH=$PATH"' >> /home/$USERNAME/.bashrc && \
    echo 'alias tlmgr="sudo tlmgr"' >> /home/$USERNAME/.bashrc

COPY ./template_loader.sh $TEX_BIN/template

RUN $TEX_BIN/tlmgr install $TEX_PACKAGES

WORKDIR /latex