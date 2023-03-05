import 'package:flutter/material.dart';

class BotonNuevaContrasena with ChangeNotifier {
  bool _ocultarContra = false;

  get ocultar {
    return _ocultarContra;
  }

  set esOcultar(bool oculto) {
    _ocultarContra = oculto;
    notifyListeners();
  }
}
