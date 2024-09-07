import 'package:firebase_core/firebase_core.dart';
import 'package:fisrt_app/firebase_options.dart';
import 'package:fisrt_app/services/auth/auth_gate.dart';
import 'package:flutter/material.dart';
import 'package:fisrt_app/themes/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:fisrt_app/models/store.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(
    MultiProvider(providers: [
      //theme provider
      ChangeNotifierProvider(create: (context) => ThemeProvider()),
      //Store provider
      ChangeNotifierProvider(create: (context) => Store()),
    ],
    child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const AuthGate(),
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}