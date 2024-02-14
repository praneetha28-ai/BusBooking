import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
String getFormattedDate(DateTime dt,{String patterm='EEE MMM dd,yyyy'}){

  return DateFormat(patterm).format(dt);
}

void showMsg(BuildContext context,String msg)=>
    ScaffoldMessenger.of(context).
    showSnackBar(SnackBar(content: Text(msg)));