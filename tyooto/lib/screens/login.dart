import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tyooto/common/textstyles.dart';
import 'package:tyooto/common/validate.dart';
import 'package:tyooto/screens/adminpage.dart';
import 'package:tyooto/screens/homepage.dart';
import 'package:tyooto/screens/registration.dart';
import 'package:tyooto/screens/teacherhomepage.dart';
import 'package:tyooto/screens/teacherregistration.dart';

class LoginPage extends StatefulWidget {
  var name;
   LoginPage({Key? key,this.name}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var emailController = new TextEditingController();
  var passwordController = new TextEditingController();
  var loginKey = new GlobalKey<FormState>();

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
                  color: Color(0xff8E2DE2),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.8),
                      spreadRadius: 3,
                      blurRadius: 5,
                      offset: Offset(2, 7), // changes position of shadow
                    ),
                  ],
                  borderRadius:
                      BorderRadius.only(bottomLeft: Radius.circular(108)),
                ),
                child: Center(
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/images/logo.png',
                        height: 250,
                        width: 300,
                      ),
                      const Text(
                        "Login",
                        style: mainhead,
                        textDirection: TextDirection.rtl,
                        textAlign: TextAlign.right,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 80,
              ),
              Form(
                key: loginKey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
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
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide: BorderSide(
                              color: Colors.grey,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
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
                        validator: (value) {
                          return Validate.AdpwdValidator(value!);
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
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide: BorderSide(
                              color: Colors.grey,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.green,
                            ),
                          ),
                          hintText: "Password",
                        ),
                        obscureText: true,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 120,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: Container(
                  height: 42,
                  width: 150,
                  child: ElevatedButton(
                    onPressed: () {
                      if (loginKey.currentState!.validate()) {
                        if (emailController.text == 'admin@gmail.com' &&
                            passwordController.text == '1234567890') {
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>AdminPage()));
                        } else {
                          FirebaseAuth.instance
                              .signInWithEmailAndPassword(
                                  email: emailController.text,
                                  password: passwordController.text)
                              .then((value) => FirebaseFirestore.instance
                                      .collection('login')
                                      .doc(value.user!.uid)
                                      .get()
                                      .then((value) {
                                    if (value.data()!['usertype'] ==
                                            'student' &&
                                        value.data()!['status'] == 1) {
                                      FirebaseFirestore.instance
                                          .collection('student')
                                          .doc(value.data()!['uid'])
                                          .get()
                                          .then((value) =>
                                              Navigator.pushReplacement(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          HomePage(
                                                            suid: value.data()!['uid'],
                                                            sname:  value.data()!['name'],
                                                            semail: value.data()!['email'],
                                                            sphonenumber: value.data()!['phonenumber'],
                                                            slocation: value.data()!['location'],
                                                          ))));
                                    } else if (value.data()!['usertype'] ==
                                            'teacher' &&
                                        value.data()!['status'] == 1) {
                                      FirebaseFirestore.instance
                                          .collection('teacher')
                                          .doc(value.data()!['uid'])
                                          .get()
                                          .then((value) =>
                                              Navigator.pushReplacement(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          TeacherHomePage(
                                                            name:  value.data()!['name'],
                                                            subject: value.data()!['subject'],
                                                            uid:value.data()!['uid'] ,
                                                            exp: value.data()!['experience'],
                                                            phnumber: value.data()!['phonenumber'],
                                                            email: value.data()!['email'],
                                                            location: value.data()!['location'],
                                                            hpayment: value.data()!['hpayment'],
                                                            qualification:value.data()!['qualification'] ,
                                                          ))));
                                    } else {
                                      showsnackbar('Cannot Login');
                                    }
                                  }))
                              .catchError((e) =>
                                  showsnackbar('Invalid Username or Password'));
                        }
                      }
                    },
                    onLongPress: () {
                      print("Long Pressed");
                    },
                    child: const Text("Login"),
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
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have an account?",
                    style: login,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegistrationPage()));
                    },
                    child: const Text(
                      " Sign Up Now",
                      style: sign,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Register as",
                    style: login,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TeacherRegistrationPage()));
                    },
                    child: const Text(
                      " Teacher",
                      style: sign,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  showsnackbar(var msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(msg),
      //backgroundColor: ,
    ));
  }
}
