import 'package:animate_do/animate_do.dart';
import 'package:animate_do_examples/src/pages/navigation_page.dart';
import 'package:animate_do_examples/src/pages/twitter_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class ExamplePage1 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: FadeIn(
          duration: Duration(milliseconds: 500),
          child: Text('Animate Do')),
        actions: <Widget>[
          IconButton(
            icon: FaIcon(FontAwesomeIcons.twitter) ,
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) { 
                return TwitterPage();
               }));
            },
          ),
          SlideInLeft(
            from: 50,
            child: IconButton(
              icon: FaIcon(FontAwesomeIcons.chevronRight) ,
              onPressed: (){
                Navigator.push(context, CupertinoPageRoute(builder: (BuildContext context) { 
                  return ExamplePage1();
                 }));
              },
            ),
          ),
        ],
      ),
      floatingActionButton: ElasticInRight(
        duration: Duration(milliseconds:1000),
        child: FloatingActionButton(
          child: FaIcon(FontAwesomeIcons.play),
          onPressed: (){
             Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) { 
                return NavigationPage();
               }));
          }
        ),
      ),


      body: Center(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElasticIn(
              delay: Duration(milliseconds: 1100 ),
              child: Icon(
                Icons.new_releases,
                color: Colors.blue,
                size: 40,
              ),
            ),
            FadeInDown(
              delay: Duration(milliseconds: 400),
              child: Text(
                "Titulo",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w200,
                ),
              ),
            ),
            FadeInDown(
              delay: Duration(milliseconds: 900),
              child: Text(
                "Soy un texto pequeño",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            FadeInLeft(
              delay: Duration(milliseconds: 1200),
              child: Container(
                width: 220,
                height: 2,
                color: Colors.blue,
              ),
            ),
          ],
        ),
     ),
   );
  }
}