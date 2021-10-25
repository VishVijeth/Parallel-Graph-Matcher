#include <stdio.h>
#include <stdlib.h>

__global__ void markFilterEdges_gpu(int * src, int * dst, int * matches, int * keepEdges, int numEdges) {
    
    int tid = blockDim.x * blockIdx.x + threadIdx.x;
	int num_threads = blockDim.x * gridDim.x;
  
    for(int i = tid; i < numEdges; i+= num_threads){
       int j = src[i];
       int k = dst[i];
       if(matches[j] == -1 && matches[k] == -1){
           keepEdges[i] = 1;
       }
       else{
           keepEdges[i] = 0;
       }
   }
	
}
