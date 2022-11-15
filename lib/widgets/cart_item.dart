import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smarket/widgets/counter_cart.dart';

class CartItem extends StatelessWidget {
  const CartItem({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70.0,
      margin: const EdgeInsets.only(bottom: 5.0),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(.1),
            blurRadius: 2.0,
            offset: const Offset(0, 2),
          )
        ],
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(5.0),
              child: Image.asset(
                "assets/images/img_1.jpg",
                height: 70.0,
                width: 70.0,
                alignment: Alignment.center,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              width: 8.0,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Lorem ipsum doleret",
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(
                    height: 2.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "\$10",
                        style: GoogleFonts.poppins(
                          color: Colors.orange[700],
                          fontSize: 15.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      CounterCart(
                        onQuantityChanged: (qty) {
                          debugPrint(qty.toString());
                        },
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
