#!/bin/bash

tmp=/tmp/$$

if [ ! -e ${tmp} ]; then
  mkdir ${tmp}
fi

# test1 : arg1 < arg2

echo 6 > ${tmp}/res_expected
./z15096yi 12 18 > ${tmp}/res_executed || echo "Mobule Error"

diff ${tmp}/res_expected ${tmp}/res_executed || echo "diff command Error"

echo "Success!"
