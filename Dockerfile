
FROM epitechcontent/epitest-docker

WORKDIR /root

COPY . /root

RUN localedef -i en_US -f UTF-8 en_US.UTF-8 \
    && cd /tmp \
    && rpm -ivh https://github.com/samber/criterion-rpm-package/releases/download/2.3.3/libcriterion-devel-2.3.3-2.el7.x86_64.rpm

RUN conan remote add conan-center https://api.bintray.com/conan/conan/conan-center -f
RUN conan remote add epitech https://api.bintray.com/conan/epitech/public-conan -f
RUN conan remote add bincrafters https://api.bintray.com/conan/bincrafters/public-conan -f

RUN conan install . --build=missing