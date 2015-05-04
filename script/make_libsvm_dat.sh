#!/bin/bash

dict="dict"

awk -F'[\t]' 'BEGIN{
}{
  if(FILENAME == ARGV[1]){
      dict[$1] = $2
  }else{
      content=$1;
      delete b;
      for(i=2;i<=NF;i++){
          if($i in dict){
              b[i] = dict[$i];
          }
      }
      n = asort(b);
      for(i=1; i<=n; ++i){
         content=content" "b[i]":1";
      }
      print content;
  }
}' ${dict} -
