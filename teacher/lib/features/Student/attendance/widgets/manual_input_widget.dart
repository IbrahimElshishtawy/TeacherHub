import 'package:flutter/material.dart';

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
          color: const Color(0xFF0F172A),
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF6366F1).withOpacity(0.15),
              blurRadius: 40,
              spreadRadius: -5,
              offset: const Offset(0, 20),
            ),
          ],
        ),
        padding: const EdgeInsets.all(28),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Header
            Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFF6366F1), Color(0xFF8B5CF6)],
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(
                    Icons.fingerprint_rounded,
                    color: Colors.white,
                    size: 22,
                  ),
                ),
                const SizedBox(width: 14),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'إدخال يدوي',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        letterSpacing: -0.3,
                      ),
                    ),
                    Text(
                      'أدخل الرقم التعريفي مباشرةً',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 28),

            // Input Field
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              decoration: BoxDecoration(
                color: const Color(0xFF1E293B),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: _isFocused
                      ? const Color(0xFF6366F1)
                      : Colors.white.withOpacity(0.07),
                  width: _isFocused ? 1.5 : 1,
                ),
                boxShadow: _isFocused
                    ? [
                        BoxShadow(
                          color: const Color(0xFF6366F1).withOpacity(0.2),
                          blurRadius: 16,
                          spreadRadius: -2,
                        ),
                      ]
                    : [],
              ),
              child: TextField(
                controller: _controller,
                focusNode: _focusNode,
                textDirection: TextDirection.ltr,
                textAlign: TextAlign.left,
                keyboardType: TextInputType.text,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 1.5,
                ),
                cursorColor: const Color(0xFF6366F1),
                decoration: InputDecoration(
                  hintText: 'XXXX-XXXX-XXXX',
                  hintStyle: TextStyle(
                    color: Colors.white.withOpacity(0.2),
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 2,
                  ),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.only(right: 4),
                    child: Icon(
                      Icons.tag_rounded,
                      color: _isFocused
                          ? const Color(0xFF6366F1)
                          : Colors.white.withOpacity(0.25),
                      size: 20,
                    ),
                  ),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 18,
                    vertical: 18,
                  ),
                ),
                onSubmitted: (_) => _handleSubmit(),
              ),
            ),

            const SizedBox(height: 16),

            // Submit Button
            GestureDetector(
              onTapDown: (_) => _animController.forward(),
              onTapUp: (_) {
                _animController.reverse();
                _handleSubmit();
              },
              onTapCancel: () => _animController.reverse(),
              child: ScaleTransition(
                scale: _scaleAnim,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  width: double.infinity,
                  height: 56,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: _hasText
                          ? [const Color(0xFF6366F1), const Color(0xFF8B5CF6)]
                          : [const Color(0xFF1E293B), const Color(0xFF1E293B)],
                      begin: Alignment.centerRight,
                      end: Alignment.centerLeft,
                    ),
                    borderRadius: BorderRadius.circular(16),
                    border: _hasText
                        ? null
                        : Border.all(color: Colors.white.withOpacity(0.07)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.send_rounded,
                        color: _hasText
                            ? Colors.white
                            : Colors.white.withOpacity(0.25),
                        size: 18,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        'تأكيد الإدخال',
                        style: TextStyle(
                          color: _hasText
                              ? Colors.white
                              : Colors.white.withOpacity(0.25),
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          letterSpacing: -0.2,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Footer hint
            Center(
              child: Text(
                'اضغط Enter للتأكيد السريع',
                style: TextStyle(
                  color: Colors.white.withOpacity(0.2),
                  fontSize: 11,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
