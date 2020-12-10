#!/bin/bash

function poll() {
        result=$(curl -s -o /dev/null -w \%{http_code}" $1)
        echo $1
        echo $2
        if [ "$result" == "$2" ]; then
                say "Domain is available"
                exit 0
        else
                echo "Waiting"
        fi
}

function main() {
        poll $1 $2
}

main
