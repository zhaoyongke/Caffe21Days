/*
Build with these commands :

$ g++ -o test get_param_from_proto.cpp ./build/src/caffe/proto/caffe.pb.cc \
-I./build/src/caffe/proto/ -I~/local_install/include –L~/local_install/lib –lprotobuf

*/

#include "caffe.pb.h"
#include <google/protobuf/io/coded_stream.h>
#include <google/protobuf/io/zero_copy_stream_impl.h>
#include <google/protobuf/text_format.h>

#include <iostream>

using namespace std;
using google::protobuf::io::FileInputStream;
using google::protobuf::io::FileOutputStream;
using google::protobuf::io::ZeroCopyInputStream;
using google::protobuf::io::CodedInputStream;
using google::protobuf::io::ZeroCopyOutputStream;
using google::protobuf::io::CodedOutputStream;
using google::protobuf::Message;
#include <fcntl.h>

int main(void)
{
  const char * filename = "solver.prototxt";
  caffe::SolverParameter solver_param;
  int fd = open(filename, O_RDONLY);
  if(fd == -1)
  {
    cout << "File not found: " << filename <<endl;
  }
  FileInputStream* input = new FileInputStream(fd);
  bool success = google::protobuf::TextFormat::Parse(input, &solver_param);
  delete input;
  close(fd);
  cout<<"Solver Mode = "<<solver_param.solver_mode()<<endl;
  cout<<"Device id = "<<solver_param.device_id()<<endl;
  cout<<"Solver Type = "<<solver_param.solver_type()<<endl;
  cout<<"Random Seed = "<<solver_param.random_seed()<<endl;
//  cout<<"Train net param = "<<solver_param.train_net_param()<<endl;
  cout<<"Max iter = "<<solver_param.max_iter()<<endl;
  cout<<"Test interval = "<<solver_param.test_interval()<<endl;
  
  cout<<"End"<<endl;
}
