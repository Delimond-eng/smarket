import 'package:flutter/material.dart';

class TicketDetail extends StatefulWidget {
  const TicketDetail({
    Key key,
    @required this.width,
    @required this.height,
    @required this.child,
    this.padding,
    this.margin,
    this.color = Colors.white,
    this.isCornerRounded = false,
    this.shadow,
  }) : super(key: key);

  final double width;
  final double height;
  final Widget child;
  final Color color;
  final bool isCornerRounded;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry margin;
  final List<BoxShadow> shadow;

  @override
  // ignore: library_private_types_in_public_api
  _TicketDetailState createState() => _TicketDetailState();
}

class _TicketDetailState extends State<TicketDetail> {
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: TicketClipper(),
      child: AnimatedContainer(
        duration: const Duration(seconds: 1),
        width: widget.width,
        height: widget.height,
        padding: widget.padding,
        margin: widget.margin,
        decoration: BoxDecoration(
          boxShadow: widget.shadow,
          color: widget.color,
          borderRadius: widget.isCornerRounded
              ? BorderRadius.circular(8.0)
              : BorderRadius.circular(0.0),
        ),
        child: widget.child,
      ),
    );
  }
}

class TicketClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.lineTo(0.0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0.0);

    path.addOval(Rect.fromCircle(
        center: Offset(0.0, size.height / 2 + 25), radius: 20.0));
    path.addOval(Rect.fromCircle(
        center: Offset(size.width, size.height / 2 + 25), radius: 20.0));

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
