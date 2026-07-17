import 'package:flutter/material.dart';

class ExportReportSheet extends StatefulWidget {
  const ExportReportSheet({super.key});

  @override
  State<ExportReportSheet> createState() => _ExportReportSheetState();
}

class _ExportReportSheetState extends State<ExportReportSheet> {
  String _reportType = 'يومي';
  String _exportFormat = 'Excel';
  bool _exporting = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Handle
            Center(
              child: Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Header
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFF22C55E), Color(0xFF4ADE80)],
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(Icons.upload_file_rounded,
                      color: Colors.white, size: 22),
                ),
                const SizedBox(width: 12),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'تصدير التقرير',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                        color: Color(0xFF1E293B),
                      ),
                    ),
                    Text(
                      'اختر نوع التقرير وصيغة التصدير',
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 24),
            // Report Type
            const Text(
              'نوع التقرير',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: Color(0xFF374151),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: ['يومي', 'أسبوعي', 'شهري'].map((type) {
                final isSelected = _reportType == type;
                return Expanded(
                  child: GestureDetector(
                    onTap: () => setState(() => _reportType = type),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      margin: const EdgeInsets.only(left: 8),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? const Color(0xFF2563EB)
                            : Colors.grey.shade50,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: isSelected
                              ? const Color(0xFF2563EB)
                              : Colors.grey.shade200,
                        ),
                      ),
                      child: Text(
                        type,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: isSelected
                              ? Colors.white
                              : Colors.grey.shade600,
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 20),
            // Format
            const Text(
              'صيغة التصدير',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: Color(0xFF374151),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                _FormatOption(
                  label: 'Excel',
                  icon: Icons.table_chart_rounded,
                  color: const Color(0xFF22C55E),
                  isSelected: _exportFormat == 'Excel',
                  onTap: () => setState(() => _exportFormat = 'Excel'),
                ),
                const SizedBox(width: 10),
                _FormatOption(
                  label: 'PDF',
                  icon: Icons.picture_as_pdf_rounded,
                  color: const Color(0xFFEF4444),
                  isSelected: _exportFormat == 'PDF',
                  onTap: () => setState(() => _exportFormat = 'PDF'),
                ),
                const SizedBox(width: 10),
                _FormatOption(
                  label: 'CSV',
                  icon: Icons.grid_on_rounded,
                  color: const Color(0xFF6366F1),
                  isSelected: _exportFormat == 'CSV',
                  onTap: () => setState(() => _exportFormat = 'CSV'),
                ),
              ],
            ),
            const SizedBox(height: 24),
            // Export Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _exporting
                    ? null
                    : () async {
                        setState(() => _exporting = true);
                        final messenger = ScaffoldMessenger.of(context);
                        final navigator = Navigator.of(context);
                        await Future.delayed(const Duration(seconds: 2));
                        if (!mounted) return;
                        navigator.pop();
                        messenger.showSnackBar(
                          SnackBar(
                            content: Text(
                                '✅ تم تصدير التقرير ال$_reportType بصيغة $_exportFormat بنجاح'),
                            backgroundColor: const Color(0xFF22C55E),
                            behavior: SnackBarBehavior.floating,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)),
                          ),
                        );
                      },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF22C55E),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 0,
                ),
                child: _exporting
                    ? const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 18,
                            height: 18,
                            child: CircularProgressIndicator(
                              strokeWidth: 2.5,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(width: 10),
                          Text('جاري التصدير...',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w700)),
                        ],
                      )
                    : Text(
                        'تصدير التقرير ال$_reportType كـ $_exportFormat',
                        style: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w700),
                      ),
              ),
            ),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}

class _FormatOption extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color color;
  final bool isSelected;
  final VoidCallback onTap;

  const _FormatOption({
    required this.label,
    required this.icon,
    required this.color,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(vertical: 14),
          decoration: BoxDecoration(
            color: isSelected ? color.withOpacity(0.1) : Colors.grey.shade50,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: isSelected ? color : Colors.grey.shade200,
              width: isSelected ? 2 : 1,
            ),
          ),
          child: Column(
            children: [
              Icon(icon,
                  size: 24,
                  color: isSelected ? color : Colors.grey.shade400),
              const SizedBox(height: 5),
              Text(
                label,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  color: isSelected ? color : Colors.grey.shade500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
