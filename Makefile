.SILENT:

help:
	echo
	echo "zngoose testing" 
	echo
	echo "Make commands"
	echo
	echo "  Commands: "
	echo
	echo "    help - Show this message"
	echo
	echo "    build - Builds the necessary docker images"
	echo "    run - Start tests and a mongodb container instance locally in docker"
	echo "    reload - Reloads the test container"
	echo
	echo "    build-tests - Builds the testing docker images"
	echo "    tests - Runs the test enviornment and any mocha tests"
	echo
	echo "    NOT-IMPLEMENTED: clean-volumes - Cleans container volumes, mostly to avoid mongodb errors"
	echo "    clean - Removes built container images"
	echo "    rclear - Basically the 'clear' command, but it works in Hyper running Vagrant on Wandows"
	echo "    deps - Check for all dependencies"
	echo

build: build-tests

run: tests

reload: build
	docker-compose -f ./test.yml restart zngtests 

# Doesn't work :(
#
# clean-volumes:
# 	docker volume rm $(docker volume ls -qf dangling=true)

clean:
	docker-compose -f ./test.yml rm -f

rclear:
	echo -e '\0033\0143'

build-tests: clean
	docker-compose -f ./test.yml build

tests: build-tests
	docker-compose -f ./test.yml up

deps:
	echo "  Dependencies: "
	echo
	echo "    * docker $(shell which docker > /dev/null || echo '- \033[31mNOT INSTALLED\033[37m')"
	echo "    * docker-compose $(shell which docker-compose > /dev/null || echo '- \033[31mNOT INSTALLED\033[37m')"
	echo

.PHONY: build build-tests run tests clean deps rclear reload
