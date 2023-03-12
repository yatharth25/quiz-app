import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:quiz/models/quiz.dart';
import 'package:quiz/screens/quiz_result.dart';

import 'package:quiz/shared/elevated_text_container.dart';
import 'package:quiz/theme.dart';

class QuizStep4 extends StatefulWidget {
  final List<Flutter>? quiz;
  final int score;
  const QuizStep4({super.key, required this.quiz, required this.score});

  @override
  State<QuizStep4> createState() => _QuizStep4State();
}

class _QuizStep4State extends State<QuizStep4> {
  String? selectedText;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: AppBar(
        elevation: 4,
        shadowColor: const Color(0xFFE0E5E8).withOpacity(0.4),
        title: const Text(
          'Quiz',
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
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
      body: Container(
        color: AppColor.containerBackground.withOpacity(0.1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 4,
                  width: MediaQuery.of(context).size.width,
                  color: AppColor.behan,
                ),
                const Gap(16),
                const Center(
                  child: Text(
                    'Question 4/4',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: AppColor.black48,
                    ),
                  ),
                ),
                const Gap(43),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 34,
                    ),
                    child: Text(
                      widget.quiz![3].questionText!,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                const Gap(64),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    children: [
                      ElevatedTextContainer(
                          text: widget.quiz![3].answers![0].text!,
                          isSelected:
                              selectedText == widget.quiz![3].answers![0].text!,
                          onTap: () => {
                                setState(() {
                                  selectedText =
                                      widget.quiz![3].answers![0].text!;
                                }),
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => QuizResult(
                                            quiz: widget.quiz!,
                                            score: widget.score +
                                                widget.quiz![3].answers![0]
                                                    .score!)))
                              }),
                      const Gap(16),
                      ElevatedTextContainer(
                          text: widget.quiz![3].answers![1].text!,
                          isSelected:
                              selectedText == widget.quiz![3].answers![1].text!,
                          onTap: () => {
                                setState(() {
                                  selectedText =
                                      widget.quiz![3].answers![1].text!;
                                }),
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => QuizResult(
                                            quiz: widget.quiz!,
                                            score: widget.score +
                                                widget.quiz![3].answers![1]
                                                    .score!)))
                              }),
                      const Gap(16),
                      ElevatedTextContainer(
                          text: widget.quiz![3].answers![2].text!,
                          isSelected:
                              selectedText == widget.quiz![3].answers![2].text!,
                          onTap: () => {
                                setState(() {
                                  selectedText =
                                      widget.quiz![3].answers![2].text!;
                                }),
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => QuizResult(
                                            quiz: widget.quiz!,
                                            score: widget.score +
                                                widget.quiz![3].answers![2]
                                                    .score!)))
                              }),
                      const Gap(16),
                      ElevatedTextContainer(
                          text: widget.quiz![3].answers![3].text!,
                          isSelected:
                              selectedText == widget.quiz![3].answers![3].text!,
                          onTap: () => {
                                setState(() {
                                  selectedText =
                                      widget.quiz![3].answers![3].text!;
                                }),
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => QuizResult(
                                            quiz: widget.quiz!,
                                            score: widget.score +
                                                widget.quiz![3].answers![3]
                                                    .score!)))
                              }),
                    ],
                  ),
                )
              ],
            ),
            Image.asset(
              'assets/images/illustration.png',
              fit: BoxFit.fitWidth,
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }
}
