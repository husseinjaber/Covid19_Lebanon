import 'package:flutter/material.dart';
import 'package:corona_lebanon/db/todo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class TODO extends StatefulWidget {
  @override
  _TODOState createState() => _TODOState();
  final TodoService todoService=new TodoService();

  var listHere =new List<String>();
  bool isLoaded=false;

}

class _TODOState extends State<TODO> {


  getData() async{

    List<DocumentSnapshot> data = await widget.todoService.getTODO();
    setState(() {
      String aa="";
      int i;
      if(!widget.isLoaded){
      for(i=0;i<data.length;i++)
        {
          print(i.toString()+"hahahaha");
         aa=data[i].data["do"];
         widget.listHere.add(aa);
         print(widget.listHere[i].toString()+"hehehehe");
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
    if(widget.listHere.length>0){
    print(widget.listHere.length.toString());
    return ListView.builder(
        itemCount: widget.listHere.length,
        itemBuilder: (context,index){
          print("is here before heh");
          return new singleTODO(
            text: widget.listHere[index].toString(),
            numb: (index+1).toString(),
          );
        }
    );
    }else
      return Container(
        height: 100,
      );



  }
}

class singleTODO extends StatelessWidget {
  final String text;
  final String numb;
  singleTODO({this.text,this.numb});
  @override
  Widget build(BuildContext context) {
    print("creating single");

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
//        height: 50,
        color: Colors.deepOrange,
        child: Padding(
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Text(numb+": "+text
            ,style: TextStyle(
              fontSize:18 ,
              color: Colors.white,
//                  backgroundColor: Colors.deepOrange
            ),
          ),
        ),

      ),
    ));
  }
}




class todo extends StatefulWidget {
  @override
  _todoState createState() => _todoState();
  static TODO todo1=new TODO();
  Widget aa1=todo1;
}

class _todoState extends State<todo> {




  @override
  Widget build(BuildContext context) {
    return Column(

          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                color: Colors.deepOrange[900],
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Text("100 things to do while stuck inside due to a pandemic:"
                  ,style: TextStyle(
                      fontSize:18 ,
                      color: Colors.white,
//                  backgroundColor: Colors.deepOrange
                    ),
                  ),
                ),

              ),
            ),
            Expanded(child: widget.aa1),
          ],
        );
  }
}
