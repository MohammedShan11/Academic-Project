import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tyooto/common/textstyles.dart';
import 'package:tyooto/screens/tboooknotificationpage.dart';

class TeacherNotification extends StatefulWidget {
  var name;
  var uid;
  TeacherNotification({Key? key,
  this.name,
  this.uid}) : super(key: key);

  @override
  _TeacherNotificationState createState() => _TeacherNotificationState();
}

class _TeacherNotificationState extends State<TeacherNotification> {
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
                stream: FirebaseFirestore.instance.collection('booking').where('uid', isEqualTo: widget.uid).where('book status', isEqualTo: 1).snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasData &&
                      snapshot.data!.docs.length == 0) {
                    return Center(child:
                    Image.asset(
                      'assets/images/no data.gif',
                      height: 300,
                      width: 300,
                    ),
                    );
                  } else {
                  return Card(
                    elevation: 10,
                    child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount:  snapshot.data!.docs.length,
                        itemBuilder: (BuildContext context, int index){
                          return GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => TBookNotificationPage(
                                name: snapshot.data!.docs[index]['student name'],
                                location: snapshot.data!.docs[index]['location'],
                                sdate: snapshot.data!.docs[index]['start date'],
                                edate: snapshot.data!.docs[index]['last date'],
                                stime: snapshot.data!.docs[index]['start time'],
                                etime: snapshot.data!.docs[index]['end time'],
                                currentlocation: snapshot.data!.docs[index]['current location'],
                                chapter: snapshot.data!.docs[index]['chapter details'],
                                bookid:  snapshot.data!.docs[index]['book_id'],
                                classtype: snapshot.data!.docs[index]['class type'],
                                time1: snapshot.data!.docs[index]['Am or Pm '],
                                time2: snapshot.data!.docs[index]['Pm or Am'],
                              )));
                            },
                            child: Card(
                              elevation: 10,
                              child: ListTile(
                                title: Text(snapshot.data!.docs[index]['student name'] ,),
                                subtitle: Text(snapshot.data!.docs[index]['student location'] ,),
                              ),
                            ),
                          );
                        }
                    ),
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
