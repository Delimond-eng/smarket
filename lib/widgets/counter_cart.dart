import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CounterCart extends StatelessWidget {
  final Function(int qty) onQuantityChanged;
  const CounterCart({Key key, this.onQuantityChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int qty = 1;
    return StatefulBuilder(builder: (context, setter) {
      return Row(
        children: [
          CounterBtn(
            color: qty <= 1 ? Colors.orange[200] : Colors.orange,
            icon: CupertinoIcons.minus,
            size: 25.0,
            onPressed: () async {
              if (qty > 1) {
                setter(() => qty--);
              }
              onQuantityChanged(qty);
            },
          ),
          const SizedBox(
            width: 4.0,
          ),
          Text(
            "$qty".padLeft(2, "0"),
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(
            width: 8.0,
          ),
          CounterBtn(
            color: Colors.orange,
            icon: CupertinoIcons.add,
            size: 25.0,
            onPressed: () async {
              setter(() => qty++);
              onQuantityChanged(qty);
            },
          ),
        ],
      );
    });
  }
}

class CounterBtn extends StatelessWidget {
  final IconData icon;
  final Color color;
  final Function onPressed;
  final double size;
  const CounterBtn({Key key, this.icon, this.color, this.onPressed, this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size ?? 35.0,
      width: size ?? 35.0,
      margin: const EdgeInsets.only(right: 5.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(5.0),
        boxShadow: [
          BoxShadow(
            blurRadius: 8,
            color: Colors.black.withOpacity(.1),
            offset: const Offset(0, 3),
          )
        ],
      ),
      child: Material(
        borderRadius: BorderRadius.circular(5.0),
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(5.0),
          onTap: onPressed,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Icon(
                icon,
                color: Colors.white,
                size: size != null ? size - 15 : 15.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
