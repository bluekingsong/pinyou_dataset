#!/bin/bash

awk -F'\t' 'BEGIN{
  ### IP,Region,City,Ad exchange,ad slot id,ad slot width,
  ### ad slot height,ad visiblility,ad slot format,advertiser id,user tags
  reserved_str = "7,8,9,10,14,15,16,17,18,19,20,24,25"
  split(reserved_str,a,",");
  for(i in a){
      reserved_field[a[i]] = i;
  }
}{
  content = $1;
  for(i=2; i<=NF; ++i){
      if(i in reserved_field) {
          if(i == 25 && $i != "null"){
              split($i,a,",");
              for(j in a){
                  content = content"\t"reserved_field[i]""a[j];
              }
          }else{
              content = content"\t"reserved_field[i]""$i;
          }
      }
  }
  print content;
}'
