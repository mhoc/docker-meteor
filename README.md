# [DOCKER-METEOR](https://hub.docker.com/r/mikehock/meteor)

A simple Dockerfile for deployments of Meteor applications.

These dockerfiles are designed to act as the base image for a Meteor application. It uses `ONBUILD`
commands to do all the `meteor build` heavy lifting for you. The goal is to result in a user 
experience as simple as Meteor itself, with all the pros and cons associated with that.

## Setup

In your `Dockerfile`:

```dockerfile
FROM mikehock/meteor:1.8-r1
```

And in a `.dockerignore` (if you want):

```
.git
.meteor/local
node_modules
```

That's it. The base image takes care of everything else. Specifically, it will run `meteor build` 
and expose the app on port `80`. Right now, none of the build process is configurable.

## Stable Images

All images are available on Docker Hub.

- `mikehock/meteor:1.8-r1`
- `mikehock/meteor:1.7-r3`
- `mikehock/meteor:1.6`
- `mikehock/meteor:1.5`

## FAQ

In a hypothetical alternate universe, this project may receive questions like:

> Wait, the latest version of meteor you support is 1.8? Wasn't that released in 2019?

Yes, and Yes.

> Does that mean I should use this?

There's no way for me to answer that. Your path through life is your own to forge.

> Aren't there open security vulnerabilities for Meteor 1.8, Node 8.17, or other associated dependencies?

Almost definitely.

> Is there any intention to add support for future versions?

No one can predict the future, and anyone who says they can is selling you something.

> The base image is 1.21gb. That seems kinda large.

That's not a question.
