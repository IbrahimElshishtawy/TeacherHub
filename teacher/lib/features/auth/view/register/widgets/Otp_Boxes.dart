// ignore_for_file: file_names

import 'package:flutter/material.dart';

/// OTP Boxes احترافي + Paste + Responsive
class OtpBoxes extends StatefulWidget {
  final TextEditingController controller;
  final int length;
  final Color primaryColor;

  const OtpBoxes({
    super.key,
    required this.controller,
    this.length = 4,
    required this.primaryColor,
  });

  @override
  State<OtpBoxes> createState() => _OtpBoxesState();
}

class _OtpBoxesState extends State<OtpBoxes> {
  late final List<FocusNode> nodes;
  late final List<TextEditingController> ctrls;

  @override
  void initState() {
    super.initState();
    nodes = List.generate(widget.length, (_) => FocusNode());
    ctrls = List.generate(widget.length, (_) => TextEditingController());

    final old = widget.controller.text.trim();
    for (int i = 0; i < widget.length; i++) {
      if (i < old.length) ctrls[i].text = old[i];
    }
  }

  @override
  void dispose() {
    for (final n in nodes) {
      n.dispose();
    }
    for (final c in ctrls) {
      c.dispose();
    }
    super.dispose();
  }

  void sync() {
    widget.controller.text = ctrls.map((c) => c.text).join();
  }

  InputDecoration deco() => InputDecoration(
    counterText: "",
    filled: true,
    fillColor: Colors.white,
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: Colors.grey.shade300),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: widget.primaryColor, width: 1.8),
    ),
    contentPadding: EdgeInsets.zero,
  );

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final boxW = ((w - 32 - 20) / widget.length).clamp(
      44.0,
      58.0,
    ); // responsive

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(widget.length, (i) {
        return SizedBox(
          width: boxW,
          height: 54,
          child: TextField(
            controller: ctrls[i],
            focusNode: nodes[i],
            maxLength: 1,
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 18),
            decoration: deco(),
            onChanged: (v) {
              // دعم Paste: لو المستخدم لصق كود كامل
              if (v.length > 1) {
                final paste = v.replaceAll(RegExp(r'\D'), '');
                for (int k = 0; k < widget.length; k++) {
                  ctrls[k].text = k < paste.length ? paste[k] : '';
                }
                sync();
                FocusScope.of(context).unfocus();
                setState(() {});
                return;
              }

              if (v.isNotEmpty) {
                if (i < widget.length - 1) {
                  FocusScope.of(context).requestFocus(nodes[i + 1]);
                } else {
                  FocusScope.of(context).unfocus();
                }
              } else {
                if (i > 0) FocusScope.of(context).requestFocus(nodes[i - 1]);
              }
              sync();
            },
          ),
        );
      }),
    );
  }
}
