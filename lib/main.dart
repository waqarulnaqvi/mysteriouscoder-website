import 'package:flutter/material.dart';
import 'package:mysteriouscoder/presentation/pages/home_page.dart';
import 'package:mysteriouscoder/shared/constants.dart';
import 'package:mysteriouscoder/shared/theme.dart';
import 'package:mysteriouscoder/shared/util.dart';
import 'package:provider/provider.dart';
import 'shared/provider/theme_provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => ThemeProvider(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = createTextTheme(
      context,
      "Noto Music",
      "Noto Sans Display",
    );

    MaterialTheme theme = MaterialTheme(textTheme);
    final mode =Provider.of<ThemeProvider>(context).mode;

    return MaterialApp(
      title: Constants.title,
      theme: theme.light(),
      darkTheme: theme.dark(),
      themeMode: mode,
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
