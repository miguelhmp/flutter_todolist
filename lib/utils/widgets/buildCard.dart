import 'package:flutter/material.dart';
import 'package:todo_flutter/utils/Constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BuildCard extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String title;
  final String tasks;
  final String navUrl;
  final Function onPress;

  BuildCard({
    @required this.icon,
    this.iconColor,
    @required this.title,
    @required this.tasks,
    this.navUrl,
    @required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 5,
        bottom: 10,
        left: 5,
      ),
      child: Card(
        elevation: 3,
        child: InkWell(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 20,
                    right: 20,
                    bottom: 20,
                    left: 20,
                  ),
                  child: FaIcon(
                    icon,
                    size: 35,
                    color: iconColor,
                  ),
                ),
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 10,
                        right: 20,
                        left: 20,
                      ),
                      child: Text(
                        title,
                        style: TextStyle(
                          color: kTextTitleColor,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        right: 20,
                        bottom: 20,
                        left: 20,
                      ),
                      child: Text(tasks),
                    ),
                  ],
                ),
              ),
              // Icon(FontAwesomeIcons.tasks),
              // Icon(LineIcons.edit),
            ],
          ),
          onTap: onPress,
        ),
      ),
    );
  }
}
