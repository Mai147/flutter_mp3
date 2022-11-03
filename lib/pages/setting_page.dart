import 'package:flutter/material.dart';
import 'package:flutter_mp3/components/BottomModal/bottom_modal.dart';
import 'package:flutter_mp3/components/Layout/layout.dart';
import 'package:flutter_mp3/components/Setting/SettingModal/setting_modal.dart';
import 'package:flutter_mp3/components/Setting/setting_item.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Layout(
      hasTopNav: false,
      hasAppBar: true,
      appBarTitle: "Thiết lập",
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        child: Column(
          children: [
            const SettingItem(
                icon: Icons.download_for_offline_outlined, title: "Tải nhạc"),
            SettingItem(
              icon: Icons.brightness_4_outlined,
              title: "Giao diện",
              clickEvent: () {
                var modal =
                    BottomModal(context: context, child: SettingModal());
                modal.initModal();
              },
            ),
          ],
        ),
      ),
    );
  }
}
