import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tyooto/common/decoration.dart';
import 'package:tyooto/common/textstyles.dart';
import 'package:tyooto/screens/login.dart';
import 'package:tyooto/screens/taboutpage.dart';
import 'package:tyooto/screens/teachernotification.dart';
import 'package:tyooto/screens/teacherprofilepage.dart';
import 'package:tyooto/screens/treminderpage.dart';
import 'package:tyooto/screens/trsettings.dart';
import 'package:tyooto/screens/tschedulenotify.dart';
import 'package:tyooto/screens/tshedulepage.dart';
import 'package:tyooto/screens/uploadpage.dart';

class TeacherHomePage extends StatefulWidget {
  var name;
  var location;
  var subject;
  var uid;
  var email;
  var hpayment;
  var exp;
  var qualification;
  var phnumber;
  TeacherHomePage(
      {Key? key,
      this.location,
      this.name,
        this.hpayment,
        this.uid,
        this.email,
        this.qualification,
        this.phnumber,
        this.exp,
      this.subject,})
      : super(key: key);

  @override
  _TeacherHomePageState createState() => _TeacherHomePageState();
}

class _TeacherHomePageState extends State<TeacherHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            Container(
              child: Container(
                width: double.infinity,
                height: 350.0,
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        child: Image.asset(
                          "assets/images/avatar.png",
                          height: 120,
                          width: 120,
                        ),
                      ),
                      Text(widget.name,style: profile,),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Column(
                  children: [
                    ListTile(
                        title: const Text('Profile'),
                        trailing: Icon(Icons.person),
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => TeacherProfilePage(
                            name: widget.name,
                            location: widget.location,
                            phonenumber: widget.phnumber,
                            email: widget.email,
                            subject: widget.subject,
                            uid: widget.uid,
                            qualification: widget.qualification,
                            payment: widget.hpayment,
                            experience: widget.exp,
                          )));
                        }
                        ),
                    ListTile(
                      title: const Text('Schedule'),
                      trailing: Icon(Icons.watch_later),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => TeacherScheduleNotify()));
                        // Update the state of the app.
                        // ...
                      },
                    ),
                    ListTile(
                      title: const Text('Reminder'),
                      trailing: Icon(Icons.doorbell_rounded),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => TReminderPage(
                          uid: widget.uid,
                        )));
                        // Update the state of the app.
                        // ...
                      },
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        right: 30,
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.blueGrey)),
                        child: Column(
                          children: [
                            ListTile(
                              title: const Text('Settings'),
                              trailing: Icon(Icons.settings),
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => TeacherSettingsPage(
                                  name: widget.name,
                                  qualification: widget.qualification,
                                  exp: widget.exp,
                                  location: widget.location,
                                  payment: widget.hpayment,
                                  phonenumber: widget.phnumber,
                                  uid: widget.uid,
                                )));
                                // Update the state of the app.
                                // ...
                              },
                            ),
                            ListTile(
                              title: const Text('About'),
                              trailing: Icon(Icons.account_box_outlined),
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => TAboutPage(
                                  name: widget.name,
                                  uid: widget.uid,
                                  location: widget.location,
                                  subject: widget.subject,
                                  phonenumber: widget.phnumber,
                                  email: widget.email,
                                )));
                                // Update the state of the app.
                                // ...
                              },
                            ),
                            ListTile(
                              title: const Text('Logout'),
                              trailing: Icon(Icons.logout),
                              onTap: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => LoginPage()));
                                // Update the state of the app.
                                // ...
                              },
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        elevation: 0.0,
        title: Center(
          child: const Text(
            "Home",
            style: appbar,
          ),
        ),
        backgroundColor: Color(0xff8E2DE2),
        actions: <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => TeacherNotification(
                    name: widget.name,
                    uid: widget.uid,
                  )));
                },
                child: const Icon(
                  Icons.notifications_none,
                  size: 26.0,
                ),
              )),
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => UploadPage(
                        uid: widget.uid,
                        name: widget.name,
                        location: widget.location,
                        phnumber: widget.phnumber,
                        email: widget.email,
                        subject: widget.subject,
                        hpayment: widget.hpayment,
                        exp: widget.exp,
                        qualification: widget.qualification,
                      )));
                },
                child: const Icon(
                  Icons.add,
                  size: 26.0,
                ),
              )),
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(50),
                      bottomLeft: Radius.circular(50)),
                  color: Color(0xff8E2DE2),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.8),
                      spreadRadius: 3,
                      blurRadius: 5,
                      offset: Offset(2, 7), // changes position of shadow
                    ),
                  ],
                ),
                height: 150,
                width: MediaQuery.of(context).size.width,
                child: Image.asset(
                  'assets/images/teach.gif',
                  height: 100,
                  width: 100,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 30, right: 30, bottom: 10, top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:  [
                    Text(
                      "Subscribed Students",
                      style: hmehead,
                    ),
                  ],
                ),
              ),
              Container(
                  height: MediaQuery.of(context).size.height * 0.7,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xff00F2FE),
                        Color(0xff8E2DE2),
                      ],
                    ),
                  ),
                 child: StreamBuilder<QuerySnapshot>(
                   stream: FirebaseFirestore.instance.collection('booking').where('uid', isEqualTo :widget.uid).where('book status', isEqualTo :2).limit(8).snapshots(),
                   builder: (context, snapshot) {
                     if(!snapshot.hasData){
                       return Center(child: CircularProgressIndicator());
                     } else if(snapshot.hasData && snapshot.data!.docs.length == 0){
                       return Center(child:
                       Image.asset(
                         'assets/images/find.gif',
                         height: 100,
                         width: 100,
                       ),
                       );
                     }else {
                     return ListView.builder(
                                  scrollDirection: Axis.vertical,
                                  itemCount:  snapshot.data!.docs.length,
                                  itemBuilder: (context, int index) {
                                    return  Card(
                                      elevation: 10,
                                      child: ListTile(
                                        trailing: Icon(CupertinoIcons.person_alt_circle),
                                      title: Text(snapshot.data!.docs[index]['student name'],),
                                      subtitle: Text(snapshot.data!.docs[index]['location'],),
                                      ),
                                    );
                                  });
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
