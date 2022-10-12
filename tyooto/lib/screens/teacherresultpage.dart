import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tyooto/common/textstyles.dart';
import 'package:tyooto/screens/teacherdetail.dart';

class TeacherResultPage extends StatefulWidget {
  var subject;
  TeacherResultPage({Key? key,this.subject}) : super(key: key);

  @override
  _TeacherResultPageState createState() => _TeacherResultPageState();
}

class _TeacherResultPageState extends State<TeacherResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.88,
              child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('teacher')
                      .where('status', isEqualTo: 1)
                  .where('subject', isEqualTo: widget.subject)
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasData &&
                        snapshot.data!.docs.length == 0) {
                      return Center(child: Text("No Data Found"));
                    } else {
                      return ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: ( context, int index) {
                          return GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => TeacherDetail(
                                name:snapshot.data!.docs[index]['name'] ,
                                subject: snapshot.data!.docs[index]['subject'],
                                qualification: snapshot.data!.docs[index]['qualification'],
                                experience: snapshot.data!.docs[index]['experience'],
                                email: snapshot.data!.docs[index]['email'],
                                location: snapshot.data!.docs[index]['location'],
                                hypayment: snapshot.data!.docs[index]['hpayment'],
                              )));
                            },
                            child: new Card(
                              elevation: 2,
                              child:  ListTile(
                                leading: const Icon(Icons.person),
                                title:  Text(snapshot.data!.docs[index]['name'],),
                                subtitle: Text(snapshot.data!.docs[index]['subject'],),
                              ),
                            ),
                          );
                        },
                      );
                    }
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
/*
  title: const Text('Tutors'),
              trailing: Icon(Icons.person_outline),
              onTap: () {
                // Update the state of the app.
                // ...
              },
 */
