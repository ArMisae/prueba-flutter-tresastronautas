import 'package:flutter/material.dart';
import 'package:prueba_flutter_nasa/routes/routes.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Prueba Flutter',
      initialRoute: 'home',
      routes: appRoutes,
    );
  }
}
