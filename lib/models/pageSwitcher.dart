import 'dart:async';

import 'package:axie_scholarship/enums/pageType.dart';

class PageSwitcher {
  final StreamController<PageType> pageTypeController =
      StreamController<PageType>();

  Stream<PageType> get pageType => pageTypeController.stream;

  bool changePage({required PageType newPage}) {
    try {
      this.pageTypeController.add(newPage);
      return true;
    } catch (e) {
      return false;
    }
  }
}
