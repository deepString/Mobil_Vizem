import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../core/storage.dart';

class AuthLoadingScreen extends StatefulWidget {
  const AuthLoadingScreen({super.key});

  @override
  State<AuthLoadingScreen> createState() => _AuthLoadingScreenState();
}

class _AuthLoadingScreenState extends State<AuthLoadingScreen> {
  loadAppAndCheckLogin() async {
    final storage = Storage();

    final firstLaunch = await storage.isFirstLaunch();
    final user = await storage.loadUser();

    if (firstLaunch) {
      // Cihazın gece gündüz moduna erişmek için
      const darkMode = ThemeMode.system == ThemeMode.dark;

      await storage.setConfig(
          language: getDeviceLanguage(), darkMode: darkMode);

      GoRouter.of(context).replace("/boarding");
    } 
    else {
      if (user == null) {
        GoRouter.of(context).replace("/login");
      } 
      else {
        final config = await storage.getConfig();

        if (config["Language"] == null) {
          storage.setConfig(language: getDeviceLanguage());
        }

        if (config["DarkMode"] == null) {
          const darkMode = ThemeMode.system == ThemeMode.dark;
          await storage.setConfig(darkMode: darkMode);
        }

        GoRouter.of(context).replace("/home");
      }
    }
  }

  getDeviceLanguage() {
    // Cihazın varsayılan diline erişmek için
    final String defaultLocale;
    // Web mi değil mi bakması için
    if (!kIsWeb) {
      defaultLocale = Platform.localeName;
    } else {
      defaultLocale = "en";
    }

    final langParts = defaultLocale.split("_");
    final supportedLanguages = ["tr", "en"];

    final String finalLang;

    if (supportedLanguages.contains(langParts[0])) {
      finalLang = langParts[0];
    } 
    else {
      finalLang = "en";
    }

    return finalLang;
  }

  @override
  void initState() {
    super.initState();
    loadAppAndCheckLogin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
