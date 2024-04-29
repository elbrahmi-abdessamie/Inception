#!/bin/bash

if [ ! -d "~/Desktop/data" ]; then
        mkdir -p /Users/$USER/Desktop/data/mariadb
        mkdir -p /Users/$USER/Desktop/data/wordpress
fi