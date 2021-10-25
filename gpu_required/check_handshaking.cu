#include <stdio.h>
#include <stdlib.h>

__global__ void check_handshaking_gpu(int * strongNeighbor, int * matches, int numNodes) {
    /** YOUR CODE GOES BELOW **/
    int tid = blockDim.x * blockIdx.x + threadIdx.x;
    int num_threads = blockDim.x * gridDim.x;

    for(int i = tid; i < numNodes; i+= num_threads){
        if(matches[i] == -1){
            int j = strongNeighbor[i];
            if((i == strongNeighbor[j])){
                matches[i] = j;
                matches[j] = i;
            }
        }
    }
	/** YOUR CODE GOES ABOVE **/
}
