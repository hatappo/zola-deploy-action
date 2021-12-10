from debian:stable-slim
MAINTAINER Shaleen Jain <shaleen@jain.sh>

LABEL "com.github.actions.name"="Zola Deploy to Pages"
LABEL "com.github.actions.description"="Build and deploy a Zola site to GitHub Pages"
LABEL "com.github.actions.icon"="zap"
LABEL "com.github.actions.color"="green"

# Set default locale for the environment
ENV LC_ALL C.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8

RUN apt-get update && apt-get install -y wget git

RUN wget -q -O - \
"https://github.com/hatappo/zola/releases/download/${ZOLA_VERSION}/zola-${ZOLA_VERSION}-x86_64-unknown-linux-gnu.with-ja-and-zh.tar.gz" \
| tar xzf - -C /usr/local/bin

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
