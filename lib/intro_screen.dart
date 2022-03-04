import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:studentlist/home.dart';
//import on board me dependency 

class IntroScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _IntroScreen();
  }
}

class _IntroScreen extends State<IntroScreen>{

  @override
  Widget build(BuildContext context) {

    //this is a page decoration for intro screen
    PageDecoration pageDecoration = PageDecoration(
          titleTextStyle: TextStyle(fontSize: 28.0, 
                    fontWeight: FontWeight.w700, 
                    color:Colors.white 
                  ), //tile font size, weight and color
          bodyTextStyle:TextStyle(fontSize: 19.0, color:Colors.white), 
          //body text size and color
          descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
          //decription padding
          imagePadding: EdgeInsets.all(20), //image padding
          boxDecoration:BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  stops: [0.1, 0.5, 0.7, 0.9],
                  colors: [
                    Colors.orange,
                    Colors.deepOrangeAccent,
                    Colors.red,
                    Colors.redAccent,
                  ],
            ),
          ), //show linear gradient background of page  
    );

    return IntroductionScreen(
          globalBackgroundColor: Colors.deepOrangeAccent,
          //main background of screen
          pages: [ //set your page view here
            PageViewModel(
              title: "Fractional shares",
              body: "Instead of having to buy an entire share, invest any amount you want.",
              image: introImage('assets/images/img1.png'),
              decoration: pageDecoration,
            ),
            PageViewModel(
              title: "Fractional shares",
              body: "Instead of having to buy an entire share, invest any amount you want.",
              image: introImage('assets/images/img2.png'),
              decoration: pageDecoration,
            ),
            PageViewModel(
              title: "Fractional shares",
              body: "Instead of having to buy an entire share, invest any amount you want.",
              image: introImage('assets/images/img3.png'),
              decoration: pageDecoration,
            ),

            //add more screen here
          ],

          onDone: () => goHomepage(context), //go to home page on done
          onSkip: () => goHomepage(context), // You can override on skip 
          showSkipButton: true,
          skipFlex: 0,
          nextFlex: 0,
          skip: Text('Skip', style: TextStyle(color: Colors.white),),
          next: Icon(Icons.arrow_forward, color: Colors.white,),
          done: Text('Getting Stated', style: TextStyle(
               fontWeight: FontWeight.w600, color:Colors.white
              ),),
          dotsDecorator: const DotsDecorator(
            size: Size(10.0, 10.0), //size of dots
            color: Colors.white, //color of dots
            activeSize: Size(22.0, 10.0),
            //activeColor: Colors.white, //color of active dot
            activeShape: RoundedRectangleBorder( //shave of active dot
              borderRadius: BorderRadius.all(Radius.circular(25.0)),
            ),
          ),
        );
  }

  void goHomepage(context){
     Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context){ 
           return Home();
        }
    ), (Route<dynamic> route) => false);
    //Navigate to home page and remove the intro screen history
    //so that "Back" button wont work.
  }

  Widget introImage(String assetName) {
  //widget to show intro image
    return Align(
      child: Image.asset('$assetName', width: 350.0),
      alignment: Alignment.bottomCenter,
    );
  }
}