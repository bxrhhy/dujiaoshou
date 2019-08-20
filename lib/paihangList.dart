import 'package:demo_dujiaoshou/detailsPage.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class PaihangList extends StatefulWidget {
  @override
  PaihangListState createState() {
    // TODO: implement createState
    return PaihangListState();
  }
}
class PaihangListState extends State<PaihangList> with AutomaticKeepAliveClientMixin{
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }
   @override
  Widget build(BuildContext context) {
    return Container(
        height: 200,
        child: ListView.builder(
          itemCount: 99,
          itemBuilder: (context,index){
            return ListItem();
          },
        ),
     
    );
  }
  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
//列表的item
class ListItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left:20,bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Text("1"),
          Container(width: 10,),
          Container(
            decoration: BoxDecoration(
              border: Border.all(width: 1,color: Colors.grey.withOpacity(0.4)),
              borderRadius: BorderRadius.circular(15)
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network("http://static.dujiaoshou.io/ncnj1zoq49lj2guk7ipe?x-oss-process=image/resize,m_pad,h_100,w_100",height: 50,width: 50,fit: BoxFit.cover,),
            ),
          ), 
          Container(width: 10,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("蚂蚁金服",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
                Text("\$10.9亿 | 中国",style: TextStyle(fontSize: 10,color: Colors.grey),),
                Text("估值日期:2015年9月8日",style: TextStyle(fontSize: 10,color: Colors.grey),)
              ],
            ),
          ),
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (_)=>DetailsPage()));
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              padding: EdgeInsets.symmetric(horizontal: 10,vertical: 3),
              decoration: BoxDecoration(
                border: Border.all(width: 1,color: Colors.blueAccent),
                borderRadius: BorderRadius.circular(20)
              ),
              child: Text("访问官网",style: TextStyle(color: Colors.blueAccent,fontSize: 14),),
            ),
          )
        ],
      ),
    );
  }
}

Future<dynamic> getData()async{
  Dio dio = Dio();
  try{
    Response response = await dio.get("https://i061957trial-trial.apim1.hanatrial.ondemand.com/i061957trial/unicorns",);
    print(response.data["entities"]);
  }catch(e){
    print("错误原因:$e");
  }
}