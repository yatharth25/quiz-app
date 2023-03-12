import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:quiz/screens/quiz_select.dart';
import 'package:quiz/theme.dart';

class QuizEntry extends StatefulWidget {
  const QuizEntry({super.key});

  @override
  State<QuizEntry> createState() => _QuizEntryState();
}

class _QuizEntryState extends State<QuizEntry> {
  bool sizeCounter = true;
  @override
  void initState() {
    Timer.periodic(const Duration(milliseconds: 700), (timer) {
      setState(() {
        sizeCounter = !sizeCounter;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 4,
        shadowColor: const Color(0xFFE0E5E8).withOpacity(0.4),
        title: const Text(
          'Quiz',
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
      ),
      body: Container(
        color: AppColor.containerBackground.withOpacity(0.1),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  const Gap(50),
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 32,
                    child: Image.asset(
                      'assets/images/dashstars.png',
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  const Gap(40),
                  Center(
                    child: SizedBox(
                      height: 100,
                      width: MediaQuery.of(context).size.width - 64,
                      child: DefaultTextStyle(
                        style: const TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 26.0,
                            color: AppColor.black),
                        child: AnimatedTextKit(
                          repeatForever: true,
                          animatedTexts: [
                            TyperAnimatedText(
                              'Hello! Myself Dash & friends.',
                              textAlign: TextAlign.center,
                              speed: const Duration(milliseconds: 60),
                            ),
                            TyperAnimatedText(
                              'Yatharth told me you guys like flutter?',
                              textAlign: TextAlign.center,
                              speed: const Duration(milliseconds: 65),
                            ),
                            TyperAnimatedText(
                              "Looks like it's your first time?",
                              textAlign: TextAlign.center,
                              speed: const Duration(milliseconds: 60),
                            ),
                            TyperAnimatedText(
                              "That's what she said, LOL",
                              textAlign: TextAlign.center,
                              speed: const Duration(milliseconds: 65),
                            ),
                            TyperAnimatedText(
                              "Nvm, Dash wan't you to try this 'Quiz App' as a beginner.",
                              textAlign: TextAlign.center,
                              speed: const Duration(milliseconds: 65),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const Gap(50),
                  InkWell(
                    borderRadius: BorderRadius.circular(50),
                    radius: 50,
                    onTap: () => Navigator.push(context,
                        MaterialPageRoute(builder: (_) => const QuizSelect())),
                    child: AnimatedContainer(
                      alignment: Alignment.center,
                      height: sizeCounter ? 80 : 70,
                      width: sizeCounter ? 200 : 170,
                      decoration: BoxDecoration(
                        color: sizeCounter ? AppColor.blue : AppColor.green,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      duration: const Duration(milliseconds: 700),
                      child: const Text(
                        'Get Started',
                        style: TextStyle(
                          fontSize: 20,
                          color: AppColor.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Image.asset(
                'assets/images/illustration.png',
                fit: BoxFit.fitWidth,
              ),
            ]),
      ),
    );
  }
}
