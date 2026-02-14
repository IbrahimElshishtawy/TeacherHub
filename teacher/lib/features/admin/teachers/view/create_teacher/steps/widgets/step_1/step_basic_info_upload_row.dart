import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class StepBasicInfoUploadRow extends StatefulWidget {
  final Color borderColor;
  final Color hintColor;
  final ValueChanged<XFile?>? onPicked;

  const StepBasicInfoUploadRow({
    super.key,
    required this.borderColor,
    required this.hintColor,
    this.onPicked,
  });

  @override
  State<StepBasicInfoUploadRow> createState() => _StepBasicInfoUploadRowState();
}

class _StepBasicInfoUploadRowState extends State<StepBasicInfoUploadRow> {
  final ImagePicker _picker = ImagePicker();
  XFile? _image;

  Future<void> _pickImage() async {
    try {
      final file = await _picker.pickImage(
        source: ImageSource.gallery, // أو ImageSource.camera
        imageQuality: 85,
      );
      if (!mounted) return;

      setState(() => _image = file);
      widget.onPicked?.call(file);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _pickImage,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        height: 52,
        decoration: BoxDecoration(
          color: const Color(0xFFF7F9FD),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: widget.borderColor),
        ),
        child: Row(
          children: [
            Container(
              width: 52,
              height: 52,
              decoration: BoxDecoration(
                color: const Color(0xFF2F6FED),
                borderRadius: BorderRadius.circular(10),
              ),
              child: _image == null
                  ? IconButton(
                      onPressed: _pickImage,
                      icon: const Icon(
                        Icons.upload_rounded,
                        color: Colors.white,
                        size: 22,
                      ),
                    )
                  : ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.file(File(_image!.path), fit: BoxFit.cover),
                    ),
            ),
            const SizedBox(width: 10),

            Expanded(
              child: Text(
                _image == null ? 'قم بتحميل صورة شخصية' : 'تم اختيار صورة ✅',
                style: TextStyle(
                  fontSize: 12,
                  color: widget.hintColor,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.right,
              ),
            ),

            if (_image != null) ...[
              IconButton(
                onPressed: () {
                  setState(() => _image = null);
                  widget.onPicked?.call(null);
                },
                icon: const Icon(Icons.close, size: 18),
                color: const Color(0xFF6B7C93),
              ),
            ],

            const SizedBox(width: 6),
          ],
        ),
      ),
    );
  }
}
