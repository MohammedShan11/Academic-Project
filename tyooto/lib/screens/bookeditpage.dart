import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:tyooto/common/textstyles.dart';
import 'package:tyooto/common/validate.dart';

class BookEditingPage extends StatefulWidget {
  var name;
  var subject;
  var sdate;
  var edate;
  var stime;
  var etime;
  var location;
  var chapter;
  var status;
  var classtype;
  var time1;
  var time2;
  var uid;
  var suid;
  var sname;
  var semail;
  var slocation;
  var sphonenumber;
  var phonenumber;
  var date;
  var book_id;
  BookEditingPage({Key? key,
    this.name,
    this.subject,
    this.sdate,
    this.edate,
    this.stime,
    this.etime,
    this.location,
    this.chapter,
    this.status,
  this.classtype,
  this.time1,
  this.time2,
  this.uid,
  this.phonenumber,
  this.suid,
  this.sname,
  this.slocation,
  this.semail,
  this.sphonenumber,
  this.date,
  this.book_id}) : super(key: key);

  @override
  _BookEditingPageState createState() => _BookEditingPageState();
}

class _BookEditingPageState extends State<BookEditingPage> {
  var LocationController = TextEditingController();
  var ChapterController = TextEditingController();
  var FdateController=new TextEditingController();
  var LdateController=new TextEditingController();
  var stimeController = new TextEditingController();
  var etimeController = new TextEditingController();
  String valueChanged = '';
  String valueSaved = '';
  String valueToValidate = '';
  var time1;
  var time2;
  var classtype;

  var now = DateTime.now();
  //var lastdate = DateTime.now().add(const Duration(days: 7));
  var lastdate = DateTime(2100);
  @override
  void initState() {
    LocationController.text=widget.location;
    ChapterController.text=widget.chapter;
    FdateController.text=widget.sdate;
    LdateController.text=widget.edate;
    stimeController.text=widget.stime;
    etimeController.text=widget.etime;
    classtype=widget.classtype;
    time1=widget.time1;
    time2=widget.time2;
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 8,
        title: const Text(
          "Reschedule Page",
          style: appbar,
        ),
        backgroundColor: Color(0xff8E2DE2),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
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
              Form(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: DottedBorder(
                        borderType: BorderType.RRect,
                        radius: Radius.circular(10),
                        dashPattern: [10,5,10,5,10,5],
                        color: Colors.lightBlueAccent,
                        strokeWidth: 3,
                        child: Container(
                          height: MediaQuery.of(context).size.height * 1.5,
                          width: 400,
                          //color: Colors.red,
                          child: Column(
                            children: [
                              SizedBox(height: 20,),
                              Text("Date",style: profile,),
                              SizedBox(height: 20,),
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
                              SizedBox(height: 15,),
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
                              SizedBox(height: 20,),
                              Text("Time",style: profile,),
                              SizedBox(height: 20,),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 25.0,),
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
                                  //SizedBox(width: 5,),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 0.0,),
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
                                ],),
                              SizedBox(height: 15,),
                              Row(
                                children: [
                                  SizedBox(width: 10,),
                                  Container(
                                    height: 100,
                                    width: 170,
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
                                    width: 160,
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
                              SizedBox(height: 20,),
                              Text("Class Type",style: profile,),
                              SizedBox(height: 20,),
                              Container(
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
                              SizedBox(height: 20,),
                              Text("Location",style: profile,),
                              SizedBox(height: 20,),
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
                              SizedBox(height: 20,),
                              Text("Chapter Details",style: profile,),
                              SizedBox(height: 20,),
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
                      ),
                    ),
                    ElevatedButton(
                        onPressed: (){
                          FirebaseFirestore.instance.collection('booking').doc(widget.book_id).update({





                            'start date': FdateController.text,
                            'last date': LdateController.text,
                            'Am or Pm ': time1,
                            'Pm or Am': time2,
                            'class type': classtype,
                            'start time': stimeController.text,
                            'end time': stimeController.text,
                            'current location': LocationController.text,
                            'chapter details': ChapterController.text,
                            'book status': 3,


                          }).then((value) {
                            Navigator.pop(context);
                            showsnackbar("successfully Requested Booking");
                          });
                         // showsnackbar("successfully Requested Reschedule");
                        },
                        child: const Text("Update"),
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
}
