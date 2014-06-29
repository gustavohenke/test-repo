#!/bin/bash

if [ ! -z "${TRAVIS_TAG}" ]; then
	echo "Tag available!"
fi

echo $TRAVIS_TAG;