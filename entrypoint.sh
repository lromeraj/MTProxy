#!/bin/bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

PUBLIC_IP=${PUBLIC_IP:-$(dig +short myip.opendns.com @resolver1.opendns.com)}
PRIVATE_IP=${PRIVATE_IP:-$(hostname -i)}

"${SCRIPT_DIR}/objs/bin/mtproto-proxy" --nat-info "$PRIVATE_IP:$PUBLIC_IP" $@
