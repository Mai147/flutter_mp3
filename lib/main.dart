import 'package:flutter/material.dart';
import 'package:flutter_mp3/constants/colors/colors_constant.dart';
import 'package:flutter_mp3/pages/personal_page.dart';
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
          ChangeNotifierProvider(create: (context) => ThemeProvider())
        ],
        child: Consumer<ThemeProvider>(
          builder: (context, themeObj, _) => MaterialApp(
            debugShowCheckedModeBanner: false,
            themeMode: themeObj.mode,
            theme: ThemeData(
              primarySwatch: Colors.blue,
              primaryColor: Colors.blue[600],
              brightness: Brightness.light,
              backgroundColor: Colors.grey[300],
              primaryColorDark: Colors.black,
              primaryColorLight: Colors.white,
              scaffoldBackgroundColor: Colors.grey[100],
              iconTheme:
                  const IconThemeData(color: Color.fromARGB(255, 80, 80, 80)),
              textTheme: TextTheme(
                  labelSmall: TextStyle(
                      color: Color.fromARGB(255, 238, 238, 238), fontSize: 14)),
              // fontFamily: 'Karla',
              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
            darkTheme: ThemeData(
              primarySwatch: Colors.purple,
              primaryColor: ColorsConstant.darkPrimaryColor,
              backgroundColor: ColorsConstant.darkBackgroundItemColor,
              primaryColorDark: ColorsConstant.whiteColor,
              primaryColorLight: ColorsConstant.blackColor,
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
                    fontSize: 14,
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
            home: PersonalPage(),
          ),
        ));
  }
}
