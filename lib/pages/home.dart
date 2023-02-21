import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/peticionApi.dart';
import '../providers/appbarcontroller.dart';
import '../providers/titleController.dart';

//este widget escucha los cambios de estado de los providers
class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    // se obtiene el estado del tema
    final cambiartitulo = Provider.of<TitleController>(context);
    final cambiarcolor = Provider.of<AppbarController>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: cambiarcolor.getColor,
        elevation: 3,
        //centerTitle: true,
        title: Text(cambiartitulo.titleC,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
            )),

        leading: IconButton(
          icon: const Icon(
            Icons.colorize,
            color: Colors.white,
          ),
          onPressed: () {
            cambiarcolor.changeColor();
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.language,
              color: Colors.white,
            ),
            onPressed: () {
              cambiartitulo.changeTitle();
            },
          ),
        ],
      ),
      body: const Peticion(),
    );
  }
}
