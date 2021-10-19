# Detailed Infos
- [wsl](./doc/wsl.md)
- [nvim](./doc/nvim.md)

# Font
Powerline10K theme requires a Nerd Font to repesent all characters. Powerline10K recommands "MesloLGS NF"
https://github.com/romkatv/powerlevel10k#meslo-nerd-font-patched-for-powerlevel10k
 
# Try it out in Docker
Run this config in a docker container and bind pwd to /code. This command is available as alias `docker-dev-env`.
```docker
docker run -it --mount type=bind,source="$(pwd)",target=/code alexmu/dev-env
```
