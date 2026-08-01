
TODO: 
- create a separate role 'iptables-docker'
- fully flush only DOCKER-USER chain before applying changed rules
- change the last rule in DOCKER-USER from -j RETURN to -j REJECT
- test the newly created 'iptables-docker' role
- It would be something like that:

```yaml
- name: Flush DOCKER-USER only
  ansible.builtin.command: iptables -F DOCKER-USER
  changed_when: true   # or track more carefully

- name: Ensure DOCKER-USER exists
  ansible.builtin.command: iptables -N DOCKER-USER
  register: docker_user_new
  failed_when: docker_user_new.rc not in [0, 1]  # 1 = already exists
  changed_when: docker_user_new.rc == 0
```

Then apply your template rules with `--noflush`, **after** the flush, don't keep appending.

Or one `shell` block that rebuilds the chain:

```yaml
- name: Rebuild DOCKER-USER
  ansible.builtin.shell: |
    iptables -N DOCKER-USER 2>/dev/null || true
    iptables -F DOCKER-USER
    iptables-restore --noflush < /path/to/docker-user.rules
```

```bash
# ensure chain exists
iptables -N DOCKER-USER 2>/dev/null || true

# clear only this chain
iptables -F DOCKER-USER

# return traffic + allow docker bridges (example)
iptables -A DOCKER-USER -m conntrack --ctstate ESTABLISHED,RELATED -j RETURN
iptables -A DOCKER-USER -i docker0 -j RETURN
iptables -A DOCKER-USER -i br+ -j RETURN

# An example what to ACCEPT (here would go ipaccess_default & ipaccess_extended rules)
iptables -A DOCKER-USER -s 203.0.113.10 -p tcp -m multiport --dports 80,443 -j ACCEPT

# default deny for everything else that hits this chain
iptables -A DOCKER-USER -j DROP
```

