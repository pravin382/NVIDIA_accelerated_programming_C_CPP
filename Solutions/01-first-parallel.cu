#include <stdio.h>

__global__ void firstParallel()
{
  printf("This should be running in parallel.\n");
}

int main()
{
  
  // run firstParallel in 4 thread blocks each containing 5 threads
  firstParallel<<<4, 5>>>();

  // wait until gpu operations are complete
  cudaDeviceSynchronize();

}
