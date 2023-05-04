import 'package:flutter/material.dart';

import '../../../constants.dart';

class SettingsListTile extends StatelessWidget {
  final Icon iconToUse;
  final String settingName;
  final Widget endingWidget;

  const SettingsListTile(
      {super.key,
      required this.iconToUse,
      required this.settingName,
      required this.endingWidget});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        color: Theme.of(context).primaryColor,
        height: 60,
        width: double.infinity,
        child: Card(
          color: Theme.of(context).primaryColor,
          elevation: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  iconToUse,
                  const SizedBox(width: 15),
                  Text(
                    settingName,
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: urbanist,
                      fontWeight: FontWeight.w600,
                    ),
                  )
                ],
              ),
              endingWidget
            ],
          ),
        ),
      ),
    );
  }
}
