import 'package:flutter/material.dart';

class StepBasicInfo extends StatefulWidget {
  const StepBasicInfo({super.key, required this.onNext});

  final VoidCallback onNext;

  @override
  State<StepBasicInfo> createState() => _StepBasicInfoState();
}

class _StepBasicInfoState extends State<StepBasicInfo> {
  final _formKey = GlobalKey<FormState>();

  final _fullName = TextEditingController();
  final _email = TextEditingController();
  final _phone = TextEditingController();
  final _password = TextEditingController();
  final _confirmPassword = TextEditingController();

  bool _obscure1 = true;
  bool _obscure2 = true;

  @override
  void dispose() {
    _fullName.dispose();
    _email.dispose();
    _phone.dispose();
    _password.dispose();
    _confirmPassword.dispose();
    super.dispose();
  }

  InputDecoration _dec(String hint) {
    return InputDecoration(
      hintText: hint,
      filled: true,
      fillColor: const Color(0xFFF3F4F6),
      contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(width: 1, color: Color(0xFF3B82F6)),
      ),
    );
  }

  Widget _label(String text, {String? sub}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          if (sub != null) ...[
            Text(
              sub,
              style: const TextStyle(fontSize: 10, color: Colors.black54),
            ),
            const SizedBox(width: 6),
          ],
          Text(
            text,
            style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w800),
            textAlign: TextAlign.right,
          ),
        ],
      ),
    );
  }

  Widget _stepsHeader() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _stepCircle("1", active: true),
            _stepLine(),
            _stepCircle("2", active: false),
            _stepLine(),
            _stepCircle("3", active: false),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            _StepChip(title: "البيانات الأساسية", active: true),
            SizedBox(width: 8),
            _StepChip(title: "البيانات التعليمية", active: false),
            SizedBox(width: 8),
            _StepChip(title: "الصلاحيات", active: false),
          ],
        ),
      ],
    );
  }

  Widget _stepCircle(String n, {required bool active}) {
    return Container(
      width: 26,
      height: 26,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: active ? const Color(0xFF1E3A8A) : Colors.white,
        borderRadius: BorderRadius.circular(13),
        border: Border.all(
          color: active ? const Color(0xFF1E3A8A) : const Color(0xFFCBD5E1),
          width: 1.2,
        ),
      ),
      child: Text(
        n,
        style: TextStyle(
          color: active ? Colors.white : const Color(0xFF475569),
          fontSize: 12,
          fontWeight: FontWeight.w800,
        ),
      ),
    );
  }

  Widget _stepLine() {
    return Container(
      width: 38,
      height: 2,
      margin: const EdgeInsets.symmetric(horizontal: 6),
      decoration: BoxDecoration(
        color: const Color(0xFFCBD5E1),
        borderRadius: BorderRadius.circular(2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xFFF5F6FA),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(14, 12, 14, 0),
            child: Column(
              children: [
                _stepsHeader(),
                const SizedBox(height: 14),

                Expanded(
                  child: SingleChildScrollView(
                    child: Container(
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(14),
                        boxShadow: const [
                          BoxShadow(
                            blurRadius: 10,
                            offset: Offset(0, 4),
                            color: Color(0x14000000),
                          ),
                        ],
                        border: Border.all(color: const Color(0xFFE5E7EB)),
                      ),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            const Text(
                              "إنشاء حساب جديد للمدرس",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            const SizedBox(height: 6),
                            const Text(
                              "إدخال بيانات المدرس وتحديد الصلاحيات قبل إنشاء الحساب",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.black54,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(height: 14),

                            _label("صورة الحساب"),
                            Container(
                              height: 56,
                              decoration: BoxDecoration(
                                color: const Color(0xFFF3F4F6),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    width: 46,
                                    height: 56,
                                    decoration: BoxDecoration(
                                      color: const Color(0xFF3B82F6),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: const Icon(
                                      Icons.upload,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  const Expanded(
                                    child: Text(
                                      "قم بتحميل صورة شخصية",
                                      style: TextStyle(
                                        color: Colors.black45,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            const SizedBox(height: 12),

                            _label("الاسم بالكامل"),
                            TextFormField(
                              controller: _fullName,
                              decoration: _dec("أدخل الاسم الكامل للمدرس"),
                              validator: (v) {
                                if (v == null || v.trim().isEmpty) {
                                  return "من فضلك أدخل الاسم";
                                }
                                return null;
                              },
                            ),

                            const SizedBox(height: 12),

                            _label("البريد الإلكتروني"),
                            TextFormField(
                              controller: _email,
                              keyboardType: TextInputType.emailAddress,
                              decoration: _dec("example@email.com"),
                              validator: (v) {
                                if (v == null || v.trim().isEmpty) {
                                  return "من فضلك أدخل البريد الإلكتروني";
                                }
                                if (!v.contains("@")) return "بريد غير صحيح";
                                return null;
                              },
                            ),

                            const SizedBox(height: 12),

                            _label("رقم الهاتف", sub: "(اختياري)"),
                            TextFormField(
                              controller: _phone,
                              keyboardType: TextInputType.phone,
                              decoration: _dec("أدخل رقم الهاتف (اختياري)"),
                            ),

                            const SizedBox(height: 12),

                            _label("كلمة المرور"),
                            TextFormField(
                              controller: _password,
                              obscureText: _obscure1,
                              decoration: _dec("أدخل كلمة المرور").copyWith(
                                suffixIcon: IconButton(
                                  onPressed: () =>
                                      setState(() => _obscure1 = !_obscure1),
                                  icon: Icon(
                                    _obscure1
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                  ),
                                ),
                              ),
                              validator: (v) {
                                if (v == null || v.isEmpty)
                                  return "أدخل كلمة المرور";
                                if (v.length < 8)
                                  return "يجب ألا تقل عن 8 أحرف";
                                return null;
                              },
                            ),

                            const SizedBox(height: 6),
                            const Text(
                              "• يجب أن تحتوي على 8 أحرف على الأقل، رقم وحرف كبير وصغير",
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                fontSize: 10,
                                color: Colors.black54,
                              ),
                            ),

                            const SizedBox(height: 12),

                            _label("تأكيد كلمة المرور"),
                            TextFormField(
                              controller: _confirmPassword,
                              obscureText: _obscure2,
                              decoration: _dec("أعد إدخال كلمة المرور للتحقق")
                                  .copyWith(
                                    suffixIcon: IconButton(
                                      onPressed: () => setState(
                                        () => _obscure2 = !_obscure2,
                                      ),
                                      icon: Icon(
                                        _obscure2
                                            ? Icons.visibility_off
                                            : Icons.visibility,
                                      ),
                                    ),
                                  ),
                              validator: (v) {
                                if (v == null || v.isEmpty)
                                  return "أعد إدخال كلمة المرور";
                                if (v != _password.text)
                                  return "كلمتا المرور غير متطابقتين";
                                return null;
                              },
                            ),

                            const SizedBox(height: 10),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 12),

                SizedBox(
                  width: double.infinity,
                  height: 54,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        widget.onNext();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF3B82F6),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 8,
                    ),
                    child: const Text(
                      "التالي",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 12),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _StepChip extends StatelessWidget {
  const _StepChip({required this.title, required this.active});

  final String title;
  final bool active;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
      decoration: BoxDecoration(
        color: active ? const Color(0xFF1E3A8A) : const Color(0xFFEFF6FF),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: active ? const Color(0xFF1E3A8A) : const Color(0xFF93C5FD),
        ),
      ),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w800,
          color: active ? Colors.white : const Color(0xFF1D4ED8),
        ),
      ),
    );
  }
}
