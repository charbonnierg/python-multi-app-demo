!#/usr/bin/env bash

STACK=${STACK:-"all-in-one"}

case "$STACK" in
    all-in-one)
        echo -e "DEBUG: Using configuration /etc/supervisord/all-in-one.conf"
        supervisord -c /etc/supervisord/all-in-one.conf
        ;;
    composite)
        echo -e "DEBUG: Using configuration /etc/supervisord/composite.conf"
        supervisord -c /etc/supervisord/composite.conf
        ;;
    app1)
        echo -e "DEBUG: Using configuration /etc/supervisord/app1.conf"
        supervisord -c /etc/supervisord/app1.conf
        ;;
    app2)
        echo -e "DEBUG: Using configuration /etc/supervisord/app2.conf"
        supervisord -c /etc/supervisord/app2.conf
        ;;
    *)
        >&2 echo -e "ERROR: Invalid stack: ${STACK}"
        exit 1
        ;;
    --help)
        echo -e "Usage: ./entrypoint.sh <stack>"
        echo -e "where <stack> can be one of ['all-in-one', 'composite', 'app1', 'app2']"
