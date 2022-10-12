import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tyooto/common/textstyles.dart';
import 'package:tyooto/screens/sbooknotificationpage.dart';

class StudentNotification extends StatefulWidget {
  var name;
  var suid;
  StudentNotification({Key? key,
  this.name,
  this.suid}) : super(key: key);

  

  @override
  _StudentNotificationState createState() => _StudentNotificationState();
}

class _StudentNotificationState extends State<StudentNotification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notification",style: appbar,),
        backgroundColor: Color(0xff8E2DE2),
      ),
      body: Column(
        children: [
          SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.8851,
              width: MediaQuery.of(context).size.width,
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance.collection('booking').where('student uid', isEqualTo: widget.suid).snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasData && snapshot.data!.docs.length == 0) {
                    return Center(child: Image.asset('assets/images/no data.gif',
                      height: 300,
                      width: 300,),);
                  } else {
                    return ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) =>
                                      SBookNotificationPage(
                                        name: snapshot.data!
                                            .docs[index]['name'],
                                        sdate: snapshot.data!
                                            .docs[index]['start date'],
                                        edate: snapshot.data!
                                            .docs[index]['last date'],
                                        stime: snapshot.data!
                                            .docs[index]['start time'],
                                        etime: snapshot.data!
                                            .docs[index]['end time'],
                                        location: snapshot.data!
                                            .docs[index]['student location'],
                                        chapter: snapshot.data!
                                            .docs[index]['chapter details'],
                                        status: snapshot.data!
                                            .docs[index]['book status'],
                                        classtype: snapshot.data!
                                            .docs[index]['class type'],
                                        time1: snapshot.data!
                                            .docs[index]['Am or Pm '],
                                        time2: snapshot.data!
                                            .docs[index]['Pm or Am'],
                                      )));
                            },
                            child: Card(
                              elevation: 10,
                              child: ListTile(
                                title: Text(
                                  snapshot.data!.docs[index]['name'],),
                                subtitle: snapshot.data!
                                    .docs[index]['book status'] == 2
                                    ? Text("Accepted",
                                    style: TextStyle(color: Colors.teal))
                                    : snapshot.data!
                                    .docs[index]['book status'] == 0 ? Text(
                                    "Rejected",
                                    style: TextStyle(color: Colors.red)) : Text(
                                    "pending",
                                    style: TextStyle(color: Colors.yellow)),
                              ),
                            ),
                          );
                        }
                    );
                  }
                }
              ),
            ),
          ),
        ],
      ),
    );
  }
}
