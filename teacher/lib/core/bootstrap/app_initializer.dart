import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/date_symbol_data_local.dart';

class AppInitializer {
  const AppInitializer._();

  static Future<void> initialize() async {
    WidgetsFlutterBinding.ensureInitialized();
    await initializeDateFormatting('ar_SA')
        .then((_) {
          if (kDebugMode) {
            print('Date formatting initialized for ar_SA');
          }
        })
        .catchError((Object error) {
          if (kDebugMode) {
            print('Error initializing date formatting for ar_SA: $error');
          }
        });
  }
}
