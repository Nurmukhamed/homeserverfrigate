#!/bin/bash

PACKERBIN=$HOME/bin/packer

${PACKERBIN} \
  build \
  -var-file="static.pkrvars.hcl" \
  .
