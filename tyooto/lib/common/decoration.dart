import 'package:flutter/material.dart';


final BoxDecoration containerdec=BoxDecoration(
    gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
            Color(0xff00F2FE),
            Color(0xff8E2DE2),
        ],
    ),
   borderRadius: BorderRadius.circular(20),
    //color: Color(0xff246368)
    );
final BoxDecoration containergen=BoxDecoration(
    gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
            Color(0xff00F2FE),
            Color(0xff8E2DE2),
        ],
    ),
   borderRadius: BorderRadius.circular(20),
    //color: Color(0xff246368)
    );

final BoxDecoration container2=BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.lightBlueAccent,
        boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.8),
                spreadRadius: 2,
                blurRadius: 4,
                offset: Offset(1, 5,), // changes position of shadow
            ),
        ],

);
