import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CaseItemView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CaseItemViewState();
  }
}

class _CaseItemViewState extends State<CaseItemView>
    with TickerProviderStateMixin {
  bool state = false;

  double _scaleFactor = 3.0;
  double _baseScaleFactor = 1.0;
  double scale = 3.3;
  bool shouldScaleDown = false; //
  @override
  Widget build(BuildContext context) {
    final ValueNotifier<Matrix4> notifier = ValueNotifier(Matrix4.identity());
    final width = 200.0;
    final height = 300.0;

    return GestureDetector(
      child: AnimatedContainer(
        color: Colors.blueAccent,
        width: width,
        height: height,
        duration: Duration(milliseconds: 100),
        transform: (shouldScaleDown
            ? (Matrix4.identity()
              ..translate(0.025 * width,
                  0.025 * height) // translate towards right and down
              ..scale(0.95,
                  0.95)) // scale with to 95% anchorred at topleft of the AnimatedContainer
            : Matrix4.identity()),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            child: Image.network(
              'https://picsum.photos/250?image=9',
              height: 200,
              width: 200,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
      onTap: () {
        print(shouldScaleDown.toString());
        shouldScaleDown = !shouldScaleDown;
        setState(() {});
      },
    );
    
  }
}
