import 'package:get/get.dart';
import '../state/payments_state.dart';

class PaymentsController extends GetxController {
  final Rx<PaymentsState> state = PaymentsState.initial.obs;

  @override
  void onInit() {
    super.onInit();
    _seed();
  }

  void _seed() {
    const overview = PaymentsOverview(
      pendingCount: 12,
      totalAmount: 250000,
      latestPaymentText: "مصطفى أحمد - 1,500 ج.م",
      failedCount: 3,
    );

    const rows = [
      PaymentRowModel(
        id: "#3352",
        fullName: "مصطفى أحمد هيكل",
        status: PaymentStatus.paid,
        method: "بطاقة ائتمان",
        date: "30-01-2026",
        amount: "1,500 ج.م",
        reason: "فلوس الدرس",
      ),
      PaymentRowModel(
        id: "#3351",
        fullName: "إبراهيم أحمد سند",
        status: PaymentStatus.failed,
        method: "فودافون كاش",
        date: "30-01-2026",
        amount: "500 ج.م",
        reason: "كورس خارجي",
      ),
      PaymentRowModel(
        id: "#3350",
        fullName: "هيام السيد مجدي",
        status: PaymentStatus.pending,
        method: "بايبال",
        date: "30-01-2026",
        amount: "750 ج.م",
        reason: "كورس خارجي",
      ),
    ];

    state.value = state.value.copyWith(overview: overview, rows: rows);
  }

  void openOverview() =>
      state.value = state.value.copyWith(mode: PaymentsViewMode.overview);

  void openTable() =>
      state.value = state.value.copyWith(mode: PaymentsViewMode.table);

  void setQuery(String q) => state.value = state.value.copyWith(query: q);

  List<PaymentRowModel> get filteredRows {
    final q = state.value.query.trim().toLowerCase();
    if (q.isEmpty) return state.value.rows;

    return state.value.rows.where((r) {
      final st = _statusText(r.status);
      return r.id.toLowerCase().contains(q) ||
          r.fullName.toLowerCase().contains(q) ||
          r.method.toLowerCase().contains(q) ||
          r.date.toLowerCase().contains(q) ||
          r.amount.toLowerCase().contains(q) ||
          r.reason.toLowerCase().contains(q) ||
          st.contains(q);
    }).toList();
  }

  String _statusText(PaymentStatus s) {
    switch (s) {
      case PaymentStatus.paid:
        return "تم الدفع";
      case PaymentStatus.pending:
        return "معلق";
      case PaymentStatus.failed:
        return "مرفوض";
    }
  }

  void onRowActions(PaymentRowModel row) {
    Get.snackbar("عملية", "فتح إجراءات ${row.id}");
  }
}
