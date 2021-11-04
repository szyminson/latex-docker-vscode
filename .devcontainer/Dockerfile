FROM debian:bullseye

WORKDIR /tmp

ARG TEX_DIR=/usr/local/texlive/year
ENV TEX_PATH=$TEX_DIR

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

RUN apt-get install git vim sudo build-essential -y
RUN cpan -i App::cpanminus && \
    cpanm YAML::Tiny && \
    cpanm File::HomeDir && \
    cpanm Unicode::GCString

RUN echo 'export PATH=$TEX_PATH:$PATH/bin/x86_64-linux' >> /root/.bashrc && \
    $TEX_PATH/bin/x86_64-linux/tlmgr install latexmk

ARG USERNAME=dev
ARG USER_UID=1000
ARG USER_GID=$USER_UID

RUN addgroup --gid $USER_GID $USERNAME && \
    adduser --uid $USER_UID --ingroup $USERNAME --gecos '' \
    --disabled-password --home /home/$USERNAME $USERNAME

RUN chmod u+w /etc/sudoers && \
    echo "$USERNAME ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers && \
    chmod u-w /etc/sudoers

RUN echo 'export PATH=$TEX_PATH/bin/x86_64-linux:$PATH' >> /home/$USERNAME/.bashrc && \
    echo 'export LANG=C' >> /home/$USERNAME/.bashrc && \
    echo 'alias sudo="sudo -E env PATH=$PATH"' >> /home/$USERNAME/.bashrc && \
    echo 'alias tlmgr="sudo tlmgr"' >> /home/$USERNAME/.bashrc

WORKDIR /latex