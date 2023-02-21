//Provider es un paquete de administración de estados
//que hace que sea fácil compartir
//información entre widgets

//este es el estado de nuestro appbar
import 'package:flutter/material.dart';

class AppbarController extends ChangeNotifier {
  Color _colorv = Colors.blue;

  get getColor {
    return _colorv;
  }

  void changeColor() {
    _colorv = _colorv == Colors.blue
        ? const Color.fromARGB(255, 244, 54, 203)
        : Colors.blue;
    //notifica a los widgets dependientes que los datos han cambiado.
    notifyListeners();
  }
}
/* if (_colorv == Colors.blue) {
      _colorv = const Color.fromARGB(255, 244, 54, 203);
    } else {
      _colorv = Colors.blue;
    }*/