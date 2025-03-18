import 'package:flutter/material.dart';
import 'package:life_hope/presentation/screen/login/view/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<double> temperature = ValueNotifier(0.5);
    return MaterialApp(
      title: 'Fundraising and Donation App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        body: LoginPage(),
      ),
    );
  }
}
