#!/bin/bash

__create_user() {
    # Create a user to SSH into as
    for element in $@
    do
        USER=$(echo "$element" | cut -d',' -f 1)
        PASS=$(echo "$element" | cut -d',' -f 2)
        useradd ${USER} -G wheel
        echo "${PASS}" | passwd --stdin ${USER}
        echo "User created: ${USER}"
    done
}

# Call all functions
__create_user $@
