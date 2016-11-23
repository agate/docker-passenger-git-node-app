Docker Passenger Git Node App

Docker image based on phusion/passenger-nodejs that pulls a git repo and starts a passenger app based on nodejs.

Environment variables:

* GIT_REPO (required)
* SSH_KEY (required if GIT_REPO using ssh protocol)
* GIT_BRANCH (optional, defaults to "master")

You can then run via:

```
docker run -p 80:80 -e GIT_REPO="git@github.com:you/yourepo.git" -e SSH_KEY="`cat path-to-ssh-key`" agate/docker-passenger-git-node-app
```
