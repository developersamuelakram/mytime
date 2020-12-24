import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:mytime/services/world_time.dart';




class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {


  void getData () async {

    WorldTime instance = WorldTime(flag: "thailand.png", url: 'Asia/Bangkok', location: 'Bangkok');

    await instance.getTime(); // we are running this method from our service class

    // as soon as this method is done we want it to go to our next screen which is homepage

    Navigator.pushReplacementNamed(context, '/home',
        arguments: {
      'location': instance.location,
      'time': instance.time,
      'flag': instance.flag,
      'url': instance.url,
      'isDaytime': instance.isDaytime
    });

    String shit = instance.time;

    print('shit is $shit');

  }

  // because we are getting data from an async method




  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
    print('init state ran');
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(
        child: SpinKitDualRing(

          size: 50.0,
          color: Colors.white ,

        ),
      ) ,




    );
  }
}
