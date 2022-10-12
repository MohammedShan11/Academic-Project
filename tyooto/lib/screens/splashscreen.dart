import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:tyooto/screens/login.dart';

import '../common/textstyles.dart';

class splashscreen extends StatefulWidget {
  const splashscreen({Key? key}) : super(key: key);


  @override
  _splashscreenState createState() => _splashscreenState();
}

class _splashscreenState extends State<splashscreen> {
  final List<PageViewModel> pages = [
    PageViewModel(
      title: 'First Page',
      body: 'Learn today succeed tomorrow',
      image: Center(
        child: Image.asset('assets/images/idea.png'),
      ),
      decoration: PageDecoration(
        titleTextStyle: TextStyle(
          fontSize: 25.0,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        bodyTextStyle: TextStyle(
          color: Colors.white,
        ),
      ),
    ),
    PageViewModel(
      title: 'second Page',
      body: 'A little progress each day adds up to big results',
      image: Center(
        child: Image.asset('assets/images/analyse.png'),
      ),
      decoration: PageDecoration(
        titleTextStyle: TextStyle(
          fontSize: 25.0,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        bodyTextStyle: TextStyle(
          color: Colors.white,
        ),
      ),
    ),
    PageViewModel(
      title: 'Third Page',
      body: 'Lots experts available on different subject',
      image: Center(
        child: Image.asset('assets/images/plan.png'),
      ),
      decoration: PageDecoration(
        titleTextStyle: TextStyle(
          fontSize: 25.0,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        bodyTextStyle: TextStyle(
          color: Colors.white,
        ),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    print(size);
    return Scaffold(

      body: Container(
        color: Color(0xff8E2DE2),
        child: Padding(
          padding: const EdgeInsets.only(top: 100.0),
          child: IntroductionScreen(
            globalBackgroundColor: Color(0xff8E2DE2),
            pages: pages,
            dotsDecorator: const DotsDecorator(
              size: Size(10, 10),
              color: Colors.white,
              activeSize: Size.square(15),
              activeColor: Colors.lightBlueAccent,
            ),
            showDoneButton: true,
            done: const Text("Done",style: TextStyle(color: Colors.white,
              fontSize: 16,),),
            showSkipButton: true,
            skip: const Text("Skip",style: TextStyle(color: Colors.white,
              fontSize: 16,),),
            showNextButton: true,
            next: const Icon(
              Icons.arrow_forward, size: 20,color: Colors.white,),
            onDone: () => onDone(context),
          ),
        ),
      ),
    );
  }

  void onDone(context){
    Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
  }
}
