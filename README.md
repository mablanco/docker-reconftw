> :warning: This repository has been archived. The upstream developers are actively mantaining their own Dockefile, so it makes no sense keep on working on my code.

# docker-reconftw

Docker image for reconftw, a simple script intended to perform a full recon on an objective with multiple subdomains (<https://github.com/six2dez/reconftw>).

## How to use this image

I recommend running the Docker container with the `--rm` parameter when using reconftw as a CLI tool, which will remove the container after finishing its execution.

**Perform all checks:**

    $ docker run -it --rm mablanco/reconftw -d example.com -a

**Full subdomains scan:**

    $ docker run -it --rm mablanco/reconftw -d example.com -s

**Perform web checks only without subs:**

    $ docker run -it --rm mablanco/reconftw -d example.com -w

When using a list of targets, load it into the container using volumes. For example:

    $ docker run -it --rm -v $PWD/targets.txt:/app/targets.txt mablanco/reconftw -l /app/targets.txt -a

More info and examples are available in the inline help:

    $ docker run --rm mablanco/reconftw

## How to build this image

Use the following command to build the image with the `latest` tag:

    $ docker build -t mablanco/reconftw .

It will fetch from the source code repository the release version specified in the RECONFTW_VERSION variable inside the Dockerfile. In case you want to build a different version, browse the available releases from <https://github.com/six2dez/reconftw/releases> and then use this command:

    $ docker build --build-arg RECONFTW_VERSION=<release> -t mablanco/reconftw:<release> .

If you want to build the bleeding edge code, use `main` as value for the RECONFTW_VERSION variable in the previous command.
