import 'package:flutter/material.dart';

class MyPage extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> with AutomaticKeepAliveClientMixin{
  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    print("绘制界面");
    return Scaffold(
      body: ListView.builder(
        itemCount: 200,
        itemBuilder: (context,index){
          return Container(
            height: 30,
            color: Colors.red,
            margin: EdgeInsets.symmetric(vertical: 10.0),
            child: Text("$index"),
          );
        },
      )
    );
  }

}