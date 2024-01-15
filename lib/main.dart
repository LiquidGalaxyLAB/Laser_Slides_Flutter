import 'package:flutter/material.dart';
import 'package:laser_slides_flutter/ui/home/EditButtonConfig.dart';
import 'package:laser_slides_flutter/ui/splashScreen/SplashScreen.dart';

import 'injectionContainer.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Container(
        child:  SplashScreen(),
      ),

    );
  }
}

