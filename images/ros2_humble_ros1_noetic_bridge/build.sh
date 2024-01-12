#!/bin/bash
# -t allows you to specify a name and optionally a tag for the image
# . specifies the location of the Dockerfile to build, in this case it is located in the same directory as this script
docker build -t ros1:bridge .
