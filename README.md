# [DOCKER-METEOR](https://hub.docker.com/mikehock/meteor)

The most simple Dockerfile available for deployments of Meteor. Note: Simple !== Small. 

These dockerfiles are designed to act as the base image for a deployment which starts with a meteor project directory and results in a Docker image. The `meteor build` steps will happen inside the image build process (specifically, in your Dockerfile that builds on-top-of this one). 

# Tags

- `1.7-r3`
- `1.6`
- `1.5`

# Typical Dockerfile

```dockerfile
FROM mikehock/meteor:1.7
```

That's it. The base image takes care of everything else. Specifically, it will run `meteor build` 
and expose the app on port `80`. Right now, none of the build process is configurable.

# Typical Dockerignore

```
.git
.meteor/local
node_modules
```

# Image Size

This results in a large image. The base image is ~1gb alone.
