%% Compile all mex files
% This script compiles the mex files needed to run the parallel sampling
% algorithms.

graphlab_path='../../..';
graphlab_bin_path=[graphlab_path, '/release'];
graphlab_include_path = [graphlab_path, '/src'];
graphlab_link_path = [graphlab_bin_path, '/src/graphlab'];
cxx_flags = ['CXXFLAGS=', ...
   '"-fPIC -Wall -O3 -pthread -fexceptions -fno-omit-frame-pointer ', ...
   '-fopenmp"'];



compilestr = ...
   ['mex -largeArrayDims', ' ', cxx_flags, ' ', ...
   'sampler.cpp', ' ', ...
   '-I', graphlab_include_path, ' ', ...
   '-L', graphlab_link_path, ' ', ...
   '-L', graphlab_link_path, '/extern/metis/GKlib', ' ', ...
   '-L', graphlab_link_path, '/extern/metis/libmetis', ' ', ...
   '-L', graphlab_bin_path, '/apps/pgibbs', ' ', ...
   '-lpgibbs_pic', ' ', ...
   '-lgraphlab_pic -lgraphlab_util_pic', ' ', ...
   '-lgraphlab_metis_pic -lgraphlab_GKlib_pic', ' ', ...
   '-lgomp'];

disp(compilestr);
eval(compilestr);
disp('Finished!');
