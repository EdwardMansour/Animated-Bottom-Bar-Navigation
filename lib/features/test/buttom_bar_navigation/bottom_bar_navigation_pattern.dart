import 'dart:ui';

import 'package:estatetial_interm_test/core/responsive/sizing_information.dart';
import 'package:flutter/material.dart';
import 'package:estatetial_interm_test/core/responsive/responsive_builder.dart';

import 'animated_buttom_bar.dart';

enum WhyFarther { harder, smarter, selfStarter, tradingCharter }

//!--Edward Mansour 08-10-2020

class BottomBarNavigation extends StatefulWidget {
  final List<BarItem> barItems = [
    BarItem(
      text: "Home",
      iconData: Icons.home,
      color: Colors.pinkAccent,
    ),
    BarItem(
      text: "Store",
      iconData: Icons.store,
      color: Colors.lightBlue,
    ),
    BarItem(
      text: "",
      iconData: Icons.add,
      color: Colors.teal,
    ),
    BarItem(
      text: "Explore",
      iconData: Icons.explore,
      color: Colors.yellow.shade600,
    ),
    BarItem(
      text: "Profile",
      iconData: Icons.person_outline,
      color: Colors.teal.shade300,
    ),
  ];

  @override
  _BottomBarNavigationState createState() => _BottomBarNavigationState();
}

class _BottomBarNavigationState extends State<BottomBarNavigation> {
  int selectedBarIndex = 0;
  bool showOrHide = false;
  bool showBottomMenu = false;
  bool showFloatingButton = true;
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (buildContext, sizingInformaion) {
        return Scaffold(
          appBar: AppBar(
            elevation: 13,
            backgroundColor: Colors.white,
            title: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              child: Text(
                'Estatetial, Internship test',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          body: GestureDetector(
            onTapUp: (details) {
              if (details.localPosition.dy <
                  sizingInformaion.localWidgetSize.height * 0.48) {
                if (showBottomMenu) {
                  this.setState(
                    () {
                      showBottomMenu = false;
                      showFloatingButton = true;
                    },
                  );
                }
              }
            },
            onPanEnd: (details) {
              if (details.velocity.pixelsPerSecond.dy > 100) {
                if (selectedBarIndex == 2) {
                  this.setState(
                    () {
                      showBottomMenu = false;
                      showFloatingButton = true;
                    },
                  );
                }
              } else if (details.velocity.pixelsPerSecond.dy < -100) {
                if (selectedBarIndex == 2) {
                  this.setState(
                    () {
                      showBottomMenu = true;
                      showFloatingButton = false;
                    },
                  );
                }
              }
            },
            child: Stack(
              children: [
                AnimatedContainer(
                  color: widget.barItems[selectedBarIndex].color,
                  duration: const Duration(milliseconds: 300),
                ),
                Opacity(
                  opacity: showBottomMenu && selectedBarIndex == 2 ? 1.0 : 0.0,
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 5.0,
                      sigmaY: 5.0,
                    ),
                    child: Container(
                      color: Colors.black.withOpacity(0.4),
                    ),
                  ),
                ),
                AnimatedPositioned(
                  curve: Curves.easeInOut,
                  duration: const Duration(milliseconds: 200),
                  left: 0,
                  bottom: selectedBarIndex == 2 && showOrHide && showBottomMenu
                      ? 0
                      : -(sizingInformaion.localWidgetSize.height * 0.3),
                  child: MenuBottom(
                    sizingInformation: sizingInformaion,
                  ),
                ),
              ],
            ),
          ),
          bottomNavigationBar: showOrHide
              ? FittedBox(
                  fit: BoxFit.contain,
                  child: BottomBar(
                    barItems: widget.barItems,
                    animationDuration: const Duration(milliseconds: 300),
                    barStyle: BarStyle(fontSize: 30, iconSize: 30),
                    onBarTap: (index) {
                      setState(() {
                        selectedBarIndex = index;
                        if (selectedBarIndex == 2) {
                          showBottomMenu = true;
                          showFloatingButton = false;
                        } else
                          showFloatingButton = true;
                      });
                    },
                  ),
                )
              : null,
          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
          floatingActionButton: showFloatingButton
              ? FloatingActionButton(
                  elevation: 13,
                  onPressed: () => setState(
                    () {
                      showOrHide = !showOrHide;
                    },
                  ),
                  child: showOrHide
                      ? Icon(Icons.keyboard_arrow_down)
                      : Icon(Icons.keyboard_arrow_up),
                )
              : null,
        );
      },
    );
  }
}

class MenuBottom extends StatelessWidget {
  final SizingInformation sizingInformation;
  const MenuBottom({Key key, this.sizingInformation}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        height: sizingInformation.localWidgetSize.height * 0.3,
        width: sizingInformation.localWidgetSize.width,
        child: Column(
          children: [
            Container(
              width: sizingInformation.localWidgetSize.width,
              height: sizingInformation.localWidgetSize.height / 10,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.camera_alt,
                      size: sizingInformation.localWidgetSize.width * 0.08,
                      color: Colors.grey.shade600,
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Use Camera',
                      style: TextStyle(
                        fontSize:
                            sizingInformation.localWidgetSize.width * 0.055,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: sizingInformation.localWidgetSize.width,
              height: sizingInformation.localWidgetSize.height / 10,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.photo_library,
                      size: sizingInformation.localWidgetSize.width * 0.08,
                      color: Colors.grey.shade600,
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Choose From Gallery',
                      style: TextStyle(
                        fontSize:
                            sizingInformation.localWidgetSize.width * 0.055,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: sizingInformation.localWidgetSize.width,
              height: sizingInformation.localWidgetSize.height / 10,
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.edit,
                      size: sizingInformation.localWidgetSize.width * 0.08,
                      color: Colors.grey.shade600,
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Write a story',
                      style: TextStyle(
                        fontSize:
                            sizingInformation.localWidgetSize.width * 0.055,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
