import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  final bool title;
  final String stopwatchData;
  final VoidCallback addHandler;
  final VoidCallback deleteHandler;

  const CustomListTile(
      {Key? key,
      required this.title,
      required this.stopwatchData,
      required this.addHandler,
      required this.deleteHandler})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: title
            ? const Text("0")
            : Text(
                stopwatchData,
                style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w300,
                    fontFamily: 'Inter'),
              ),
        trailing: SizedBox(
          width: 200,
          child: Row(
            children: [
              const SizedBox(
                width: 20,
              ),
              TextButton(
                  onPressed: () => addHandler(),
                  child: const Text(
                    'Add',
                    style: TextStyle(
                        color: Color(0XFFFF7A00),
                        fontSize: 25,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400),
                  )),
              const SizedBox(
                width: 30,
              ),
              TextButton(
                  onPressed: () {
                    deleteHandler();
                  },
                  child: const Text(
                    'Delete',
                    style: TextStyle(
                        color: Color(0XFF0054F8),
                        fontSize: 25,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400),
                  )),
            ],
          ),
        ));
  }
}
