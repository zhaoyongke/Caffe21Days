#include <vector>
#include <iostream>
#include <caffe/net.hpp>
using namespace caffe;
using namespace std;
int main(void)
{
  std::string proto("deploy.prototxt");
  Net<float> nn(proto, caffe::TEST);
  vector<string> bn = nn.blob_names();
  cout<<"#### Blob Names #####"<<endl;
  for(int i = 0; i < bn.size(); i++)
  {
    cout<<"Blob #"<<i<<" : "<<bn[i]<<endl;
  }
  vector<string> ln = nn.layer_names();
  cout<<"#### Layer Names #####"<<endl;
  for(int i = 0; i < ln.size(); i++)
  {
    cout<<"Layer #"<<i<<" : "<<ln[i]<<endl;
  }
  return 0;
}
