#!/bin/bash
if [ $# -ne 2 ];then
    echo "$0 date[20131019] output_prefix";
    exit 1
fi

awk -F'\t' '{
  if(FILENAME == ARGV[1]){
      dict[$1] = 1;
  }else{
      label = 0;
      if($1 in dict){
          label = 1;
      }
      print label"\t"$0;
  }
}' clk.${1}.txt imp.${1}.txt  > ${2}.${1}.txt
