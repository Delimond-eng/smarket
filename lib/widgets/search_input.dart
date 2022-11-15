import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchInput extends StatelessWidget {
  final Function onSearch;
  final Function onFocused;
  final TextEditingController controller;
  final String hintText;
  const SearchInput({
    Key key,
    this.controller,
    this.hintText,
    this.onSearch,
    this.onFocused,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15.0),
      height: 50.0,
      width: size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(.3),
            blurRadius: 1.0,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: TextField(
                controller: controller,
                maxLines: 1,
                onTap: onFocused,
                style: GoogleFonts.poppins(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w800,
                ),
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(8.0),
                  hintText: hintText ?? "Recherche produit...",
                  hintStyle: GoogleFonts.poppins(
                    color: Colors.grey[500],
                    fontWeight: FontWeight.w500,
                    fontSize: 15.0,
                  ),
                  border: InputBorder.none,
                  counterText: '',
                ),
              ),
            ),
            Container(
              height: 50.0,
              width: 45.0,
              margin: const EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.circular(5.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(.3),
                    offset: const Offset(0, 2),
                    blurRadius: 2,
                  )
                ],
              ),
              child: Material(
                borderRadius: BorderRadius.circular(5.0),
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(5.0),
                  onTap: onSearch,
                  child: const Center(
                    child: Icon(
                      CupertinoIcons.search,
                      color: Colors.white,
                      size: 18.0,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
