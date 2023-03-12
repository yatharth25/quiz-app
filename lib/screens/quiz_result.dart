import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:quiz/models/quiz.dart';
import 'package:quiz/theme.dart';

class QuizResult extends StatefulWidget {
  final List<Flutter> quiz;
  final int score;
  const QuizResult({
    super.key,
    required this.score,
    required this.quiz,
  });

  @override
  State<QuizResult> createState() => _QuizResultState();
}

class _QuizResultState extends State<QuizResult> {
  bool isAnimationDone = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: AppBar(
        elevation: 4,
        shadowColor: const Color(0xFFE0E5E8).withOpacity(0.4),
        title: const Text(
          "You’re eligible",
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        centerTitle: false,
        leading: IconButton(
          icon: Image.asset(
            'assets/icons/back.png',
            height: 24,
            width: 24,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.popUntil(context, (route) => route.isFirst);
            },
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Image.asset(
                'assets/icons/cross.png',
                height: 24,
                width: 24,
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: Container(
        height: 76.0,
        decoration: BoxDecoration(
          color: Color(int.parse("0xffFFFFFF")),
          boxShadow: const <BoxShadow>[
            BoxShadow(
                color: AppColor.boxShadow,
                blurRadius: 15.0,
                offset: Offset(0.0, 0.75))
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            left: 16,
            right: 16,
            top: 8,
            bottom: 16,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  Navigator.popUntil(context, (route) => route.isFirst);
                },
                child: Container(
                  width: (MediaQuery.of(context).size.width * 0.5) - 24,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(color: AppColor.behan),
                      color: AppColor.white),
                  child: const Center(
                    child: Text("Try again",
                        style: TextStyle(
                            color: AppColor.behan,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600)),
                  ),
                ),
              ),
              const Gap(16),
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () async {
                  exit(0);
                },
                child: Container(
                  width: (MediaQuery.of(context).size.width * 0.5) - 24,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      gradient: const LinearGradient(
                          colors: AppColor.enableButtonColor)),
                  child: const Center(
                    child: Text("Quit",
                        style: TextStyle(
                            color: AppColor.white,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Container(
        color: AppColor.containerBackground.withOpacity(0.1),
        child: SingleChildScrollView(
            child: Column(
          children: [
            congratsAnimationWidget(
              title: 'Yayyy!!, You did it',
              score: widget.score.toString(),
              desc: widget.score == 20
                  ? 'Bro you a Jawwwdddd!!'
                  : widget.score >= 10
                      ? 'Duh! looks like you a flutter expert'
                      : 'Ummm, maybe you should give a 1 more try?',
            ),
            ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (ctx, i) {
                  String? correctAnswer;
                  widget.quiz[i].answers?.forEach((e) {
                    if (e.score == 5) {
                      correctAnswer = e.text;
                    }
                  });
                  return loanComponent(
                    imageUrl: 'assets/images/ques.png',
                    title: widget.quiz[i].questionText,
                    desc: correctAnswer,
                  );
                },
                separatorBuilder: (ctx, index) {
                  return const Gap(8);
                },
                itemCount: 4),
            const Gap(16),
          ],
        )),
      ),
    );
  }

  Widget congratsAnimationWidget({String? title, String? desc, String? score}) {
    return AnimatedContainer(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      height: isAnimationDone
          ? 260
          : MediaQuery.of(context).size.height -
              (152 + MediaQuery.of(context).viewPadding.top),
      decoration: BoxDecoration(
          color: AppColor.white, borderRadius: BorderRadius.circular(8)),
      width: double.maxFinite,
      duration: const Duration(milliseconds: 500),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              AnimatedContainer(
                height: isAnimationDone ? 124 : 184,
                width: isAnimationDone ? 155 : 230,
                duration: const Duration(milliseconds: 500),
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                          'assets/images/completed.jpeg',
                        ))),
              ),
              if (!isAnimationDone)
                Image.asset(
                  'assets/images/confetti.gif',
                  fit: BoxFit.cover,
                )
            ],
          ),
          const Gap(24),
          SizedBox(
            width: MediaQuery.of(context).size.width - 64,
            child: SizedBox(
              width: MediaQuery.of(context).size.width - 64,
              child: Wrap(
                alignment: WrapAlignment.center,
                runAlignment: WrapAlignment.center,
                children: [
                  Text(
                    title ?? '',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 22, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          ),
          const Gap(8),
          Text(
            desc ?? '',
            textAlign: TextAlign.center,
            style: const TextStyle(
                color: AppColor.black48,
                fontWeight: FontWeight.w400,
                fontSize: 14),
          ),
          const Gap(8),
          Text(
            'Score : ${score ?? ''}/20',
            textAlign: TextAlign.center,
            style: const TextStyle(
                color: AppColor.black48,
                fontWeight: FontWeight.w400,
                fontSize: 14),
          ),
        ],
      ),
    );
  }

  Future<void> initiateAnimation() async {
    await Future.delayed(const Duration(seconds: 2)).then((value) {
      setState(() {
        isAnimationDone = true;
      });
    });
  }

  @override
  void initState() {
    initiateAnimation();
    super.initState();
  }

  Widget loanComponent({String? imageUrl, String? title, String? desc}) {
    return Container(
      height: 90,
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      margin: const EdgeInsets.symmetric(horizontal: 16),
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Image.asset(
            imageUrl ?? '',
            height: 64,
            width: 64,
          ),
          const Gap(24),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Wrap(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: Text(
                      title ?? '',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: AppColor.black48,
                      ),
                    ),
                  ),
                ],
              ),
              const Gap(4),
              Wrap(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: Wrap(
                      children: [
                        const Text(
                          'Correct Answer: ',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF002147)),
                        ),
                        Text(
                          desc ?? '',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: AppColor.black48,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
