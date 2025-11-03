import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('fr'), Locale('ar')],
      path: 'assets/translations',
      fallbackLocale: const Locale('en'),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Grandline Delivery',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('appTitle'.tr()),
        backgroundColor: Theme.of(context).colorScheme.primary,
        actions: [
          PopupMenuButton<Locale>(
            onSelected: (Locale locale) {
              context.setLocale(locale);
            },
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(
                  value: const Locale('en'),
                  child: Text('English'),
                ),
                PopupMenuItem(
                  value: const Locale('fr'),
                  child: Text('Français'),
                ),
                PopupMenuItem(
                  value: const Locale('ar'),
                  child: Text('العربية'),
                ),
              ];
            },
          ),
        ],
      ),
      body: Center(
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.local_shipping,
              size: 80,
              color: Colors.blue,
            ),
            SizedBox(height: 20),
            Text(
              'welcome',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ).tr(),
            SizedBox(height: 10),
            Text(
              'subtitle',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ).tr(),
          ],
        ),
      ),
    );
  }
}
