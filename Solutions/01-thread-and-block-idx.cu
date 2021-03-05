#include <stdio.h>

__global__ void printSuccessForCorrectExecutionConfiguration()
{

  if(threadIdx.x == 3 && blockIdx.x == 4)
  {
    printf("Success!\n");
  } else {
    //printf("Failure. Update the execution configuration as necessary.\n");
  }
}

int main()
{
  
  // altering such that we get success once
  printSuccessForCorrectExecutionConfiguration<<<5, 4>>>();

  cudaDeviceSynchronize();
}
