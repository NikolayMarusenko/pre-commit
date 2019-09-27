#!/usr/bin/env bash

set -e

export PATH=$PATH:/usr/local/bin

terraform plan -out=plan.out
terraform-compliance -f git:https://github.com/NikolayMarusenko/pre-commit.git -p plan.out
rm plan.out 
