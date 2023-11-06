import 'dart:io';

import 'package:flutter/material.dart';

class CircleImage extends StatelessWidget {
  final double diameter;
  final String? initialImage;

  const CircleImage({
    super.key,
    this.diameter = 144,
    this.initialImage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: diameter,
      height: diameter,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        // border: Border.all(color: Palette.primary, width: 2),
        border: Border.all(width: 2),
        image: DecorationImage(fit: BoxFit.contain, image: _getImage()),
      ),
    );
  }

  ImageProvider _getImage() {
    final initial = initialImage;
    if (initial == null) return const AssetImage('assets/images/person.png');
    if (initial.startsWith('/')) return FileImage(File(initial));
    return NetworkImage(initial);
  }
}
