FROM quay.io/spivegin/tlmbasedebian

RUN apt-get update -y &&\
    apt-get install -y \
        apt-utils \
        bash \
        unzip
RUN apt install -y openjdk-8-jre-headless 

ENV VERSION 4.6
ADD https://www.languagetool.org/download/LanguageTool-$VERSION.zip /LanguageTool-$VERSION.zip

RUN unzip LanguageTool-$VERSION.zip \
    && rm LanguageTool-$VERSION.zip

WORKDIR /LanguageTool-$VERSION

ADD misc/start.sh /start.sh
RUN chmod a+x /start.sh
RUN mkdir /nonexistent && touch /nonexistent/.languagetool.cfg

CMD [ "/start.sh" ]
EXPOSE 8080
