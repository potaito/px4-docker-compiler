
# Building
```shell
docker build . -f Dockerfile -t my-px4-compiler \
            --build-arg USER=$USER \
            --build-arg UID=$(id -u) \
            --build-arg GID=$(id -g) \
            --build-arg GIT_NAME="Your Name" \
            --build-arg GIT_EMAIL="your email address" \
            -t my-px4-compiler
```

# Running
```shell
docker run -it --rm -v $PWD:$PWD -w $PWD my-px4-compiler
```