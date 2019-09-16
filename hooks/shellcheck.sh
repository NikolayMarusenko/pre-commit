#!/usr/bin/env bash

set -e

export PATH=$PATH:/usr/local/bin

exit_status=0

for file in "$@"; do
 if (head -1 "$file" |grep '^#!.*sh'>/dev/null); then

    if ! shellcheck "$file"; then
        exit_status=1
    fi
 elif [[ "$file" =~ \.sh$|bash$ ]]; then
      echo "$file: missing shebang"
      exit_status=1
 fi
done

exit $exit_status
