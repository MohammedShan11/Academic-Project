import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tyooto/common/textstyles.dart';
import 'package:tyooto/common/validate.dart';

class AboutPage extends StatefulWidget {
  var name;
  var uid;
  var email;
  var phonenumber;
  var location;
  AboutPage({Key? key,
  this.name,
  this.uid,
  this.email,
  this.phonenumber,
  this.location}) : super(key: key);

  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {

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
        title: Text("About",style: appbar,),
        backgroundColor: Color(0xff8E2DE2),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 200,
                width: 400,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text("""This is a academic project done by Tyooto team""",style: profile,),
                ),
              ),
              SizedBox(height: 20,),
              Text("FeedBack",style: profile,),
              SizedBox(height: 30,),
              Container(
                width: 300,
                height: 300,
                //color: Colors.lightBlue,
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
                        maxLines: 9,
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
                     // SizedBox(height: 48,),
                      ElevatedButton(
                          onPressed: (){
                            if(feedbackkey.currentState!.validate()){
                            FirebaseFirestore.instance.collection('student feedback').doc(feedback_id).set(
                                {
                                  'feedback id': feedback_id,
                                  'student uid': widget.uid,
                                  'student name': widget.name,
                                  'feedback': feedbackController.text,
                                  'date': DateTime.now(),
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
    );
  }
  showsnackbar(var msg){
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          elevation: 10,
          content: Text(msg),
          backgroundColor: Color(0xff8E2DE2),
        )
    );
  }
}
