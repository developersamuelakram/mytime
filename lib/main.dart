import 'package:flutter/material.dart';
import 'package:mytime/pages/chooselocation.dart';
import 'package:mytime/pages/home.dart';
import 'package:mytime/pages/loading.dart';

void main() => runApp (MaterialApp(

  initialRoute: '/',
  routes: {

    '/': (context)=> Loading(),
    '/home': (context)=> HomePage(),
    '/chooselocation': (context)=> ChooseLocation(),


  },
));
