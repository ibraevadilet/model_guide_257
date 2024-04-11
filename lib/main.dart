import 'package:apphud/apphud.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:model_guide_257/auth_pages/auth_page.dart';
import 'package:model_guide_257/data/calendar_hive_model.dart/calendar_hive_model.dart';
import 'package:model_guide_257/pages/info_screen.dart';
import 'package:model_guide_257/pages/navig_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

late final SharedPreferences asfasfasfafs;
late final Box<CalendarHiveModel> calHive;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await initializeDateFormatting();
  await Hive.initFlutter();
  Hive.registerAdapter(CalendarHiveModelAdapter());
  calHive = await Hive.openBox<CalendarHiveModel>('calHive');
  await Firebase.initializeApp();
  await Apphud.start(apiKey: 'app_GCdTvpBhwC41hxgC6Rp577syexqoV1');
  asfasfasfafs = await SharedPreferences.getInstance();
  final isOpend = asfasfasfafs.getBool('isOpened') ?? false;

  await asfasfasfafs.setBool('isOpened', true);
  final isUserAuth = FirebaseAuth.instance.currentUser == null;
  if (isOpend) {
    runApp(PrNavigatorApp(
        childWidget: isUserAuth ? const AuthPage() : const NavigPage()));
  } else {
    runApp(const PrNavigatorApp());
  }
}

class PrNavigatorApp extends StatelessWidget {
  const PrNavigatorApp({super.key, this.childWidget});
  final Widget? childWidget;
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Model Guide App',
        theme: ThemeData.light().copyWith(
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.white,
            shadowColor: Colors.white,
          ),
          scaffoldBackgroundColor: Colors.white,
          splashColor: Colors.transparent,
          splashFactory: NoSplash.splashFactory,
          highlightColor: Colors.transparent,
        ),
        home: childWidget ?? const InfoScreen(),
      ),
    );
  }
}
