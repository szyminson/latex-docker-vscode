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
6. Put your project files into `project` dir or load a template using `template` command in integrated terminal.
7. Enjoy!

## Template loader
```
Latex template loader by szyminson.

Syntax: template [-s template_name] [-r] [-l]
options:
-s template_name  Load template with given name.
-r                Restore last project from backup.
-l                Display a list of available templates.
```
