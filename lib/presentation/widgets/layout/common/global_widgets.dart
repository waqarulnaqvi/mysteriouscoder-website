import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void openUrl(String url) async{
  final Uri uri=Uri.parse(url);
  if(await canLaunchUrl(uri)){
    await launchUrl(uri);
  }
  else{
    throw 'Could not launch $url';
  }
}

SizedBox spacerH([double height = 20])  =>SizedBox(height: height);

SizedBox spacerW([double width = 20])  =>SizedBox(width: width);