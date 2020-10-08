import 'package:flutter/cupertino.dart';

//!--Edward Mansour 08-10-2020

class SizingInformation {
  final Size screenSize;
  final Size localWidgetSize;

  SizingInformation({
    this.screenSize,
    this.localWidgetSize,
  });

  @override
  String toString() {
    return 'Screen size:$screenSize , Local widget size:$localWidgetSize .';
  }
}
