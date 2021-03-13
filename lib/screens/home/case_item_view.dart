import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CaseItemView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CaseItemViewState();
  }
}

class _CaseItemViewState extends State<CaseItemView> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        color: Colors.red,
        child: Image.network(
          'https://picsum.photos/250?image=9',
          fit: BoxFit.cover,
        ),
      ),
    );

  }
}
