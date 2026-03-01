import 'package:get/get.dart';
import '../state/subject_teacher_state.dart';

class SubjectTeacherController extends GetxController {
  final _state = const SubjectTeacherState().obs;
  SubjectTeacherState get state => _state.value;

  // بيانات تجريبية (بدّلها بالـ API)
  final subjects = const <SubjectModel>[
    SubjectModel(
      id: "ar",
      name: "اللغة العربية",
      iconAsset: "assets/icons/ar.png",
    ),
    SubjectModel(
      id: "en",
      name: "اللغة الإنجليزية",
      iconAsset: "assets/icons/en.png",
    ),
    SubjectModel(
      id: "chem",
      name: "الكيمياء",
      iconAsset: "assets/icons/chem.png",
    ),
    SubjectModel(
      id: "fr",
      name: "اللغة الفرنسية",
      iconAsset: "assets/icons/fr.png",
    ),
    SubjectModel(
      id: "math",
      name: "الرياضيات",
      iconAsset: "assets/icons/math.png",
    ),
    SubjectModel(
      id: "phy",
      name: "الفيزياء",
      iconAsset: "assets/icons/phy.png",
    ),
    SubjectModel(id: "bio", name: "الأحياء", iconAsset: "assets/icons/bio.png"),
  ];

  // ممكن تربطها حسب المادة
  List<TeacherModel> teachersForSubject(String subjectId) {
    return const [
      TeacherModel(
        id: "t1",
        name: "أ/ محمد أحمد",
        avatarUrl: "https://i.pravatar.cc/300?img=12",
        available: true,
        gradeText: "الصف الثالث الثانوي",
        stageText: "المرحلة الثانوية",
        studentsCount: 300,
      ),
      TeacherModel(
        id: "t2",
        name: "أ/ محمد أحمد",
        avatarUrl: "https://i.pravatar.cc/300?img=13",
        available: false,
        gradeText: "الصف الثالث الثانوي",
        stageText: "المرحلة الثانوية",
        studentsCount: 600,
      ),
      TeacherModel(
        id: "t3",
        name: "أ/ محمد أحمد",
        avatarUrl: "https://i.pravatar.cc/300?img=14",
        available: true,
        gradeText: "الصف الثالث الثانوي",
        stageText: "المرحلة الثانوية",
        studentsCount: 300,
      ),
    ];
  }

  TeacherModel? selectedTeacher(String subjectId) =>
      state.selectedTeachers[subjectId];

  void setTeacherForSubject(String subjectId, TeacherModel teacher) {
    final newMap = Map<String, TeacherModel>.from(state.selectedTeachers);
    newMap[subjectId] = teacher;
    _state.value = state.copyWith(selectedTeachers: newMap);
  }

  bool get hasAnySelection => state.selectedTeachers.isNotEmpty;
}
