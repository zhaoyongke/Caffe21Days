#include <vector>
#include <iostream>
#include <caffe/blob.hpp>
using namespace caffe;
using namespace std;
int main(void)
{
  Blob<float> a;
  cout<<"Size : "<< a.shape_string()<<endl;
  a.Reshape(1, 2, 3, 4);
  cout<<"Size : "<< a.shape_string()<<endl;
  
  
  
  // 续上面代码
  float * p = a.mutable_cpu_data();
  for(int i = 0; i < a.count(); i++)
  {
    p[i] = i;
  }
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

  
  
  
  // 续上面代码
  cout<<"ASUM = "<<a.asum_data()<<endl;
  cout<<"SUMSQ = "<<a.sumsq_data()<<endl;

  return 0;
}
