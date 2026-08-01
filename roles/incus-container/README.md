Create an LXC container with Incus and set static ip address.

You also may create a volume and attach it to the container,
but only ONCE.

```
# Fair warning: this part is not truly idempotent (yet).
# You are supposed to create the volume only once.
# use then --skip-tags=container_volume , when modifying ip address or whatever
```

```
shift=true for a volume: translate the host file system's user and group IDs (UID/GID) to match the container.
Sets up a VFS idmap shifting overlay on a disk device mount to automatically translate the host file system's user and group IDs (UID/GID) to match the container. It solves permission errors when sharing a host directory inside an unprivileged container. 
A VFS idmap (Virtual File System ID-mapped mount) is a Linux kernel feature that lets you change how file ownership (UID/GID) is seen on a specific directory mount. It acts like an on-the-fly translation layer between the physical filesystem on disk and the processes interacting with it. 
The Core Problem It Solves
Unprivileged containers (like Incus or LXC) don't run as the real host root (UID 0). Instead, they are confined to a high range, like UID 100000. 
If you mount a host folder owned by UID 1000 (your host user) into that container, the container sees it as owned by nobody or 65534.
The container cannot write to it, resulting in "Permission Denied" errors. 
How VFS ID-Mapping Works
Instead of permanently rewriting the files on your host disk using chown (which ruins host permissions), a VFS idmap handles everything safely in system memory.
```
