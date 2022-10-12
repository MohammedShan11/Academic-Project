import 'package:flutter/material.dart';
import 'package:tyooto/common/textstyles.dart';

class TeacherProfilePage extends StatefulWidget {
  var uid;
  var name;
  var subject;
  var experience;
  var payment;
  var phonenumber;
  var location;
  var email;
  var qualification;
  TeacherProfilePage({Key? key,
    this.uid,
    this.subject,
    this.experience,
    this.payment,
    this.phonenumber,
    this.location,
    this.email,
    this.name,
    this.qualification}) : super(key: key);

  @override
  _TeacherProfilePageState createState() => _TeacherProfilePageState();
}

class _TeacherProfilePageState extends State<TeacherProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile",style: appbar,),
        backgroundColor: Color(0xff8E2DE2),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Card(
              elevation: 10,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10),
                  bottomRight: Radius.circular(80),
                ),
                side: BorderSide(width: 3, color: Color(0xff8E2DE2)),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top : 30),
                    child: Center(
                      child: Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        child: Image.asset("assets/images/avatar.png",height: 150,width: 150,),
                      ),
                    ),
                  ),
                  Text(widget.name,style: profile,),
                  Text(widget.subject,style: profile,),
                  Text(widget.qualification,style: profile,),
                  Text(widget.experience,style: profile,),
                  Text(widget.location,style: profile,),
                  Text(widget.email,style: profile,),
                  Text(widget.payment,style: profile,),
                  Text(widget.phonenumber,style: profile,),
                  SizedBox(height: 20,)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
