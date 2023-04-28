// // import 'dart:async';
//this is a comment
// // import 'package:flutter/material.dart';
// // import 'package:crud_memo/Screens/login.dart';

// // class splashscreen extends StatefulWidget {
// //   const splashscreen({Key? key}) : super(key: key);

// //   @override
// //   _MyHomePageState createState() => _MyHomePageState();
// // }

// // class _MyHomePageState extends State<splashscreen> {
// //   @override
// //   void initState() {
// //     super.initState();
// //     Timer(
// //         Duration(seconds: 3),
// //         () => Navigator.pushReplacement(
// //             context, MaterialPageRoute(builder: (context) => MyLogin())));
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Container(
// //         color: Colors.blue,
// //         child: FlutterLogo(size: MediaQuery.of(context).size.height));
// //   }
// // }

// import 'dart:async';
// import 'package:crud_memo/Screens/signin.dart';
// import 'package:flutter/material.dart';
// import 'package:crud_memo/Screens/signup.dart';

// class SplashScreen extends StatefulWidget {
//   @override
//   _SplashScreenState createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   void initState() {
//     super.initState();

//     Timer(Duration(seconds: 3), () {
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (context) => SigninScreen()),
//       );
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Text('Nemo'),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Delay screen transition by 3 seconds
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/signin');
    });
  }

  @override
  Widget build(BuildContext context) {
    timeDilation = 1.0; // Set animation speed
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.black, Colors.black],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Image.asset(
              //   'logo.png',
              //   height: 120.0,
              //   width: 120.0,
              // ),
              SizedBox(height: 24.0),
              Text(
                'Nemo',
                style: TextStyle(
                    fontSize: 36.0,
                    fontWeight: FontWeight.bold,
                    foreground: Paint()
                      ..shader = LinearGradient(colors: <Color>[
                        Colors.black,
                        Colors.blue,
                        Colors.green,
                        // Colors.green,
                        // Colors.blue,
                        // Colors.indigo,
                        // Colors.purple,
                      ]).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0)),
                    shadows: [
                      Shadow(
                        blurRadius: 0.0,
                        color: Colors.grey,
                        offset: Offset(0, 0.0),
                      ),
                    ]),
              ),
              Text('A memo for notes',
                  style: TextStyle(
                    fontSize: 21.0,
                    fontWeight: FontWeight.normal,
                    color: Colors.grey,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
