FROM kalilinux/kali-rolling

ARG SSH_USER
ARG SSH_PASSWORD

RUN apt -y update && apt -y upgrade && apt -y autoremove && apt clean

RUN apt install metasploit-framework \
                nmap \ 
                powersploit \ 
                python-pip \
                python3 \ 
                vim \
                sudo \
                openssh-server -y


RUN echo "root:${SSH_PASSWORD}" | chpasswd

COPY ssh_config /etc/ssh/ssh_config
COPY sshd_config /etc/ssh/sshd_config

COPY create_user.sh /usr/local/bin/create_user.sh
RUN chmod +x /usr/local/bin/create_user.sh
RUN /usr/local/bin/create_user.sh

COPY persist_db.sh /usr/local/bin/persist_db.sh
RUN chmod +x /usr/local/bin/persist_db.sh


COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]

CMD tail -f /dev/null
