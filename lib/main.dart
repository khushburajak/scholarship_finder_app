import 'package:flutter/cupertino.dart';
import 'package:scholarshuip_finder_app/app/app.dart';
import 'package:scholarshuip_finder_app/app/di/di.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initDependencies();
  runApp(
    App(),
  );
}
