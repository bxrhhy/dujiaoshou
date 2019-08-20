import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
        elevation: 0,
        title: Container(
          height: 35,
          decoration: BoxDecoration(
            color: Color(0xFFEDEDED),
            borderRadius: BorderRadius.circular(25)
          ),
          child: Stack(
            alignment: Alignment.centerLeft,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(
                  hintText: "请输入关键字搜索",
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(left: 35)
                ),
              ),
              Positioned(
                left: 10,
                child: Image.asset("images/search.png",height: 18,)
              )
            ],
          ),
        ),
        centerTitle: true,
      
    );
  }
}