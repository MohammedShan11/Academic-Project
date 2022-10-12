import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Validate {
  static String? emailValidator(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern.toString());
    if (!regex.hasMatch(value)) {
      return 'Email format is invalid';
    } else {
      return null;
    }
  }

  static String? pwdValidator(String value) {
    if (value.length <10 || num.tryParse(value) == null) {
      return 'Password should contain atleast 10 digits';
    } else {
      return null;
    }
  }
  static String? numberValidator(String value) {
    if (value.length <10 || num.tryParse(value) == null) {
      return 'Phone number should contain atleast 10 digits';
    } else {
      return null;
    }
  }

  static String? AdpwdValidator(String value) {
    if (value.length < 8) {   //elitethootha4545
      return "Password should contain atleast 8 characters ";
    } else {
      return null;
    }
  }

  static String? NameValidator(String value) {
    if (value.toString() == "") {
      return " User Name is Invalid ";
    }else {
      return null;
    }
  }

  static String? LocationValidator(String value) {
    if (value.toString() == "") {
      return " Location is not given ";
    }else {
      return null;
    }
  }

  static String? QualificationValidator(String value) {
    if (value.toString() == "") {
      return " Qualification is not given ";
    }else {
      return null;
    }
  }

  static String? ExperienceValidator(String value) {
    if (value.toString() == "") {
      return " Experience is not given ";
    }else {
      return null;
    }
  }

  static String? PaymentValidator(String value) {
    if (value.toString() == "") {
      return " Payment is not given ";
    }else {
      return null;
    }
  }
  static String? ConfirmValidator(String value,String password) {
    if (value.toString() != password) {   //elitethootha4545
      return "Password doesn't match ";
    } else {
      return null;
    }
  }
  static String? LinkValidator(String value) {
    if (value.toString() == "") {
      return "Link is not given";
    }else {
      return null;
    }
  }

  static String? TitleValidator(String value) {
    if (value.toString() == "") {
      return "Title is not given";
    }else {
      return null;
    }
  }

  static String? DesValidator(String value) {
    if (value.toString() == "") {
      return "Description is not given";
    }else {
      return null;
    }
  }

  static String? ChapterValidator(String value) {
    if (value.toString() == "") {
      return "Chapter Details is not given";
    }else {
      return null;
    }
  }
  static String? STimeValidator(String value) {
    if (value.toString() == "") {
      return "Starting Time is Invalid";
    }else {
      return null;
    }
  }

  static String? LTimeValidator(String value) {
    if (value.toString() == "") {
      return "Last Time is Invalid";
    }else {
      return null;
    }
  }

  static String? SDateValidator(String value) {
    if (value.toString() == "") {
      return " Date is Invalid";
    }else {
      return null;
    }

  }
  static String? LDateValidator(String value) {
    if (value.toString() == "") {
      return " Date is Invalid";
    }else {
      return null;
    }
  }

  static String? FeedbackValidator(String value) {
    if (value.toString() == "") {
      return "Feedback is not given";
    }else {
      return null;
    }
  }

  static void orientaionStyle(){

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,DeviceOrientation.portraitDown,DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight
    ]);
  }

}