import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tyooto/common/textstyles.dart';
import 'package:url_launcher/url_launcher.dart';

class SubTutorPage extends StatefulWidget {

  var suid;
  SubTutorPage({Key? key,
  this.suid}) : super(key: key);

  @override
  _SubTutorPageState createState() => _SubTutorPageState();
}

class _SubTutorPageState extends State<SubTutorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tutors",style: appbar,),
        backgroundColor: Color(0xff8E2DE2),
      ),
      body: Column(
        children: [
          SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.8851,
              width: MediaQuery.of(context).size.width,
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance.collection('booking').where('student uid', isEqualTo :widget.suid).where('book status', isEqualTo :2).snapshots(),
                builder: (context, snapshot) {
                  if(!snapshot.hasData){
                    return Center(child: CircularProgressIndicator());
                  } else if(snapshot.hasData && snapshot.data!.docs.length == 0){
                    return Center(child:
                    Image.asset(
                      'assets/images/no data.gif',
                      height: 300,
                      width: 300,
                    ),
                    );
                  }else {
                  return ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount:  snapshot.data!.docs.length,
                      itemBuilder: (BuildContext context, int index){
                        return Card(
                          elevation: 10,
                          child: ListTile(
                            trailing: GestureDetector(
                              onTap: (){
                                launch('tel:${snapshot.data!.docs[index]['phonenumber']}');
                              },
                                child: Icon(CupertinoIcons.phone_solid)
                            ),
                            title: Text(snapshot.data!.docs[index]['name'],),
                            subtitle: Text(snapshot.data!.docs[index]['subject'],),
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

