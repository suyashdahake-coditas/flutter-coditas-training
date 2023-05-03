import 'package:flutter/material.dart';

class SettingsName extends StatefulWidget {
  final Icon iconToUse;
  final String settingName;
  final Widget endingWidget;

  const SettingsName(
      {super.key,
      required this.iconToUse,
      required this.settingName,
      required this.endingWidget});

  @override
  State<SettingsName> createState() => _SettingsNameState();
}

class _SettingsNameState extends State<SettingsName> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
                widget.iconToUse,
                SizedBox(width: 15),
                Text(
                  widget.settingName,
                  style: const TextStyle(fontSize: 15),
                )
              ],
            ),
            widget.endingWidget
          ],
        ),
      ),
    );
  }
}
