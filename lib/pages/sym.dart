import 'package:flutter/material.dart';
import 'package:corona_lebanon/db/data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class sym extends StatefulWidget {
  @override
  _symState createState() => _symState();
  StatsService statsService=new StatsService();
  Widget aaaa=new Image(image: AssetImage('pics/waiting.png'));
}

class _symState extends State<sym> {

  String pic1="h";
  String pic2="h";
  getData() async{
    List<DocumentSnapshot> data = await widget.statsService.getpics();
    setState(() {
      pic1=data[0].data["pic1"];
      pic2=data[0].data["pic2"];
      if(data[0].data["pic1"]!=null&&data[0].data["pic2"]!=null)
        {widget.aaaa=ListView(
          children: <Widget>[
            FadeInImage.assetNetwork(
//          width: 400,
//          height: 400,
              placeholder: 'pics/waiting.png',
              image: pic1,
            ),
            SizedBox(height: 15,),
            FadeInImage.assetNetwork(
//          width: 400,
//          height: 400,
                placeholder: 'pics/waiting.png',
                image: pic2 ),
            SizedBox(height: 20,),
          ]
      );}
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
    return Container(
      child: widget.aaaa,
    );

  }
}
