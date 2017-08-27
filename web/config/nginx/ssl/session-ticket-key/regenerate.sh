#!/bin/bash

working_dir="`dirname $0`"

previous_key_path="$working_dir"'/previous.key'
current_key_path="$working_dir"'/current.key'

rm -f $previous_key_path
mv $current_key_path $previous_key_path

openssl rand 48 > $current_key_path

