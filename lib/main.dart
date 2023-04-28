import 'package:firebase_core/firebase_core.dart';
import 'package:crud_memo/Screens/signin.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Screens/resetpassword.dart';
import 'firebase_options.dart';
import 'package:crud_memo/Screens/splashscreen.dart';
import 'package:crud_memo/Screens/signup.dart';
import 'package:crud_memo/Screens/home_Screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_database/firebase_database.dart';

// Future<void> main() async { 
//   // Initializing Firestore
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   // Home Widget
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       initialRoute: 'welcome',
//       title: 'Memo',
//       //home: MyHomePage(),
//       routes: {
//         'welcome': (context) => splashscreen(),
//         'home': (context) => SignInScreen(),
//         // 'register': (context) => myRegister(),
//       },
//     );
//   }
// }

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // Define the routes for each screen
  final Map<String, WidgetBuilder> routes = {
    '/': (context) => SplashScreen(),
    '/signup': (context) => SignUpScreen(),
    '/signin': (context) => SigninScreen(),
    '/resetpassword': (context) => ResetPassword(),
    '/main': (context) => HomeScreen(),
    // '/resetpassword': (context) => ResetPassword(),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nemo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      // Set the initial route to the Splash Screen
      initialRoute: '/',
      routes: routes,
    );
  }
}

final FirebaseAuth _auth = FirebaseAuth.instance;
Future<String?> signIn(String email, String password) async {
  try {
    UserCredential result = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
    User? user = result.user;
    return user?.uid;
  } catch (e) {
    print(e.toString());
    return null;
  }
}
