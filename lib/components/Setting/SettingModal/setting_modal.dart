import 'package:flutter/material.dart';
import 'package:flutter_mp3/components/Setting/SettingModal/setting_modal_item.dart';
import 'package:flutter_mp3/provider/theme_provider.dart';
import 'package:provider/provider.dart';

class SettingModal extends StatefulWidget {
  const SettingModal({super.key});

  @override
  State<SettingModal> createState() => _SettingModalState();
}

class _SettingModalState extends State<SettingModal> {
  String modeActive = "";
  void changeMode(String mode) {
    if (mode == "light") {
      Provider.of<ThemeProvider>(context, listen: false).setLightMode();
    } else {
      Provider.of<ThemeProvider>(context, listen: false).setDarkMode();
    }
    setState(() {
      modeActive = mode;
    });
    Navigator.pop(context);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    String mode = Provider.of<ThemeProvider>(context, listen: false).modeName;
    modeActive = mode;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.only(bottom: 30),
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(color: Theme.of(context).dividerColor))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Giao diện",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Column(
              children: [
                SettingModalItem(
                    title: "Sáng",
                    isActive: modeActive == "light",
                    clickEvent: () {
                      changeMode("light");
                    }),
                SettingModalItem(
                    title: "Tối",
                    isActive: modeActive == "dark",
                    clickEvent: () {
                      changeMode("dark");
                    }),
                SettingModalItem(
                    title: "Theo thiết bị",
                    isActive: modeActive == "device",
                    clickEvent: () {
                      setState(() {
                        Provider.of<ThemeProvider>(context, listen: false)
                            .setByDeviceMode();
                        Navigator.pop(context);
                      });
                    })
              ],
            ),
          ),
        ],
      ),
    );
  }
}
