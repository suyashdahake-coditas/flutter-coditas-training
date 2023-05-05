import 'package:flutter/cupertino.dart';
import 'package:mume_music_player_app/screens/settings_screen/widgets/settings_list_tile.dart';
import "package:flutter/material.dart";

import '../../constants/color_constants.dart';
import '../../main.dart';
import 'widgets/custom_card_widget.dart';

ThemeMode themeMode = ThemeMode.system;

class Settings extends StatelessWidget {
  const Settings({super.key});

  void _toggleTheme(bool newValue) {
    isDarkMode.value = newValue;
  }

  @override
  Widget build(BuildContext context) {
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
                const SizedBox(
                  width: 15,
                ),
                const Text(
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
                const CustomCardWidget(),
                const SizedBox(height: 10),
                const Divider(),
                const SettingsListTile(
                  iconToUse: Icon(Icons.file_upload_outlined),
                  settingName: "Backup",
                  endingWidget: Icon(Icons.arrow_forward_ios),
                ),
                const SettingsListTile(
                  iconToUse: Icon(Icons.notifications_outlined),
                  settingName: "Notification",
                  endingWidget: Icon(Icons.arrow_forward_ios),
                ),
                SettingsListTile(
                  iconToUse: const Icon(Icons.language),
                  settingName: "Language",
                  endingWidget: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          "English (US)",
                          style: TextStyle(
                              fontFamily: 'Urbanist',
                              fontSize: 20,
                              fontWeight: FontWeight.w600),
                        ),
                        Icon(Icons.arrow_forward_ios)
                      ]),
                ),
                SettingsListTile(
                  iconToUse: const Icon(Icons.remove_red_eye_outlined),
                  settingName: "Dark Mode",
                  endingWidget: CupertinoSwitch(
                    activeColor: primaryColor,
                    value: value,
                    onChanged: _toggleTheme,
                  ),
                ),
                const SettingsListTile(
                  iconToUse: Icon(Icons.share_outlined),
                  settingName: "Share App",
                  endingWidget: Icon(Icons.arrow_forward_ios),
                ),
                const SettingsListTile(
                  iconToUse: Icon(Icons.file_open_outlined),
                  settingName: "Change Log",
                  endingWidget: Icon(Icons.arrow_forward_ios),
                ),
                const SettingsListTile(
                  iconToUse: Icon(Icons.privacy_tip_outlined),
                  settingName: "Privacy Policy",
                  endingWidget: Icon(Icons.arrow_forward_ios),
                ),
                const SettingsListTile(
                  iconToUse: Icon(Icons.info_outlined),
                  settingName: "FAQ",
                  endingWidget: Icon(Icons.arrow_forward_ios),
                ),
                const SettingsListTile(
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
