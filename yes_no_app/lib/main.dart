import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/Config/Theme/app_theme.dart';
import 'package:yes_no_app/Presentation/Providers/chat_provider.dart';
import 'package:yes_no_app/Presentation/Screens/Chat/chat_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => ChatProvider())],
      child: MaterialApp(
        title: 'Yes No App',
        debugShowCheckedModeBanner: false,
        theme: AppTheme(selectedColor: 0).theme(),
        home: const Scaffold(body: ChatScreen()),
      ),
    );
  }
}
