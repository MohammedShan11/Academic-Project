import 'package:flutter/material.dart';
import 'package:tyooto/screens/teacherresultpage.dart';

class TeacherSearchPage extends StatefulWidget {
  const TeacherSearchPage({Key? key}) : super(key: key);

  @override
  _TeacherSearchPageState createState() => _TeacherSearchPageState();
}

class _TeacherSearchPageState extends State<TeacherSearchPage> {
  var subject;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff8E2DE2),
      ),
      body: Container(
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
            Padding(
              padding: const EdgeInsets.only(right: 10.0,left: 10.0,),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.white,
                ),
                width: 270,
                //width: MediaQuery.of(context).size.width
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: DropdownButtonFormField<String>(
                    dropdownColor: Colors.white,
                    isExpanded: true,
                    value: subject,
                    hint: Text("Search for Tutors"),
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.book),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          if (subject != null) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => TeacherResultPage(
                                      subject: subject
                                    )));
                          }
                        },
                      child: Icon(Icons.search)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onChanged: (ctgry) => setState(() => subject = ctgry),
                    validator: (value) => value == null ? 'field required' : null,
                    items: [
                      'Maths',
                      'Physics',
                      'Chemistry',
                      'Biology',
                      'English',
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
    );
  }
}
