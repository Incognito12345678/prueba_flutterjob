// ignore: file_names
import 'package:flutter/material.dart';

class TitleController extends ChangeNotifier {
  String titleC = 'informacion sobre criptomonedas';

  get getTitle {
    return titleC;
  }

  void changeTitle() {
    titleC = titleC == 'informacion sobre criptomonedas'
        ? 'information about cryptocurrencies'
        : 'informacion sobre criptomonedas';

    notifyListeners();
  }
/*if (titleC == 'informacion sobre criptomonedas') {
      titleC = 'information about cryptocurrencies';
    } else {
      titleC = 'informacion sobre criptomonedas';
    }*/
}
