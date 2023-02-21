import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba_flutter_job/providers/appbarcontroller.dart';
import 'package:prueba_flutter_job/providers/titleController.dart';

import 'pages/home.dart';
import 'pages/information.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        //Para utilizar Provider en nuestra aplicación, debemos envolver nuestro widget principal en un widget ChangeNotifierProvider
        ChangeNotifierProvider(create: (context) => TitleController()),
        ChangeNotifierProvider(create: (context) => AppbarController()),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            brightness: Brightness.light,
          ),
          routes: {
            '/': (context) => const Home(),
            '/information': (context) => const Informacion(),
          }),
    );
  }
}
