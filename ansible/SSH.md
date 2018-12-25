# SSH

Todos os arquivos para configuração estão localizados em `/etc/ansible/`

## Chaves RSA

Ao construir o conteiner, uma chave pública com o nome `key.pub` será gerada por padrão, porém, caso seja necessário outras chaves, seguem as instruções.

### Gerar a chave

Ao gerar a chave, criá-la dentro do diretório `keys` em `/etc/ansible/keys`

#### Entrada

```shell
# ssh-keygen -t rsa -b 4096
```

#### Saída

```shell
Generating public/private rsa key pair.
Enter file in which to save the key (/root/.ssh/id_rsa): /etc/ansible/keys/example-key
Enter passphrase (empty for no passphrase):
Enter same passphrase again:
Your identification has been saved in /etc/ansible/keys/example-key.
Your public key has been saved in /etc/ansible/keys/example-key.pub.
The key fingerprint is:
91:75:d3:51:63:19:fd:31:e8:fa:6b:41:90:75:f3:0d root@ac6a2209cb88
The key's randomart image is:
+--[ RSA 4096]----+
|          . =oEO=|
|         o + o+=*|
|        o   o   *|
|         .   o  .|
|        S   o    |
|           . .   |
|            . .  |
|             o   |
|            ...  |
+-----------------+
```

Nesse caso, a chave foi gerada com o nome `example-key`.

#### Importante

> Nenhuma senha foi definida, para se executar à partir de uma automação, é interessante que não seja obrigatório o uso de senha, caso contrário, sempre que o script executar, essa senha deverá ser informada.
> Caminho final da chave publica `/etc/ansible/keys/example-key.pub`.

### Copiando a chave pública para os hosts que serão gerenciados

```shell
# ssh-copy-id -i /etc/ansible/keys/key.pub [user]@[address]

Ex.:

# ssh-copy-id -i /etc/ansible/keys/key.pub root@172.17.0.2
The authenticity of host '172.17.0.2 (172.17.0.2)' can't be established.
ECDSA key fingerprint is 39:0d:77:31:0d:b8:32:66:d4:01:20:8f:fe:b5:fc:4f.
Are you sure you want to continue connecting (yes/no)? yes
/usr/bin/ssh-copy-id: INFO: attempting to log in with the new key(s), to filter out any that are already installed
/usr/bin/ssh-copy-id: INFO: 1 key(s) remain to be installed -- if you are prompted now it is to install the new keys
root@172.17.0.2's password:

Number of key(s) added: 1

Now try logging into the machine, with:   "ssh 'root@172.17.0.2'"
and check to make sure that only the key(s) you wanted were added.
```

Ps.: Ao ser solicitado a senha no caso do root, digitar `root`.

### Configurações para acesso aos hosts

O arquivo `hosts` no diretório de configuração do ansible, diz quais hosts o ansible irá se conectar. Podem ser informado o hostname, ip, expressões regulares etc.

Para editar o arquivo, utilize o `vim.tiny`

```ssh
# vim.tiny hosts
```
No início do arquivo, adicine a linha com o Ip da máquina que será gerenciada, no caso, `172.17.0.2`

#### Configuração da chave privada

No arquivo de configuração do [Ansible][ansible] `ansible.cfg`

```ssh
# vim.tiny ansible.cfg
```

Descomentar e a tag `private_key_file` apontá-la para a chave privada:

```
...
private_key_file = /etc/ansible/keys/key
...
```
