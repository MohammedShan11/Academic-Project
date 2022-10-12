import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tyooto/common/decoration.dart';
import 'package:tyooto/common/textstyles.dart';
import 'package:tyooto/common/validate.dart';
import 'package:tyooto/screens/bookingpage.dart';
import 'package:tyooto/screens/teacherfeedbackpage.dart';
import 'package:url_launcher/url_launcher.dart';

class TeacherDetail extends StatefulWidget {
  var name;
  var subject;
  var email;
  var location;
  var qualification;
  var hypayment;
  var experience;
  var phonenumber;
  var uid;
  var suid;
  var semail;
  var slocation;
  var sphonenumber;
  var sname;
  TeacherDetail(
      {Key? key,
      this.name,
      this.subject,
      this.email,
      this.location,
      this.qualification,
      this.phonenumber,
      this.experience,
      this.hypayment,
      this.uid,
      this.suid,
      this.semail,
      this.slocation,
      this.sphonenumber,
      this.sname}) : super(key: key);

  @override
  _TeacherDetailState createState() => _TeacherDetailState();
}

class _TeacherDetailState extends State<TeacherDetail> {

  var feedbackController = new TextEditingController();
  var feedbackkey = GlobalKey<FormState>();
  var feedback_id;

  @override
  void initState() {
    feedback_id=DateTime.now().toString();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 8,
        title: const Text(
          "Profile",
          style: appbar,
        ),
        backgroundColor: Color(0xff8E2DE2),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height *1.6,
          width: MediaQuery.of(context).size.width,
          child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                    padding: const EdgeInsets.all(10),
                    child: Container(
                      height: 220,
                      width: MediaQuery.of(context).size.width,
                      child: Card(
                        elevation: 10,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(10),
                            topRight: Radius.circular(80),
                          ),
                          side: BorderSide(width: 3, color: Color(0xff8E2DE2)),
                        ),
                        child: Row(
                          children: [
                            Container(
                              child: Image.asset(
                                'assets/images/avatar.png',
                                height: 130,
                                width: 130,
                              ),
                            ),
                            Container(
                              width: 200,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                   Text(
                                   widget.name,
                                    style: hmehead,
                                  ),
                                   Text(
                                    widget.subject,
                                    style: course,
                                  ),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 18.0),
                                    child: Row(
                                      //mainAxisAlignment:
                                          ///MainAxisAlignment.spaceBetween,
                                      children: [
                                        GestureDetector(
                                          onTap: (){
                                            launch('whatsapp://send?phone=+91+${widget.phonenumber}');
                                            //_launchwatsup();
                                          },
                                          child: Container(
                                            decoration: container2,
                                            height: 50,
                                            width: 50,
                                            child: Icon(Icons.message),
                                          ),
                                        ),
                                        SizedBox(width: 5,),
                                        GestureDetector(
                                          onTap: (){
                                            launch('tel:${widget.phonenumber}');
                                          },
                                          child: Container(
                                            decoration: container2,
                                            height: 50,
                                            width: 50,
                                            child: Icon(Icons.call),
                                          ),
                                        ),
                                       /* SizedBox(width: 5,),
                                        GestureDetector(
                                          onTap: (){
                                            showsnackbar("Added to Favourite");
                                          },
                                          child: Container(
                                            decoration: container2,
                                            height: 50,
                                            width: 50,
                                            child: Icon(Icons.favorite,color: Colors.red,),
                                          ),
                                        ),
                                        */
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    )),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children : [
                      Card(
                        elevation: 10,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            bottomLeft: Radius.circular(80),
                          ),
                          side: BorderSide(width: 3, color: Color(0xff8E2DE2)),
                        ),
                        child: Container(
                        height: MediaQuery.of(context).size.height * 0.25,
                        width:  MediaQuery.of(context).size.width,
                        //color: Colors.red.withOpacity(0.8),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 25.0,top: 5.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Text("About",style: profile,),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Column(
                                    children : const [
                                      Text("subject           :"),
                                      Text("Qualification :"),
                                      Text("Experience    :"),
                                      Text('Email              :'),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10.0),
                                    child: Column(
                                      children: [
                                        Text(widget.subject),
                                        Text(widget.qualification),
                                        Text(widget.experience),
                                        Text(widget.email),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text("Address",style: profile,),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Column(
                                    children: [
                                      Text("Location        :"),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10.0),
                                    child: Column(
                                      children: [
                                        Text(widget.location),
                                      ],
                                    ),
                                  ),
                                  ],
                                  ),
                                ],
                              ),
                        ),

                        ),
                      ),
                      SizedBox(height: 20,),
                      Container(
                        height: 180,
                        width: 250,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.8),
                              spreadRadius: 3,
                              blurRadius: 5,
                              offset: Offset(2, 7), // changes position of shadow
                            ),
                          ],
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: StreamBuilder<QuerySnapshot>(
                          stream: FirebaseFirestore.instance.collection('democlass').where('uid', isEqualTo: widget.uid).snapshots(),
                          builder: (context, snapshot) {
                            if (!snapshot.hasData) {
                              return Center(child: CircularProgressIndicator());
                            } else if (snapshot.hasData &&
                                snapshot.data!.docs.length == 0) {
                              return Center(child: Text("Demo class not added"));
                            } else {
                            return ListView.builder(
                                scrollDirection: Axis.vertical,
                                itemCount:  snapshot.data!.docs.length,
                                itemBuilder: (BuildContext context, int index){
                                  return Container(
                                    height: 180,
                                    width: 250,
                                    color: Color(0xff8E2DE2),
                                    child: Stack(
                                      children: [
                                        Positioned(
                                          bottom: 0,
                                          child: Container(
                                            height: 70,
                                            width: 250,
                                            color: Colors.lightBlueAccent,
                                          ),
                                        ),
                                        Positioned(
                                            top: -10,
                                            right: 35,
                                            child: Image.asset('assets/images/demo.gif',scale: 5)
                                        ),
                                        Positioned(
                                          top: 38,
                                          right: 20,
                                           bottom: 0,
                                            child: GestureDetector(
                                              onTap: (){
                                                launch(snapshot.data!.docs[index]['link'],);
                                              },
                                                child: Icon(Icons.play_circle_fill,size: 70,color: Colors.white,)),
                                        ),
                                        Positioned(
                                          top: 110,
                                            child: Column(
                                              children: [
                                                Text(snapshot.data!.docs[index]['title'],style: TextStyle(fontWeight: FontWeight.w700),),
                                                SizedBox(height: 10,),
                                                Text(snapshot.data!.docs[index]['description'],),
                                              ],
                                            ),
                                        )
                                      ],
                                    ),
                                  );
                                }
                            );
                            }
                          }
                        ),
                      ),
                      SizedBox(height: 40,),
                      Text("Feedback",style: profile,),
                      SizedBox(height: 10,),
                      GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => TeacherFeedbackPage(
                            uid: widget.uid,
                          )));
                        },
                        child: Text("View All",
                          style: TextStyle(
                              color: Colors.lightBlueAccent,
                              fontSize: 16,
                              fontWeight: FontWeight.w700),),
                      ),
                      SizedBox(height: 20,),
                      Row(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.88,
                            height: MediaQuery.of(context).size.height * 0.28,
                            //color: Colors.lightBlue,
                            child: Column(
                              children: [
                                Expanded(child: StreamBuilder<QuerySnapshot>(
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
                          ),
                        ],
                      ),
        ],
                  ),//about

                  ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Form(
                key: feedbackkey,
                child: Column(
                  children: [
                    TextFormField(
                      keyboardType: TextInputType.text,
                      validator: (value){
                        return Validate.FeedbackValidator(value!);
                      },
                      controller: feedbackController,
                      maxLines: 5,
                      maxLength: 200,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide: BorderSide(
                              color: Colors.grey,
                            ),
                          ),
                          hintText: "FeedBack"
                      ),
                    ),
                    ElevatedButton(
                      onPressed: (){
                        if(feedbackkey.currentState!.validate()){
                          FirebaseFirestore.instance.collection('feedback').doc(feedback_id).set({
                            'feedback id': feedback_id,
                            'teacher uid': widget.uid,
                            'teacher name': widget.name,
                            'student name': widget.sname,
                            'student uid': widget.suid,
                            'feedback': feedbackController.text,
                          }).then((value){
                            showsnackbar("successfully  submitted feedback");
                          });

                        }
                      },
                      child: Text("Submit"),
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        backgroundColor:
                        MaterialStateProperty.all(Colors.lightBlueAccent),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
    ),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.8),
              spreadRadius: 3,
              blurRadius: 5,
              offset: Offset(0, -2,), // changes position of shadow
            ),
          ],
        ),
        child: BottomAppBar(
          color: Color(0xff8E2DE2),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Container(
                  height: 60,
                  child: Row(
                    children: [
                      //Icon(Icons.money),
                      Text("₹",style: price,),
                      Text(widget.hypayment,style: price,),
                      Text(" /hour",style: price2,),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => BookingPage(
                      name: widget.name,
                      subject: widget.subject,
                      email: widget.email,
                      qualification: widget.qualification,
                      experience: widget.experience,
                      location: widget.location,
                      phonenumber: widget.phonenumber,
                      uid: widget.uid,
                      suid: widget.suid,
                      semail: widget.semail,
                      slocation: widget.slocation,
                      sphonenumber: widget.sphonenumber,
                      sname: widget.sname,
                    )));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.lightBlueAccent,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    height: 40,
                    width: 190,
                    child: Center(child: Text("Book Now",style: buynow,)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  showsnackbar(var msg){
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(msg),
          backgroundColor: Colors.lightBlueAccent,
        )
    );
  }
  void _launchwatsup() async {
    var whatsappUrl = "whatsapp://send?phone=+91" + widget.phonenumber;
    await canLaunch(whatsappUrl)
        ? launch(whatsappUrl)
        : launch('https://play.google.com/store/apps/details?id=com.whatsapp');
  }

}
