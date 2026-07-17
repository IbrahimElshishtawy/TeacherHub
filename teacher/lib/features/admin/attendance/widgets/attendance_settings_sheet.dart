import 'package:flutter/material.dart';
import '../state/attendance_state.dart';

class AttendanceSettingsSheet extends StatefulWidget {
  final AttendanceSettings settings;
  final ValueChanged<AttendanceSettings> onSave;

  const AttendanceSettingsSheet({
    super.key,
    required this.settings,
    required this.onSave,
  });

  @override
  State<AttendanceSettingsSheet> createState() =>
      _AttendanceSettingsSheetState();
}

class _AttendanceSettingsSheetState extends State<AttendanceSettingsSheet> {
  late AttendanceSettings _current;

  @override
  void initState() {
    super.initState();
    _current = widget.settings;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.88,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
      ),
      child: Column(
        children: [
          const SizedBox(height: 12),
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          // Header
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFF2563EB), Color(0xFF60A5FA)],
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(Icons.settings_rounded,
                      color: Colors.white, size: 20),
                ),
                const SizedBox(width: 12),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'إعدادات الحضور',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                        color: Color(0xFF1E293B),
                      ),
                    ),
                    Text(
                      'خصّص نظام الحضور حسب احتياجاتك',
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          const Divider(height: 1),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _SettingsGroup(
                    title: 'طرق التسجيل',
                    icon: Icons.how_to_reg_rounded,
                    color: const Color(0xFF2563EB),
                    children: [
                      _ToggleTile(
                        label: 'تفعيل مسح QR',
                        subtitle: 'السماح بتسجيل الحضور عبر QR Code',
                        icon: Icons.qr_code_scanner_rounded,
                        value: _current.enableQrAttendance,
                        color: const Color(0xFF2563EB),
                        onChanged: (v) => setState(() =>
                            _current = _current.copyWith(enableQrAttendance: v)),
                      ),
                      _ToggleTile(
                        label: 'تفعيل التسجيل اليدوي',
                        subtitle: 'السماح بتسجيل الحضور يدوياً',
                        icon: Icons.edit_note_rounded,
                        value: _current.enableManualAttendance,
                        color: const Color(0xFF7C3AED),
                        onChanged: (v) => setState(() => _current =
                            _current.copyWith(enableManualAttendance: v)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  _SettingsGroup(
                    title: 'إعدادات التأخر',
                    icon: Icons.access_time_rounded,
                    color: const Color(0xFFF59E0B),
                    children: [
                      _ToggleTile(
                        label: 'السماح بالتأخر',
                        subtitle: 'تسجيل الطلاب المتأخرين كـ "متأخر"',
                        icon: Icons.access_time_filled_rounded,
                        value: _current.allowLateAttendance,
                        color: const Color(0xFFF59E0B),
                        onChanged: (v) => setState(() =>
                            _current = _current.copyWith(allowLateAttendance: v)),
                      ),
                      // Late threshold slider
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'حد التأخر (دقائق)',
                                  style: TextStyle(
                                    fontSize: 13.5,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF374151),
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 4),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFF59E0B)
                                        .withOpacity(0.15),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Text(
                                    '${_current.lateThresholdMinutes} دقيقة',
                                    style: const TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xFFF59E0B),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Slider(
                              value:
                                  _current.lateThresholdMinutes.toDouble(),
                              min: 5,
                              max: 60,
                              divisions: 11,
                              activeColor: const Color(0xFFF59E0B),
                              inactiveColor: const Color(0xFFF59E0B)
                                  .withOpacity(0.2),
                              onChanged: (v) => setState(() => _current =
                                  _current.copyWith(
                                      lateThresholdMinutes: v.round())),
                            ),
                          ],
                        ),
                      ),
                      _ToggleTile(
                        label: 'إغلاق الحضور تلقائياً',
                        subtitle:
                            'إيقاف التسجيل بعد انتهاء الوقت المحدد',
                        icon: Icons.lock_clock_rounded,
                        value: _current.autoCloseAttendance,
                        color: const Color(0xFFEF4444),
                        onChanged: (v) => setState(() => _current =
                            _current.copyWith(autoCloseAttendance: v)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  _SettingsGroup(
                    title: 'إشعارات أولياء الأمور',
                    icon: Icons.notifications_rounded,
                    color: const Color(0xFF22C55E),
                    children: [
                      _ToggleTile(
                        label: 'تفعيل الإشعارات',
                        subtitle: 'إرسال إشعارات WhatsApp لأولياء الأمور',
                        icon: Icons.chat_bubble_rounded,
                        value: _current.enableParentNotifications,
                        color: const Color(0xFF22C55E),
                        onChanged: (v) => setState(() => _current = _current
                            .copyWith(enableParentNotifications: v)),
                      ),
                      _ToggleTile(
                        label: 'إشعار عند الغياب',
                        subtitle: 'إعلام الولي عند تسجيل الغياب',
                        icon: Icons.cancel_rounded,
                        value: _current.notifyOnAbsent,
                        color: const Color(0xFFEF4444),
                        onChanged: (v) => setState(() =>
                            _current = _current.copyWith(notifyOnAbsent: v)),
                      ),
                      _ToggleTile(
                        label: 'إشعار عند التأخر',
                        subtitle: 'إعلام الولي عند تسجيل التأخر',
                        icon: Icons.access_time_rounded,
                        value: _current.notifyOnLate,
                        color: const Color(0xFFF59E0B),
                        onChanged: (v) => setState(() =>
                            _current = _current.copyWith(notifyOnLate: v)),
                      ),
                      _ToggleTile(
                        label: 'إشعار تأكيد الحضور',
                        subtitle: 'إعلام الولي عند تسجيل الحضور بنجاح',
                        icon: Icons.check_circle_rounded,
                        value: _current.notifyOnSuccess,
                        color: const Color(0xFF22C55E),
                        onChanged: (v) => setState(() =>
                            _current = _current.copyWith(notifyOnSuccess: v)),
                      ),
                      _ToggleTile(
                        label: 'تقرير يومي',
                        subtitle: 'إرسال ملخص حضور يومي للآباء',
                        icon: Icons.today_rounded,
                        value: _current.generateDailySummary,
                        color: const Color(0xFF2563EB),
                        onChanged: (v) => setState(() => _current =
                            _current.copyWith(generateDailySummary: v)),
                      ),
                      _ToggleTile(
                        label: 'تقرير أسبوعي',
                        subtitle: 'إرسال ملخص حضور أسبوعي للآباء',
                        icon: Icons.calendar_view_week_rounded,
                        value: _current.generateWeeklySummary,
                        color: const Color(0xFF6366F1),
                        onChanged: (v) => setState(() => _current =
                            _current.copyWith(generateWeeklySummary: v)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 28),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        widget.onSave(_current);
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF2563EB),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        elevation: 0,
                      ),
                      child: const Text(
                        'حفظ الإعدادات',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SettingsGroup extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;
  final List<Widget> children;

  const _SettingsGroup({
    required this.title,
    required this.icon,
    required this.color,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.shade100),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 14, 16, 8),
            child: Row(
              children: [
                Icon(icon, size: 18, color: color),
                const SizedBox(width: 8),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: color,
                  ),
                ),
              ],
            ),
          ),
          const Divider(height: 1),
          ...children,
        ],
      ),
    );
  }
}

class _ToggleTile extends StatelessWidget {
  final String label;
  final String subtitle;
  final IconData icon;
  final bool value;
  final Color color;
  final ValueChanged<bool> onChanged;

  const _ToggleTile({
    required this.label,
    required this.subtitle,
    required this.icon,
    required this.value,
    required this.color,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(icon, size: 18, color: color),
      ),
      title: Text(
        label,
        style: const TextStyle(
          fontSize: 13.5,
          fontWeight: FontWeight.w600,
          color: Color(0xFF1E293B),
        ),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(fontSize: 11.5, color: Colors.grey.shade500),
      ),
      trailing: Switch.adaptive(
        value: value,
        onChanged: onChanged,
        activeColor: color,
      ),
    );
  }
}
