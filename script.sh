#!/bin/bash

echo "Deleting everything..."

userdel -fr carlos
userdel -fr maria
userdel -fr joao

userdel -fr debora
userdel -fr sebastiana
userdel -fr roberto

userdel -fr josefina
userdel -fr amanda
userdel -fr rogerio

groupdel -f GRP_ADM
groupdel -f GRP_VEN
groupdel -f GRP_SEC

rm -rf /publico
rm -rf /adm
rm -rf /ven
rm -rf /sec

echo "Creating directories..."

mkdir /publico
mkdir /adm
mkdir /ven
mkdir /sec

echo "Creating groups..."

groupadd GRP_ADM
groupadd GRP_VEN
groupadd GRP_SEC

echo "Specifying directories permissions..."

chown root:GRP_ADM /adm
chown root:GRP_VEN /ven
chown root:GRP_SEC /sec

chmod 777 /publico
chmod 770 /adm
chmod 770 /ven
chmod 770 /sec

echo "Creating users..."

useradd carlos -c "carlos" -s /bin/bash -m -G GRP_ADM -p $(openssl passwd -crypt Senha123)
useradd maria -c "maria" -s /bin/bash -m -G GRP_ADM -p $(openssl passwd -crypt Senha123)
useradd joao -c "joao" -s /bin/bash -m -G GRP_ADM -p $(openssl passwd -crypt Senha123)

useradd debora -c "debora" -s /bin/bash -m -G GRP_VEN -p $(openssl passwd -crypt Senha123)
useradd sebastiana -c "sebastiana" -s /bin/bash -m -G GRP_VEN -p $(openssl passwd -crypt Senha123)
useradd roberto -c "roberto" -s /bin/bash -m -G GRP_VEN -p $(openssl passwd -crypt Senha123)

useradd josefina -c "josefina" -s /bin/bash -m -G GRP_SEC -p $(openssl passwd -crypt Senha123)
useradd amanda -c "amanda" -s /bin/bash -m -G GRP_SEC -p $(openssl passwd -crypt Senha123)
useradd rogerio -c "rogerio" -s /bin/bash -m -G GRP_SEC -p $(openssl passwd -crypt Senha123)

echo "The end"