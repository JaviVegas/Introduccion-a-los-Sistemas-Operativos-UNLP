#!/bin/bash
select action in Listar DondeEstoy QuienEsta Exit
do
    case $action in
        "Listar")
            ls $pwd;;
        "DondeEstoy")
            pwd;;
        "QuienEsta")
            whoami;;
        "Exit")
            exit 0;;
    esac
done
