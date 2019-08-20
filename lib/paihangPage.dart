import 'package:dujiaoshou/paihangList.dart';
import 'package:flutter/material.dart';

import 'appBar.dart';

class PaihangPage extends StatefulWidget {
  @override
  _PaihangPageState createState() => _PaihangPageState();
}

class _PaihangPageState extends State<PaihangPage> with AutomaticKeepAliveClientMixin{
  @override
  bool get wantKeepAlive =>true;
  List<String> _picList_GZ = [];
  List<String> _picList_ZX = [];
  List<String> _kinds = [];
  List<Widget> _tabs = [];
  List<Widget> _tabviews = [];
  ScrollController _controller = ScrollController();
  int currentIndex;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    currentIndex = 0;
    _picList_GZ = [
      "http://static.dujiaoshou.io/v1488025290/vhg2ghsprqvxwuijbvrm.png?x-oss-process=image/resize,m_pad,h_100,w_100",
      "http://static.dujiaoshou.io/bomkrvppqn1pssoqsxqy?x-oss-process=image/resize,m_pad,h_100,w_100",
      "http://static.dujiaoshou.io/v1503597655/gicoo1jedk2qzrye7wnv.png?x-oss-process=image/resize,m_pad,h_100,w_100"
    ];
    _picList_ZX = [
      "http://static.dujiaoshou.io/ncnj1zoq49lj2guk7ipe?x-oss-process=image/resize,m_pad,h_100,w_100",
      "http://static.dujiaoshou.io/ou8jmfz9upjucrzhhkgm?x-oss-process=image/resize,m_pad,h_100,w_100",
      "http://static.dujiaoshou.io/geii0xdx3tbm8jhpeidr?x-oss-process=image/resize,m_pad,h_100,w_100"
    ];
    _kinds = [
      "全部",
      "互联网",
      "工业",
      "农业",
      "建筑业",
      "建筑业",
    ];
    _tabs = [
      Container(color: Colors.transparent,height: 40,alignment:Alignment.center,child: Text("全部")),
      Container(color: Colors.transparent,height: 40,alignment:Alignment.center,child: Text("互联网")),
      Container(color: Colors.transparent,height: 40,alignment:Alignment.center,child: Text("工业")),
      Container(color: Colors.transparent,height: 40,alignment:Alignment.center,child: Text("农业")),
      Container(color: Colors.transparent,height: 40,alignment:Alignment.center,child: Text("建筑业")),
      Container(color: Colors.transparent,height: 40,alignment:Alignment.center,child: Text("林业")),
      
    ];
    _tabviews = [
      PaihangList(),
      Center(child: Text("互联网")),
      Center(child: Text("工业")),
      Center(child: Text("农业")),
      Center(child: Text("建筑业")),
      Center(child: Text("林业")),
    ];
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        child: CustomAppBar(),
        preferredSize: Size.fromHeight(50)
      ),
      body: DefaultTabController(
        length: _kinds.length,
        child: NestedScrollView(
          controller: _controller,
          headerSliverBuilder: (BuildContext context,bool inner){
            return [
              SliverToBoxAdapter(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10,vertical: 8),
                    height: 80,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: PaihangItem(
                            title: "国家排行榜",
                            time: "每周一更新",
                            picList: _picList_GZ,
                          )
                        ),
                        Container(width: 20,),
                        Expanded(
                          child: PaihangItem(
                            title: "最新排行榜",
                            time: "每天0点更新",
                            picList: _picList_ZX,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              SliverAppBar(
                expandedHeight: 0,
                floating: true,
                pinned: true,
                bottom: PreferredSize(
                  preferredSize: Size.fromHeight(50),
                  child: Theme(
                    data: Theme.of(context).copyWith(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent
                    ),
                    child: TabBar(
                      onTap: (x){
                        setState(() {
                          currentIndex = x;
                        });
                      },
                      isScrollable: true,
                      indicatorColor: Colors.transparent,
                      labelColor: Colors.blueAccent,
                      unselectedLabelColor: Colors.grey.withOpacity(0.6),
                      labelStyle: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
                      unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal),
                      tabs: _tabs
                    ),
                  ),
                )
              )
            ];
          },
          body: TabBarView(
            children: _tabviews,
          )
        ),
      )
    );
  }
}
class PaihangItem extends StatelessWidget {
  String title;
  String time;
  List<String> picList = [];
  PaihangItem({Key key,this.title,this.time,this.picList}):super(key:key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(offset: Offset(1.0,1.0),color: Color(0xff2C515C).withOpacity(0.1),blurRadius: 5,),
          BoxShadow(offset: Offset(-0.5,-0.5),color: Color(0xff2C515C).withOpacity(0.1),blurRadius: 5,),
        ]
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          //左侧的榜单名称
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(title,style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),),
              Text(time,style: TextStyle(fontSize: 10,color: Colors.grey),)
            ],
          ),
          //右侧的logo列表
          Container(
            height: 40,
            width: 60,
            child: Stack(
              alignment: Alignment.bottomLeft,
              children: <Widget>[
                PaihangItemIcon(top: 3,src: picList[0],),
                Positioned(left: 10,child: PaihangItemIcon(top: 2,src: picList[1],),),
                Positioned(left: 20,child: PaihangItemIcon(top: 1,src: picList[2],),),
              ],
            ),
          )
        ],
      )
    );
  }
}
//排行榜的logo
class PaihangItemIcon extends StatelessWidget {
  int top;
  String src;
  PaihangItemIcon({Key key,this.top,this.src}):super(key:key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: Image.network(
            src,
            height: top==3?30:(top==2?35:40),
            width: top==3?30:(top==2?35:40),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.grey.withOpacity(top==3?0.7:(top==2?0.4:0)),
            border: Border.all(width: 0.1,color: Colors.grey)
          ),
          height: top==3?30:(top==2?35:40),
          width: top==3?30:(top==2?35:40),
        )
      ],
    );
  }
}
