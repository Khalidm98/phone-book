import 'dart:io';

import 'package:flutter/material.dart';

import '../../utils/image_picker.dart';
import '../../utils/modal_sheet.dart';
import '../circle_image.dart';

class ImagePick extends FormField<File> {
  final double diameter;
  final String? initialImage;

  @override
  FormFieldState<File> createState() => _ImagePickState();

  ImagePick({
    super.key,
    super.enabled,
    super.onSaved,
    this.diameter = 144,
    this.initialImage,
    bool required = true,
    FormFieldValidator<File>? validator,
  }) : super(builder: (state) => (state as _ImagePickState).builder());
}

class _ImagePickState extends FormFieldState<File> {
  @override
  ImagePick get widget => super.widget as ImagePick;

  Widget builder() {
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            CircleImage(
              diameter: widget.diameter,
              initialImage: value?.path ?? widget.initialImage,
            ),
            Padding(
              padding: EdgeInsetsDirectional.only(
                start: widget.diameter - 44,
                top: widget.diameter - 44,
              ),
              child: ElevatedButton(
                onPressed: widget.enabled ? _change : () {},
                child: const Icon(Icons.edit),
                style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(),
                  minimumSize: const Size(40, 40),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Future<void> _change() async {
    showAppModalBottomSheet(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ModalSheetButton(
              label: 'Camera',
              icon: const Icon(Icons.camera_alt),
              onPressed: () async {
                final image = await captureImage();
                if (image != null) didChange(image);
              },
            ),
            ModalSheetButton(
              label: 'Gallery',
              icon: const Icon(Icons.photo),
              onPressed: () async {
                final image = await pickImage();
                if (image != null) didChange(image);
              },
            ),
          ],
        ),
      ],
    );
  }
}
