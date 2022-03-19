FROM jeanlescure/node-awscli:latest

LABEL "com.github.actions.name"="React Deploy to S3"
LABEL "com.github.actions.description"="Build a React.js web app and sync to an AWS S3 repository"
LABEL "com.github.actions.icon"="upload-cloud"
LABEL "com.github.actions.color"="green"

LABEL version="1.1.0"
LABEL repository="https://github.com/jeanlescure/react-deploy-to-s3-action"
LABEL homepage="https://jeanlescure.io/"
LABEL maintainer="Jean Lescure <opensource@jeanlescure.io>"

ENV PATH /github/workspace/node_modules/.bin:$PATH
ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

RUN curl https://deb.nodesource.com/setup_12.x | bash
RUN curl https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

RUN apt-get update && apt-get install -y nodejs yarn postgresql-client


ENTRYPOINT ["/entrypoint.sh"]
