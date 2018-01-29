#!/bin/bash

# nextInputName="facebook_data.dat"
# originalInputName="facebook_data.dat"

mergeOutputParts() {
  cat output/part-* > output/all.dat
}

startHadoop() {
  hadoop jar $HADOOP_HOME/share/hadoop/tools/lib/hadoop-streaming-2.8.1.jar -input data/$nextInputName -output output -file python/mapper.py -mapper mapper.py -file python/reducer.py -reducer reducer.py
  # mv output/part-* data/input$i
  # mv output/part-* "data/input$i.dat"
  mergeOutputParts
  mv "output/all.dat" "data/result$i.dat"
  rm -rf output/*
  rm -rf output/.*
  rmdir output
  if [ $nextInputName != $originalInputName ]
  then
    rm data/$nextInputName
  fi
  nextInputName="result$i.dat"
  echo "END"
}

main(){
  # for i in {0..5..1}
  # do
  #    startHadoop $i
  #    # echo $nextInputName
  #    # echo $iterationCount
  #    # echo $1
  # done
  for ((i=1; i<=$iterationCount; i++));
  do
     startHadoop $i
  done
}

if [ $# -eq 0 ]
then
  echo "No argument supplied"
  nextInputName="input.dat"
  originalInputName="input.dat"
  iterationCount=3
else
  nextInputName=$1
  originalInputName=$1
  iterationCount=$2
fi

main
