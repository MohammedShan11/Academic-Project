import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class ExamplePage extends StatefulWidget {
  const ExamplePage({Key? key}) : super(key: key);

  @override
  _ExamplePageState createState() => _ExamplePageState();
}

class _ExamplePageState extends State<ExamplePage> {
  var dateController=new TextEditingController();
  var date2Controller=new TextEditingController();
  var valueChanged;
  var valueSaved;
  var valueToValidate;
  var subject;
  var time1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(child: Text("Booking")),
        ),
        body: Container(
          height: 150,
          width: MediaQuery.of(context).size.width,
          child: Row(
            children: [
               Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 30.0),
                 child: Container(
                   height: 70,
                   width: 140,
                   color: Colors.red,
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
            ],
          ),
        ),

    );
  }
}