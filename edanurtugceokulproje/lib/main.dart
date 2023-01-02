/**import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:edanurtugceokulproje/kullanicisecim.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: secimyeri(),
    );
  }
}
*/



import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:edanurtugceokulproje/kullanicisecim.dart';




void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        // CHeck for Errors
        if (snapshot.hasError) {
          print("Something went Wrong");
        }
        // once Completed, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
            title: 'giriş ekranı',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            debugShowCheckedModeBanner: false,
            home: secimyeri(),
          );
        }
        return const CircularProgressIndicator();
      },
    );
  }
}


