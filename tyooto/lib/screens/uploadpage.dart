import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tyooto/common/textstyles.dart';
import 'package:tyooto/common/validate.dart';

class UploadPage extends StatefulWidget {
  var name;
  var location;
  var subject;
  var uid;
  var email;
  var hpayment;
  var exp;
  var qualification;
  var phnumber;
 UploadPage({Key? key,
   this.location,
   this.name,
   this.hpayment,
   this.uid,
   this.email,
   this.qualification,
   this.phnumber,
   this.subject,
   this.exp
 }) : super(key: key);

  @override
  _UploadPageState createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {
  var demo_id;

  var textController = new TextEditingController();
  var titleController = new TextEditingController();
  var desController = new TextEditingController();
  var submitKey = new GlobalKey<FormState>();

  @override
  void initState() {
    demo_id=DateTime.now().toString();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Upload Files",style: appbar,),
        backgroundColor: Color(0xff8E2DE2),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20,),
            Form(
              key: submitKey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      validator: (value){
                        return Validate.LinkValidator(value!);
                      },
                      controller: textController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          borderSide: BorderSide(
                            color: Colors.grey,
                          ),
                        ),
                        hintText: "Paste Your Link",
                      ),
                    ),
                  ),
                  const SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      validator: (value){
                        return Validate.TitleValidator(value!);
                      },
                      controller: titleController,
                      maxLength: 100,
                      decoration: const InputDecoration(
                        hintText: "Title"
                      ),
                    ),
                  ),
                  const SizedBox(height: 5,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      validator: (value){
                        return Validate.DesValidator(value!);
                      },
                      controller: desController,
                      maxLines: 5,
                      maxLength: 200,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          borderSide: BorderSide(
                            color: Colors.grey,
                          ),
                        ),
                        hintText: "Description"
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Padding(
                padding: const EdgeInsets.only(top: 1,),
              child: Container(
                height: 50,
                width: 190,
                child: ElevatedButton(
                  onPressed: (){
    if(submitKey.currentState!.validate()) {
      FirebaseFirestore.instance.collection('democlass').doc(demo_id).set({

        'demo_id': demo_id,
        'uid': widget.uid,
        'name': widget.name,
        'subject': widget.subject,
        'qualification': widget.qualification,
        'link': textController.text,
        'title': titleController.text,
        'description': desController.text,
        'date': DateTime.now(),
        'status': 1
      }).then((value) {
        Navigator.pop(context);
        showsnackbar("Demo Classes Added");
      });
    }
                  },
                  child: const Text("Submit"),
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                      )
                    ),
                    backgroundColor: MaterialStateProperty.all(Colors.lightBlueAccent)
                  ),
                ),
              ),
            ),
        ],
        ),
      ),
        );

  }
  showsnackbar(var msg){
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(msg),
          backgroundColor: Colors.lightBlueAccent,
        )
    );
  }
}
