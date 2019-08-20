import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'appBar.dart';
import 'myPage.dart';
import 'paihangPage.dart';
void main() {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MyApp());
} 

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
        // platform: TargetPlatform.android
      ),
      home:Scaffold(
        body: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  MyHomePageState createState() {
    // TODO: implement createState
    return MyHomePageState();
  }
}
class MyHomePageState extends State<MyHomePage>  with AutomaticKeepAliveClientMixin{
  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
  PageController controller = PageController();

  int currentIndex;
  List<Widget> bodyList = [
    Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        child: CustomAppBar(),
        preferredSize: Size.fromHeight(50)
      ),
      body: Center(child: Text("JOJO"),),
    ),
    PaihangPage(),
    MyPage()
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    currentIndex = 0;
  }
  setCurrent(x){
    // setState(() {
    //   currentIndex = x;
    // });
    setState(() {
    controller.jumpToPage(x);
      currentIndex = x;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent
          ),
        child: BottomNavigationBar(
          selectedItemColor: Colors.blueAccent,
          selectedFontSize: 12,
          unselectedFontSize: 12,
          currentIndex: currentIndex,
          onTap: (x){
            setCurrent(x);
          },
          items: [
            BottomNavigationBarItem(
              icon: Image.asset("images/home.png",height: 25,),
              activeIcon: Image.asset("images/home_active.png",height: 25,),
              title: Text("主页")
            ),
            BottomNavigationBarItem(
              icon: Image.asset("images/paihang.png",height: 25,),
              activeIcon: Image.asset("images/paihang_active.png",height: 25,),
              title: Text("排行榜")
            ),
            BottomNavigationBarItem(
              icon: Image.asset("images/my.png",height: 25,),
              activeIcon: Image.asset("images/my_active.png",height: 25,),
              title: Text("我的")
            ),
          ],
        ),
      ),
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        children: bodyList,
        controller: controller,
      )
      
    );
  }
}
