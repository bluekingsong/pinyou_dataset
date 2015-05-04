#!/bin/bash

dict="dict"

awk -F'[\t]' 'BEGIN{
}{
  if(FILENAME == ARGV[1]){
      dict[$1] = $2
  }else{
      content=$1;
      for(i=2;i<=NF;i++){
          if($i in dict){
              content=content" "dict[$i]":1";
          }
      }
      print content;
  }
}' ${dict} -
