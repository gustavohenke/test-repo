#!/bin/bash

if [ ! -z "${TRAVIS_TAG}" ]; then
	rm -rf ~/.ssh
	mkdir ~/.ssh
	echo -n $id_rsa_{00..30} >> ~/.ssh/id_rsa_base64
	base64 --decode --ignore-garbage ~/.ssh/id_rsa_base64 > ~/.ssh/id_rsa
	chmod 600 ~/.ssh/id_rsa
	echo -e "Host github.com\n\tStrictHostKeyChecking no\n" >> ~/.ssh/config

	GIT_NAME=`git show --format="%an" master | head -n 1`
	GIT_MAIL=`git show --format="%ae" master | head -n 1`

	# Configure git
	git config user.name "${GIT_NAME}"
	git config user.email "${GIT_MAIL}"

	git checkout master
	echo -e "foo\n" >> foo.bar
	git commit -am "Automated commit"
	git remote set-url origin git@github.com:gustavohenke/test-repo.git
	git push origin master
fi