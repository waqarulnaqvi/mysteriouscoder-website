import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mysteriouscoder/presentation/providers/website_info_provider.dart';
import 'package:mysteriouscoder/presentation/providers/theme_provider.dart';
import 'package:mysteriouscoder/core/constants/constants.dart';
import 'package:mysteriouscoder/core/theme.dart';
import 'package:mysteriouscoder/core/utils/util.dart';
import 'package:provider/provider.dart';
import 'package:url_strategy/url_strategy.dart';
import 'core/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setPathUrlStrategy();
  await _loadFonts();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ChangeNotifierProvider(create: (context) => WebsiteInfoProvider()),
    ],
    child: MyApp(),
  ));
}

Future<void> _loadFonts() async {
  // Load Poppins font
  final fontLoaderPoppins = FontLoader('Poppins')
    ..addFont(rootBundle.load('assets/fonts/Poppins-Regular.ttf'));

  // Load Montserrat font
  final fontLoaderMontserrat = FontLoader('Montserrat')
    ..addFont(rootBundle.load('assets/fonts/Montserrat-Regular.ttf'));

  // Load both fonts
  await Future.wait([
    fontLoaderPoppins.load(),
    fontLoaderMontserrat.load(),
  ]);
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
    final mode = Provider.of<ThemeProvider>(context).mode;

    return MaterialApp.router(
      title: Constants.title,
      theme: theme.light(),
      darkTheme: theme.dark(),
      themeMode: mode,
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.router, // ✅ Use GoRouter
    );
  }
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     TextTheme textTheme = createTextTheme(
//       context,
//       "Noto Music",
//       "Noto Sans Display",
//     );
//
//     MaterialTheme theme = MaterialTheme(textTheme);
//     final mode = Provider.of<ThemeProvider>(context).mode;
//
//     return MaterialApp(
//       title: Constants.title,
//       theme: theme.light(),
//       darkTheme: theme.dark(),
//       themeMode: mode,
//       debugShowCheckedModeBanner: false,
//       initialRoute: '/',
//       onGenerateRoute: (settings) {
//         if (settings.name?.startsWith('/privacy_policy/') == true) {
//           // final piName = settings.name?.split('/')[2]; // Extract the dynamic part, e.g., pi.name
//           final args = settings.arguments as PrivacyPolicyData?;
//           return MaterialPageRoute(
//               builder: (context) => PrivacyPolicy(
//                   title: args?.title,
//                   icon: args?.image,
//                   description: args?.description));
//         }
//         return MaterialPageRoute(builder: (context) => HomePage());
//       },
//     );
//   }
// }

///firebase.json
//{
//   "hosting": {
//     "public": "build/web",
//     "ignore": [
//       "firebase.json",
//       "**/.*",
//       "**/node_modules/**"
//     ],
//     "rewrites": [
//       {
//         "source": "/privacypolicy{,/**}",
//         "destination": "/index.html"
//       }
//     ]
//   }
// }
