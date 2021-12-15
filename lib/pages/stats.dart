import 'dart:math';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:corona_lebanon/db/data.dart';

class stats extends StatefulWidget {
  @override
  _statsState createState() => _statsState();
  StatsService statsService=new StatsService();

  String total="-";
  String good="-";
  String dead="-";
  String pic="";
}

class _statsState extends State<stats> {

//  DocumentSnapshot dataHere;

  getData() async{
    List<DocumentSnapshot> data = await widget.statsService.getStat();
    setState(() {
      widget.total=data[0].data["total"];
      widget.good=data[0].data["good"];
      widget.dead=data[0].data["dead"];
      widget.dead=data[0].data["dead"];
      widget.pic=data[0].data["pic"];
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



    return StreamBuilder(
      stream:widget.statsService.firestore.collection("stats").snapshots(),
      builder: (context, snapshot) {
        getData();
        return Padding(
          padding: const EdgeInsets.all(15.0),
          child:SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Table(

                  children: [
                    TableRow(

                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(

                            child: Center(child: Text("Confirmed",style: TextStyle(fontSize: 16,color: Colors.white),)),

                            height: 50,
                            width: 80,
                            color: Colors.deepOrange,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(

                            child: Center(child: Text("Recovered",style: TextStyle(fontSize: 16,color: Colors.white),)),

                            height: 50,
                            width: 80,
                            color: Colors.deepOrange,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(

                            child: Center(child: Text("Deaths",style: TextStyle(fontSize: 16,color: Colors.white),)),

                            height: 50,
                            width: 80,
                            color: Colors.deepOrange,
                          ),
                        ),


                      ],
                    ),
                    TableRow(
                      children:[
                        SizedBox(height: 10,),
                        SizedBox(height: 10,),
                        SizedBox(height: 10,),
                      ]
                    ),
                    TableRow(
                      children: [
                        Container(
                          child:CircleAvatar(
                              backgroundColor: Colors.deepOrange,
                              child: Text(widget.total,style: TextStyle(fontSize: 18,color: Colors.white),)
                          ),
                          height: 90,
                        ),
                        Container(
                          child:CircleAvatar(
                              backgroundColor: Colors.deepOrange,
                              child: Text(widget.good,style: TextStyle(fontSize: 18,color: Colors.white),)
                          ),
                          height: 90,
                        ),
                        Container(
                          child: CircleAvatar(
                              backgroundColor: Colors.deepOrange,
                              child: Text(widget.dead,style: TextStyle(fontSize: 18,color: Colors.white),)
                          ),
                          height: 90,
                        ),
                      ]
                    ),

                  ],

                ),
                SizedBox(height: 20,),
                Container(

                  child: FadeInImage.assetNetwork(
                      placeholder: 'pics/waiting.png',
                      image:widget.pic),
                ),
              ],
            ),
          ),
        );
      }
    );
  }
}
