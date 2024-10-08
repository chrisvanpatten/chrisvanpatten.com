#!/bin/bash

flyctl launch \
	--name chrisvanpatten \
	--image=ghost:5-alpine \
	--vm-memory 512 \
	--region ord \
	--no-deploy \
	--org chrisvanpatten \
	;

flyctl volumes create ghost_data \
	--region ord \
	--size 2 \
	--auto-confirm \
	;
