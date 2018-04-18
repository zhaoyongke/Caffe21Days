#include <vector>
#include <iostream>
#include <caffe/blob.hpp>
#include <caffe/util/io.hpp>

using namespace caffe;
using namespace std;


int main(void)
{
  Blob<float> a;
  cout<<"Size : "<< a.shape_string()<<endl;
  a.Reshape(1, 2, 3, 4);
  cout<<"Size : "<< a.shape_string()<<endl;
  float * p = a.mutable_cpu_data();
  float * q = a.mutable_cpu_diff();
  for(int i = 0; i < a.count(); i++)
  {
    p[i] = i;
    q[i] = a.count() - 1 - i;
  }
  a.Update();
  for(int u = 0; u < a.num(); u++)
  {
    for(int v = 0; v < a.channels(); v++)
    {
      for(int w = 0; w < a.height(); w++)
      {
        for(int x = 0; x < a.width(); x++)
        {
          cout<<"a["<<u<<"]["<<v<<"]["<<w<<"]["<<x<<"] = "<< a.data_at(u, v, w, x)<<endl;
        }
      }
    }
  }
  cout<<"ASUM = "<<a.asum_data()<<endl;
  cout<<"SUMSQ = "<<a.sumsq_data()<<endl;
  BlobProto bp;
  a.ToProto(&bp, true); 
  WriteProtoToBinaryFile(bp, "a.blob");
  BlobProto bp2;
  ReadProtoFromBinaryFileOrDie("a.blob", &bp2);
  Blob<float> b;
  b.FromProto(bp2, true);
  for(int u = 0; u < b.num(); u++)
  {
    for(int v = 0; v < b.channels(); v++)
    {
      for(int w = 0; w < b.height(); w++)
      {
        for(int x = 0; x < b.width(); x++)
        {
          cout<<"b["<<u<<"]["<<v<<"]["<<w<<"]["<<x<<"] = "<< b.data_at(u, v, w, x)<<endl;
        }
      }
    }
  }
  return 0;
}
