#!/bin/bash

exercism submit

git add .

NAME=${$(pwd)##*/}

git commit -m "Add $NAME exercise solution"
