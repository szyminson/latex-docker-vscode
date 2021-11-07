# latex-docker-vscode
## Prerequisites
* VSCode with `ms-vscode-remote.remote-containers` extension.
* Docker
## Quickstart

1. Start Docker
2. Clone or download this repository
3. Open in VSCode
4. In VSCode `Ctrl + Shift + P` -> Reopen in Container
5. Wait for container to start. When running for the first time it might take up to 15 minutes because of TexLive installation process.
6. Enjoy!

## Dr Kubik's Thesis template
Install additional packages:
```
tlmgr install fontaxes ebgaramond tex-gyre xpatch layouts printlen enumitem datetime fmtcount gustlib
```