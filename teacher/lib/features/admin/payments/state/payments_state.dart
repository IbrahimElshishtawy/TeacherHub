enum PaymentsViewMode { overview, table }

class PaymentsOverview {
  final int pendingCount;
  final double totalAmount;
  final String latestPaymentText;
  final int failedCount;

  const PaymentsOverview({
    required this.pendingCount,
    required this.totalAmount,
    required this.latestPaymentText,
    required this.failedCount,
  });

  static const empty = PaymentsOverview(
    pendingCount: 0,
    totalAmount: 0,
    latestPaymentText: "",
    failedCount: 0,
  );

  PaymentsOverview copyWith({
    int? pendingCount,
    double? totalAmount,
    String? latestPaymentText,
    int? failedCount,
  }) {
    return PaymentsOverview(
      pendingCount: pendingCount ?? this.pendingCount,
      totalAmount: totalAmount ?? this.totalAmount,
      latestPaymentText: latestPaymentText ?? this.latestPaymentText,
      failedCount: failedCount ?? this.failedCount,
    );
  }
}

enum PaymentStatus { paid, pending, failed }

class PaymentRowModel {
  final String id;
  final String fullName;
  final String avatarUrl;

  final PaymentStatus status;
  final String method;
  final String date;
  final String amount;
  final String reason;

  const PaymentRowModel({
    required this.id,
    required this.fullName,
    this.avatarUrl = "",
    required this.status,
    required this.method,
    required this.date,
    required this.amount,
    required this.reason,
  });

  PaymentRowModel copyWith({
    String? id,
    String? fullName,
    String? avatarUrl,
    PaymentStatus? status,
    String? method,
    String? date,
    String? amount,
    String? reason,
  }) {
    return PaymentRowModel(
      id: id ?? this.id,
      fullName: fullName ?? this.fullName,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      status: status ?? this.status,
      method: method ?? this.method,
      date: date ?? this.date,
      amount: amount ?? this.amount,
      reason: reason ?? this.reason,
    );
  }
}

class PaymentsState {
  final PaymentsViewMode mode;
  final PaymentsOverview overview;
  final List<PaymentRowModel> rows;
  final String query;

  const PaymentsState({
    required this.mode,
    required this.overview,
    required this.rows,
    required this.query,
  });

  static const initial = PaymentsState(
    mode: PaymentsViewMode.overview,
    overview: PaymentsOverview.empty,
    rows: [],
    query: "",
  );

  PaymentsState copyWith({
    PaymentsViewMode? mode,
    PaymentsOverview? overview,
    List<PaymentRowModel>? rows,
    String? query,
  }) {
    return PaymentsState(
      mode: mode ?? this.mode,
      overview: overview ?? this.overview,
      rows: rows ?? this.rows,
      query: query ?? this.query,
    );
  }
}
