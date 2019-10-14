import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String title;
  final IconData icon;
  final Function onTap;
  const ButtonWidget({this.title, this.icon, this.onTap});
  @override
  Widget build(BuildContext context) {
    var iconSettings = IconSettingsButtonWidget.getIconSettings(icon);
    return OutlineButton(
      padding: EdgeInsets.all(10),
      onPressed: onTap,
      child: Row(
        children: <Widget>[
          Container(
            height: 30,
            width: 30,
            margin: EdgeInsets.only(right: 10),
            child: Icon(
              icon,
              color: iconSettings.iconColor,
              size: 15,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(35),
              color: iconSettings.ballColor,
            ),
          ),
          Expanded(
              child: Text(
            title,
            style: TextStyle(fontSize: 18),
          )),
          Icon(Icons.keyboard_arrow_right)
        ],
      ),
    );
  }
}

class IconSettingsButtonWidget {

  Color iconColor;
  Color ballColor;

  IconSettingsButtonWidget.getIconSettings(IconData icon) {
    if (icon == Icons.message) {
      iconColor = Colors.white;
      ballColor = Color(0xFF4E71FF);
    }
  }
}
