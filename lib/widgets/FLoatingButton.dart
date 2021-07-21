import 'package:flutter/material.dart';

class FLoatButton extends StatelessWidget {
  final icon;
  final Function onPressAction;

  const FLoatButton({
    Key key,
    @required this.icon,
    @required this.onPressAction,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      //margin: EdgeInsets.only(bottom: 35.00),
      child: FloatingActionButton(
        onPressed: this.onPressAction,
        backgroundColor: Colors.purple[700],
        child: Icon(
          icon,
          color: Colors.white,
        ),
        // shape: OutlineInputBorder(
        //     borderSide: BorderSide(color: Colors.greenAccent[700], width: 8),
        //     borderRadius: BorderRadius.circular(50.0)),
      ),
    );
  }
}
