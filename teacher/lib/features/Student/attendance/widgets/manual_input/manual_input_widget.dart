import 'package:flutter/material.dart';

import 'manual_input_footer_hint.dart';
import 'manual_input_header.dart';
import 'manual_input_submit_button.dart';
import 'manual_input_text_field.dart';
import 'manual_input_theme.dart';

class ManualInputWidget extends StatefulWidget {
  final Function(String) onInput;

  const ManualInputWidget({super.key, required this.onInput});

  @override
  State<ManualInputWidget> createState() => _ManualInputWidgetState();
}

class _ManualInputWidgetState extends State<ManualInputWidget>
    with SingleTickerProviderStateMixin {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  late AnimationController _animController;
  late Animation<double> _scaleAnim;

  bool _isFocused = false;
  bool _hasText = false;

  @override
  void initState() {
    super.initState();

    _animController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 150),
    );

    _scaleAnim = Tween<double>(begin: 1.0, end: 0.96).animate(
      CurvedAnimation(parent: _animController, curve: Curves.easeInOut),
    );

    _focusNode.addListener(() {
      setState(() => _isFocused = _focusNode.hasFocus);
    });

    _controller.addListener(() {
      setState(() => _hasText = _controller.text.isNotEmpty);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    _animController.dispose();
    super.dispose();
  }

  void _handleSubmit() {
    if (_controller.text.trim().isEmpty) return;
    widget.onInput(_controller.text.trim());
    _controller.clear();
    _focusNode.unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        decoration: BoxDecoration(
          color: ManualInputTheme.cardBackground,
          borderRadius: BorderRadius.circular(ManualInputTheme.cardRadius),
          border: Border.all(color: ManualInputTheme.cardBorder),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(ManualInputTheme.cardShadowOpacity),
              blurRadius: 20,
              spreadRadius: -5,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        padding: const EdgeInsets.all(28),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const ManualInputHeader(),
            const SizedBox(height: 28),
            ManualInputTextField(
              controller: _controller,
              focusNode: _focusNode,
              isFocused: _isFocused,
              onSubmitted: _handleSubmit,
            ),
            const SizedBox(height: 16),
            ManualInputSubmitButton(
              hasText: _hasText,
              scaleAnimation: _scaleAnim,
              onTapDown: () => _animController.forward(),
              onTapUp: () {
                _animController.reverse();
                _handleSubmit();
              },
              onTapCancel: () => _animController.reverse(),
            ),
            const SizedBox(height: 16),
            const ManualInputFooterHint(),
          ],
        ),
      ),
    );
  }
}
