import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tyooto/common/decoration.dart';
import 'package:tyooto/common/textstyles.dart';
import 'package:tyooto/screens/aboutpage.dart';
import 'package:tyooto/screens/example.dart';
import 'package:tyooto/screens/login.dart';
import 'package:tyooto/screens/schedulepage.dart';
import 'package:tyooto/screens/stsetting.dart';
import 'package:tyooto/screens/studentnotification.dart';
import 'package:tyooto/screens/studentprofilepage.dart';
import 'package:tyooto/screens/subtutorpage.dart';
import 'package:tyooto/screens/teacherdetail.dart';
import 'package:tyooto/screens/teacherresultpage.dart';
import 'package:tyooto/screens/teachersearchpage.dart';
import 'package:tyooto/screens/viewall.dart';
import 'package:tyooto/screens/viewallgen.dart';

class HomePage extends StatefulWidget {
  var suid;
  var semail;
  var sphonenumber;
  var sname;
  var slocation;
  HomePage(
      {Key? key,
      this.suid,
      this.semail,
      this.sphonenumber,
      this.sname,
      this.slocation})
      : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var searchController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            Container(
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
                        scale: 1,
                      ),
                    ),
                    Text(widget.sname,style: profile,),
                  ],
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
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => StudentProfilePage(
                                  name:  widget.sname,
                                  location: widget.slocation,
                                  email: widget.semail,
                                  phonenumber: widget.sphonenumber,
                                  uid: widget.suid,
                                )));
                        // Update the state of the app.
                        // ...
                      },
                    ),
                    ListTile(
                      title: const Text('Tutors'),
                      trailing: Icon(Icons.person_outline),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => SubTutorPage()));
                        // Update the state of the app.
                        // ...
                      },
                    ),
                    ListTile(
                      title: const Text('Rescedule'),
                      trailing: Icon(Icons.timelapse),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => ReShedulePage(
                          suid: widget.suid,
                        )));
                        // Update the state of the app.
                        // ...
                      },
                    ),
                    SizedBox(height: 50,),
                    Padding(
                      padding: const EdgeInsets.only(right: 30,),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.blueGrey)
                        ),
                        child: Column(
                          children: [
                            ListTile(
                              title: const Text('Settings'),
                              trailing: Icon(Icons.settings),
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => StudentSettingsPage(
                                  uid: widget.suid,
                                  name: widget.sname,
                                  location: widget.slocation,
                                  phonenumber: widget.sphonenumber,
                                )));
                                // Update the state of the app.
                                // ...
                              },
                            ),
                            ListTile(
                              title: const Text('About'),
                              trailing: Icon(Icons.account_box_outlined),
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => AboutPage(
                                  name: widget.sname,
                                  email: widget.semail,
                                  phonenumber: widget.sphonenumber,
                                  uid: widget.suid,
                                  location: widget.slocation,
                                )));
                                // Update the state of the app.
                                // ...
                              },
                            ),
                            ListTile(
                              title: const Text('Logout'),
                              trailing: Icon(Icons.logout),
                              onTap: () {
                                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
                                // Update the state of the app.
                                // ...
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        elevation: 0.0,
        title: const Text(
          "Home",
          style: appbar,
        ),
        centerTitle: true,
        backgroundColor: Color(0xff8E2DE2),
        actions: <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => StudentNotification(
                    suid: widget.suid,
                  )));
                },
                child: const Icon(
                  Icons.notifications_none,
                  size: 26.0,
                ),
              )),
          /*Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ExamplePage()));
                },
                child: const Icon(
                  Icons.add,
                  size: 26.0,
                ),
              )),*/
        ],
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.8),
                      spreadRadius: 3,
                      blurRadius: 5,
                      offset: Offset(2, 7), // changes position of shadow
                    ),
                  ],
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(50),
                        bottomLeft: Radius.circular(50)),
                  color: Color(0xff8E2DE2),

        ),
                height: 150,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width * 0.80,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black87.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 3,
                              offset: Offset(2, 7), // changes position of shadow
                            ),
                          ],
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white),
                      child: GestureDetector(
                        onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => TeacherSearchPage()));
                        },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: const [
                              CircleAvatar(
                                  radius: 20,
                                  backgroundColor: Colors.lightBlueAccent,
                                  child: Icon(
                                    Icons.person,
                                    color: Colors.white,
                                  )),
                              Text("Search for Teachers"),
                              Icon(Icons.search),
                            ],
                          ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 30, right: 30, bottom: 10, top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:  [
                    Text(
                      "Popular Teachers",
                      style: hmehead,
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => ViewAllPagePop(
                          sname: widget.sname,
                          semail: widget.semail,
                          slocation: widget.slocation,
                          sphonenumber: widget.sphonenumber,
                          suid: widget.suid,
                        )));
                      },
                    child : Text(
                      "View All",
                      style: TextStyle(
                          color: Colors.lightBlueAccent,
                          fontSize: 16,
                          fontWeight: FontWeight.w700),
                    ),
                    ),
                  ],
                ),
              ),
              Container(
                  height: 260,
                  child: StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection('teacher')
                          .where('pstatus', isEqualTo: 1).limit(4)
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return Center(child: CircularProgressIndicator());
                        } else if (snapshot.hasData &&
                            snapshot.data!.docs.length == 0) {
                          return Center(child: Text("No Data Found"));
                        } else {
                          return ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount:  snapshot.data!.docs.length,
                              itemBuilder: (context, int index) {
                                return Padding(
                                  padding:
                                      const EdgeInsets.only(left: 30, top: 10,bottom: 20,),
                                  child: Container(
                                    height: 230,
                                    width: 180,
                                    child: Stack(
                                      children: [
                                        Positioned(
                                          bottom: 0,
                                          child: Container(
                                            decoration: containerdec,
                                            height: 200,
                                            width: 180,
                                          ),
                                        ),
                                        Positioned(
                                            top: -25,
                                            left: -50,
                                            right: 50,
                                            child: Image.asset(
                                              'assets/images/avatar.png',
                                              scale: 3,
                                            )),
                                        Positioned(
                                          bottom: 150,
                                          left: 80,
                                          right: 50,
                                          child: Text(
                                            snapshot.data!.docs[index]['name'],
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 18,
                                                fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          bottom: 100,
                                          left: 10,
                                          right: 50,
                                          child: Text(
                                            snapshot.data!.docs[index]['subject'],
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 15,
                                                fontWeight: FontWeight.w700
                                            ),
                                          ),
                                        ),
                                        const Positioned(
                                          bottom: 75,
                                          left: 10,
                                          right: 50,
                                          child: Text(
                                            "Rating",
                                            style: TextStyle(
                                                color: Colors.white70,
                                                fontSize: 12),
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.bottomCenter,
                                            child: GestureDetector(
                                              onTap: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) => TeacherDetail(
                                                          name:snapshot.data!.docs[index]['name'] ,
                                                          subject: snapshot.data!.docs[index]['subject'],
                                                          qualification: snapshot.data!.docs[index]['qualification'],
                                                          experience: snapshot.data!.docs[index]['experience'],
                                                          email: snapshot.data!.docs[index]['email'],
                                                          location: snapshot.data!.docs[index]['location'],
                                                          hypayment: snapshot.data!.docs[index]['hpayment'],
                                                          uid: snapshot.data!.docs[index]['uid'],
                                                          phonenumber: snapshot.data!.docs[index]['phonenumber'],
                                                          suid: widget.suid,
                                                          semail: widget.semail,
                                                          slocation: widget.slocation,
                                                          sphonenumber: widget.sphonenumber,
                                                          sname: widget.sname,
                                                        )));
                                              },
                                          child: Container(
                                            height: 40,
                                            width: 180,
                                            decoration: const BoxDecoration(
                                                color: Colors.lightBlueAccent,
                                                borderRadius: BorderRadius.only(
                                                    bottomRight:
                                                        Radius.circular(20),
                                                    bottomLeft:
                                                        Radius.circular(20))),
                                            child: const Center(
                                              child: Text(
                                                "View",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 18,
                                                    fontWeight:FontWeight.w700,
                                                ),
                                              ),
                                            ),
                                          ),
                                        )
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              });
                        }
                      })),
              Padding(
                padding: const EdgeInsets.only(
                    left: 30, right: 30, bottom: 10, top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "General Teachers",
                      style: hmehead,
                    ),
                    GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => ViewAllPageGen(
                            sname: widget.sname,
                            semail: widget.semail,
                            slocation: widget.slocation,
                            sphonenumber: widget.sphonenumber,
                            suid: widget.suid,
                          )));
                        },
                    child : Text(
                      "View All",
                      style: TextStyle(
                          color: Colors.lightBlueAccent,
                          fontSize: 16,
                          fontWeight: FontWeight.w700),
                    ),
              ),
                  ],
                ),
              ),
              Container(
                  height: 230,
                  child: StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
        .collection('teacher')
        .where('pstatus', isEqualTo: 2).limit(4)
        .snapshots(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasData &&
                          snapshot.data!.docs.length == 0) {
                        return Center(child: Text("No Data Found"));
                      } else {
                        return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (context, int index) {
                            return Padding(
                              padding: const EdgeInsets.only(
                                  left: 30, top: 10, bottom: 20),
                              child: Container(
                                height: 140,
                                width: 230,
                                child: Stack(
                                  children: [
                                    Positioned(
                                      bottom: 0,
                                      child: Container(
                                        decoration: containergen,
                                        height: 170,
                                        width: 230,
                                      ),
                                    ),
                                    Positioned(
                                        top: -60,
                                        left: -80,
                                        right: 80,
                                        child: Image.asset(
                                          'assets/images/avatar.png',
                                          scale: 4,
                                        )),
                                    Positioned(
                                      bottom: 130,
                                      left: 70,
                                      right: 50,
                                      child: Text(
                                        snapshot.data!.docs[index]['name'],
                                        style: const TextStyle(
                                            color: Colors.white, fontSize: 18, fontWeight: FontWeight.w700,),
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 90,
                                      left: 10,
                                      child: Text(
                                        snapshot.data!.docs[index]['subject'],
                                        style: const TextStyle(
                                            color: Colors.white, fontSize: 15, fontWeight: FontWeight.w700,),
                                      ),
                                    ),
                                   const Positioned(
                                      bottom: 60,
                                      left: 10,
                                      child: Text(
                                        "Rating",
                                        style:  TextStyle(
                                            color: Colors.white70, fontSize: 12),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.bottomCenter,
                                        child: GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) => TeacherDetail(
                                                      name:snapshot.data!.docs[index]['name'] ,
                                                      subject: snapshot.data!.docs[index]['subject'],
                                                      qualification: snapshot.data!.docs[index]['qualification'],
                                                      experience: snapshot.data!.docs[index]['experience'],
                                                      email: snapshot.data!.docs[index]['email'],
                                                      location: snapshot.data!.docs[index]['location'],
                                                      hypayment: snapshot.data!.docs[index]['hpayment'],
                                                      uid: snapshot.data!.docs[index]['uid'],
                                                      phonenumber: snapshot.data!.docs[index]['phonenumber'],
                                                      suid: widget.suid,
                                                      semail: widget.semail,
                                                      slocation: widget.slocation,
                                                      sphonenumber: widget.sphonenumber,
                                                      sname: widget.sname,
                                                    )));
                                          },
                                      child: Container(
                                        height: 40,
                                        width: 230,
                                        decoration: const BoxDecoration(
                                            color: Colors.lightBlueAccent,
                                            borderRadius: BorderRadius.only(
                                                bottomRight: Radius.circular(20),
                                                bottomLeft: Radius.circular(20))),
                                        child: const Center(
                                            child : Text(
                                            "View",
                                            style: TextStyle(
                                                color: Colors.white, fontSize: 18, fontWeight:FontWeight.w700,),
                                          ),
                                        ),
                                      ),
                                    )
                                    ),
                                  ],
                                ),
                              ),
                            );
                          });
                      }
                    }
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
