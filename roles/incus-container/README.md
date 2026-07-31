Create an LXC container with Incus and set static ip address.

You also my create a volume and attach it to the container,
but only ONCE.

```
# Fair warning: this part is not indepotent.
# You can create only one volulume only one time.
# Presuming that you are creating LXC container _with_ volume
# ONLY ONCE and not modifying volumes later
# use then --skip-tags=container_volume , when modifying ip address or whatever
```
