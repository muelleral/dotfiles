# WSL

### Multiple instances of the same distro
Distros installed from the MS Store can only be installed once. To install multiple instances of the same distro use export/import feature of wsl.

1. Install distro from store.
2. Create `/etc/wsl.conf`
3. Export the bare distro to a location (e.g. C:/wsl/images/distroname-bare). This way every imported distro has the same user.
   `wsl.exe --export Ubuntu-20.04 C:\wsl\images\ubuntu2004_minimal`
4. (optional) Install used tools and export the distro again. (e.g. C:/wsl/images/distroname-minimal)
5. Unregister the installed distro from the ms store. This way it is possible to install the distro anytime again.
   `wsl --unregister Ubuntu-20.04`
6. Import a distro from the created images and change the deault user.
   `wsl.exe --import ubuntu2004 C:\wsl\ubuntu2004 C:\wsl\images\ubuntu2004_minimal`	

### WSL config setting for distro
In /etc/wsl.conf
```
[user]
default=username

[automount]
enabled = true
```
