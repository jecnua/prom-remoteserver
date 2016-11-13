# Fake remote storage receiver server for Prometheus on docker

NOTE: This repo is part of my analysis of the weave cloud product ([notes](https://go-talks.appspot.com/github.com/jecnua/notes-presentations/projects/weave/weave_cloud.article)).

While testing the new online service [cloud.weave.works](https://cloud.weave.works) (to forward prometheus data), I found this new configuration that we needed to add to the _prometheus.yml_:

    remote_write:
      url: https://cloud.weave.works/api/prom/push
      basic_auth:
        <token>

You can find more in the [prom docs](https://prometheus.io/docs/operating/configuration/#%3Cremote_write%3E).

Unfortunately it isn't working with a test prometheus on my local mac.
To be sure it wasn't a prom problem I found out a way to test the functionality via a fake [receiver server](https://github.com/prometheus/prometheus/blob/master/documentation/examples/remote_storage/README.md).

The go server code is in the _/code_ directory and it has not been changed.

To allow the prometheus docker installation to see the server, I put the code in another docker and connected the two. You can test with the docker-compose command.

Data will be printed on the shell you run the command into.

## Usage

### Build

In my case:

    docker build -t jecnua/prom-remoteserver .

*NOTE*: If you want to take a peek inside remember that Alpine doesn't have netstat. Use ss (e.s.: ss -tl)

### Run

    docker-compose up

## Tests

Tested on:

- MacOSX Sierra
- Docker for mac Version 1.12.3-beta29.3 (13640) / Channel: Beta 619507e27c

## Disclaimers

I am not an expert on docker, I am actually just starting to play with it.
For any advice or comments feel free to send me an email :)
I don't bite.
Please reference this repo or I could get it as recruiters spam. ^^

## Links

- Makefile copied and slightly modified from [microscling](https://github.com/microscaling/microscaling/blob/master/Makefile)
- Go server [repo](https://github.com/prometheus/prometheus/blob/master/documentation/examples/remote_storage/README.md)
