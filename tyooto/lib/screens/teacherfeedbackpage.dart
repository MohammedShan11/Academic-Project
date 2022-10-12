import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tyooto/common/textstyles.dart';

class TeacherFeedbackPage extends StatefulWidget {
  var uid;
  TeacherFeedbackPage({Key? key,
  this.uid}) : super(key: key);

  @override
  _TeacherFeedbackPageState createState() => _TeacherFeedbackPageState();
}

class _TeacherFeedbackPageState extends State<TeacherFeedbackPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FeedBack",style: appbar,),
        backgroundColor: Color(0xff8E2DE2),
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance.collection('feedback').where('teacher uid', isEqualTo: widget.uid).snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasData &&
                    snapshot.data!.docs.length == 0) {
                  return Center(child: Text("No Data Found"));
                } else {
                return ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount:  snapshot.data!.docs.length,
                  itemBuilder: (BuildContext context, int index){
                    return Card(
                      elevation: 10,
                      child: ListTile(
                        title: Text(snapshot.data!.docs[index]['student name'],),
                        subtitle: Text(snapshot.data!.docs[index]['feedback']),
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
    );
  }
}
