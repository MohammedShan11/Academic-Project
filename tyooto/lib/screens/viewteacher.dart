import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tyooto/common/textstyles.dart';
import 'package:url_launcher/url_launcher.dart';


class TeacherView extends StatefulWidget {
  const TeacherView({Key? key}) : super(key: key);

  @override
  _TeacherViewState createState() => _TeacherViewState();
}

class _TeacherViewState extends State<TeacherView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text("Teachers",style: appbar,),
        backgroundColor: Color(0xff8E2DE2),
    ),
      body: Container(
        child : StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance.collection('teacher').where('status',isEqualTo: 1).snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData)
              {
                return Center(child: CircularProgressIndicator());
              }
              else if (snapshot.hasData && snapshot.data!.docs.length == 0)
              {
                return Center(child: Text("No Data Found"));
              }
              else {
                return ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: ( context,int index){
                      return Padding(
                        padding: const EdgeInsets.all(20),
                        child: Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 3,
                                blurRadius: 4,
                                offset: Offset(5, 7), // changes position of shadow
                              ),
                            ],
                            color: Colors.lightBlueAccent,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: GestureDetector(
                            onTap: (){
                              launch('tel:${snapshot.data!.docs[index]['phonenumber']}');
                            },
                            child: ListTile(
                              title: Text(snapshot.data!.docs[index]['name'],style: small,),
                              subtitle: Text(snapshot.data!.docs[index]['location'],style: small2,),
                              trailing: IconButton(onPressed: (){
                                FirebaseFirestore.instance.collection('teacher').doc(snapshot.data!.docs[index]['uid']).update({
                                  'status': 0,
                                });
                              }, icon: Icon(Icons.delete)),
                            ),
                          ),
                        ),
                      );
                    }
                );
              }
            }
        ),
      ),
    );
  }
}
