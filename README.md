# [Docker-Meteor](https://hub.docker.com/r/mikehock/meteor)

[![DockerHub](https://img.shields.io/badge/DockerHub-1.9--r1-blue?logo=docker)](https://hub.docker.com/r/mikehock/meteor)
[![GHCR](https://img.shields.io/badge/GHCR-1.9--r1-black?logo=github)](https://github.com/mhoc/docker-meteor/pkgs/container/docker-meteor)

A simple Dockerfile for deployments of Meteor applications.

These dockerfiles are designed to act as the base image for a Meteor application. It uses `ONBUILD`
commands to do all the `meteor build` heavy lifting for you. The goal is to result in a user 
experience as simple as Meteor itself, with all the pros and cons associated with that.

## Setup

In your `Dockerfile`:

```dockerfile
FROM mikehock/meteor:1.9-r1
```

And in a `.dockerignore` (if you want):

```
.git
.meteor/local
node_modules
```

That's it. The base image takes care of everything else. Specifically, it will run `meteor build` 
and expose the app on port `80`. Right now, none of the build process is configurable.

## Images

All images are available on both Docker Hub and Github Container Registry.

| Tag (Docker Hub)         | Tag (ghcr)                          | Meteor | Ubuntu |
|--------------------------|-------------------------------------|--------|--------|
| `mikehock/meteor:1.9-r1` | `ghcr.io/mhoc/docker-meteor:1.9-r1` | 1.9.3  | 16.04  |
| `mikehock/meteor:1.8-r1` | `ghcr.io/mhoc/docker-meteor:1.8-r1` | 1.8.3  | 16.04  |
| `mikehock/meteor:1.7-r3` | `ghcr.io/mhoc/docker-meteor:1.7-r3` | 1.7.x  | 16.04  |
| `mikehock/meteor:1.6`    | `ghcr.io/mhoc/docker-meteor:1.6-r1` | 1.6.x  | 20.04  |
| `mikehock/meteor:1.5`    | `ghcr.io/mhoc/docker-meteor:1.5-r1` | 1.5.x  | 20.04  |

## FAQ

In a hypothetical alternate universe, this project may receive questions like:

> Wait, the latest version of meteor you support is 1.9? Aren't there more recent versions?

Yes, and Yes.

> Does that mean I should use this?

There's no way for me to answer that. Your path through life is your own to forge.

> Is there any intention to add support for future versions?

No one can predict the future, and anyone who says they can is selling you something.

> The base image is 1.21gb. That seems kinda large.

That's not a question.
