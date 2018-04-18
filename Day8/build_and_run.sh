g++ -o app blob_demo.cpp  -I $CAFFE_ROOT/include/ -D CPU_ONLY -I $CAFFE_ROOT/.build_release/src/ -L $CAFFE_ROOT/build/lib/ -lcaffe -lglog -lboost_system
export LD_LIBRARY_PATH= $CAFFE_ROOT/build/lib/:$LD_LIBRARY_PATH
./app
