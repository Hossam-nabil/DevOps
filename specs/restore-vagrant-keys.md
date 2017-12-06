# [Vagrant ssh authentication failure](https://stackoverflow.com/questions/22922891/vagrant-ssh-authentication-failure) - stackoverflow.com
### 1. Locate the private key in the host:

    vagrant ssh-config

Output:

```
Host default
  ...
  Port 2222
  ...
  IdentityFile /home/me/.vagrant.d/[...]/virtualbox/vagrant_private_key
  ...
```

### 2. Store the private key path and the port number in variables:

Use these two commands with the output from above:

```
pk="/home/me/.vagrant.d/.../virtualbox/vagrant_private_key"
port=2222
```

### 3. Generate a public key and upload it to the guest machine:

Copy/pasta, no changes needed:

```
ssh-keygen -y -f $pk > authorized_keys
scp -P $port authorized_keys vagrant@localhost:~/.ssh/
vagrant ssh -c "chmod 600 ~/.ssh/authorized_keys"
rm authorized_keys
```
