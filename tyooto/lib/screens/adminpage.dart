import 'package:flutter/material.dart';
import 'package:tyooto/common/textstyles.dart';
import 'package:tyooto/screens/TeacherFeedbackPage.dart';
import 'package:tyooto/screens/studentfeedback.dart';
import 'package:tyooto/screens/viewstudents.dart';
import 'package:tyooto/screens/viewteacher.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({Key? key}) : super(key: key);

  @override
  _AdminPageState createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {

  var data = [
    'Students','Teachers','Teacher Feedback','Student FeedBack',
  ];
  var icons = [
    Icons.school,Icons.book,Icons.note_add,Icons.note_add,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Admin Page",style: appbar,)),
        backgroundColor: Color(0xff8E2DE2),
        automaticallyImplyLeading: false,
        actions: [
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(
                  Icons.logout,
                  size: 26.0,
                ),
              )),
        ],
      ),
      body: SafeArea(
        child: Container(
          child: ListTile(
            title: ListView.builder(
                itemCount: data.length,
                itemBuilder: ( context,int index){
                return Padding(
                  padding: const EdgeInsets.all(30),
                  child: GestureDetector(
                    onTap: (){
                      if (index == 0) {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>StudentView()));
                      }
                      else if (index == 1){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>TeacherView()));
                      }
                      else if(index == 2){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => TeacherFeedbackPage()));
                      }
                      else if(index == 3){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => StudentFeedbackPage()));
                      }
                    },
                    child: Container(
                      height: 80,
                      width: 80,
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
                        borderRadius: BorderRadius.circular(20)
                      ),
                        child: Center(
                            child: Text(data[index],style: small,),
                        ),
                    ),
                  ),
                );
                }
                ),
          )
        ),
      ),
    );
  }
}
