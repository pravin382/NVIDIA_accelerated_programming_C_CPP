#include <stdio.h>

// no need to change this
void helloCPU()
{
  printf("Hello from the CPU.\n");
}


// add __GLOBAL__ so that the function runs from gpu
__global__ void helloGPU()
{
  printf("Hello from the GPU.\n");
}

int main()
{

  // calling the  GPU function
  helloGPU<<<1, 1>>>();
  cudaDeviceSynchronize(); // finish GPU first and then move to next

  helloCPU();

  helloGPU<<<1, 1>>>();
  // synchronize CPU and GPU operations
  cudaDeviceSynchronize();

} 


