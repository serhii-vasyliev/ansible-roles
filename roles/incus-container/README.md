Create an LXC container with Incus and set static ip address.

You also may create a volume and attach it to the container,
but only ONCE.

```
# Fair warning: this part is not truly indepotent (yet).
# You are supposed to create the volume only once.
# use then --skip-tags=container_volume , when modifying ip address or whatever
```
