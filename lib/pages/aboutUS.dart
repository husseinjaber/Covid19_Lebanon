import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


class AboutME extends StatefulWidget {
  @override
  _AboutMEState createState() => _AboutMEState();
}

class _AboutMEState extends State<AboutME> {


  _launchURL(String fbORinsta) async {
    String url = fbORinsta;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
        title: Text("About us"),
        actions: <Widget>[
//          new IconButton(icon: Icon(Icons.search,color: Colors.white,), onPressed:(){}),
//          new IconButton(icon: Icon(Icons.shopping_basket,color: Colors.white,), onPressed:(){}),

        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[

            new Text("Hussein Jaber",style: TextStyle(fontSize: 30),),
            SizedBox(height: 25,),
            new Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                InkWell(
                  onTap: (){
                    _launchURL("https://www.facebook.com/7senjr");
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: new Image(
                      width: 50,
                      height: 50,
                      image: AssetImage('pics/fb.png'),),
                  ),
                ),
                SizedBox(width: 25,),
                InkWell(
                  onTap: (){
                    _launchURL("https://www.instagram.com/7senj/");
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: new Image(
                      width: 50,
                      height: 50,
                      image: AssetImage('pics/in.png'),),
                  ),
                ),
                SizedBox(width: 25,),

                InkWell(
                  onTap: (){
                    _launchURL("https://www.linkedin.com/in/7senj/");
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: new Image(
                      width: 50,
                      height: 50,
                      image: AssetImage('pics/li.png'),),
                  ),
                ),


              ],
            )


          ],
        ),
      ),

    );
  }
}
