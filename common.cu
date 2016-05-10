


#include "cuda_runtime.h"
#include "cuda.h"
#include "device_launch_parameters.h"
#include "device_atomic_functions.h"

#define CUDA_CALL(x) {const cudaError_t a = (x);if (a != cudaSuccess) { printf("\nCuda error: %s (err_num = %d)\n",cudaGetErrorString(a),a);cudaDeviceReset();}}
#define MAX_HEIGHT 1024
#define MAX_WIDTH 1024
//#define MAX_VERTEX MAX_WIDTH * MAX_HEIGHT

#define INT_PTR(x) (*((int*)(&(x))))

__device__ int dx[8] = {-1,0,1,-1,1,-1,0,1};
__device__ int dy[8] = {-1,-1,-1,0,0,1,1,1};

__device__ int get_loc() {
	int idx = blockIdx.x * blockDim.x + threadIdx.x;
	int idy = blockIdx.y * blockDim.y + threadIdx.y;
	return gridDim.x * blockDim.x * idy +idx;
} 

__device__ int get_x() {
	return blockIdx.x * blockDim.x + threadIdx.x;
}

__device__ int get_y() {
	return blockIdx.y * blockDim.y + threadIdx.y;
}

__device__ bool check_bound(int x, int y, int w, int h) {
	if (x>0&&y>0&&x<w&&y<h) return 1;
		else return 0;
}

__device__ bool check_connect(int loc1, int loc2, unsigned char *img, unsigned char byF) {
	if(img[loc1]==byF&&img[loc2]==byF) return 1;
	return 0;





}