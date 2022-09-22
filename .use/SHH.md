# SHH

## Generate SSH

```bash
ssh-keygen -t ed25519 -C "your_email@example.com"
```

If you are using a legacy system that doesn't support the Ed25519 algorithm, use:

```bash
ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
```

or:

```bash
ssh-keygen -t rsa
```

---

## Add SSH agent

Ensure the ssh-agent is running.

```bash
eval "$(ssh-agent -s)"
```

Add your SSH private key to the ssh-agent. If you created your key with a different name, or if you are adding an existing key that has a different name, replace id_ed25519 in the command with the name of your private key file.

```bash
ssh-add "your_key_path"
```

---

## Add public key remote server

### Create ssh directory in the user’s home directory (as a sysadmin)

Keep in mind that you have to create these new directories and files in the end user’s home directory, not your own (root/sysadmin).

```bash
mkdir -p /home/user_name/.ssh && touch /home/user_name/.ssh/authorized_keys
```

Now open this /home/user_name/.ssh/authorized_keys file with a text editor like Vim and add the public key of the user here:

```bash
nano /home/user_name/.ssh/authorized_keys
```

Save and close the file. It’s almost ready.

### Step 3: Set appropriate permission to the file

Having appropriate file permission on the ssh file is very important otherwise you’ll see errors like Permission denied (publickey).

First, make sure to set the correct file permissions:

```bash
chmod 700 /home/user_name/.ssh && chmod 600 /home/user_name/.ssh/authorized_keys
```

You created those file with either root or your own admin accounts for some other user. You need to change the ownership to the user:

```bash
chown -R username:username /home/username/.ssh
```

Now that it’s done, you can ask the end user to log in to the server.
