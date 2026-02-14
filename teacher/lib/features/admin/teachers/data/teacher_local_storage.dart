import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import '../state/teacher_account_state.dart';

class TeacherLocalStorage {
  static const String _seedAssetPath = 'assets/data/teacher.json';
  static const String _fileName = 'teacher.json';

  Future<File> _getLocalFile() async {
    final dir = await getApplicationDocumentsDirectory();
    return File('${dir.path}/$_fileName');
  }

  Future<void> ensureInitialized() async {
    final file = await _getLocalFile();
    if (await file.exists()) return;

    try {
      final seed = await rootBundle.loadString(_seedAssetPath);
      await file.writeAsString(seed, flush: true);
    } catch (_) {
      await file.writeAsString('[]', flush: true);
    }
  }

  Future<List<TeacherAccountState>> readAll() async {
    await ensureInitialized();
    final file = await _getLocalFile();
    final raw = await file.readAsString();
    return TeacherAccountState.decodeList(raw);
  }

  Future<void> writeAll(List<TeacherAccountState> items) async {
    await ensureInitialized();
    final file = await _getLocalFile();
    final raw = TeacherAccountState.encodeList(items);
    await file.writeAsString(raw, flush: true);
  }

  Future<void> addTeacher(TeacherAccountState teacher) async {
    final all = await readAll();
    all.add(teacher);
    await writeAll(all);
  }

  Future<void> updateTeacher(TeacherAccountState updated) async {
    final all = await readAll();
    final idx = all.indexWhere((t) => t.id == updated.id);
    if (idx == -1) return;
    all[idx] = updated;
    await writeAll(all);
  }

  Future<void> deleteTeacher(String id) async {
    final all = await readAll();
    all.removeWhere((t) => t.id == id);
    await writeAll(all);
  }
}
