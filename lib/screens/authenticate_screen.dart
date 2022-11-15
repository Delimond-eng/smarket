import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smarket/screens/home_screen.dart';

import '../responsive/base_widget.dart';
import '../responsive/enum_screens.dart';
import '../widgets/auth_field.dart';

class AuthenticateScreen extends StatelessWidget {
  const AuthenticateScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Responsive(
            builder: (context, screenSize) {
              return Container(
                height: constraints.maxHeight,
                width: constraints.maxWidth,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                ),
                child: Center(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        FadeInUp(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "SMarket",
                                style: GoogleFonts.poppins(
                                  color: Colors.orange[900],
                                  fontSize: 40.0,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              Text(
                                "Votre appli pour gérer votre super marché !",
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        ZoomIn(
                          child: Container(
                            margin: EdgeInsets.symmetric(
                              horizontal: screenSize.deviceScreenType ==
                                      DeviceScreenType.Mobile
                                  ? 10.0
                                  : 0.0,
                            ),
                            padding: const EdgeInsets.all(15.0),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.0),
                              color: Colors.white.withOpacity(.8),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 8,
                                  color: Colors.grey.withOpacity(.2),
                                  offset: const Offset(0, 3),
                                )
                              ],
                            ),
                            height: 200.0,
                            width: 420.0,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Flexible(
                                  child: AuthField(
                                    hintText: "Entrez le nom d'utilisateur...",
                                    icon: CupertinoIcons.person_solid,
                                  ),
                                ),
                                const SizedBox(
                                  height: 15.0,
                                ),
                                const Flexible(
                                  child: AuthField(
                                    hintText: "Entrez le mot de passe...",
                                    icon: Icons.key_sharp,
                                    isPassWord: true,
                                  ),
                                ),
                                const SizedBox(
                                  height: 15.0,
                                ),
                                Flexible(
                                  child: SizedBox(
                                    height: 50.0,
                                    width: double.infinity,
                                    child: ElevatedButton.icon(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.orange[800],
                                      ),
                                      onPressed: () {
                                        Navigator.pushAndRemoveUntil(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const HomeScreen()),
                                          (route) => false,
                                        );
                                      },
                                      icon: const Icon(
                                        Icons.lock_open_rounded,
                                        size: 15.0,
                                        color: Colors.white,
                                      ),
                                      label: Text(
                                        "Connecter".toUpperCase(),
                                        style: GoogleFonts.didactGothic(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w700,
                                          letterSpacing: 2.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
