
import 'package:flutter/material.dart';

class NavbarVisibilityProvider with ChangeNotifier {
  bool _isNavBarVisible = true;

  bool get isNavBarVisible => _isNavBarVisible;

  void hideNavBar() {
    _isNavBarVisible = false;
    notifyListeners();
  }

  void showNavBar() {
    _isNavBarVisible = true;
    notifyListeners();
  }
}
