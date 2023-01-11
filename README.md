
# Building the Docker Image
```shell
docker build . -f Dockerfile -t my-px4-compiler \
            --build-arg USER=$USER \
            --build-arg UID=$(id -u) \
            --build-arg GID=$(id -g) \
            --build-arg GIT_NAME="Your Name" \
            --build-arg GIT_EMAIL="your email address" \
            -t my-px4-compiler
```

# Running the Docker Container

## Interactive shell

```shell
docker run -it --rm -v $PWD:$PWD -w $PWD my-px4-compiler
```

## Alternative: One-off PX4 build command
This starts a docker container, runs the build command and then stops the container again:

```shell
docker run -v $PWD:$PWD -w $PWD my-px4-compiler make px4_fmu-v5x_default
```
