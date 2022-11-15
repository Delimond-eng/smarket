import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(5.0)),
              child: Image.asset(
                "assets/images/img_1.jpg",
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
                alignment: Alignment.center,
              ),
            ),
          ),
          const SizedBox(
            height: 5.0,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Pain croissant d'or",
                  style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 4.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "750 ",
                            style: GoogleFonts.poppins(
                              color: Colors.orange[900],
                              fontSize: 20.0,
                              fontWeight: FontWeight.w900,
                              letterSpacing: 1.0,
                            ),
                          ),
                          TextSpan(
                            text: "CDF",
                            style: GoogleFonts.poppins(
                              color: Colors.grey[700],
                              fontSize: 10.0,
                              fontWeight: FontWeight.w600,
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: 40.0,
                      width: 40.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        color: Colors.grey[300],
                        boxShadow: [
                          BoxShadow(
                            color: Colors.orange.withOpacity(.3),
                            blurRadius: 2,
                            offset: const Offset(0, 2),
                          )
                        ],
                      ),
                      child: Material(
                        borderRadius: BorderRadius.circular(5.0),
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(5.0),
                          onTap: () {},
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Center(
                              child: Icon(
                                CupertinoIcons.cart_fill,
                                color: Colors.black,
                                size: 18.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
