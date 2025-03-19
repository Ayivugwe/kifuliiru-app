import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'home.dart';
//import on board me dependency

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _IntroScreen();
  }
}

class _IntroScreen extends State<IntroScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    PageDecoration pageDecoration = PageDecoration(
      titleTextStyle: theme.textTheme.headlineLarge ?? const TextStyle(
        fontSize: 28.0,
        fontWeight: FontWeight.w700,
        color: Colors.black,
      ),
      bodyTextStyle: theme.textTheme.bodyLarge ?? const TextStyle(
        fontSize: 20.0,
        color: Colors.black,
      ),
      bodyPadding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 10.0),
      imagePadding: const EdgeInsets.all(10),
      boxDecoration: BoxDecoration(
        color: theme.colorScheme.surface,
      ),
    );

    return IntroductionScreen(
      globalBackgroundColor: theme.colorScheme.secondary,
      pages: [
        PageViewModel(
          title: "Muyegerere",
          body: "Muyegerere, tumenye indeto yitu Kifuliiru.  Guno mukolwa guli hano higulu lye'Kifuliiru ndeto yitu.",
          image: introImage('assets/images/img1.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Ibufuliiru",
          body: "Muyegerere, tumenye indeto imwitu Ibufuliiru.",
          image: introImage('assets/images/img2.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Kifuliiru",
          body: "Muyegerere, tumenye imwitu Ibufuliiru.",
          image: introImage('assets/images/img3.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Bafuliiru",
          body: "Muyegerere, tumenye abandu bitu Bafuliiru.",
          image: introImage('assets/images/img4.png'),
          decoration: pageDecoration,
        ),
      ],
      onDone: () => goHomepage(context),
      onSkip: () => goHomepage(context),
      showSkipButton: true,
      dotsFlex: 0,
      nextFlex: 0,
      skip: Text(
        'Gwajika',
        style: TextStyle(color: theme.colorScheme.onSecondary),
      ),
      next: Icon(
        Icons.arrow_forward,
        color: theme.colorScheme.onSecondary,
      ),
      done: Text(
        'Gwajika',
        style: TextStyle(
          fontWeight: FontWeight.w600,
          color: theme.colorScheme.onSecondary,
        ),
      ),
      dotsDecorator: DotsDecorator(
        size: const Size(10.0, 10.0),
        color: theme.colorScheme.onSecondary,
        activeSize: const Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
      ),
    );
  }

  void goHomepage(context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const Home()),
    );
  }

  Widget introImage(String assetName) {
    //widget to show intro image
    return Align(
      alignment: Alignment.bottomCenter,
      child: Image.asset(assetName, width: 350.0),
    );
  }
}
