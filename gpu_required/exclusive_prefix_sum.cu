#include <stdio.h>
#include <stdlib.h>

__global__ void exclusive_prefix_sum_gpu(int * oldSum, int * newSum, int distance, int numElements) {
    
    int num_threads = blockDim.x * gridDim.x;
    int tid = blockDim.x * blockIdx.x + threadIdx.x;
    
    if(distance == 0){
        for(int i = tid; i < numElements ; i+= num_threads){
            if(i == 0){
                newSum[i] = 0;
            }
            else{
                newSum[i] = oldSum[i-1];
            } 
        }
    }
    else{
        for(int i = tid; i < numElements ; i+= num_threads){
                if(i-distance > 0){
                    newSum[i] = oldSum[i] + oldSum[i-distance];
                }
                else{
                    newSum[i] = oldSum[i];
                }
        }
    }
	
}
