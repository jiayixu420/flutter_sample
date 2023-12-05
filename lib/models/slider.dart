import 'package:flutter/material.dart';

class SliderImage {
  int? id;
  String? description;
  String? description2;
  String? image;
  Size? size;
  String? route;
  String? btnTxt;
  IconData? icon;
  double? height;
  double? width;

  SliderImage.init();

  SliderImage({
    required this.description,
    required this.image,
    required this.id,
    required this.size,
    required this.route,
    required this.btnTxt,
    this.description2,
    this.icon,
    this.height,
    this.width,
  });
}
