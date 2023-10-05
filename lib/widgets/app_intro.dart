import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:hayat_onldocc_homepage/main.dart';

class AppIntro extends StatefulWidget {
  const AppIntro({super.key});

  @override
  State<AppIntro> createState() => _AppIntroState();
}

class _AppIntroState extends State<AppIntro> {
  int _hoverAppDetailIndex = 0;
  int _selectedAppDetailIndex = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < phoneWidth) {
          return Container(
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 245, 251, 253),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                left: 50,
                right: 50,
                top: 50,
                bottom: 70,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "앱 자세히 보기",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey.shade800,
                    ),
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedAppDetailIndex = 0;
                            });
                          },
                          child: MouseRegion(
                            onHover: (event) {
                              setState(() {
                                _hoverAppDetailIndex = 0;
                              });
                            },
                            cursor: SystemMouseCursors.click,
                            child: Stack(
                              children: [
                                Container(
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      bottomLeft: Radius.circular(10),
                                    ),
                                  ),
                                  clipBehavior: Clip.hardEdge,
                                  child: Stack(
                                    children: [
                                      Image.asset(
                                        "assets/service_intro/aichat.jpg",
                                        fit: BoxFit.cover,
                                      ),
                                      if (_selectedAppDetailIndex != 0)
                                        BackdropFilter(
                                          filter: ImageFilter.blur(
                                              sigmaX: 3, sigmaY: 3),
                                          child: Container(
                                            color:
                                                Colors.black.withOpacity(0.2),
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                                Positioned(
                                  bottom: 0,
                                  left: 0,
                                  child: Padding(
                                    padding: const EdgeInsets.all(20),
                                    child: Text(
                                      "AI 채팅\n기능 보기",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w800,
                                          fontSize: 8,
                                          color: _selectedAppDetailIndex == 0
                                              ? Colors.white
                                              : Colors.black),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedAppDetailIndex = 1;
                            });
                          },
                          child: MouseRegion(
                            onHover: (event) {
                              setState(() {
                                _hoverAppDetailIndex = 1;
                              });
                            },
                            cursor: SystemMouseCursors.click,
                            child: Stack(
                              children: [
                                Opacity(
                                  opacity:
                                      _selectedAppDetailIndex == 1 ? 1 : 0.5,
                                  child: Stack(
                                    children: [
                                      Image.asset(
                                        "assets/service_intro/diary.jpg",
                                        fit: BoxFit.cover,
                                      ),
                                      if (_selectedAppDetailIndex != 1)
                                        BackdropFilter(
                                          filter: ImageFilter.blur(
                                              sigmaX: 3, sigmaY: 3),
                                          child: Container(
                                            color:
                                                Colors.black.withOpacity(0.2),
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                                Positioned(
                                  bottom: 0,
                                  left: 0,
                                  child: Padding(
                                    padding: const EdgeInsets.all(20),
                                    child: Text(
                                      "일기 활용\n서비스 보기",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w800,
                                          fontSize: 8,
                                          color: _selectedAppDetailIndex == 1
                                              ? Colors.white
                                              : Colors.black),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedAppDetailIndex = 2;
                            });
                          },
                          child: MouseRegion(
                            onHover: (event) {
                              setState(() {
                                _hoverAppDetailIndex = 2;
                              });
                            },
                            cursor: SystemMouseCursors.click,
                            child: Stack(
                              children: [
                                Container(
                                  decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(10),
                                    bottomRight: Radius.circular(10),
                                  )),
                                  clipBehavior: Clip.hardEdge,
                                  child: Stack(
                                    children: [
                                      Image.asset(
                                        "assets/service_intro/business.jpg",
                                        fit: BoxFit.cover,
                                      ),
                                      if (_hoverAppDetailIndex != 2)
                                        BackdropFilter(
                                          filter: ImageFilter.blur(
                                              sigmaX: 3, sigmaY: 3),
                                          child: Container(
                                            color:
                                                Colors.black.withOpacity(0.2),
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                                Positioned(
                                  bottom: 0,
                                  left: 0,
                                  child: Padding(
                                    padding: const EdgeInsets.all(20),
                                    child: Text(
                                      "사업자 제공\n서비스 보기",
                                      style: TextStyle(
                                          fontSize: 8,
                                          fontWeight: FontWeight.w800,
                                          color: _hoverAppDetailIndex == 2
                                              ? Colors.white
                                              : Colors.black),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(
                    height: 30,
                  ),
                  // app_detail
                  Visibility(
                    visible: _selectedAppDetailIndex == 0,
                    child: SizedBox(
                      width: size.width * 0.8,
                      height: 200,
                      child: Row(
                        children: [
                          Image.asset(
                            "assets/service_detail/ai_chat.png",
                            fit: BoxFit.cover,
                          ).animate().fadeIn(
                                begin: 0,
                                duration: 1.seconds,
                              ),
                          const SizedBox(
                            width: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RichText(
                                text: const TextSpan(
                                  text: "시니어들은\n접근하기 어려운\n",
                                  style: TextStyle(
                                    fontSize: 8,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: "챗GPT, ",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                    TextSpan(
                                      text: "AI 기술\n\n오늘도청춘으로\n아주 쉽게 접근하고\n",
                                    ),
                                    TextSpan(
                                      text: "음성",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                    TextSpan(
                                      text: "으로도 사용해요.",
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.yellowAccent.withOpacity(0.2),
                                ),
                                child: const Text(
                                  "질문을 통한 유익한 정보 획득,\n대화를 통한 외로움 해소까지!",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w900,
                                    fontSize: 8,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Visibility(
                      visible: _selectedAppDetailIndex == 1,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "일기 피드백",
                                    style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontWeight: FontWeight.w900,
                                      fontSize: 8,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  RichText(
                                    text: const TextSpan(
                                      text: "시니어의 오늘 ",
                                      style: TextStyle(fontSize: 8),
                                      children: [
                                        TextSpan(
                                          text: "4가지 활동",
                                          style: TextStyle(
                                            fontWeight: FontWeight.w800,
                                          ),
                                        ),
                                        TextSpan(
                                          text: "에 대해\n하나, 하나 체크하며 ",
                                        ),
                                        TextSpan(
                                          text: "동기를 부여",
                                          style: TextStyle(
                                            fontWeight: FontWeight.w800,
                                          ),
                                        ),
                                        TextSpan(
                                          text: "합니다.",
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        height: 100,
                                        child: Image.asset(
                                          "assets/service_detail/feedback1.png",
                                        ),
                                      ).animate().fadeIn(
                                            begin: 0,
                                            duration: 1.seconds,
                                          ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      SizedBox(
                                        height: 100,
                                        child: Image.asset(
                                          "assets/service_detail/feedback2.png",
                                        ),
                                      ).animate(delay: 500.milliseconds).fadeIn(
                                            begin: 0,
                                            duration: 1.seconds,
                                          ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      SizedBox(
                                        height: 100,
                                        child: Image.asset(
                                          "assets/service_detail/feedback3.png",
                                        ),
                                      ).animate(delay: 1.seconds).fadeIn(
                                            begin: 0,
                                            duration: 1.seconds,
                                          ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      SizedBox(
                                        height: 100,
                                        child: Image.asset(
                                          "assets/service_detail/feedback4.png",
                                        ),
                                      ).animate(delay: 1.5.seconds).fadeIn(
                                            begin: 0,
                                            duration: 1.seconds,
                                          ),
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "함께 보기와 순위",
                                style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 8,
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              SizedBox(
                                height: 100,
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Image.asset(
                                              "assets/service_detail/group1.png"),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Image.asset(
                                              "assets/service_detail/group2.png"),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          const Text(
                                            "나와 다른 사람을\n알아가고,\n현재의 나에 대해\n알릴 수 있어요.",
                                            style: TextStyle(fontSize: 8),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Row(
                                        children: [
                                          Image.asset(
                                              "assets/service_detail/ranking.png"),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          const Text(
                                            "모든 활동에 점수를 부여해서\n순위 경쟁을 통한\n재미를 느껴요.",
                                            style: TextStyle(fontSize: 8),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Column(
                                children: [
                                  Text(
                                    "행사",
                                    style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontWeight: FontWeight.w900,
                                      fontSize: 8,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  RichText(
                                    text: const TextSpan(
                                      text: "여러가지 ",
                                      style: TextStyle(fontSize: 8),
                                      children: [
                                        TextSpan(
                                          text: "시니어 행사",
                                          style: TextStyle(
                                            fontWeight: FontWeight.w800,
                                          ),
                                        ),
                                        TextSpan(
                                          text: "를 통해\n다양한 행사 상품을 획득해요.",
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        height: 100,
                                        child: Image.asset(
                                          "assets/service_detail/event1.png",
                                        ),
                                      ).animate().fadeIn(
                                            begin: 0,
                                            duration: const Duration(
                                              milliseconds: 500,
                                            ),
                                          ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      SizedBox(
                                        height: 100,
                                        child: Image.asset(
                                          "assets/service_detail/event2.png",
                                        ),
                                      )
                                          .animate(
                                              delay: const Duration(
                                                  milliseconds: 500))
                                          .fadeIn(
                                            begin: 0,
                                            duration: const Duration(
                                              milliseconds: 500,
                                            ),
                                          ),
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                        ],
                      )),
                  Visibility(
                      visible: _selectedAppDetailIndex == 2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: size.width * 0.5,
                            child: Image.asset(
                              "assets/service_detail/admin.png",
                            ),
                          ).animate().fadeIn(
                                begin: 0,
                                duration: 1.seconds,
                              ),
                          const SizedBox(
                            height: 20,
                          ),
                          RichText(
                            text: const TextSpan(
                              text: "지역 주민간 대인 관계가 활성화 되고,\n",
                              style: TextStyle(fontSize: 8),
                              children: [
                                TextSpan(
                                  text: "다양한 지역 행사",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                                TextSpan(
                                  text: "를 쉽게 주관할 수 있어요.\n\n자동 축적되는 ",
                                ),
                                TextSpan(
                                  text: "걸음수 데이터",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                                TextSpan(
                                  text:
                                      "와\n한 눈에 보는 감정 변화 그래프로\n실시간으로 지역민을 케어할 수 있어요.",
                                ),
                              ],
                            ),
                          ),
                        ],
                      )),
                ],
              ),
            ),
          );
        } else {
          return Container(
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 245, 251, 253),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                left: 100,
                right: 100,
                top: 100,
                bottom: 150,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "앱 자세히 보기",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey.shade800,
                    ),
                  ),
                  const SizedBox(
                    height: 80,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedAppDetailIndex = 0;
                            });
                          },
                          child: MouseRegion(
                            onHover: (event) {
                              setState(() {
                                _hoverAppDetailIndex = 0;
                              });
                            },
                            cursor: SystemMouseCursors.click,
                            child: Stack(
                              children: [
                                Container(
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      bottomLeft: Radius.circular(10),
                                    ),
                                  ),
                                  clipBehavior: Clip.hardEdge,
                                  child: Stack(
                                    children: [
                                      Image.asset(
                                        "assets/service_intro/aichat.jpg",
                                        fit: BoxFit.cover,
                                      ),
                                      if (_hoverAppDetailIndex != 0)
                                        BackdropFilter(
                                          filter: ImageFilter.blur(
                                              sigmaX: 3, sigmaY: 3),
                                          child: Container(
                                            color:
                                                Colors.black.withOpacity(0.2),
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                                Positioned(
                                  bottom: 30,
                                  left: 30,
                                  child: Padding(
                                    padding: const EdgeInsets.all(20),
                                    child: Text(
                                      "AI 채팅\n기능 보기",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w800,
                                          fontSize: 40,
                                          color: _hoverAppDetailIndex == 0
                                              ? Colors.white
                                              : Colors.black),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedAppDetailIndex = 1;
                            });
                          },
                          child: MouseRegion(
                            onHover: (event) {
                              setState(() {
                                _hoverAppDetailIndex = 1;
                              });
                            },
                            cursor: SystemMouseCursors.click,
                            child: Stack(
                              children: [
                                Opacity(
                                  opacity: _hoverAppDetailIndex == 1 ? 1 : 0.5,
                                  child: Stack(
                                    children: [
                                      Image.asset(
                                        "assets/service_intro/diary.jpg",
                                        fit: BoxFit.cover,
                                      ),
                                      if (_hoverAppDetailIndex != 1)
                                        BackdropFilter(
                                          filter: ImageFilter.blur(
                                              sigmaX: 3, sigmaY: 3),
                                          child: Container(
                                            color:
                                                Colors.black.withOpacity(0.2),
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                                Positioned(
                                  bottom: 30,
                                  left: 30,
                                  child: Padding(
                                    padding: const EdgeInsets.all(20),
                                    child: Text(
                                      "일기 활용\n서비스 보기",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w800,
                                          fontSize: 40,
                                          color: _hoverAppDetailIndex == 1
                                              ? Colors.white
                                              : Colors.black),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedAppDetailIndex = 2;
                            });
                          },
                          child: MouseRegion(
                            onHover: (event) {
                              setState(() {
                                _hoverAppDetailIndex = 2;
                              });
                            },
                            cursor: SystemMouseCursors.click,
                            child: Stack(
                              children: [
                                Container(
                                  decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(10),
                                    bottomRight: Radius.circular(10),
                                  )),
                                  clipBehavior: Clip.hardEdge,
                                  child: Stack(
                                    children: [
                                      Image.asset(
                                        "assets/service_intro/business.jpg",
                                        fit: BoxFit.cover,
                                      ),
                                      if (_hoverAppDetailIndex != 2)
                                        BackdropFilter(
                                          filter: ImageFilter.blur(
                                              sigmaX: 3, sigmaY: 3),
                                          child: Container(
                                            color:
                                                Colors.black.withOpacity(0.2),
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                                Positioned(
                                  bottom: 30,
                                  left: 30,
                                  child: Padding(
                                    padding: const EdgeInsets.all(20),
                                    child: Text(
                                      "사업자 제공\n서비스 보기",
                                      style: TextStyle(
                                          fontSize: 40,
                                          fontWeight: FontWeight.w800,
                                          color: _hoverAppDetailIndex == 2
                                              ? Colors.white
                                              : Colors.black),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(
                    height: 100,
                  ),
                  // app_detail
                  Visibility(
                    visible: _selectedAppDetailIndex == 0,
                    child: SizedBox(
                      width: size.width * 0.8,
                      height: 500,
                      child: Row(
                        children: [
                          Image.asset(
                            "assets/service_detail/ai_chat.png",
                            fit: BoxFit.cover,
                          ).animate().fadeIn(
                                begin: 0,
                                duration: 1.seconds,
                              ),
                          const SizedBox(
                            width: 50,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RichText(
                                text: const TextSpan(
                                  text: "시니어들은\n접근하기 어려운\n",
                                  style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: "챗GPT, ",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                    TextSpan(
                                      text: "AI 기술\n\n오늘도청춘으로\n아주 쉽게 접근하고\n",
                                    ),
                                    TextSpan(
                                      text: "음성",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                    TextSpan(
                                      text: "으로도 사용해요.",
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 50,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.yellowAccent.withOpacity(0.2),
                                ),
                                child: const Text(
                                  "질문을 통한 유익한 정보 획득,\n대화를 통한 외로움 해소까지!",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w900,
                                      fontSize: 30),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Visibility(
                      visible: _selectedAppDetailIndex == 1,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 50,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "일기 피드백",
                                      style: TextStyle(
                                        color: Theme.of(context).primaryColor,
                                        fontWeight: FontWeight.w900,
                                        fontSize: 22,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    RichText(
                                      text: const TextSpan(
                                        text: "시니어의 오늘 ",
                                        style: TextStyle(fontSize: 25),
                                        children: [
                                          TextSpan(
                                            text: "4가지 활동",
                                            style: TextStyle(
                                              fontWeight: FontWeight.w800,
                                            ),
                                          ),
                                          TextSpan(
                                            text: "에 대해\n하나, 하나 체크하며 ",
                                          ),
                                          TextSpan(
                                            text: "동기를 부여",
                                            style: TextStyle(
                                              fontWeight: FontWeight.w800,
                                            ),
                                          ),
                                          TextSpan(
                                            text: "합니다.",
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 50,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(
                                          height: 400,
                                          child: Image.asset(
                                            "assets/service_detail/feedback1.png",
                                          ),
                                        ).animate().fadeIn(
                                              begin: 0,
                                              duration: 1.seconds,
                                            ),
                                        const SizedBox(
                                          width: 30,
                                        ),
                                        SizedBox(
                                          height: 400,
                                          child: Image.asset(
                                            "assets/service_detail/feedback2.png",
                                          ),
                                        )
                                            .animate(delay: 500.milliseconds)
                                            .fadeIn(
                                              begin: 0,
                                              duration: 1.seconds,
                                            ),
                                        const SizedBox(
                                          width: 30,
                                        ),
                                        SizedBox(
                                          height: 400,
                                          child: Image.asset(
                                            "assets/service_detail/feedback3.png",
                                          ),
                                        ).animate(delay: 1.seconds).fadeIn(
                                              begin: 0,
                                              duration: 1.seconds,
                                            ),
                                        const SizedBox(
                                          width: 30,
                                        ),
                                        SizedBox(
                                          height: 400,
                                          child: Image.asset(
                                            "assets/service_detail/feedback4.png",
                                          ),
                                        ).animate(delay: 1.5.seconds).fadeIn(
                                              begin: 0,
                                              duration: 1.seconds,
                                            ),
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 100,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "함께 보기와 순위",
                                  style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontWeight: FontWeight.w900,
                                    fontSize: 22,
                                  ),
                                ),
                                const SizedBox(
                                  height: 100,
                                ),
                                SizedBox(
                                  height: 400,
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Image.asset(
                                                "assets/service_detail/group1.png"),
                                            const SizedBox(
                                              width: 20,
                                            ),
                                            Image.asset(
                                                "assets/service_detail/group2.png"),
                                            const SizedBox(
                                              width: 20,
                                            ),
                                            const Text(
                                              "나와 다른 사람을\n알아가고,\n현재의 나에 대해\n알릴 수 있어요.",
                                              style: TextStyle(fontSize: 25),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          width: 80,
                                        ),
                                        Row(
                                          children: [
                                            Image.asset(
                                                "assets/service_detail/ranking.png"),
                                            const SizedBox(
                                              width: 20,
                                            ),
                                            const Text(
                                              "모든 활동에 점수를 부여해서\n순위 경쟁을 통한\n재미를 느껴요.",
                                              style: TextStyle(fontSize: 25),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 100,
                                ),
                                Column(
                                  children: [
                                    Text(
                                      "행사",
                                      style: TextStyle(
                                        color: Theme.of(context).primaryColor,
                                        fontWeight: FontWeight.w900,
                                        fontSize: 22,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    RichText(
                                      text: const TextSpan(
                                        text: "여러가지 ",
                                        style: TextStyle(fontSize: 25),
                                        children: [
                                          TextSpan(
                                            text: "시니어 행사",
                                            style: TextStyle(
                                              fontWeight: FontWeight.w800,
                                            ),
                                          ),
                                          TextSpan(
                                            text: "를 통해\n다양한 행사 상품을 획득해요.",
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 50,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          height: 400,
                                          child: Image.asset(
                                            "assets/service_detail/event1.png",
                                          ),
                                        ).animate().fadeIn(
                                              begin: 0,
                                              duration: const Duration(
                                                milliseconds: 500,
                                              ),
                                            ),
                                        const SizedBox(
                                          width: 30,
                                        ),
                                        SizedBox(
                                          height: 400,
                                          child: Image.asset(
                                            "assets/service_detail/event2.png",
                                          ),
                                        )
                                            .animate(
                                                delay: const Duration(
                                                    milliseconds: 500))
                                            .fadeIn(
                                              begin: 0,
                                              duration: const Duration(
                                                milliseconds: 500,
                                              ),
                                            ),
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      )),
                  Visibility(
                      visible: _selectedAppDetailIndex == 2,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 50,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 400,
                              child: Image.asset(
                                "assets/service_detail/admin.png",
                              ),
                            ).animate().fadeIn(
                                  begin: 0,
                                  duration: 1.seconds,
                                ),
                            const SizedBox(
                              width: 30,
                            ),
                            RichText(
                              text: const TextSpan(
                                text: "지역 주민간 대인 관계가 활성화 되고,\n",
                                style: TextStyle(fontSize: 25),
                                children: [
                                  TextSpan(
                                    text: "다양한 지역 행사",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                  TextSpan(
                                    text: "를 쉽게 주관할 수 있어요.\n\n자동 축적되는 ",
                                  ),
                                  TextSpan(
                                    text: "걸음수 데이터",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                  TextSpan(
                                    text:
                                        "와\n한 눈에 보는 감정 변화 그래프로\n실시간으로 지역민을 케어할 수 있어요.",
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
