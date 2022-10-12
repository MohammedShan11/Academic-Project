import 'package:flutter/material.dart';
import 'package:tyooto/common/textstyles.dart';

class StudentFeedbackPage extends StatefulWidget {
  const StudentFeedbackPage({Key? key}) : super(key: key);

  @override
  _StudentFeedbackPageState createState() => _StudentFeedbackPageState();
}

class _StudentFeedbackPageState extends State<StudentFeedbackPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Feedback',style: appbar,),
        backgroundColor: Color(0xff8E2DE2),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemBuilder: (BuildContext context, int index){
                  return Card(
                    elevation: 10,
                    child: ListTile(
                      title: Text("Name"),
                      subtitle: Text("feedback"),
                    ),
                  );
                }
            ),
          ),
        ],
      ),
    );
  }
}
