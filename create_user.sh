#!/bin/bash
set -e

printf "\n\033[0;44m---> Creating SSH master user.\033[0m\n"

useradd -m -d /home/${SSH_USER} -G ssh ${SSH_USER} -s /bin/bash
echo "${SSH_USER}:${SSH_PASSWORD}" | chpasswd
echo 'PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin"' >> /home/${SSH_USER}/.profile

echo "${SSH_USER} ALL=NOPASSWD:/bin/rm" >> /etc/sudoers
echo "${SSH_USER} ALL=NOPASSWD:/bin/mkdir" >> /etc/sudoers
echo "${SSH_USER} ALL=NOPASSWD:/bin/chown" >> /etc/sudoers
echo "${SSH_USER} ALL=NOPASSWD:/usr/sbin/useradd" >> /etc/sudoers
echo "${SSH_USER} ALL=NOPASSWD:/usr/sbin/deluser" >> /etc/sudoers
echo "${SSH_USER} ALL=NOPASSWD:/usr/sbin/chpasswd" >> /etc/sudoers
 
exec "$@"