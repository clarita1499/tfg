import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:page_indicator/page_indicator.dart';

class IntroPages extends HookWidget{
  static Widget create(BuildContext context) => IntroPages();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return PageIndicatorContainer(
        child: PageView(
          children: [
            Container(
              color: Colors.blue,
              child: Text("Página 1"),
            ),
            Container(
              color: Colors.grey,
              child: Text("Página 2"),
            ),
          ],
        ),
        length: 4,
        align: IndicatorAlign.bottom,
      indicatorSpace: 12,
    );
  }
}