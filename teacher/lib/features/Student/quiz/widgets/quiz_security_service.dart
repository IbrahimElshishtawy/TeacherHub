import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:teacher/features/Student/quiz/state/quiz_guard_state.dart';

class QuizSecurityService {
  static const MethodChannel _channel = MethodChannel(
    'teacher/quiz_security',
  );

  static Future<void> enableSecureMode() async {
    await SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

    try {
      await _channel.invokeMethod<void>('enableSecureMode');
    } on PlatformException {
      // Ignore platform failures to keep the exam flow usable on unsupported targets.
    }
  }

  static Future<void> disableSecureMode() async {
    await SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

    try {
      await _channel.invokeMethod<void>('disableSecureMode');
    } on PlatformException {
      // Ignore platform failures to keep the exam flow usable on unsupported targets.
    }
  }

  static Future<QuizDeviceInfo> getDeviceInfo() async {
    if (!defaultTargetPlatform.name.toLowerCase().contains('android')) {
      return const QuizDeviceInfo(
        isPhysicalDevice: false,
        deviceLabel: 'الاختبار الآمن مدعوم حاليًا على أجهزة Android الفعلية فقط.',
      );
    }

    final DeviceInfoPlugin plugin = DeviceInfoPlugin();
    final AndroidDeviceInfo info = await plugin.androidInfo;
    final String label =
        '${info.manufacturer} ${info.model} | Android ${info.version.release}';

    return QuizDeviceInfo(
      isPhysicalDevice: info.isPhysicalDevice,
      deviceLabel: label,
    );
  }
}
