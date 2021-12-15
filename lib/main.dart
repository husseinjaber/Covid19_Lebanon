import 'package:flutter/material.dart';
//import 'package:corona_lebanon/widget/messaging_widget.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'pages/stats.dart';
import 'pages/sym.dart';
import 'pages/todo.dart';
import 'pages/donate.dart';
import 'pages/aboutUS.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final String appTitle = 'Corona in Lebanon';
  @override
  Widget build(BuildContext context) => MaterialApp(
    theme: ThemeData(
      primaryColor:Colors.deepOrange,
    ),
    debugShowCheckedModeBanner: false,
    title: appTitle,
    home: MainPage(),
  );
}
//const MainPage({this.appTitle});

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  static Widget HomeWidget1=new stats();
  Widget HomeWidget=HomeWidget1;

  static Widget HomeWidget2=new sym();
  static Widget HomeWidget3=new todo() ;








  int _page = 0;
  String title="Coronavirus Stats in Lebanon";
  GlobalKey _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.deepOrange[200],
      drawer: new Drawer(
        child: ListView(
          children: <Widget>[
            SizedBox(height: 50,),

            InkWell(
              onTap: (

                  ){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>new Donate()));
              },
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: ListTile(
                  leading:Icon(Icons.supervisor_account,color: Colors.black,size: 22,),
                  title: Text("Donate to lebanese red cross, and more",style: TextStyle(color:Colors.black,fontSize: 18 ),),
                ),
              ),
            ),


            InkWell(
              onTap: (

                  ){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>new AboutME()));
              },
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: ListTile(
                  leading:Icon(Icons.person_pin,color: Colors.black,size: 22,),
                  title: Text("About Us",style: TextStyle(color:Colors.black,fontSize: 18 ),),
                ),
              ),
            ),
//            ListTile(
//              leading:Icon(Icons.ac_unit),
//              title: Text("hello"),
//            ),
          ],
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: Text(title,style: TextStyle(fontSize: 16),),
      ),
        bottomNavigationBar: CurvedNavigationBar(
          backgroundColor:Colors.transparent,
          color: Colors.deepOrange,
//          buttonBackgroundColor:Colors.white,
          key: _bottomNavigationKey,
          height: 60,
          items: <Widget>[
            Icon(Icons.ac_unit, size: 30,color: Colors.white,),
            Icon(Icons.list, size: 30,color: Colors.white,),
            Icon(Icons.home, size: 30,color: Colors.white,),
          ],
          onTap: (index) {
            setState(() {
              _page = index;
              if(index==0)
                {
                  title="Coronavirus Live Stats in Lebanon";
                   HomeWidget=HomeWidget1;            }
              else if(index==1)
                {
                  title="Symptoms and Prevention";
                  HomeWidget=HomeWidget2;
                }
              else if(index==2){
                title="Quarantine?";
                HomeWidget=HomeWidget3;
              }

            });
          },
        ),
        body:HomeWidget,
    );
  }
}
