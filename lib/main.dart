import 'package:flutter/material.dart';
import 'package:flutter_mp3/constants/colors/colors_constant.dart';
import 'package:flutter_mp3/pages/personal_page.dart';
import 'package:flutter_mp3/pages/setting_page.dart';
import 'package:flutter_mp3/pages/song_page.dart';
import 'package:flutter_mp3/provider/song_provider.dart';
import 'package:flutter_mp3/provider/theme_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => ThemeProvider()),
          ChangeNotifierProvider(create: (context) => SongProvider())
        ],
        child: Consumer<ThemeProvider>(
          builder: (context, themeObj, _) => GestureDetector(
            onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
            child: MaterialApp(
              initialRoute: '/',
              routes: {
                '/': (context) => const PersonalPage(),
                '/setting': (context) => const SettingPage(),
                '/song': (context) => const SongPage()
              },
              debugShowCheckedModeBanner: false,
              themeMode: themeObj.mode,
              theme: ThemeData(
                primarySwatch: Colors.purple,
                primaryColor: ColorsConstant.lightPrimaryColor,
                brightness: Brightness.light,
                backgroundColor: ColorsConstant.lightBackgroundItemColor,
                primaryColorDark: Colors.black,
                primaryColorLight: Colors.white,
                dividerColor: ColorsConstant.lightBorderColor,
                shadowColor: ColorsConstant.lightShadowColor,
                scaffoldBackgroundColor: ColorsConstant.lightBackgroundColor,
                bottomAppBarColor: ColorsConstant.lightBottomNavbarColor,
                iconTheme:
                    const IconThemeData(color: Color.fromARGB(255, 80, 80, 80)),
                textTheme: const TextTheme(
                    titleLarge: TextStyle(
                        color: ColorsConstant.blackColor,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                    titleMedium: TextStyle(
                        color: ColorsConstant.blackColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                    titleSmall: TextStyle(
                        color: ColorsConstant.blackColor,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                    displayMedium: TextStyle(
                      color: ColorsConstant.blackColor,
                      fontSize: 14,
                    ),
                    displaySmall: TextStyle(
                      color: ColorsConstant.blackColor,
                      fontSize: 12,
                    ),
                    labelMedium: TextStyle(
                        color: ColorsConstant.lightTextColor, fontSize: 12),
                    labelSmall: TextStyle(
                        color: ColorsConstant.lightTextColor, fontSize: 10)),
                // fontFamily: 'Karla',
                visualDensity: VisualDensity.adaptivePlatformDensity,
              ),
              darkTheme: ThemeData(
                brightness: Brightness.dark,
                primarySwatch: Colors.purple,
                primaryColor: ColorsConstant.darkPrimaryColor,
                backgroundColor: ColorsConstant.darkBackgroundItemColor,
                primaryColorDark: ColorsConstant.whiteColor,
                primaryColorLight: ColorsConstant.blackColor,
                dividerColor: ColorsConstant.darkBorderColor,
                shadowColor: ColorsConstant.darkShadowColor,
                scaffoldBackgroundColor: ColorsConstant.darkBackgroundColor,
                bottomAppBarColor: ColorsConstant.darkBottomNavbarColor,
                iconTheme:
                    const IconThemeData(color: ColorsConstant.darkIconColor),
                textTheme: const TextTheme(
                    titleLarge: TextStyle(
                        color: ColorsConstant.whiteColor,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                    titleMedium: TextStyle(
                        color: ColorsConstant.whiteColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                    titleSmall: TextStyle(
                        color: ColorsConstant.whiteColor,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                    displayMedium: TextStyle(
                      color: ColorsConstant.whiteColor,
                      fontSize: 16,
                    ),
                    displaySmall: TextStyle(
                      color: ColorsConstant.whiteColor,
                      fontSize: 12,
                    ),
                    labelMedium: TextStyle(
                        color: ColorsConstant.darkTextColor, fontSize: 12),
                    labelSmall: TextStyle(
                        color: ColorsConstant.darkTextColor, fontSize: 10)),
                visualDensity: VisualDensity.adaptivePlatformDensity,
              ),
              title: 'Flutter Mp3',
              // home: PersonalPage(),
            ),
          ),
        ));
  }
}
