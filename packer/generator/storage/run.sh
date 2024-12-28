#!/bin/bash

PACKERBIN=$HOME/bin/packer

 ${PACKERBIN} \
   build \
   -var-file="storage.pkrvars.hcl" \
   .
