// ignore_for_file: public_member_api_docs

import 'dart:convert';

class TeacherAccountState {
  // ====== Core ======
  final String id;
  final bool isActive;
  final String createdAt; // ISO String
  final String? selectedOption; // new_account / disable_current / ...

  // ====== Basic Info (Step 1) ======
  final String fullName;
  final String email;
  final String? phone;
  final String? avatarPath; // file path or url
  final String? password; // (غير مفضل تخزينها محليًا)

  // ====== Academic Info (Step 2) ======
  final List<String> stages;
  final List<String> grades;
  final List<String> subjects;

  // ====== Permissions (Step 3) ======
  final Map<String, bool> permissions;

  // ====== UI helpers (اختياري) ======
  final bool? isOptionSelected;

  const TeacherAccountState({
    required this.id,
    required this.isActive,
    required this.createdAt,
    required this.fullName,
    required this.email,
    this.phone,
    this.avatarPath,
    this.password,
    this.selectedOption,
    this.stages = const [],
    this.grades = const [],
    this.subjects = const [],
    this.permissions = const {},
    this.isOptionSelected,
  });

  String get avatarUrl => avatarPath ?? '';

  String get createdAtLabel => createdAt;
  String get stageLabel {
    if (stages.isEmpty) return '';
    return stages.join(' • ');
  }

  String get subjectsLabel {
    if (subjects.isEmpty) return '';
    return subjects.join(' • ');
  }

  TeacherAccountState copyWith({
    String? id,
    bool? isActive,
    String? createdAt,
    String? fullName,
    String? email,
    String? phone,
    String? avatarPath,
    String? password,
    String? selectedOption,
    List<String>? stages,
    List<String>? grades,
    List<String>? subjects,
    Map<String, bool>? permissions,
    bool? isOptionSelected,
  }) {
    return TeacherAccountState(
      id: id ?? this.id,
      isActive: isActive ?? this.isActive,
      createdAt: createdAt ?? this.createdAt,
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      avatarPath: avatarPath ?? this.avatarPath,
      password: password ?? this.password,
      selectedOption: selectedOption ?? this.selectedOption,
      stages: stages ?? this.stages,
      grades: grades ?? this.grades,
      subjects: subjects ?? this.subjects,
      permissions: permissions ?? this.permissions,
      isOptionSelected: isOptionSelected ?? this.isOptionSelected,
    );
  }

  // ---------------- JSON ----------------

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "isActive": isActive,
      "createdAt": createdAt,
      "selectedOption": selectedOption,
      "fullName": fullName,
      "email": email,
      "phone": phone,
      "avatarPath": avatarPath,
      "password": password,
      "stages": stages,
      "grades": grades,
      "subjects": subjects,
      "permissions": permissions,
    };
  }

  static TeacherAccountState fromJson(Map<String, dynamic> json) {
    final permissionsRaw = (json["permissions"] is Map)
        ? Map<String, dynamic>.from(json["permissions"] as Map)
        : <String, dynamic>{};

    return TeacherAccountState(
      id: (json["id"] ?? "").toString(),
      isActive: (json["isActive"] ?? false) == true,
      createdAt: (json["createdAt"] ?? "").toString(),
      selectedOption: json["selectedOption"]?.toString(),
      fullName: (json["fullName"] ?? "").toString(),
      email: (json["email"] ?? "").toString(),
      phone: json["phone"]?.toString(),
      avatarPath: json["avatarPath"]?.toString(),
      password: json["password"]?.toString(),
      stages: (json["stages"] is List)
          ? List<String>.from((json["stages"] as List).map((e) => e.toString()))
          : const [],
      grades: (json["grades"] is List)
          ? List<String>.from((json["grades"] as List).map((e) => e.toString()))
          : const [],
      subjects: (json["subjects"] is List)
          ? List<String>.from(
              (json["subjects"] as List).map((e) => e.toString()),
            )
          : const [],
      permissions: permissionsRaw.map((k, v) => MapEntry(k, v == true)),
    );
  }

  // helpers لقراءة/كتابة قائمة المدرسين
  static String encodeList(List<TeacherAccountState> items) {
    final list = items.map((e) => e.toJson()).toList();
    return jsonEncode(list);
  }

  static List<TeacherAccountState> decodeList(String raw) {
    final decoded = jsonDecode(raw);
    if (decoded is! List) return [];
    return decoded
        .map((e) => TeacherAccountState.fromJson(Map<String, dynamic>.from(e)))
        .toList();
  }
}
