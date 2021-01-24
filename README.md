# docker-reconftw

Docker image for reconftw, a simple script intended to perform a full recon on an objective with multiple subdomains (<https://github.com/six2dez/reconftw>).

## How to use this image

I recommend running the Docker container with the `--rm` parameter when using reconftw as a CLI tool, which will remove the container after finishing its execution.

Inline help:

    $ docker run --rm mablanco/reconftw

Full scan:

    $ docker run -t --rm mablanco/reconftw -d example.com -a

Subdomains scan:

    $ docker run -t --rm mablanco/reconftw -d example.com -s

Web scan (target list required):

    $ docker run -t --rm mablanco/reconftw -d example.com -l targets.txt -w

Dorks:

    $ docker run -t --rm mablanco/reconftw -d example.com -g

## How to build this image

Use the following command to build the image with the `latest` tag:

    $ docker build -t mablanco/reconftw .

It will fetch from the source code repository the release version specified in the RECONFTW_VERSION variable inside the Dockerfile. In case you want to build a different version, browse the available releases from <https://github.com/six2dez/reconftw/releases> and then use this command:

    $ docker build --build-arg RECONFTW_VERSION=<release> -t mablanco/reconftw:<release> .

If you want to build the bleeding edge code, use `main` as value for the RECONFTW_VERSION variable in the previous command.
