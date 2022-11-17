import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TicketItem extends StatelessWidget {
  final String title;
  final String value;
  final double fSize;
  final Color color;
  const TicketItem({
    Key key,
    this.title,
    this.value,
    this.fSize,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 3),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: fSize ?? 14.0,
              fontWeight: FontWeight.w500,
              color: color ?? Colors.grey[800],
            ),
          ),
          Text(
            value,
            style: GoogleFonts.poppins(
              fontSize: (fSize != null) ? fSize + 3 : 16.0,
              fontWeight: FontWeight.w800,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
