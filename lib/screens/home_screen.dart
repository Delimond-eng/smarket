import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smarket/responsive/base_widget.dart';
import 'package:smarket/responsive/sizing_info.dart';
import 'package:smarket/widgets/cart_item.dart';
import 'package:smarket/widgets/dashed_separator.dart';
import 'package:smarket/widgets/product_item.dart';
import 'package:smarket/widgets/search_input.dart';
import 'package:smarket/widgets/ticket_wigdet.dart';
import 'package:virtual_keyboard_multi_language/virtual_keyboard_multi_language.dart';

import '../widgets/filter_widget.dart';
import '../widgets/sidemenu_btn.dart';
import '../widgets/ticket_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _searchController = TextEditingController();

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  void showKeyBoard() {
    showModalBottomSheet(
      context: context,
      barrierColor: Colors.transparent,
      elevation: 30.0,
      enableDrag: true,
      builder: (builder) {
        return FadeInUp(
          child: Container(
            height: 300.0,
            color: Colors.transparent, //could change this to Color(0xFF737373),
            //so you don't have to change MaterialApp canvasColor
            child: Container(
              color: const Color(0xff240b28),
              child: VirtualKeyboard(
                height: 300,
                textColor: Colors.white,
                type: VirtualKeyboardType.Alphanumeric,
                fontSize: 18,
                // ignore: prefer_const_literals_to_create_immutables
                defaultLayouts: [VirtualKeyboardDefaultLayouts.English],
                onKeyPress: (key) {
                  if (key.keyType == VirtualKeyboardKeyType.Action) {
                    if (key.action == VirtualKeyboardKeyAction.Return) {
                      if (kDebugMode) {
                        print("Retourn data : ${_searchController.text}");
                        Navigator.pop(context);
                      }
                    }
                  }
                },
                textController: _searchController,
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.grey[300],
      endDrawer: _cartSide(context),
      drawerScrimColor: Colors.black12,
      floatingActionButton: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 30.0),
            child: FloatingActionButton(
              heroTag: 'btn1',
              elevation: 10.0,
              backgroundColor: const Color(0xff240b28),
              onPressed: showKeyBoard,
              child: const Icon(
                CupertinoIcons.keyboard,
                color: Colors.white,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: FloatingActionButton(
              heroTag: 'btn2',
              elevation: 10.0,
              backgroundColor: Colors.indigo,
              onPressed: () {},
              child: const Icon(
                CupertinoIcons.barcode_viewfinder,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: Responsive(
        builder: (context, info) {
          return SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Row(
              children: [
                if (info.screenSize.width < 1180) ...[
                  FadeInLeft(child: _sideMenu(info)),
                ],
                Expanded(
                  flex: 9,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _header(context),
                      FadeInUp(
                        child: SingleChildScrollView(
                          padding: const EdgeInsets.all(15.0),
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: List.generate(
                              8,
                              (index) => FilterWidget(
                                isSelected: index == 0,
                                label: "Cat??gorie $index",
                              ),
                            ).toList(),
                          ),
                        ),
                      ),
                      FadeInUp(
                        child: SearchInput(
                          controller: _searchController,
                          onFocused: showKeyBoard,
                          onSearch: () {},
                        ),
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      Expanded(
                        child: FadeInLeft(
                          child: GridView.builder(
                            padding: const EdgeInsets.all(15.0),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              childAspectRatio: .88,
                              crossAxisCount:
                                  (MediaQuery.of(context).size.width ~/ 250)
                                      .toInt(),
                              crossAxisSpacing: 10.0,
                              mainAxisSpacing: 10.0,
                            ),
                            itemCount: 20,
                            itemBuilder: ((context, index) {
                              return FadeInUp(child: const ProductItem());
                            }),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                if (info.screenSize.width >= 1180) ...[
                  Expanded(
                    flex: 3,
                    child: _cartSide(context),
                  ),
                ]
              ],
            ),
          );
        },
      ),
    );
  }

  List<Map> menuItems = [
    {"label": "cart", "icon": CupertinoIcons.cart},
    {"label": "user", "icon": CupertinoIcons.person},
  ];
  Widget _sideMenu(SizingInfo info) {
    var selected = '';
    return StatefulBuilder(builder: (context, setter) {
      return Container(
        height: info.screenSize.height,
        width: 60.0,
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Center(
                child: Icon(
                  CupertinoIcons.rectangle_3_offgrid_fill,
                  color: Colors.orange[800],
                  size: 33.0,
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (var item in menuItems) ...[
                    SideMenuBtn(
                      icon: item["icon"],
                      label: item["label"],
                      isActive: (selected == item["label"]),
                      onTap: () {
                        setter(() => selected = item["label"]);
                        if (item['label'] == 'cart') {
                          _scaffoldKey.currentState.openEndDrawer();
                        }
                      },
                    ),
                  ],
                ],
              ),
            )
          ],
        ),
      );
    });
  }

  Widget _cartSide(BuildContext context) {
    return Container(
      width: 350.0,
      color: Colors.grey[100],
      child: Column(
        children: [
          Column(
            children: [
              Container(
                margin: const EdgeInsets.all(8.0),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            CupertinoIcons.cart,
                            size: 18.0,
                            color: Colors.orange[700],
                          ),
                          const SizedBox(
                            width: 5.0,
                          ),
                          Text(
                            "Panier",
                            style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontSize: 18.0,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.pink[200],
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: Material(
                          borderRadius: BorderRadius.circular(5.0),
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () {},
                            borderRadius: BorderRadius.circular(5.0),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                child: Text(
                                  "Vider panier",
                                  style: GoogleFonts.poppins(
                                    color: Colors.pink[800],
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(8.0),
              itemCount: 4,
              itemBuilder: (_, __) {
                return const CartItem();
              },
            ),
          ),
          TicketDetail(
            width: MediaQuery.of(context).size.width,
            height: 160.0,
            margin: const EdgeInsets.all(10),
            color: Colors.grey[300],
            isCornerRounded: true,
            padding: const EdgeInsets.all(5),
            child: Column(
              children: [
                const TicketItem(
                  title: "Sub total",
                  value: "\$ 25.05",
                ),
                const TicketItem(
                  title: "Discount sales",
                  value: "-\$5.00",
                ),
                const TicketItem(
                  title: "Total sales tax",
                  value: "\$2.50",
                ),
                DashedLine(
                  height: 2,
                  color: Colors.grey[500],
                ),
                const TicketItem(
                  color: Colors.black,
                  title: "Total",
                  value: "\$24.02",
                  fSize: 18.0,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: SizedBox(
              width: double.infinity,
              height: 50.0,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                child: Text(
                  "Valider & imprimer",
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _header(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FadeInRight(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "SMarket",
                    style: GoogleFonts.poppins(
                      color: Colors.orange[900],
                      fontSize: 30.0,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  Text(
                    "Votre appli pour g??rer votre super march?? !",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ),
          ZoomIn(
            child: Container(
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
                        "assets/images/img_3.jpg",
                        height: 50.0,
                        width: 50.0,
                        alignment: Alignment.center,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(
                      width: 8.0,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Gaston Delimond",
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
                          children: [
                            Container(
                              height: 8.0,
                              width: 8.0,
                              decoration: BoxDecoration(
                                color: Colors.greenAccent,
                                borderRadius: BorderRadius.circular(
                                  2,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 5.0,
                            ),
                            Text(
                              "administrator",
                              style: GoogleFonts.poppins(
                                color: Colors.grey[700],
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
