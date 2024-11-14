import 'package:flutter/material.dart';

class ImageSlider extends StatelessWidget {
  const ImageSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset("assets/images/sliderImage1.jpg"),
    );
  }
}
