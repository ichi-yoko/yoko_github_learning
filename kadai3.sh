#!/bin/bash

tmp=/tmp/$$

error_func() {
  echo "[ERROR] Case:$1 $2"
  exit 1
}


if [ ! -e ${tmp} ]; then
  mkdir ${tmp}
fi

# test1 : arg1 < arg2 (arg1, arg2 > 0)
echo "test1 : arg1 < arg2 : 12 18"
test_case_num=1

echo 6 > ${tmp}/res_expected
./z15096yi 12 18 > ${tmp}/res_executed || error_func $test_case_num "Failed to run test module"

diff ${tmp}/res_expected ${tmp}/res_executed || error_func $test_case_num "Not expected result."

echo "test1 Success!"
#exit 0


# test2 : arg1 < arg2 (arg1, arg2 > 0)
echo "test2 : arg1 > arg2 : 20 15"
test_case_num=2

echo 5 > ${tmp}/res_expected
./z15096yi 20 15 > ${tmp}/res_executed || error_func $test_case_num "Failed to run test module"

diff ${tmp}/res_expected ${tmp}/res_executed || error_func $test_case_num "Not expected result."

echo "test2 Success!"


# test3 : arg1 = arg2 (arg1, arg2 > 0)
echo "test3 : arg1 = arg2 : 19 19"
test_case_num=3

echo 19 > ${tmp}/res_expected
./z15096yi 19 19 > ${tmp}/res_executed || error_func $test_case_num "Failed to run test module"

diff ${tmp}/res_expected ${tmp}/res_executed || error_func $test_case_num "Not expected result."

echo "test3 Success!"


if [ -e ${tmp} ]; then
  rm -r ${tmp}
fi

echo "All Test Success!"
exit 0

