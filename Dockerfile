
FROM epitechcontent/epitest-docker

WORKDIR /root

COPY . /root

RUN localedef -i en_US -f UTF-8 en_US.UTF-8 \
    && cd /tmp \
    && rpm -ivh https://github.com/samber/criterion-rpm-package/releases/download/2.3.3/libcriterion-devel-2.3.3-2.el7.x86_64.rpm

RUN conan remote add conan-center https://api.bintray.com/conan/conan/conan-center -f
RUN conan remote add epitech https://api.bintray.com/conan/epitech/public-conan -f
RUN conan remote add bincrafters https://api.bintray.com/conan/bincrafters/public-conan -f

RUN dnf -y install openssh-server passwd

RUN mkdir /var/run/sshd
RUN ssh-keygen -A

RUN passwd -d root

RUN sed -i 's/#PermitEmptyPasswords no/PermitEmptyPasswords yes/' /etc/ssh/sshd_config
RUN sed -i 's/SyslogFacility AUTHPRIV/SyslogFacility AUTH/' /etc/ssh/sshd_config
RUN sed -i 's/#LogLevel INFO/LogLevel INFO/' /etc/ssh/sshd_config

RUN conan install . --build=missing

CMD /usr/sbin/sshd -D -d

EXPOSE 22