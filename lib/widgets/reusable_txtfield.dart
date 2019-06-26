import 'package:flutter/material.dart';
import 'package:memtrix/constants.dart';

class ReusableTxtField extends StatefulWidget {
  ReusableTxtField({this.frontText});

  final String frontText;

  @override
  _ReusableTxtFieldState createState() => _ReusableTxtFieldState();
}

class _ReusableTxtFieldState extends State<ReusableTxtField> {
  String _frontText;

  @override
  void initState() {
    if (widget.frontText != '') 
      _frontText = widget.frontText;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //TODO: use EditableText instead
    return TextField(
      maxLines: null,
      expands: true,
      keyboardType: TextInputType.multiline,
      textInputAction: TextInputAction.done,
      textAlign: TextAlign.center,
      decoration: InputDecoration(
          //enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: kMainColor)),
          hintText: _frontText != null ? _frontText : 'Enter text ',
          hintStyle: TextStyle(color: kMainColor)),
      style: TextStyle(
        fontSize: 24,
        color: kMainColor,
      ),
      onChanged: (input) {
        setState(() {
          _frontText = input;
        });
      },
    );
  }
}
