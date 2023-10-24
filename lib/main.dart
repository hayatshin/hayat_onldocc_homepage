import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hayat_onldocc_homepage/widgets/app_intro.dart';
import 'package:hayat_onldocc_homepage/widgets/contract.dart';
import 'package:hayat_onldocc_homepage/widgets/footer.dart';
import 'package:hayat_onldocc_homepage/widgets/service_intro.dart';
import 'package:url_launcher/url_launcher.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: "assets/config/dotenv");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      onGenerateRoute: (settings) {
        if (settings.name == "/") {
          return PageRouteBuilder(
            settings: settings,
            pageBuilder: (_, __, ___) => const MainHomePage(),
            transitionDuration: Duration.zero,
            reverseTransitionDuration: Duration.zero,
          );
        }
        if (settings.name == "/contract") {
          return PageRouteBuilder(
            settings: settings,
            pageBuilder: (_, __, ___) => const Contract(),
            transitionDuration: Duration.zero,
            reverseTransitionDuration: Duration.zero,
          );
        }
        return null;
      },
      title: '하야트 | 인지케어',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "NanumSquare",
        primaryColor: const Color(0xFFFF2D78),
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
        ),
        dividerColor: Colors.transparent,
      ),
    );
  }
}

const int phoneWidth = 600;

class MainHomePage extends StatefulWidget {
  const MainHomePage({
    super.key,
  });

  @override
  State<MainHomePage> createState() => _MainHomePageState();
}

class _MainHomePageState extends State<MainHomePage> {
  GlobalKey serviceIntroKey = GlobalKey();
  GlobalKey appIntroKey = GlobalKey();
  int? _hoverTabNavInt;
  int? _hoverDownload;

  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _scrollToMain() {
    _scrollController.animateTo(0,
        duration: const Duration(milliseconds: 700), curve: Curves.easeInOut);
  }

  void _scrollToServiceIntro() {
    Scrollable.ensureVisible(serviceIntroKey.currentContext!,
        duration: const Duration(milliseconds: 700), curve: Curves.easeInOut);
  }

  void _scrollToAppIntro() {
    Scrollable.ensureVisible(appIntroKey.currentContext!,
        duration: const Duration(milliseconds: 700), curve: Curves.easeInOut);
  }

  Future<void> _launchAndroidDownload() async {
    Uri andoridUrl = Uri.parse(
        "https://play.google.com/store/apps/details?id=com.chugnchunon.chungchunon_android");
    try {
      await launchUrl(andoridUrl);
    } catch (e) {
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        showCloseIcon: true,
        content: Text(
          "링크가 열리지 않습니다.",
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ));
    }
  }

  Future<void> _launchIosDownload() async {
    Uri iosUrl = Uri.parse(
        "https://apps.apple.com/us/app/%EC%98%A4%EB%8A%98%EB%8F%84%EC%B2%AD%EC%B6%98-%EA%B8%80%EC%93%B0%EA%B8%B0-%EA%B1%B7%EA%B8%B0-%EC%B9%98%EB%A7%A4%EC%98%88%EB%B0%A9-%EC%A0%95%EC%8B%A0%EA%B1%B4%EA%B0%95%EC%95%B1/id6468271503");
    try {
      await launchUrl(iosUrl);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text(
          "링크가 열리지 않습니다.",
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 110,
        title: LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth < phoneWidth) {
              // 핸드폰
              return Padding(
                padding: const EdgeInsets.only(
                  top: 20,
                  bottom: 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 20,
                      ),
                      child: Center(
                        child: SizedBox(
                          width: size.width * 0.2,
                          child: Image.asset(
                            "assets/icons/logo2.png",
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: _scrollToMain,
                          child: MouseRegion(
                            cursor: SystemMouseCursors.click,
                            onHover: (event) {
                              setState(() {
                                _hoverTabNavInt = 0;
                              });
                            },
                            onExit: (event) {
                              setState(() {
                                _hoverTabNavInt = null;
                              });
                            },
                            child: Text(
                              "인지케어",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: _hoverTabNavInt == 0
                                    ? FontWeight.w800
                                    : FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        GestureDetector(
                          onTap: _scrollToServiceIntro,
                          child: MouseRegion(
                            cursor: SystemMouseCursors.click,
                            onHover: (event) {
                              setState(() {
                                _hoverTabNavInt = 1;
                              });
                            },
                            onExit: (event) {
                              setState(() {
                                _hoverTabNavInt = null;
                              });
                            },
                            child: Text(
                              "서비스 소개",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: _hoverTabNavInt == 1
                                    ? FontWeight.w800
                                    : FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        GestureDetector(
                          onTap: _scrollToAppIntro,
                          child: MouseRegion(
                            cursor: SystemMouseCursors.click,
                            onHover: (event) {
                              setState(() {
                                _hoverTabNavInt = 2;
                              });
                            },
                            onExit: (event) {
                              setState(() {
                                _hoverTabNavInt = null;
                              });
                            },
                            child: Text(
                              "앱 소개",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: _hoverTabNavInt == 2
                                    ? FontWeight.w800
                                    : FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/contract');
                          },
                          child: MouseRegion(
                            cursor: SystemMouseCursors.click,
                            onHover: (event) {
                              setState(() {
                                _hoverTabNavInt = 3;
                              });
                            },
                            onExit: (event) {
                              setState(() {
                                _hoverTabNavInt = null;
                              });
                            },
                            child: Text(
                              "계약 문의",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: _hoverTabNavInt == 3
                                    ? FontWeight.w800
                                    : FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            } else {
              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 50,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: size.width * 0.07,
                      child: Image.asset(
                        "assets/icons/logo2.png",
                        fit: BoxFit.contain,
                      ),
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: _scrollToMain,
                          child: MouseRegion(
                            cursor: SystemMouseCursors.click,
                            onHover: (event) {
                              setState(() {
                                _hoverTabNavInt = 0;
                              });
                            },
                            onExit: (event) {
                              setState(() {
                                _hoverTabNavInt = null;
                              });
                            },
                            child: Text(
                              "인지케어",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: _hoverTabNavInt == 0
                                    ? FontWeight.w800
                                    : FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 50,
                        ),
                        GestureDetector(
                          onTap: _scrollToServiceIntro,
                          child: MouseRegion(
                            cursor: SystemMouseCursors.click,
                            onHover: (event) {
                              setState(() {
                                _hoverTabNavInt = 1;
                              });
                            },
                            onExit: (event) {
                              setState(() {
                                _hoverTabNavInt = null;
                              });
                            },
                            child: Text(
                              "서비스 소개",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: _hoverTabNavInt == 1
                                    ? FontWeight.w800
                                    : FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 50,
                        ),
                        GestureDetector(
                          onTap: _scrollToAppIntro,
                          child: MouseRegion(
                            cursor: SystemMouseCursors.click,
                            onHover: (event) {
                              setState(() {
                                _hoverTabNavInt = 2;
                              });
                            },
                            onExit: (event) {
                              setState(() {
                                _hoverTabNavInt = null;
                              });
                            },
                            child: Text(
                              "앱 소개",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: _hoverTabNavInt == 2
                                    ? FontWeight.w800
                                    : FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 50,
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/contract');
                      },
                      child: MouseRegion(
                        cursor: SystemMouseCursors.click,
                        onHover: (event) {
                          setState(() {
                            _hoverTabNavInt = 3;
                          });
                        },
                        onExit: (event) {
                          setState(() {
                            _hoverTabNavInt = null;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: _hoverTabNavInt == 3
                                ? Colors.grey.shade800
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                              color: Colors.grey.shade800,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 5,
                            ),
                            child: Text(
                              "계약 문의",
                              style: TextStyle(
                                fontSize: 18,
                                color: _hoverTabNavInt == 3
                                    ? Colors.white
                                    : Colors.black,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              );
            }
          },
        ),
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth < phoneWidth) {
              return Column(
                children: [
                  // main
                  SizedBox(
                    width: size.width,
                    child: Container(
                      decoration: const BoxDecoration(color: Colors.white
                          // color: Theme.of(context).primaryColor.withOpacity(0.3),
                          ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 50,
                          horizontal: 20,
                        ),
                        child: Center(
                          child: Column(
                            children: [
                              Image.asset(
                                "assets/main/main_phone2.png",
                                width: size.width * 0.7,
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              Column(
                                children: [
                                  RichText(
                                    text: TextSpan(
                                      text: "치매 예방 사업에\n",
                                      style: TextStyle(
                                        letterSpacing: -2,
                                        fontSize: 40,
                                        fontWeight: FontWeight.w900,
                                        color: Colors.grey.shade900,
                                      ),
                                      children: [
                                        TextSpan(
                                          text: "AI 기술",
                                          style: TextStyle(
                                            color:
                                                Theme.of(context).primaryColor,
                                          ),
                                        ),
                                        const TextSpan(
                                          text: "을 더하다",
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 40,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      GestureDetector(
                                        onTap: _launchAndroidDownload,
                                        child: MouseRegion(
                                          cursor: SystemMouseCursors.click,
                                          onHover: (event) {
                                            setState(() {
                                              _hoverDownload = 0;
                                            });
                                          },
                                          onExit: (event) {
                                            setState(() {
                                              _hoverDownload = null;
                                            });
                                          },
                                          child: Container(
                                            width: 230,
                                            height: 40,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                              border: Border.all(
                                                color: Colors.grey.shade900,
                                              ),
                                              color: _hoverDownload == 0
                                                  ? Colors.grey.shade900
                                                  : Colors.transparent,
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                FaIcon(
                                                  FontAwesomeIcons.googlePlay,
                                                  size: 17,
                                                  color: _hoverDownload == 0
                                                      ? Colors.white
                                                      : Colors.grey.shade900,
                                                ),
                                                const SizedBox(
                                                  width: 15,
                                                ),
                                                Text(
                                                  "구글 플레이스토어",
                                                  style: TextStyle(
                                                    fontSize: 17,
                                                    color: _hoverDownload == 0
                                                        ? Colors.white
                                                        : Colors.grey.shade900,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 12,
                                      ),
                                      GestureDetector(
                                        onTap: _launchIosDownload,
                                        child: MouseRegion(
                                          cursor: SystemMouseCursors.click,
                                          onHover: (event) {
                                            setState(() {
                                              _hoverDownload = 1;
                                            });
                                          },
                                          onExit: (event) {
                                            setState(() {
                                              _hoverDownload = null;
                                            });
                                          },
                                          child: Container(
                                            width: 230,
                                            height: 40,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                              border: Border.all(
                                                color: Colors.grey.shade900,
                                              ),
                                              color: _hoverDownload == 1
                                                  ? Colors.grey.shade900
                                                  : Colors.transparent,
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                FaIcon(FontAwesomeIcons.apple,
                                                    size: 17,
                                                    color: _hoverDownload == 1
                                                        ? Colors.white
                                                        : Colors.grey.shade900),
                                                const SizedBox(
                                                  width: 15,
                                                ),
                                                Text(
                                                  "iOS 앱스토어",
                                                  style: TextStyle(
                                                      fontSize: 17,
                                                      color: _hoverDownload == 1
                                                          ? Colors.white
                                                          : Colors
                                                              .grey.shade900),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  // service
                  Container(
                    key: serviceIntroKey,
                    child: const ServiceIntro(),
                  ),
                  // app
                  Container(
                    key: appIntroKey,
                    child: const AppIntro(),
                  ),
                  // footer
                  const Footer(),
                ],
              );
            } else {
              return Column(
                children: [
                  // main
                  SizedBox(
                    width: size.width,
                    child: Container(
                      decoration: const BoxDecoration(color: Colors.white
                          // color: Theme.of(context).primaryColor.withOpacity(0.3),
                          ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 150,
                          horizontal: 50,
                        ),
                        child: Center(
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.asset(
                                "assets/main/main_phone2.png",
                                width: size.width * 0.4,
                              ),
                              const SizedBox(
                                width: 80,
                              ),
                              Column(
                                children: [
                                  RichText(
                                    text: TextSpan(
                                      text: "치매 예방 사업에\n",
                                      style: TextStyle(
                                        letterSpacing: -2,
                                        fontSize: 80,
                                        fontWeight: FontWeight.w800,
                                        color: Colors.grey.shade900,
                                      ),
                                      children: [
                                        TextSpan(
                                          text: "AI 기술",
                                          style: TextStyle(
                                            color:
                                                Theme.of(context).primaryColor,
                                          ),
                                        ),
                                        const TextSpan(
                                          text: "을 더하다",
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 100,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      GestureDetector(
                                        onTap: _launchAndroidDownload,
                                        child: MouseRegion(
                                          cursor: SystemMouseCursors.click,
                                          onHover: (event) {
                                            setState(() {
                                              _hoverDownload = 0;
                                            });
                                          },
                                          onExit: (event) {
                                            setState(() {
                                              _hoverDownload = null;
                                            });
                                          },
                                          child: Container(
                                            width: 300,
                                            height: 70,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                              border: Border.all(
                                                color: Colors.grey.shade900,
                                              ),
                                              color: _hoverDownload == 0
                                                  ? Colors.grey.shade900
                                                  : Colors.transparent,
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                FaIcon(
                                                  FontAwesomeIcons.googlePlay,
                                                  size: 30,
                                                  color: _hoverDownload == 0
                                                      ? Colors.white
                                                      : Colors.grey.shade900,
                                                ),
                                                const SizedBox(
                                                  width: 15,
                                                ),
                                                Text(
                                                  "구글 플레이스토어",
                                                  style: TextStyle(
                                                    fontSize: 22,
                                                    color: _hoverDownload == 0
                                                        ? Colors.white
                                                        : Colors.grey.shade900,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      GestureDetector(
                                        onTap: _launchIosDownload,
                                        child: MouseRegion(
                                          cursor: SystemMouseCursors.click,
                                          onHover: (event) {
                                            setState(() {
                                              _hoverDownload = 1;
                                            });
                                          },
                                          onExit: (event) {
                                            setState(() {
                                              _hoverDownload = null;
                                            });
                                          },
                                          child: Container(
                                            width: 300,
                                            height: 70,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                              border: Border.all(
                                                color: Colors.grey.shade900,
                                              ),
                                              color: _hoverDownload == 1
                                                  ? Colors.grey.shade900
                                                  : Colors.transparent,
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                FaIcon(FontAwesomeIcons.apple,
                                                    size: 30,
                                                    color: _hoverDownload == 1
                                                        ? Colors.white
                                                        : Colors.grey.shade900),
                                                const SizedBox(
                                                  width: 15,
                                                ),
                                                Text(
                                                  "iOS 앱스토어",
                                                  style: TextStyle(
                                                      fontSize: 22,
                                                      color: _hoverDownload == 1
                                                          ? Colors.white
                                                          : Colors
                                                              .grey.shade900),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  // service
                  Container(
                    key: serviceIntroKey,
                    child: const ServiceIntro(),
                  ),
                  // app
                  Container(
                    key: appIntroKey,
                    child: const AppIntro(),
                  ),
                  // footer
                  const Footer(),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
