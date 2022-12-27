import 'package:flutter/material.dart';
import 'package:flutter_mp3/components/BottomModal/bottom_modal.dart';
import 'package:flutter_mp3/pages/login_page.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
      children: [
        Image.asset(
          "assets/images/logo.png",
          width: size.width * 3 / 8,
          height: size.width * 3 / 8,
        ),
        const SizedBox(
          height: 20,
        ),
        TextFormField(
          style: Theme.of(context).textTheme.titleMedium,
          decoration: const InputDecoration(
            labelText: "Tên đăng nhập",
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        TextFormField(
          style: Theme.of(context).textTheme.titleMedium,
          decoration: const InputDecoration(
            labelText: "Email",
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        TextFormField(
          obscureText: true,
          enableSuggestions: false,
          autocorrect: false,
          style: Theme.of(context).textTheme.titleMedium,
          decoration: const InputDecoration(labelText: "Mật khẩu"),
        ),
        const SizedBox(
          height: 20,
        ),
        TextFormField(
          obscureText: true,
          enableSuggestions: false,
          autocorrect: false,
          style: Theme.of(context).textTheme.titleMedium,
          decoration: const InputDecoration(labelText: "Nhập lại mật khẩu"),
        ),
        const SizedBox(
          height: 30,
        ),
        ElevatedButton(
          onPressed: () {},
          style:
              ElevatedButton.styleFrom(minimumSize: const Size.fromHeight(50)),
          child: const Text("Đăng ký"),
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
            Text(
              "Đã có tài khoản?",
              style: Theme.of(context).textTheme.displayMedium,
            ),
            const SizedBox(
              width: 4,
            ),
            InkWell(
              onTap: () {
                Navigator.pop(context);
                var bottomModal =
                    BottomModal(context: context, child: const LoginPage());
                bottomModal.initFullScreenModal();
              },
              child: Text(
                "Đăng nhập",
                style: TextStyle(
                    fontSize:
                        Theme.of(context).textTheme.displayMedium!.fontSize,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor),
              ),
            )
          ],
        ),
      ],
    );
  }
}
