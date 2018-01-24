# hadoop_streaming_job_chaining

When running MapReduce jobs it is possible to have several MapReduce steps with overall job scenarios means the last reduce output will be used as input for the next map job.
```
Map1 -> Reduce1 -> Map2 -> Reduce2 -> Map3...
```

This script lanches hadoop MapReduce job several times and chain each output as an input for the next job

## Usage

```
$ # ./test.sh input_file_name iteration_number
$ ./test.sh input.dat 3
```
