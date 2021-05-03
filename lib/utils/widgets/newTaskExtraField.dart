import 'package:flutter/material.dart';

class NewTaskExtraField extends StatelessWidget {
  final IconData icon;
  final String title;

  const NewTaskExtraField({@required this.icon, @required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 25),
            child: Icon(
              icon,
              color: Colors.grey,
            ),
          ),
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
