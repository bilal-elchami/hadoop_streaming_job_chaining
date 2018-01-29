# hadoop_streaming_job_chaining

When running MapReduce jobs it is possible to have several MapReduce steps with overall job scenarios means the last reduce output will be used as input for the next map job.
```
Map1 -> Reduce1 -> Map2 -> Reduce2 -> Map3...
```

This script lanches hadoop MapReduce job several times and chain each output as an input for the next job

## Usage

```
$ # ./launch.sh input_file_name iteration_number
$ ./launch.sh input.dat 3
```

This script is not generic and will automatically search for input files in a directory called data and will create a directory called output as well to temporary save the output files.

Finally, the result file can be found in the data directory.
