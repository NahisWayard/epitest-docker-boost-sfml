
FROM epitechcontent/epitest-docker

WORKDIR /root

COPY . /root

RUN conan remote add conan-center https://api.bintray.com/conan/conan/conan-center -f
RUN conan remote add epitech https://api.bintray.com/conan/epitech/public-conan -f
RUN conan remote add bincrafters https://api.bintray.com/conan/bincrafters/public-conan -f

RUN conan install . --build=missing