#!/bin/bash

flyctl launch \
	--name "chrisvanpatten-mysql" \
	--image=mysql:8 \
	--vm-memory 512 \
	--region ord \
	--no-deploy \
	--org chrisvanpatten \
	--attach \
	;

fly volumes create mysql_data \
	--size 2 \
	--region ord \
	--auto-confirm \
	;
