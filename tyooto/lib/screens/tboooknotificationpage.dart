import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:tyooto/common/textstyles.dart';

class TBookNotificationPage extends StatefulWidget {
  var name;
  var location;
  var sdate;
  var edate;
  var stime;
  var etime;
  var currentlocation;
  var chapter;
  var bookid;
  var time1;
  var time2;
  var classtype;
  TBookNotificationPage({Key? key,
  this.name,
  this.location,
    this.bookid,
  this.chapter,
  this.currentlocation,
  this.edate,
  this.etime,
  this.sdate,
  this.stime,
    this.time1,
    this.classtype,
    this.time2}) : super(key: key);

  @override
  _TBookNotificationPageState createState() => _TBookNotificationPageState();
}

class _TBookNotificationPageState extends State<TBookNotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Booked Page",style: appbar,),
        backgroundColor: Color(0xff8E2DE2),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  elevation: 10,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                      bottomRight: Radius.circular(80),
                    ),
                    side: BorderSide(width: 3, color: Color(0xff8E2DE2)),
                  ),
                  child: Container(
                    height: 150,
                    width: 400,
                    //color: Colors.red,
                    child: Row(
                      children: [
                        Image.asset("assets/images/avatar.png",
                          height: 120,
                          width: 120,),
                        Padding(
                          padding: const EdgeInsets.all(40.0),
                          child: Container(
                            child: Column(
                              children: [
                                Text(widget.name,style: hmehead,),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(widget.location,style: course,),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: DottedBorder(
                  borderType: BorderType.RRect,
                  radius: Radius.circular(10),
                  dashPattern: [10,5,10,5,10,5],
                  color: Colors.lightBlueAccent,
                  strokeWidth: 3,
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.7,
                    width: 400,
                    //color: Colors.red,
                    child: Column(
                      children: [
                        SizedBox(height: 20,),
                        Text("Date",style: profile,),
                        SizedBox(height: 20,),
                        Text(widget.sdate),
                        SizedBox(height: 15,),
                        Text(widget.edate),
                        SizedBox(height: 20,),
                        Text("Time",style: profile,),
                        SizedBox(height: 20,),
                        Padding(
                          padding: const EdgeInsets.only(left: 155.0),
                          child: Row(children: [Text(widget.stime),SizedBox(width: 5,),Text(widget.time1),],),
                        ),
                        SizedBox(height: 15,),
                        Padding(
                          padding: const EdgeInsets.only(left: 155.0),
                          child: Row(children: [Text(widget.etime),SizedBox(width: 5,),Text(widget.time2),],),
                        ),
                        SizedBox(height: 20,),
                        Text("Class Type",style: profile,),
                        SizedBox(height: 20,),
                        Text(widget.classtype),
                        SizedBox(height: 20,),
                        Text("Location",style: profile,),
                        SizedBox(height: 20,),
                        Text(widget.currentlocation),
                        SizedBox(height: 20,),
                        Text("Chapter Details",style: profile,),
                        SizedBox(height: 20,),
                        Text(widget.chapter),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                height: 100,
                width: 400,
                //color: Colors.blue,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50.0),
                      child: GestureDetector(
                        onTap: (){
                          FirebaseFirestore.instance.collection('booking').doc(widget.bookid).update({
                            'book status': 2,

                          }).then((value) =>  showsnackbar("successfully  Accepted"));

                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          height: 40,
                          width: 100,
                          child: Center(child: Text("Accept",style: buynow,)),
                        ),
                      ),
                    ),
                    SizedBox(width: 40,),
                    GestureDetector(
                      onTap: (){
                        FirebaseFirestore.instance.collection('booking').doc(widget.bookid).update({
                          'book status': 0,

                        }).then((value) =>  showsnackbar("successfully  Rejected"));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        height: 40,
                        width: 100,
                        child: Center(child: Text("Reject",style: buynow,)),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  showsnackbar(var msg){
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(msg),
          backgroundColor: Colors.lightBlueAccent,
        )
    );
  }
}
