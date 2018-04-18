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
  float * p = a.mutable_cpu_data();
  float * q = a.mutable_cpu_diff();
  for(int i = 0; i < a.count(); i++)
  {
    p[i] = i;	// 将 data 初始化为 1, 2, 3 ..
    q[i] = a.count() - 1 - i; // 将 diff 初始化为 23, 22, 21, …
  }
  a.Update();	// 执行 Update 操作，将 diff 与 data 融合
		// 这也是 CNN 权值更新步骤的最终实施者
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

  return 0;
}
