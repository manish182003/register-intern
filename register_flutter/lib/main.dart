import 'package:flutter/material.dart';
import 'package:flutter_logs/flutter_logs.dart';
import 'package:register_flutter/register.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await FlutterLogs.initLogs(
    directoryStructure: DirectoryStructure.SINGLE_FILE_FOR_DAY,
    timeStampFormat: TimeStampFormat.TIME_FORMAT_READABLE,
    logFileExtension: LogFileExtension.LOG,
  );
  FlutterLogs.logInfo(
    "kaamConnect",
    "main",
    "Application Started",
  );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RegsiterScreen(),
    );
  }
}
