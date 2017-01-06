# users

Manage users by group


Role Variables
--------------

See [defaults/main.yml](defaults/main.yml) for a list and description of
variables used in this role.


Example Playbooks
----------------

Example "master list" of users:
```yaml
# group_vars, etc
user_list:
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

Example list of groups to add:
```yaml
- user_groups:
    - name: groupname # required
      search_name: groupname # optional name of group to search for, defaults to `name`
      gid: 999 #optional group id
      state: synced # remove absent users, add present users
      sudo: no # optional (default false) - boolean, mapping (see below), or `nopasswd`
    - name: deleted_users
      state: absent # will only remove members marked as absent in user_list!
    - name: god_group
      sudo: nopasswd # password-less sudo
    - name: limited_sudo_group
      sudo:
        commands: /bin/ls # optional string of sudo commands
        nopasswd: yes # optional boolean to allow nopasswd
        users: # optional string of sudo users
        hosts: # optional string of sudo hosts
```

Add all developers from `user_list` to developers group:
```yaml
- hosts: webservers
  roles:
     - role: users
       user_groups:
         - name: developers
```

Search for all members of the webadmins group and add them to the sysadmin linux
group using group id 2300, and give them password-less sudo:
```yaml
- hosts: webservers
  roles:
    - role: users
      user_groups:
        - name: sysadmin
          search_name: webadmins
          gid: 2300
          sudo: nopasswd
```
