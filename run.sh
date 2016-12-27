#!/bin/sh
pushd `dirname $0`
	echo Prepare
	WORK_DIR=`pwd`
	[ -z "$IMAGE_NAME" ] && IMAGE_NAME="motion_img"
	[ -z "$INSTANCE_NAME" ] && INSTANCE_NAME="motion"
	[ -z "$CAP_DIR" ] && CAP_DIR="$WORK_DIR/caps"
	[ -z "$DEVICE" ] && DEVICE="/dev/video0"

	[ -d "$CAP_DIR" ] ||  mkdir -p "$CAP_DIR"
	# if you are using selinux, following command required
	## chcon -t svirt_sandbox_file_t "$CAP_DIR"

	echo Build instances
	docker build -t "$IMAGE_NAME" .

	echo Cleanup old instances
	docker stop "$INSTANCE_NAME" 1> /dev/null 2> /dev/null
	docker rm "$INSTANCE_NAME" 1> /dev/null 2> /dev/null

	echo Run new instances
	docker run --name "$INSTANCE_NAME" --device="$DEVICE":/dev/video0 -v="$CAP_DIR":/video:rw -d "$IMAGE_NAME"

	echo Done
popd
