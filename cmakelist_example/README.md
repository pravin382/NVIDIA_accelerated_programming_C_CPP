The cmakelist in this folder is very basic and assumes that the CUDA is not optional. If CUDA is optional, use CMakeLists from project folder(NOT THIS ONE).

- If you want to use this CMakeLists, navigate to build folder and run 
```
$ cmake -S ../cmakelist_example/ -B .
$ make
$ ./main
```