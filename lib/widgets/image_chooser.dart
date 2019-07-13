import 'package:flutter/material.dart';
import '../constants.dart';
import 'reusable_card.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flare_flutter/flare_controls.dart';

class ImageChooser extends StatefulWidget {
  ImageChooser({this.frontImage});

  final Image frontImage;
  @override
  _ImageChooserState createState() => _ImageChooserState();
}

class _ImageChooserState extends State<ImageChooser> {
  
  final FlareControls _controls = FlareControls();
  Image _frontImage;
  String curAnimation = 'idle';
  //Future getImage()
  // upload from camera, gallery or search on pixabay!

  @override
  void initState() {
    _frontImage = widget.frontImage;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ReusableCard(
      color: kPinkColor,
      childPadding: 10,
      cardChild: Container(
        width: 340,
        //child: _frontImage == null ? kChooseImageText : _frontImage,
        child: Container(
          child: GestureDetector(
            onTap: _onTap,
            child: FlareActor(
              'assets/image_button.flr',
              animation: curAnimation,
              fit: BoxFit.contain,
              shouldClip: true,
              alignment: Alignment.bottomRight,
              controller: _controls,
            ),
          ),
        ),
      ),
    );
  }

  void _onTap() {
    setState(() {
      curAnimation = curAnimation == 'idle' ? 'onPressed' : 'idle';
    });
  }

}
