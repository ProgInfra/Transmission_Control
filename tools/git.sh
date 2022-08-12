#!/bin/bash


# Git Setup Multiple Repository
git remote add gitlab git@gitlab.com:proginfra/transmission_control.git
git remote set-url --add --push origin git@gitlab.com:proginfra/transmission_control.git

git remote add github git@github.com:ProgInfra/Transmission_Control.git
git remote set-url --add --push origin git@github.com:ProgInfra/Transmission_Control.git


# Display Config
git remote show origin

git config --list
