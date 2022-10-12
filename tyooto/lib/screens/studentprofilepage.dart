import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tyooto/common/textstyles.dart';
import 'package:tyooto/common/validate.dart';

class StudentProfilePage extends StatefulWidget {
  var name;
  var location;
  var email;
  var uid;
  var phonenumber;
  StudentProfilePage({Key? key,this.name,this.email,this.location, this.phonenumber,this.uid}) : super(key: key);

  @override
  _StudentProfilePageState createState() => _StudentProfilePageState();
}

class _StudentProfilePageState extends State<StudentProfilePage> {
  var nameController = new TextEditingController();
  var registerKey = new GlobalKey<FormState>();
  var numberController = new TextEditingController();
  var locationController = new TextEditingController();
  @override
  void initState() {
    nameController.text=widget.name;
    locationController.text=widget.location;
    numberController.text = widget.phonenumber;
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Profile',style: appbar,),
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
                key: registerKey,
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
                        children : [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 30.0),
                            child:TextFormField(
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
                          Padding(
                            padding: const EdgeInsets.only(bottom: 20.0),
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
                          Padding(
                            padding: const EdgeInsets.only(bottom: 20.0),
                            child: Text(widget.email,style: profile,),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 20.0),
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
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 20.0),
                            child: Container(
                              height: 42,
                              width: 150,
                              child: ElevatedButton(
                                onPressed: (){
                                  if(registerKey.currentState!.validate()){
                                      FirebaseFirestore.instance.collection('student').doc(widget.uid).
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
              ),
            ),
          ),

        ),
      ),
    );
  }
}
