#!/bin/sh

command=$1

if [ "$command" = "deploy" ]; then
	echo "Deploying all Froala Demo Application"
	git clone https://github.com/froala/wysiwyg-editor-node-sdk
	cp node_Dockerfile wysiwyg-editor-node-sdk

	docker-compose -p test-demo-apps up -d --build --force-recreate
fi
if [ "$command" = "clean" ]; then
	echo "Deleting all the repositories and deployed applications"
	docker-compose -p test-demo-apps down
	rm -rf wysiwyg-editor-node-sdk
fi
