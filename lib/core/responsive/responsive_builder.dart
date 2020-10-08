import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'sizing_information.dart';

//!--Edward Mansour 08-10-2020

class ResponsiveBuilder extends StatelessWidget {
  final Widget Function(
    BuildContext buildContext,
    SizingInformation sizingInformaion,
  ) builder;

  const ResponsiveBuilder({Key key, this.builder}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, boxConstraints) {
      var mediaQuery = MediaQuery.of(context);
      var sizingInformation = SizingInformation(
        screenSize: mediaQuery.size,
        localWidgetSize:
            Size(boxConstraints.maxWidth, boxConstraints.maxHeight),
      );
      return builder(context, sizingInformation);
    });
  }
}
