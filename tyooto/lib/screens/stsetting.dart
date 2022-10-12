import 'package:flutter/material.dart';
import 'package:tyooto/common/textstyles.dart';
import 'package:tyooto/screens/seditprofile.dart';

class StudentSettingsPage extends StatefulWidget {
  var name;
  var location;
  var uid;
  var phonenumber;
  StudentSettingsPage({Key? key,
  this.name,
  this.location,
  this.uid,
  this.phonenumber,}) : super(key: key);

  @override
  _StudentSettingsPageState createState() => _StudentSettingsPageState();
}

class _StudentSettingsPageState extends State<StudentSettingsPage> {
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
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>StudentEditProfilePage(
                          uid: widget.uid,
                          name: widget.name,
                          phonenumber: widget.phonenumber,
                          location: widget.location,
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
