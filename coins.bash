#!/bin/bash

coins=( 50 10 5 2 1 )

exchange() {
  local sum=$1
  shift
  for i in $@; do
    amount=$((sum/i))
    sum=$((sum-amount*i))
    echo $amount
  done
}

main() {
  declare -a total
  echo "монеты: ${coins[@]}"
  while read zp; do
    thecoins=( $(exchange $((zp%100)) ${coins[@]}) )
    echo "$zp ${thecoins[@]}"
    for ((i=0;i<${#coins[@]};++i)); do
      total[$i]=$(( ${total[$i]}+${thecoins[$i]} ))
    done
  done
  echo "итого: ${total[@]}"
} 

main | column -t
