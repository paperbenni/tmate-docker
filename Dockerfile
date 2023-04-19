FROM ubuntu:kinetic
RUN mkdir -p /home/user
WORKDIR /home/user
ENV HOME /home/user
RUN apt-get update && apt-get install -y locales openssh-server openssh-client wget && mkdir ~/.ssh
RUN sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
    locale-gen
ENV LANG en_US.UTF-8  
ENV LANGUAGE en_US:en  
ENV LC_ALL en_US.UTF-8     

COPY launch.sh launch.sh
RUN chmod +x launch.sh
CMD ./launch.sh && bash