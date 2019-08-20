import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {
  @override
  DetailsPageState createState() {
    // TODO: implement createState
    return DetailsPageState();
  }
}
class DetailsPageState extends State<DetailsPage>{
  ScrollController _controller = ScrollController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller.addListener(
      (){
        if(_controller.position.pixels>50){
          print("jj");
        }
      }
    );
  }
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        title: Text(""),
        centerTitle: true,
        leading: GestureDetector(child: Icon(Icons.arrow_back_ios,color: Colors.black87,),onTap: (){Navigator.pop(context);},),
        actions: <Widget>[
          GestureDetector(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Icon(Icons.star,color: Colors.grey,),
            ),
            onTap: (){
              print("收藏");
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        controller: _controller,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            //标题
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                //左侧文字标题
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("蚂蚁金服",style: TextStyle(fontSize: 18),),
                      Container(height: 5,),
                      Row(
                        children: <Widget>[
                          Text("\$10.9亿 | 中国 | 金融服务",style: TextStyle(fontSize: 12,color: Colors.grey),),
                        ],
                      ),
                    ],
                  ),
                ),
                //右侧公司logo
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    // border: Border.all(width: 1,color: Colors.grey.withOpacity(0.5)),
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network("http://static.dujiaoshou.io/ou8jmfz9upjucrzhhkgm?x-oss-process=image/resize,m_pad,h_100,w_100"),
                  ),
                )
                ],
                
              )
            ),
            Container(
              height: 30,
            ),
            //公司简介
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("公司介绍",style: TextStyle(fontSize: 18),),
                  Container(height: 5,),
                  Text("蚂蚁金服是一家旨在为世界带来普惠金融服务的科技企业，起步于 2004 年成立的支付宝。2014 年 10 月，蚂蚁金服正式成立。蚂蚁金服以“为世界带来更多平等的机会”为使命，致力于通过科技创新能力，搭建一个开放、共享的信用体系和金融服务平台，为全球消费者和小微企业提供安全、便捷的普惠金融服务。",style: TextStyle(fontSize: 14,color: Colors.black54,letterSpacing: 0.5,),),
                ],
              ),
            ),
            Container(height: 30,),
            //公司官网
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("公司官网",style: TextStyle(fontSize: 18),),
                  Container(height: 5,),
                  Text("www.antfin.com",style: TextStyle(color: Colors.blueAccent,decoration: TextDecoration.underline),)
                ],
              ),
            ),
            Container(height: 30,),
            //机构成员
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  //标题和更多按钮
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("机构成员",style: TextStyle(fontSize: 18),),
                        GestureDetector(
                          child: Text("查看全部>>",style: TextStyle(fontSize: 12,color: Colors.grey),
                          ),
                          onTap: (){
                            print("跳到机构成员详情页");
                          },
                        ),
                      ],
                    ),
                  ),
                  Container(height: 5,),
                  //成员列表
                  Container(
                    height: 70,
                    child: ListView.builder(
                      padding: EdgeInsets.only(left: 15,),
                      scrollDirection: Axis.horizontal,
                      itemCount: 20,
                      itemBuilder: (context,index){
                        return MemberItem();
                      },
                    ),
                  )
                ],
              ),
            ),
            Container(height: 30,),
            //公司地址
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("公司地址",style: TextStyle(fontSize: 18),),
                  Container(height: 5,),
                  Container(
                    child: Text("地图"),
                  )
                ],
              ),
            )
          ],
        ),
      )
    );
  }
}

class MemberItem extends StatelessWidget {
  String name;
  String jobs;
  String headSrc;
  MemberItem({Key key,this.name,this.jobs,this.headSrc}):super(key:key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(offset: Offset(1.0,0.0),color: Colors.grey.withOpacity(0.1),blurRadius: 4),
        ],
      ),
      child: Row(
        children: <Widget>[
          //头像
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child:Image.network("https://ss2.baidu.com/6ONYsjip0QIZ8tyhnq/it/u=1443019826,379367391&fm=173&app=25&f=JPEG?w=600&h=378&s=5E386BCBA6353596DC1D0D1B030090D1",height: 40,width: 40,fit: BoxFit.cover,)
          ),
          Container(width: 5,),
          Text("井贤栋(董事长)",style: TextStyle(fontSize: 14,color: Colors.blueAccent),),
        ],
      ),
    );
  }
}