# `Fractal Generator using different maps` Sample

Mandelbrot is an infinitely complex fractal patterning that is derived from a simple formula.  It demonstrates using DPC++ for offloading computations to a GPU (or other devices) and shows how processing time can be optimized and improved with parallelism.

For comprehensive instructions regarding DPC++ Programming, go to https://software.intel.com/en-us/oneapi-programming-guide and search based on relevant terms noted in the comments.

| Optimized for                       | Description
|:---                               |:---
| OS                                | Linux* Ubuntu* 18.04; Windows 10
| Hardware                          | Skylake with GEN9 or newer
| Software                          | Intel&reg; oneAPI DPC++/C++ Compiler
| What you will learn               | How to offload the computation to GPU using the Intel&reg; oneAPI DPC++/C++ Compiler
| Time to complete                  | 15 minutes

## Purpose
Mandelbrot is a DPC++ application that generates a fractal image by initializing a matrix of 512 x 512, where the computation at each point (pixel) is entirely independent of the computation at other points. The sample includes both parallel and serial calculation of the set, allowing for a direct comparison of results. The parallel implementation can demonstrate the use of Unified Shared Memory (USM) or buffers. You can modify parameters such as the number of rows, columns, and iterations to evaluate the difference in performance and load between USM and buffers. This is further described at the end of this document in the "Running the Sample" section.

The code will attempt first to execute on an available GPU and fallback to the system's CPU if a compatible GPU is not detected.  The device used for compilation is displayed in the output along with elapsed time to render the mandelbrot image. This is helpful for comparing different offload implementations based on complexity of the computation. 

## Key Implementation Details 
The basic DPC++ implementation explained in the code includes device selector, buffer, accessor, kernel, and command groups.

### Running Samples In DevCloud
If running a sample in the Intel DevCloud, remember that you must specify the compute node (CPU, GPU, FPGA) as well whether to run in batch or interactive mode. For more information see the Intel® oneAPI Base Toolkit Get Started Guide (https://devcloud.intel.com/oneapi/get-started/base-toolkit/)


## Running the Sample
### Application Parameters 
You can modify the Mandelbrot parameters from within mandel.hpp. The configurable parameters include:
    row_size = 
    col_size =
    max_iterations =
    repetitions =
The default row and column size is 512.  Max interatins and repetions are both 100.  By adjusting the parameters, you can observe how the performance varies using the different offload techniques.  Note that if the values drop below 128 for row and column, the output is limted to just text in the ouput window.

### Example of Output
```
Platform Name: Intel(R) OpenCL HD Graphics
  Platform Version: OpenCL 2.1 
       Device Name: Intel(R) Gen9 HD Graphics NEO
    Max Work Group: 256
 Max Compute Units: 24

Parallel Mandelbrot set using buffers.
Rendered image output to file: mandelbrot.png (output too large to display in text)
       Serial time: 0.0430331s
     Parallel time: 0.00224131s
Successfully computed Mandelbrot set.
```
