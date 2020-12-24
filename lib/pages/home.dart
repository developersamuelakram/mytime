import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Map data = {};

  @override
  Widget build(BuildContext context) {

    // tenaray if the data is empty then
    // display the hardcoded location's time
    // otherwise update it.
    data = data.isNotEmpty ? data:ModalRoute.of(context).settings.arguments;
    String bgImage = data['isDaytime'] ? 'daytime.png': 'nighttime.png';


    return Scaffold(

      body: SafeArea(
        child: Container(
        decoration: BoxDecoration(
        image: DecorationImage (
        image: AssetImage('assets/$bgImage'),
        fit: BoxFit.cover,
    ),
    ),

    child: Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
            child: Column(
              children: <Widget> [

                FlatButton.icon(
                  icon: Icon(Icons.location_on,
                      color: Colors.black),
                  label: Text('Update Location',
                  style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black

                  ),), onPressed: ()  async {

                    // push named just for when its poping up
                  // receciving values
                  //pushreplacementnamed when its not a pop
                    dynamic result = await Navigator.pushNamed(context, '/chooselocation');
                    // set state method

                  setState(() {

                    data = {

                      'location': result['location'],
                      'time': result['time'],
                      'isDaytime': result['isDaytime'],
                      'flag': result['flag'],
                      'url': result['url'],

                    };

                  });
                  },
                ),

                SizedBox(height: 20.0),

                Text(
                  data['location'],
                  style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold
                ),
                ),

                SizedBox(height: 20.0),

                Text(
                  data['time'],
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold
                ),
                ),










              ],
            ),
          ),
        ),
      ),

      ),


    );
  }
}
