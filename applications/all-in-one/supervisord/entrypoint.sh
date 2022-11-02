#!/usr/bin/env bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

SUPERVISORD_HOME=${SUPERVISORD_HOME:-"$SCRIPT_DIR/configs"}
DEFAULT_STACK=${STACK:-"multiprocess"}
STACK=${1:-$DEFAULT_STACK}

case "$STACK" in
    multiprocess)
        echo -e "DEBUG: Using configuration $SUPERVISORD_HOME/multiprocess.conf"
        supervisord -c $SUPERVISORD_HOME/multiprocess.conf
        ;;
    composite)
        echo -e "DEBUG: Using configuration $SUPERVISORD_HOME/composite.conf"
        supervisord -c $SUPERVISORD_HOME/composite.conf
        ;;
    app1)
        echo -e "DEBUG: Using configuration $SUPERVISORD_HOME/app1.conf"
        supervisord -c $SUPERVISORD_HOME/app1.conf
        ;;
    app2)
        echo -e "DEBUG: Using configuration $SUPERVISORD_HOME/app2.conf"
        supervisord -c $SUPERVISORD_HOME/app2.conf
        ;;
    *)
        >&2 echo -e "ERROR: Invalid stack: ${STACK}"
        echo -e "Usage: ./entrypoint.sh <stack>"
        echo -e "where <stack> can be one of ['multiprocess', 'composite', 'app1', 'app2']"
        exit 1
        ;;
    --help)
        echo -e "Usage: ./entrypoint.sh <stack>"
        echo -e "where <stack> can be one of ['multiprocess', 'composite', 'app1', 'app2']"
        ;;
esac
