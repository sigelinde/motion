FROM ubuntu:latest

RUN apt-get update && apt-get upgrade -y && apt-get install -y motion && apt-get clean
ADD motion.conf /etc/motion/

CMD cd /video && motion
