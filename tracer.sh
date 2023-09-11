#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Use tracer --help to show commands"
    exit 1
fi

arg="$1"

if [ "$arg" == "--help" ]; then
    echo "init            Initialize a tracer to track your files modify.
status          Show a status of your files.
commit          To commit your changes."
    exit 1
fi

if [ "$arg" == "init" ]; then

    # Validation
    if [ -d "$PWD/.tracer" ]; then
        echo "A repository already exist in this path."
        exit 1
    fi

    php $(dirname $0)/tracer.php "$arg" "$PWD"

elif [ "$arg" == "status" ]; then

    if [ -d "$PWD/.tracer" ]; then
        php $(dirname $0)/tracer.php "$arg" "$PWD"
        exit 1
    else
        echo "No repository found. Do a 'tracer init' command."
    fi
    
else
    echo "Command does not regonized, use --help flag to show commands avaliable."
fi
