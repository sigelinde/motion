Motion container
------------------------------------------------------

# About
This is a docker container that enables capture movies on its changes.
It works with USB Video Class (UVC) webcams.

# How to run
1. Plug webcams and check its device file (ex. /dev/video0)
2. run `env DEVICE=/dev/video0 ./run.sh`

