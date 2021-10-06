import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

handleRead(url) async {
  if (await canLaunch(url)) {
    return launch(url);
  } else {
    throw 'cannot launch $url';
  }
}
