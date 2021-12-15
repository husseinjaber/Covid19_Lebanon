import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:corona_lebanon/db/data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:url_launcher/url_launcher.dart';


class donate{
  String name;
  String link;
  String pic;
}

class DonateHere extends StatefulWidget {
  @override
  _DonateHereState createState() => _DonateHereState();
  List<donate> listHere=new List<donate>();
  bool isLoaded=false;
  final StatsService statsService=new StatsService();

}

class _DonateHereState extends State<DonateHere> {

  getData() async{

    List<DocumentSnapshot> data = await widget.statsService.getDONATE();
    setState(() {
      donate  aa=new donate();
      int i;
      if(!widget.isLoaded){
        for(i=0;i<data.length;i++)
        {
          aa.name=data[i].data["name"];
          aa.link=data[i].data["site"];
          aa.pic=data[i].data["pic"];
          widget.listHere.add(aa);
        }
        widget.isLoaded=true;
      }


    });


  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getData();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.listHere.length,
        itemBuilder: (context,index){
          print("is here before heh");
          return singleDonate(
            name:widget.listHere[index].name ,
            pic: widget.listHere[index].pic,
            link: widget.listHere[index].link,
          );
        }
    );
  }
}


class singleDonate extends StatelessWidget {
  final String name;
  final String pic;
  final String link;
  singleDonate({this.link,this.name,this.pic});


  _launchURL(String fbORinsta) async {
    String url = fbORinsta;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }}


    @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(

        onTap: (){
          _launchURL(link);
        },
        child: Container(
          color: Colors.red,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,

              children: <Widget>[
                Text(name,style: TextStyle(fontSize: 18),),
                FadeInImage.assetNetwork(
                    placeholder: 'pics/waiting.png',
                    image:pic),
                Text(link,style: TextStyle(fontSize: 18),),

              ],
            ),
        ),

      ),
    );
  }
}
class Donate extends StatefulWidget {
  @override
  _DonateState createState() => _DonateState();
}

class _DonateState extends State<Donate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: new AppBar(
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
         title: Text("Donate"),
         actions: <Widget>[
//          new IconButton(icon: Icon(Icons.search,color: Colors.white,), onPressed:(){}),
//          new IconButton(icon: Icon(Icons.shopping_basket,color: Colors.white,), onPressed:(){}),

    ],
    ),


      body:DonateHere() ,




    );
  }
}
