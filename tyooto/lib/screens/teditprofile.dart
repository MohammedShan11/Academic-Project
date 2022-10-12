import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tyooto/common/textstyles.dart';
import 'package:tyooto/common/validate.dart';

class TeacherEditProfilePage extends StatefulWidget {
  var name;
  var qualification;
  var exp;
  var location;
  var payment;
  var phonenumber;
  var uid;
  TeacherEditProfilePage({Key? key,
    this.name,
    this.qualification,
    this.exp,
    this.location,
    this.payment,
    this.phonenumber,
  this.uid}) : super(key: key);

  @override
  _TeacherEditProfilePageState createState() => _TeacherEditProfilePageState();
}

class _TeacherEditProfilePageState extends State<TeacherEditProfilePage> {
  var nameController = new TextEditingController();
  var numberController = new TextEditingController();
  var locationController = new TextEditingController();
  var qualificationController = new TextEditingController();
  var experienceController = new TextEditingController();
  var paymentController = new TextEditingController();
  var registerKey = new GlobalKey<FormState>();
  @override
  void initState() {
    nameController.text=widget.name;
    numberController.text=widget.phonenumber;
    locationController.text=widget.location;
    qualificationController.text=widget.qualification;
    experienceController.text=widget.exp;
    paymentController.text=widget.payment;
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile',style: appbar,),
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
              child: Form(
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
                    Container(
                      child: Column(
                        children: [
                          Form(
                            key: registerKey,
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                                  child: TextFormField(
                                    keyboardType: TextInputType.text,
                                    validator: (value){
                                      return Validate.NameValidator(value!);
                                    },
                                    controller: nameController,
                                    decoration: const InputDecoration(
                                      prefixIcon: Icon(Icons.person),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(20)),
                                        borderSide: BorderSide(
                                          color: Colors.grey,
                                        ),
                                      ),
                                      enabledBorder:  OutlineInputBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(20)),
                                        borderSide: BorderSide(
                                          color: Colors.grey,
                                        ),
                                      ),
                                      focusedBorder:  OutlineInputBorder(
                                        //borderRadius: BorderRadius.all(Radius.circular(20)),
                                        borderSide: BorderSide(
                                          color: Colors.green,
                                        ),
                                      ),
                                      hintText: "User Name",
                                    ),

                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                                  child: TextFormField(
                                    keyboardType: TextInputType.text,
                                    validator: (value){
                                      return Validate.QualificationValidator(value!);
                                    },
                                    controller: qualificationController,
                                    decoration: const InputDecoration(
                                      prefixIcon: Icon(Icons.school),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(20)),
                                        borderSide: BorderSide(
                                          color: Colors.grey,
                                        ),
                                      ),
                                      enabledBorder:  OutlineInputBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(20)),
                                        borderSide: BorderSide(
                                          color: Colors.grey,
                                        ),
                                      ),
                                      focusedBorder:  OutlineInputBorder(
                                        //borderRadius: BorderRadius.all(Radius.circular(20)),
                                        borderSide: BorderSide(
                                          color: Colors.green,
                                        ),
                                      ),
                                      hintText: "Qualificaiton",
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                                  child: TextFormField(
                                    keyboardType: TextInputType.text,
                                    validator: (value){
                                      return Validate.ExperienceValidator(value!);
                                    },
                                    controller: experienceController,
                                    decoration: const InputDecoration(
                                      prefixIcon: Icon(Icons.timelapse),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(20)),
                                        borderSide: BorderSide(
                                          color: Colors.grey,
                                        ),
                                      ),
                                      enabledBorder:  OutlineInputBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(20)),
                                        borderSide: BorderSide(
                                          color: Colors.grey,
                                        ),
                                      ),
                                      focusedBorder:  OutlineInputBorder(
                                        //borderRadius: BorderRadius.all(Radius.circular(20)),
                                        borderSide: BorderSide(
                                          color: Colors.green,
                                        ),
                                      ),
                                      hintText: "Experience",
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                                  child: TextFormField(
                                    keyboardType: TextInputType.text,
                                    validator: (value){
                                      return Validate.PaymentValidator(value!);
                                    },
                                    controller: paymentController,
                                    decoration: const InputDecoration(
                                      prefixIcon: Icon(Icons.payment),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(20)),
                                        borderSide: BorderSide(
                                          color: Colors.grey,
                                        ),
                                      ),
                                      enabledBorder:  OutlineInputBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(20)),
                                        borderSide: BorderSide(
                                          color: Colors.grey,
                                        ),
                                      ),
                                      focusedBorder:  OutlineInputBorder(
                                        //borderRadius: BorderRadius.all(Radius.circular(20)),
                                        borderSide: BorderSide(
                                          color: Colors.green,
                                        ),
                                      ),
                                      hintText: "Hourly Payment",
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                                  child: TextFormField(
                                    keyboardType: TextInputType.number,
                                    validator: (value){
                                      return Validate.numberValidator(value!);
                                    },
                                    controller: numberController,
                                    decoration: const InputDecoration(
                                      prefixIcon: Icon(Icons.phone),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(20)),
                                        borderSide: BorderSide(
                                          color: Colors.grey,
                                        ),
                                      ),
                                      enabledBorder:  OutlineInputBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(20)),
                                        borderSide: BorderSide(
                                          color: Colors.grey,
                                        ),
                                      ),
                                      focusedBorder:  OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.green,
                                        ),
                                      ),
                                      hintText: "Phone Number",
                                    ),
                                    obscureText: true,
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),

                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                                  child: TextFormField(
                                    keyboardType: TextInputType.text,
                                    validator: (value){
                                      return Validate.LocationValidator(value!);
                                    },
                                    controller: locationController,
                                    decoration: const InputDecoration(
                                      prefixIcon: Icon(Icons.location_city),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(20)),
                                        borderSide: BorderSide(
                                          color: Colors.grey,
                                        ),
                                      ),
                                      enabledBorder:  OutlineInputBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(20)),
                                        borderSide: BorderSide(
                                          color: Colors.grey,
                                        ),
                                      ),
                                      focusedBorder:  OutlineInputBorder(
                                        //borderRadius: BorderRadius.all(Radius.circular(20)),
                                        borderSide: BorderSide(
                                          color: Colors.green,
                                        ),
                                      ),
                                      hintText: "Location",
                                    ),

                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 20.0),
                                  child: Container(
                                    height: 42,
                                    width: 150,
                                    child: ElevatedButton(
                                      onPressed: (){
                                        if(registerKey.currentState!.validate()){
                                          FirebaseFirestore.instance.collection('teacher').doc(widget.uid).
                                          update({
                                            'name':nameController.text,
                                            'location':locationController.text,
                                            'phonenumber': numberController.text,
                                          }).then((value){print("ok");
                                          Navigator.pop(context);
                                          });
                                        }
                                      },
                                      onLongPress: (){
                                        print("Long Pressed");
                                      },
                                      child: const Text("update"),
                                      style: ButtonStyle(
                                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                        ),
                                        backgroundColor: MaterialStateProperty.all(Colors.lightBlueAccent),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
