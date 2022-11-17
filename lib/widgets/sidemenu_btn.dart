import 'package:flutter/material.dart';

class SideMenuBtn extends StatelessWidget {
  final IconData icon;
  final String label;
  final Function onTap;
  final bool isActive;
  const SideMenuBtn({
    Key key,
    this.icon,
    this.label,
    this.onTap,
    this.isActive,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: isActive
            ? const Border(
                right: BorderSide(
                  color: Colors.orange,
                  width: 2.0,
                ),
              )
            : null,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          child: Center(
            child: Icon(
              icon,
              color: isActive ? Colors.orange : Colors.grey[700],
              size: 20.0,
            ),
          ),
        ),
      ),
    );
  }
}
