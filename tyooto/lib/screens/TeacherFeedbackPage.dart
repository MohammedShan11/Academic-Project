import 'package:flutter/material.dart';
import 'package:tyooto/common/textstyles.dart';

class TeacherFeedbackPage extends StatefulWidget {
  const TeacherFeedbackPage({Key? key}) : super(key: key);

  @override
  _TeacherFeedbackPageState createState() => _TeacherFeedbackPageState();
}

class _TeacherFeedbackPageState extends State<TeacherFeedbackPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Teacher Feedback',style: appbar,),
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
