import 'package:flutter/cupertino.dart';

class ModalProvider extends ChangeNotifier {
  bool isOpen = false;
  String content = "";

  void openModal(String content) {
    isOpen = true;
    this.content = content;
    notifyListeners();
  }

  void closeModal() {
    isOpen = false;
    notifyListeners();
  }
}
