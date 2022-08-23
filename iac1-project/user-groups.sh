#!/bin/bash

echo “Criando pastas no diretório raiz…”
mkdir /adm
mkdir /ven
mkdir /sec
mkdir /public

echo “Criando grupos de acesso…”
groupadd GRP_ADM
groupadd GRP_VEN
groupadd GRP_SEC

echo “Alterando o dono de todos os diretórios criados para usuário root...”
chown root:GRP_ADM /adm
chown root:GRP_VEN /ven
chown root:GRP_SEC /sec

echo “Criando usuários…”
echo “Adicionando permissões de usuários para grupo administrativo...”
useradd carlos -c "Carlos" -G GRP_ADM -m -p $(openssl passwd -crypt 123) -s /bin/bash
useradd maria -c "Maria" -G GRP_ADM -m -p $(openssl passwd -crypt 123) -s /bin/bash
useradd joao -c "João" -G GRP_ADM -m -p $(openssl passwd -crypt 123) -s /bin/bash
passwd carlos -e
passwd maria -e
passwd joao -e

echo “Adicionando permissões de usuários para grupo de vendas...”
useradd debora -c "Debora" -G GRP_VEN -m -p $(openssl passwd -crypt 123) -s /bin/bash
useradd sebastiana -c "Sebastiana" -G GRP_VEN -m -p $(openssl passwd -crypt 123) -s /bin/bash
useradd roberto -c "Roberto" -G GRP_VEN -m -p $(openssl passwd -crypt 123) -s /bin/bash
passwd debora -e
passwd sebastiana -e
passwd roberto -e

echo “Adicionando permissões de usuários para grupo secretariado...”
useradd josefina -c "Josefina" -G GRP_SEC -m -p $(openssl passwd -crypt 123) -s /bin/bash
useradd amanda -c "Amanda" -G GRP_SEC -m -p $(openssl passwd -crypt 123) -s /bin/bash
useradd rogerio -c "Rogerio" -G GRP_SEC -m -p $(openssl passwd -crypt 123) -s /bin/bash
passwd josefina -e
passwd amanda -e
passwd rogerio -e

echo “Alterando permissão total para todos os usuários no diretório público...”
chmod 777 /public

echo “Alterando permissão total para usuários pertencentes aos seus respectivos grupos...”
echo “Alterando permissão de leitura, escrita e execução para usuários não pertencentes aos seus grupos...”
chmod 770 /adm
chmod 770 /ven
chmod 770 /sec

echo “Script finalizado.”
