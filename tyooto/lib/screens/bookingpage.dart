import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tyooto/common/textstyles.dart';
import 'package:tyooto/common/validate.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:tyooto/screens/homepage.dart';

class BookingPage extends StatefulWidget {
  var name;
  var experience;
  var subject;
  var qualification;
  var email;
  var location;
  var phonenumber;
  var uid;
  var suid;
  var semail;
  var slocation;
  var sphonenumber;
  var sname;
  BookingPage({Key? key,
  this.name,
  this.experience,
  this.subject,
  this.qualification,
  this.email,
  this.location,
  this.phonenumber,
  this.uid,
  this.suid,
  this.semail,
  this.slocation,
  this.sphonenumber,
  this.sname}) : super(key: key);

  @override
  _BookingPageState createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  var LocationController = TextEditingController();
  var ChapterController = TextEditingController();
  var bookKey = new GlobalKey<FormState>();
  var timeKey = new GlobalKey<FormState>();
  var timeKey2 = new GlobalKey<FormState>();
  var classKey = new GlobalKey<FormState>();
  var datekey = new GlobalKey<FormState>();
  var FdateController=new TextEditingController();
  var LdateController=new TextEditingController();
  String valueChanged = '';
  String valueSaved = '';
  String valueToValidate = '';
  var stimeController = new TextEditingController();
  var etimeController = new TextEditingController();
  var time1;
  var time2;
  var classtype;
  var book_id;
  var now = DateTime.now();
  //var lastdate = DateTime.now().add(const Duration(days: 7));
  var lastdate = DateTime(2100);

  @override
  void initState() {
    book_id=DateTime.now().toString();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Booking",style: appbar,),
        backgroundColor: Color(0xff8E2DE2),
        actions: <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage(
                    sphonenumber: widget.sphonenumber,
                    slocation: widget.slocation,
                    semail: widget.semail,
                    suid: widget.suid,
                    sname: widget.sname,
                  )));
                },
                child: const Icon(
                  Icons.home,
                  size: 26.0,
                ),
              )),
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        //color: Colors.red,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    elevation: 10,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10),
                        bottomRight: Radius.circular(80),
                      ),
                      side: BorderSide(width: 3, color: Color(0xff8E2DE2)),
                    ),
                    child: Container(
                      height: 150,
                      width: 400,
                      //color: Colors.red,
                      child: Row(
                        children: [
                        Image.asset("assets/images/avatar.png",
                        height: 120,
                        width: 120,),
                          Padding(
                            padding: const EdgeInsets.all(40.0),
                            child: Container(
                              child: Column(
                                children: [
                                  Text(widget.name,style: hmehead,),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(widget.subject,style: course,),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 230,
                  width: 400,
                  //color: Colors.lightBlueAccent,
                  child: Form(
                    key: datekey,
                    child: Column(
                      children: [
                        Text("Date",style: profile,),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 10.0,),
                          child: DateTimePicker(
                            type: DateTimePickerType.date,
                            //dateMask: 'yyyy/MM/dd',
                            controller: FdateController,
                            //initialValue: _initialValue,
                            firstDate: now,
                            lastDate: DateTime(2100),
                            icon: Icon(Icons.event),
                            dateLabelText: 'Starting Date',
                            onChanged: (val) => setState(() => valueChanged = val),
                            validator: (value){
                              return Validate.SDateValidator(value!);
                            },
                            onSaved: (val) => setState(() => valueSaved = val ?? ''),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 10.0,),
                          child: DateTimePicker(
                            type: DateTimePickerType.date,
                            //dateMask: 'yyyy/MM/dd',
                            controller: LdateController,
                            //initialValue: _initialValue,
                            firstDate: DateTime.now(),
                            lastDate: lastdate,
                            icon: Icon(Icons.event),
                            dateLabelText: 'Last Date',
                            onChanged: (val) => setState(() => valueChanged = val),
                            validator: (value){
                              return Validate.LDateValidator(value!);
                            },
                            onSaved: (val) => setState(() => valueSaved = val ?? ''),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 25,
                  width: 400,
                  child: Center(child: Text("Time",style: profile,)),
                ),
                Container(
                  height: 100,
                  width: 400,
                  //color: Colors.green,
                  child: Form(
                    key: timeKey2,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30.0,),
                          child: Container(
                            height: 90,
                            width: 140,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10.0),
                              child: DropdownButtonFormField<String>(
                                dropdownColor: Colors.white,
                                isExpanded: true,
                                value: time1,
                                hint: Text("AM or PM"),
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                                onChanged: (ctgry) => setState(() => time1 = ctgry),
                                validator: (value) => value == null ? 'field required' : null,
                                items: [
                                  'AM',
                                  'PM',
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0,),
                          child: Container(
                            height: 90,
                            width: 140,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10.0),
                              child: DropdownButtonFormField<String>(
                                dropdownColor: Colors.white,
                                isExpanded: true,
                                value: time2,
                                hint: Text("AM or PM"),
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                                onChanged: (ctgry) => setState(() => time2 = ctgry),
                                validator: (value) => value == null ? 'field required' : null,
                                items: [
                                  'AM',
                                  'PM',
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 120,
                  width: 400,
                  //color: Colors.orange,
                  child: Form(
                    key: timeKey,
                    child: Row(
                      children: [
                        Container(
                          height: 100,
                          width: 190,
                          //color: Colors.green,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0,),
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              validator: (value){
                                return Validate.STimeValidator(value!);
                              },
                              controller: stimeController,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(20)),
                                  borderSide: BorderSide(
                                    color: Colors.grey,
                                  ),
                                ),
                                hintText: "Strating Time",
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 100,
                          width: 190,
                          //color: Colors.blue,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0,),
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              validator: (value){
                                return Validate.LTimeValidator(value!);
                              },
                              controller: etimeController,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(20)),
                                  borderSide: BorderSide(
                                    color: Colors.grey,
                                  ),
                                ),
                                hintText: "Ending Time",
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 25,
                  width: 400,
                  child: Center(child: Text("Class Type",style: profile,)),
                ),
                Form(
                  key: classKey,
                  child: Container(
                    height: 150,
                    width: 400,
                    child: Column(
                      children: [
                        SizedBox(height: 30,),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 40.0),
                          child: DropdownButtonFormField<String>(
                            dropdownColor: Colors.white,
                            isExpanded: true,
                            value: classtype,
                            hint: Text("Online or Offline"),
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            onChanged: (ctgry) => setState(() => classtype = ctgry),
                            validator: (value) => value == null ? 'field required' : null,
                            items: [
                              'Online',
                              'Offline',
                            ].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.69,
                  width: 400,
                  //color: Colors.green,
                  child: Column(
                    children: [
                      Form(
                        key: bookKey,
                        child: Column(
                          children: [
                            Text("Location",style: profile,),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 10.0,),
                              child: TextFormField(
                                keyboardType: TextInputType.text,
                                validator: (value){
                                  return Validate.LocationValidator(value!);
                                },
                                controller: LocationController,
                                maxLines: 5,
                                maxLength: 100,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(20)),
                                    borderSide: BorderSide(
                                      color: Colors.grey,
                                    ),
                                  ),
                                  hintText: """\n 
Current Location""",
                                ),
                              ),
                            ),
                            const SizedBox(height: 3,),
                            Text("Chapter",style: profile,),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 5.0,),
                              child: TextFormField(
                                keyboardType: TextInputType.text,
                                validator: (value){
                                  return Validate.ChapterValidator(value!);
                                },
                                controller: ChapterController,
                                maxLines: 3,
                                maxLength: 80,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(20)),
                                    borderSide: BorderSide(
                                      color: Colors.grey,
                                    ),
                                  ),
                                  hintText: """\n 
Chapter Details""",
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 30.0),
                        child: GestureDetector(
                          onTap: (){
                            if(datekey.currentState!.validate()) {
                            if(timeKey2.currentState!.validate()) {
                            if(timeKey.currentState!.validate()) {
                              if(classKey.currentState!.validate()){
                              if(bookKey.currentState!.validate()){
                              FirebaseFirestore.instance.collection('booking').doc(book_id).set({

                                'book_id': book_id,
                                'uid': widget.uid,
                                'name': widget.name,
                                'subject': widget.subject,
                                'student uid': widget.suid,
                                'student name': widget.sname,
                                'student email': widget.semail,
                                'student location': widget.slocation,
                                'student phonenumber': widget.sphonenumber,
                                'phonenumber': widget.phonenumber,
                                'location': widget.location,
                                'start date': FdateController.text,
                                'last date': LdateController.text,
                                'Am or Pm ': time1,
                                'Pm or Am': time2,
                                'class type': classtype,
                                'start time': stimeController.text,
                                'end time': stimeController.text,
                                'current location': LocationController.text,
                                'chapter details': ChapterController.text,
                                'date': DateTime.now(),
                                'book status': 1,


                              }).then((value) {
                                Navigator.pop(context);
                                showsnackbar("successfully Requested Booking");
                              });
                              }
                              }
                            }
                            }
                            }
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.lightBlueAccent,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            height: 40,
                            width: 150,
                            child: Center(child: Text("Book",style: buynow,),),
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
}
