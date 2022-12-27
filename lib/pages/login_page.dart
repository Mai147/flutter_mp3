import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mp3/components/Auth/login.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        minimum: const EdgeInsets.only(top: 16),
        child: Scaffold(
            appBar: AppBar(
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  CupertinoIcons.chevron_down,
                  color: Theme.of(context).primaryColorDark,
                ),
              ),
              title: Text(
                "Đăng nhập",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              shadowColor: Colors.transparent,
            ),
            body: const SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Login(),
              ),
            )));
  }
}
