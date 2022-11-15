import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final IconData icon;
  final bool isPassWord;

  const AuthField({
    Key key,
    this.controller,
    this.hintText,
    this.icon,
    this.isPassWord = false,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _AuthFieldState createState() => _AuthFieldState();
}

class _AuthFieldState extends State<AuthField> {
  bool _isObscure = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        color: Colors.white,
        border: Border.all(
          color: Colors.orange[300],
          width: .5,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: [
            Icon(
              widget.icon,
              color: Colors.black,
              size: 18.0,
            ),
            if (widget.isPassWord == false) ...[
              Flexible(
                child: TextField(
                  controller: widget.controller,
                  style: GoogleFonts.poppins(
                    fontSize: 15.0,
                    fontWeight: FontWeight.w600,
                  ),
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(8.0),
                    hintText: widget.hintText,
                    hintStyle: GoogleFonts.poppins(
                      color: Colors.grey[600],
                      fontWeight: FontWeight.w400,
                      fontSize: 13.0,
                    ),
                    border: InputBorder.none,
                    counterText: '',
                  ),
                ),
              )
            ] else ...[
              Flexible(
                child: TextField(
                  controller: widget.controller,
                  obscureText: _isObscure,
                  style: GoogleFonts.poppins(
                    fontSize: 15.0,
                    fontWeight: FontWeight.w600,
                  ),
                  decoration: InputDecoration(
                    hintText: widget.hintText,
                    contentPadding: const EdgeInsets.all(8.0),
                    hintStyle: GoogleFonts.poppins(
                      color: Colors.grey[600],
                      fontWeight: FontWeight.w400,
                      fontSize: 13.0,
                    ),
                    border: InputBorder.none,
                    counterText: '',
                  ),
                ),
              )
            ],
            if (widget.isPassWord) ...[
              IconButton(
                iconSize: 18,
                icon: Icon(
                  _isObscure
                      ? CupertinoIcons.eye_fill
                      : CupertinoIcons.eye_slash_fill,
                ),
                color: Colors.grey[800],
                onPressed: () {
                  setState(() {
                    _isObscure = !_isObscure;
                  });
                },
              )
            ]
          ],
        ),
      ),
    );
  }
}
