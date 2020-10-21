#!/usr/bin/env bash

echo '{"CN":"CA","key":{"algo":"rsa","size":2048}}' | cfssl gencert -initca - | cfssljson -bare ca -
echo '{"signing":{"default":{"expiry":"43800h","usages":["signing","key encipherment","server auth","client auth"]}}}' > ca-config.json

export NAME=hera-dev
export ADDRESS=10.0.10.11,$NAME
echo '{"CN":"$NAME","hosts":[""],"key":{"algo":"rsa","size":2048}}' |
    cfssl gencert -config=ca-config.json -ca=ca.pem -ca-key=ca-key.pem -hostname="$ADDRESS" - |
    cfssljson -bare $NAME