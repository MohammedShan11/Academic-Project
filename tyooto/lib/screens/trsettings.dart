import 'package:flutter/material.dart';
import 'package:tyooto/common/textstyles.dart';
import 'package:tyooto/screens/teditprofile.dart';

class TeacherSettingsPage extends StatefulWidget {
  var name;
  var qualification;
  var exp;
  var location;
  var payment;
  var phonenumber;
  var uid;
  TeacherSettingsPage({Key? key,
  this.name,
  this.qualification,
  this.exp,
  this.location,
  this.payment,
  this.phonenumber,
  this.uid}) : super(key: key);

  @override
  _TeacherSettingsPageState createState() => _TeacherSettingsPageState();
}

class _TeacherSettingsPageState extends State<TeacherSettingsPage> {
  var data = [
    'Edit Profile',
  ];
  var icons = [
    Icons.settings,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings',style: appbar,),
        backgroundColor: Color(0xff8E2DE2),
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
                  itemCount: data.length,
                  itemBuilder: ( context,int index){
                    return GestureDetector(
                      onTap: (){
                        if (index == 0){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>TeacherEditProfilePage(
                            name: widget.name,
                            qualification: widget.qualification,
                            exp: widget.exp,
                            location: widget.location,
                            payment: widget.payment,
                            phonenumber: widget.phonenumber,
                            uid: widget.uid,
                          )));
                        }
                      },
                        child: Container(
                          height: 80,
                          width: 80,
                          color: Colors.lightBlueAccent,
                          child: Center(
                            child: Text(data[index],style: small,),
                          ),
                        )
                    );
                  }
          ),
          ),
        ],
      ),
    );
  }
}
