import 'package:flutter/material.dart';
import 'core/config/app_config.dart';
import 'features/menu/presentation/pages/main_menu_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppConfig.instance.load();
  runApp(const MultimediaApp());
}

class MultimediaApp extends StatelessWidget {
  const MultimediaApp({super.key});

  @override
  Widget build(BuildContext context) {
    final title = AppConfig.instance.get<String>('app.title', 'Multimedia Lab 07');
    return MaterialApp(
      title: title,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.purple,
          primary: Colors.purple,
        ),
        appBarTheme: const AppBarTheme(centerTitle: true),
      ),
      home: const MainMenuPage(),
    );
  }
}
