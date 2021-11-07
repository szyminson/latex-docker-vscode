# latex-docker-vscode
A boilerplate for working locally on LaTeX projects with zero effort.
## Prerequisites
* VSCode with `ms-vscode-remote.remote-containers` extension.
* Docker
## Quickstart

1. Start Docker
2. Clone or download this repository
3. Open in VSCode
4. In VSCode `Ctrl + Shift + P` -> Reopen in Container
5. Wait for container to start. When running for the first time it might take up to 15 minutes because of TexLive installation process.
6. Put your project files into `project` dir or load a template using `template` command in integrated terminal.
7. Enjoy!

## Package manager
Some projects may require additional CTAN packages. You can install them by using `tlmgr` command in the integrated terminal or by creating a .env file based on .env.example and setting `TEX_PACKAGES` variable. In the second case they will be installed during the image building process so `Ctrl + Shift + P` -> Rebuild Container will be necessary.

## Template loader
```
Latex template loader by szyminson.

Syntax: template [-s template_name] [-r] [-l]
options:
-s template_name  Load template with given name.
-r                Restore last project from backup.
-l                Display a list of available templates.
```
