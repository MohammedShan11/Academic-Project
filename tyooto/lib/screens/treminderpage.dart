import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tyooto/common/textstyles.dart';

class TReminderPage extends StatefulWidget {
  var uid;
  TReminderPage({Key? key,
  this.uid}) : super(key: key);

  @override
  _TReminderPageState createState() => _TReminderPageState();
}

class _TReminderPageState extends State<TReminderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Reminder",style: appbar,),
        backgroundColor: Color(0xff8E2DE2),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance.collection('booking').where('uid', isEqualTo: widget.uid).where('book status', isEqualTo: 2).snapshots(),
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
                              subtitle: Row(
                                children: [
                                  Text(snapshot.data!.docs[index]['start time'],),
                                  SizedBox(width: 5,),
                                  Text(snapshot.data!.docs[index]['Am or Pm '],),
                                ],
                              ),
                              trailing: Icon(Icons.doorbell_sharp),
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
      ),
    );
  }
}
