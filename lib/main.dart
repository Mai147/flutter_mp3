import 'package:flutter/material.dart';
import 'package:flutter_mp3/constants/colors/colors_constant.dart';
import 'package:flutter_mp3/provider/audio_provider.dart';
import 'package:flutter_mp3/provider/modal_provider.dart';
import 'package:flutter_mp3/provider/song_provider.dart';
import 'package:flutter_mp3/provider/theme_provider.dart';
import 'package:flutter_mp3/routes/routes.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  await JustAudioBackground.init(
    androidNotificationChannelId: 'com.example.flutter_mp3.audio',
    androidNotificationChannelName: 'Audio playback',
    androidNotificationOngoing: true,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => ThemeProvider()),
          ChangeNotifierProvider(create: (context) => AudioProvider()),
          ChangeNotifierProvider(create: (context) => SongProvider()),
          ChangeNotifierProvider(create: (context) => ModalProvider()),
        ],
        child: Consumer<ThemeProvider>(
          builder: (context, themeObj, _) => GestureDetector(
            onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
            child: MaterialApp(
              initialRoute: '/',
              routes: routes,
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
                disabledColor: ColorsConstant.lightDisabledColor,
                scaffoldBackgroundColor: ColorsConstant.lightBackgroundColor,
                bottomAppBarColor: ColorsConstant.lightBottomNavbarColor,
                inputDecorationTheme: const InputDecorationTheme(
                    fillColor: ColorsConstant.lightSearchBackgroundColor),
                iconTheme:
                    const IconThemeData(color: ColorsConstant.lightIconColor),
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
                    displayLarge: TextStyle(
                      color: ColorsConstant.blackColor,
                      fontSize: 20,
                    ),
                    displayMedium: TextStyle(
                      color: ColorsConstant.blackColor,
                      fontSize: 14,
                    ),
                    displaySmall: TextStyle(
                      color: ColorsConstant.blackColor,
                      fontSize: 12,
                    ),
                    labelLarge: TextStyle(
                        color: ColorsConstant.lightTextColor, fontSize: 16),
                    labelMedium: TextStyle(
                        color: ColorsConstant.lightTextColor, fontSize: 12),
                    labelSmall: TextStyle(
                        color: ColorsConstant.lightTextColor,
                        fontSize: 10,
                        letterSpacing: 0.8)),
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
                inputDecorationTheme: const InputDecorationTheme(
                    fillColor: ColorsConstant.darkSearchBackgroundColor),
                disabledColor: ColorsConstant.darkDisabledColor,
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
                    displayLarge: TextStyle(
                      color: ColorsConstant.whiteColor,
                      fontSize: 20,
                    ),
                    displayMedium: TextStyle(
                      color: ColorsConstant.whiteColor,
                      fontSize: 16,
                    ),
                    displaySmall: TextStyle(
                      color: ColorsConstant.whiteColor,
                      fontSize: 12,
                    ),
                    labelLarge: TextStyle(
                        color: ColorsConstant.darkTextColor, fontSize: 16),
                    labelMedium: TextStyle(
                        color: ColorsConstant.darkTextColor, fontSize: 14),
                    labelSmall: TextStyle(
                        color: ColorsConstant.darkTextColor,
                        fontSize: 10,
                        letterSpacing: 0.8)),
                visualDensity: VisualDensity.adaptivePlatformDensity,
              ),
              title: 'Flutter Mp3',
              // home: PersonalPage(),
            ),
          ),
        ));
  }
}
