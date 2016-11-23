#!/usr/bin/env bash

# INPUT ENV
#   GIT_REPO (required)
#   SSH_KEY  (required if GIT_REPO using git protocol)

APP_NAME=webapp
APP_HOME=/home/app
APP_DIR=${APP_HOME}/${APP_NAME}

if [ "$SSH_KEY" ]; then
  echo -e "Host *\n  StrictHostKeyChecking no\n" >> ~/.ssh/config
  echo "$SSH_KEY" > ~/.ssh/id_rsa && chmod 600 ~/.ssh/id_rsa
fi

cat << EOF | ruby > /etc/nginx/main.d/app_env.conf
ENV.map do |k, v|
  puts "env #{k};"
end
EOF

cd $APP_HOME

if [[ -d $APP_DIR/.git ]]; then
  echo "webapp already exist"
else
  git clone $GIT_REPO $APP_NAME
fi

chown -R app:app $APP_DIR

cd $APP_DIR
su - app -c "cd $APP_DIR; npm install"
