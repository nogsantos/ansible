# [Ansible][ansible]

O [Ansible][ansible] é uma plataforma de automação. Foi criado para provisionamento de máquinas, executar comandos em outras máquinas de forma automatizada.

À partir de um script, pode ser gerado a configuração, rotinas de deploy etc.

> [Ansible][ansible] é uma ferramenta de automação de TI. Ele pode configurar sistemas, implantar software e orquestrar tarefas de TI mais avançadas, como implantações contínuas ou atualizações sem interrupção de tempo de inatividade.
>
> Os principais objetivos da [Ansible][ansible] são simplicidade e facilidade de uso. Ele também tem um forte foco em segurança e confiabilidade, apresentando um mínimo de partes móveis, uso de OpenSSH para transporte (com outros transportes e modos pull como alternativas) e uma linguagem projetada em torno da capacidade de auditoria por humanos - mesmo aqueles não familiarizados com o programa.

##### Note

>
> Final container size ~ `323MB`.
>
> The image is built on top of the most recently tagged `ubuntu:14.04` image and installs the following extra packages:
> - `vim.tiny`
> - `wget`
> - `sudo`
> - `net-tools`
> - `ca-certificates`
> - `unzip`
> - `lsof`
> - `bash-completion`
> - `software-properties-common`
> - `ssh`
> - `openssh-server`
> - `ansible`

## SSH

Todos os arquivos para configuração estão localizados em `/etc/ansible/`

### Chaves RSA

Ao construir o conteiner, uma chave pública com o nome `key.pub` será gerada por padrão, porém, caso seja necessário outras chaves, seguem as instruções.

#### Gerar a chave

Ao gerar a chave, criá-la dentro do diretório `keys` em `/etc/ansible/keys`

##### Entrada
```shell
# ssh-keygen -t rsa -b 4096
```
##### Saída
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

##### Importante

> Nenhuma senha foi definida, para se executar à partir de uma automação, é interessante que não seja obrigatório o uso de senha, caso contrário, sempre que o script executar, essa senha deverá ser informada.
> Caminho final da chave publica `/etc/ansible/keys/example-key.pub`.

##### Copiando a chave pública

```shell
# ssh-copy-id -i /etc/ansible/keys/key.pub [user]@[address]
```

[ansible]:https://docs.ansible.com/ansible/latest/index.html "Ansible"