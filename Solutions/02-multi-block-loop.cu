#include <stdio.h>

/*
 * Refactor `loop` to be a CUDA Kernel. The new kernel should
 * only do the work of 1 iteration of the original loop.
 */

__global__ void loop() //no need of N
{
    int i = blockDim.x * blockIdx.x + threadIdx.x;
    printf("This is iteration number %d\n", i);

}

int main()
{


  int N = 10;
  int blocks = 2;
  loop<<<blocks,N/blocks>>>();

  cudaDeviceSynchronize();
}
