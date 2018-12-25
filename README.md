# [Ansible][ansible]

O [Ansible][ansible] é uma plataforma de automação. Foi criado para provisionamento de máquinas, executar comandos em outras máquinas de forma automatizada.

À partir de um script, pode ser gerado a configuração, rotinas de deploy etc.

> [Ansible][ansible] é uma ferramenta de automação de TI. Ele pode configurar sistemas, implantar software e orquestrar tarefas de TI mais avançadas, como implantações contínuas ou atualizações sem interrupção de tempo de inatividade.
>
> Os principais objetivos da [Ansible][ansible] são simplicidade e facilidade de uso. Ele também tem um forte foco em segurança e confiabilidade, apresentando um mínimo de partes móveis, uso de OpenSSH para transporte (com outros transportes e modos pull como alternativas) e uma linguagem projetada em torno da capacidade de auditoria por humanos - mesmo aqueles não familiarizados com o programa.

## Container

Criar o container pela imagem, executar no host

```shell
$ docker run -it --name ansible nogsantos/ansible /bin/bash
```

#### Iniciar open ssh em background

```shell
# /usr/sbin/sshd -D &
```

## Documentação

- [SSH setup](./ansible/SSH.md)


##### Footer notes

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

[ansible]:https://docs.ansible.com/ansible/latest/index.html "Ansible"
