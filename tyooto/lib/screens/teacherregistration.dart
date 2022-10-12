import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tyooto/common/textstyles.dart';
import 'package:tyooto/common/validate.dart';
import 'package:tyooto/screens/login.dart';

class TeacherRegistrationPage extends StatefulWidget {
  const TeacherRegistrationPage({Key? key}) : super(key: key);

  @override
  _TeacherRegistrationPageState createState() => _TeacherRegistrationPageState();
}

class _TeacherRegistrationPageState extends State<TeacherRegistrationPage> {

  var nameController = new TextEditingController();
  var emailController = new TextEditingController();
  var passwordController = new TextEditingController();
  var confirmController = new TextEditingController();
  var numberController = new TextEditingController();
  var locationController = new TextEditingController();
  var qualificationController = new TextEditingController();
  var experienceController = new TextEditingController();
  var paymentController = new TextEditingController();
  var subject;
  var registerKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.4,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.8),
                      spreadRadius: 3,
                      blurRadius: 4,
                      offset: Offset(5, 7), // changes position of shadow
                    ),
                  ],
                  color: Color(0xff8E2DE2),
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(100)),
                ),
                child: Center(
                  child: Column(
                    children: [
                      Image.asset('assets/images/logo.png',height: 250,width: 300,),
                      Text("Register",style: mainhead,textDirection: TextDirection.rtl,textAlign: TextAlign.right,),
                    ],
                  ),
                ),
              ),

              const SizedBox(
                height: 10,
              ),
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
                      child: DropdownButtonFormField<String>(
                        value: subject,
                        decoration: InputDecoration(
                          hintText: "Subject",
                          prefixIcon: Icon(Icons.book),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        onChanged: (ctgry) =>
                            setState(() => subject = ctgry),
                        validator: (value) => value == null ? 'field required' : null,
                        items: ['Maths', 'Physics', 'Chemistry', 'Biology', 'English',]
                            .map<DropdownMenuItem<String>>(
                                (String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
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
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        validator: (value){
                          return Validate.emailValidator(value!);
                        },
                        controller: emailController,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.email),
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
                          hintText: "Email",
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
                          return Validate.pwdValidator(value!);
                        },
                        controller: passwordController,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.lock),
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
                          hintText: "Password",
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
                        keyboardType: TextInputType.number,
                        validator: (value){
                          return Validate.pwdValidator(value!);
                        },
                        controller: confirmController,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.lock_rounded),
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
                          hintText: "Confirm Password",
                        ),
                        obscureText: true,
                      ),
                    ),

                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: Container(
                  height: 42,
                  width: 150,
                  child: ElevatedButton(
                    onPressed: (){
                      //print("Tapped");
                      if(registerKey.currentState!.validate()){
                        FirebaseAuth.instance.createUserWithEmailAndPassword(email:emailController.text, password: passwordController.text).
                        then((value) {

                          FirebaseFirestore.instance.collection('login').doc(value.user!.uid).
                          set({
                            'uid':value.user!.uid,
                            'email':emailController.text,
                            'name': nameController.text,
                            'password':passwordController.text,
                            'usertype':'teacher',
                            'status':1,

                          }).then((val) =>  FirebaseFirestore.instance.collection('teacher').doc(value.user!.uid).
                          set({
                            'uid':value.user!.uid,
                            'email':emailController.text,
                            'name': nameController.text,
                            'experience':experienceController.text,
                            'qualification':qualificationController.text,
                            'subject':subject,
                            'hpayment':paymentController.text,
                            'status':1,
                            'pstatus':2,
                            'count':0,
                            'location':locationController.text,
                            'phonenumber': numberController.text,
                            'date':DateTime.now()
                          })).then((value) {
                            showsnackbar('Successfuly Registered');
                            Navigator.pop(context);
                          });



                        }).catchError((e)=>showsnackbar('Registration Failed'));
                      }
                    },
                    onLongPress: (){
                      print("Long Pressed");
                    },
                    child: const Text("Register"),
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
             // const SizedBox(
               // height: 10,
              //),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have an account?",style: login,),
                  GestureDetector(onTap: (){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context)=>LoginPage()));
                  },
                    child: Text(" Sign In",style: sign,),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
  showsnackbar(var msg){
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(msg),
          //backgroundColor: ,
        )
    );
  }
}
