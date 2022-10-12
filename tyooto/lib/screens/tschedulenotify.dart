import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tyooto/common/textstyles.dart';
import 'package:tyooto/screens/tshedulepage.dart';

class TeacherScheduleNotify extends StatefulWidget {
  const TeacherScheduleNotify({Key? key}) : super(key: key);

  @override
  _TeacherScheduleNotifyState createState() => _TeacherScheduleNotifyState();
}

class _TeacherScheduleNotifyState extends State<TeacherScheduleNotify> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Schedule Notification",style: appbar,),
        backgroundColor: Color(0xff8E2DE2),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance.collection('booking').where('book status', isEqualTo: 3).snapshots(),
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
                  return ListView.builder(
                      scrollDirection: Axis.vertical,
                    itemCount: snapshot.data!.docs.length,
                      itemBuilder:  (BuildContext context, int index){
                        return GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => TeacherSchedulePage(
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
                              title: Text( snapshot.data!.docs[index]['name'],),
                              subtitle: Text(snapshot.data!.docs[index]['current location'],),
                            ),
                          ),
                        );
                      }
                  );
                  }
                }
              ),
            ),
          ],
        ),
      ),
    );
  }
}
