# users

Manage users by group


Role Variables
--------------

See [defaults/main.yml](defaults/main.yml) for a list and description of
variables used in this role.


Example Playbooks
----------------

```yaml
# group_vars, etc
users_list:
  - name: bclark
    comment: Brian Clark
    groups:
      - admins
    authorized_keys:
      - ssh-rsa AAAA...
  - name: user1
    comment: Joe User
    group: custom_primary_group
    groups:
      - users
  - name: dev1
    groups:
      - webadmins
    authorized_keys:
      - ssh-rsa AAAA...
```

Add all developers from `users_list` to developers group:
```yaml
- hosts: webservers
  roles:
     - role: users
       users_group: developers
```

Search for all members of the webadmins group and add them to the sysadmin linux group using group id 2300:
```yaml
- hosts: webservers
  roles:
    - role: users
      users_group: sysadmin
      users_search_group: webadmins
      users_gid: 2300
```
