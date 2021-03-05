# NVIDIA_accelerated_programming_C_CPP
Fundamentals of Accelerated Computing with CUDA C/C++

Accelerated systems, also referred to as heterogeneous systems, are both composed of both CPUs and GPUs. Accelerrated systems run CPU programs which in turn , launches functions that will benefit from massive parallelism provided by GPUs.

Information about  the GPU can be queried with the ```nvidia-smi```. For me this gives following output. Important is the name of GPU, my GPU is 
GeForce 940MX. based on your GPU, architecture flag will be different. In my case, it belongs to Maxwell architecture needing 50 or 52  or 53. See this [link](https://docs.nvidia.com/cuda/cuda-compiler-driver-nvcc/index.html#virtual-architecture-feature-list). Providing another architecture flag will not work.
```
$ nvidia-smi
Fri Mar  5 19:15:01 2021       
+-----------------------------------------------------------------------------+
| NVIDIA-SMI 460.32.03    Driver Version: 460.32.03    CUDA Version: 11.2     |
|-------------------------------+----------------------+----------------------+
| GPU  Name        Persistence-M| Bus-Id        Disp.A | Volatile Uncorr. ECC |
| Fan  Temp  Perf  Pwr:Usage/Cap|         Memory-Usage | GPU-Util  Compute M. |
|                               |                      |               MIG M. |
|===============================+======================+======================|
|   0  GeForce 940MX       On   | 00000000:01:00.0 Off |                  N/A |
| N/A   50C    P0    N/A /  N/A |    905MiB /  2004MiB |      0%      Default |
|                               |                      |                  N/A |
+-------------------------------+----------------------+----------------------+
                                                                               
+-----------------------------------------------------------------------------+
| Processes:                                                                  |
|  GPU   GI   CI        PID   Type   Process name                  GPU Memory |
|        ID   ID                                                   Usage      |
|=============================================================================|
|    0   N/A  N/A      1113      G   /usr/lib/xorg/Xorg                 26MiB |
|    0   N/A  N/A      1330      G   /usr/bin/gnome-shell               83MiB |
...
+-----------------------------------------------------------------------------+

```

### Note:
.cu is the file extensions for the CUDA-accelerated programs. Example of one of the file is shown below:

```
void CPUFunction()
{
  printf("This function is defined to run on the CPU.\n");
}

__global__ void GPUFunction()
{
  printf("This function is defined to run on the GPU.\n");
}

int main()
{
  CPUFunction();

  GPUFunction<<<1, 1>>>(); //kernel with 1 block of threads containing 1 thread. 
  cudaDeviceSynchronize(); // wait until GPU finishes its task.
}
```
Above .cu file contains two functions, the first which will run in CPU, second will run on GPU.

## To compile the code use, for example:
```
$ nvcc -arch=sm_50 -o hello-gpu ../Solutions/01-hello-gpu.cu
```
And to run
```
$ ./hello-gpu
```
If you want to directly compile and run, use:
```
$ nvcc -arch=sm_50 -o hello-gpu ../Solutions/01-hello-gpu.cu -run
```
## Using CMakeLists.txt
You may need to change the name of executable in CMakeLists for different programs to run.
```
add_executable(main
  <CHANGE HERE>
)
```
```
$ mkdir build && cd build
$ cmake -DCMAKE_CUDA_FLAGS="-arch=sm_50" ..
$ make
$ ./main
```
or directly run the program using [run.sh](./run.sh) from project folder
```
$ sh run.sh 
```

## Codes
- [01-hello-gpu.cu](./Solutions/01-hello-gpu.cu)
