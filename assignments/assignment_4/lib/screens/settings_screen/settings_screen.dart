import 'package:flutter/cupertino.dart';
import 'package:mume_music_player_app/screens/settings_screen/widgets/setting_name.dart';
import "package:flutter/material.dart";

import '../../constants.dart';
import '../../main.dart';
import 'widgets/firstCardWidget.dart';

ThemeMode themeMode = ThemeMode.system;

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  void _toggleTheme(bool newValue) {
    setState(() {
      isDarkMode.value = newValue;
      print(themeMode);
    });
  }

  @override
  Widget build(BuildContext context) {
    print('Build');
    return ValueListenableBuilder<bool>(
      valueListenable: isDarkMode,
      builder: (BuildContext context, bool value, Widget? child) {
        return Scaffold(
          backgroundColor: Theme.of(context).primaryColor,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            elevation: 0,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  CupertinoIcons.music_note_2,
                  color: primaryColor,
                ),
                SizedBox(
                  width: 15,
                ),
                Text(
                  "Settings",
                )
              ],
            ),
            actions: const [
              Icon(
                CupertinoIcons.ellipsis_circle,
                size: 30,
              ),
              SizedBox(
                width: 10,
              )
            ],
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                const FirstWidget(),
                const SizedBox(height: 10),
                const Divider(),
                const SettingsName(
                  iconToUse: Icon(Icons.file_upload_outlined),
                  settingName: "Backup",
                  endingWidget: Icon(Icons.arrow_forward_ios),
                ),
                const SettingsName(
                  iconToUse: Icon(Icons.notifications_outlined),
                  settingName: "Notification",
                  endingWidget: Icon(Icons.arrow_forward_ios),
                ),
                SettingsName(
                  iconToUse: const Icon(Icons.language),
                  settingName: "Language",
                  endingWidget: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text("English(Us)"),
                        Icon(Icons.arrow_forward_ios)
                      ]),
                ),
                SettingsName(
                  iconToUse: const Icon(Icons.remove_red_eye_outlined),
                  settingName: "Dark Mode",
                  endingWidget: CupertinoSwitch(
                    activeColor: primaryColor,
                    value: value,
                    onChanged: _toggleTheme,
                  ),
                ),
                const SettingsName(
                  iconToUse: Icon(Icons.share_outlined),
                  settingName: "Share App",
                  endingWidget: Icon(Icons.arrow_forward_ios),
                ),
                const SettingsName(
                  iconToUse: Icon(Icons.file_open_outlined),
                  settingName: "Change Log",
                  endingWidget: Icon(Icons.arrow_forward_ios),
                ),
                const SettingsName(
                  iconToUse: Icon(Icons.privacy_tip_outlined),
                  settingName: "Privacy Policy",
                  endingWidget: Icon(Icons.arrow_forward_ios),
                ),
                const SettingsName(
                  iconToUse: Icon(Icons.info_outlined),
                  settingName: "FAQ",
                  endingWidget: Icon(Icons.arrow_forward_ios),
                ),
                const SettingsName(
                  iconToUse: Icon(Icons.exit_to_app),
                  settingName: "Quit",
                  endingWidget: Icon(Icons.arrow_forward_ios),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
