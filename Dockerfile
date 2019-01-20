FROM ubuntu
RUN apt update && apt install -y openssh wget && mkdir ~/.ssh
COPY launch.sh launch.sh
RUN chmod +x launch
CMD ./launch.sh && bash