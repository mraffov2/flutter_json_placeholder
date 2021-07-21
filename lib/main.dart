import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app/providers/PlaceholderProvider.dart';
import 'package:test_app/screens/Home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PlaceholderProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Test App',
        theme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: Colors.purple[700],
        ),
        home: Home(),
      ),
    );
  }
}
