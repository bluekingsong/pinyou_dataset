#!/bin/bash

awk -F'\t' 'BEGIN{
}{
  for(i=2; i<=NF; ++i){
    dict[$i] += 1;
  }
}END{
  id = 1;
  for(i in dict){
      if(dict[i] >= 5){
         print i""id;
         id += 1;
      }
  }
}'
