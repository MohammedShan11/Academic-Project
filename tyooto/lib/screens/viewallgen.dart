import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tyooto/common/textstyles.dart';
import 'package:tyooto/screens/teacherdetail.dart';

class ViewAllPageGen extends StatefulWidget {

  var sname;
  var semail;
  var slocation;
  var sphonenumber;
  var suid;
   ViewAllPageGen({Key? key,
     this.sname,
     this.semail,
     this.slocation,
     this.sphonenumber,
     this.suid}) : super(key: key);

  @override
  _ViewAllPageGenState createState() => _ViewAllPageGenState();
}

class _ViewAllPageGenState extends State<ViewAllPageGen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "General Teachers",
          style: appbar,
        ),
        backgroundColor: Color(0xff8E2DE2),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xff00F2FE),
              Color(0xff8E2DE2),
            ],
          ),
        ),
        child: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection('teacher')
                .where('pstatus', isEqualTo: 2)
                .snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasData && snapshot.data!.docs.length == 0) {
                return Center(child: Text("No Data Found"));
              } else {
                return ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(8),
                        child: GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => TeacherDetail(
                              name:snapshot.data!.docs[index]['name'] ,
                              subject: snapshot.data!.docs[index]['subject'],
                              qualification: snapshot.data!.docs[index]['qualification'],
                              experience: snapshot.data!.docs[index]['experience'],
                              email: snapshot.data!.docs[index]['email'],
                              location: snapshot.data!.docs[index]['location'],
                              hypayment: snapshot.data!.docs[index]['hpayment'],
                              sname: widget.sname,
                              semail: widget.semail,
                              slocation: widget.slocation,
                              sphonenumber: widget.sphonenumber,
                              suid: widget.suid,
                            )));
                          },
                          child: Card(
                            elevation: 10,
                            child: Container(
                              height: 90,
                              child: Stack(
                                children: [
                                  Positioned(
                                    top: 15,
                                    left: 10,
                                    child: Image.asset("assets/images/avatar.png",height: 50,width: 50,),
                                  ),
                                  Positioned(
                                    top: 20,
                                    left: 100,
                                    child: Text(
                                      snapshot.data!.docs[index]['name'],style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      color: Colors.blue,
                                    ),
                                    ),
                                  ),
                                  Positioned(
                                    top: 50,
                                    left: 95,
                                    child: Text(
                                      snapshot.data!.docs[index]['subject'],style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                    ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    });
              }
            }),
      ),
    );
  }
}
