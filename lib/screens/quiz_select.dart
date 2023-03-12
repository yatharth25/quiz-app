import 'package:flutter/material.dart';
import 'package:quiz/constants/data.dart';
import 'package:quiz/models/quiz.dart';
import 'package:quiz/screens/quiz_step1.dart';
import 'package:quiz/theme.dart';
import 'package:gap/gap.dart';

class QuizSelect extends StatefulWidget {
  const QuizSelect({super.key});

  @override
  State<QuizSelect> createState() => _QuizSelectState();
}

class _QuizSelectState extends State<QuizSelect> {
  Quiz? quiz;
  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
            onTap: () {},
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
                const Gap(70),
                const Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 34,
                    ),
                    child: Text(
                      'Which quiz do you want to try?',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                const Gap(64),
                GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: 6,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      childAspectRatio: 0.842),
                  padding: const EdgeInsets.only(
                      left: 16, top: 24, right: 16, bottom: 24),
                  itemBuilder: (ctx, i) {
                    var quizName = 'Flutter';
                    return Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          boxShadow: [
                            BoxShadow(
                                color: AppColor.black.withOpacity(0.12),
                                blurRadius: 16)
                          ]),
                      child: PhysicalModel(
                        color: Colors.white,
                        elevation: 4,
                        shadowColor: Colors.transparent,
                        borderRadius: BorderRadius.circular(12),
                        child: Material(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          child: InkWell(
                            focusColor: AppColor.behan.withOpacity(0.5),
                            splashColor: AppColor.behan.withOpacity(0.5),
                            highlightColor: AppColor.behan.withOpacity(0.5),
                            hoverColor: AppColor.behan.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(12),
                            radius: 12,
                            onTap: () {
                              setState(() {
                                selectedIndex = i;
                              });
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (ctx) => QuizStep1(
                                            quiz: quiz!.data!.flutter,
                                            score: 0,
                                          )));
                            },
                            child: Container(
                              alignment: Alignment.center,
                              clipBehavior: Clip.hardEdge,
                              height: 133,
                              decoration: BoxDecoration(
                                border: selectedIndex == i
                                    ? Border.all(
                                        width: 2, color: AppColor.behan)
                                    : null,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Column(
                                children: [
                                  Expanded(
                                    flex: 6,
                                    child: ClipRRect(
                                      borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(8),
                                          topRight: Radius.circular(8)),
                                      child: Image.asset(
                                        'assets/images/flutter.png',
                                        fit: BoxFit.fitHeight,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 4,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8, vertical: 12),
                                      child: Container(
                                        alignment: Alignment.center,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Flexible(
                                              child: Text(quizName,
                                                  style: const TextStyle(
                                                      fontSize: 14,
                                                      color: AppColor.black48,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
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
    quiz = Quiz.fromJson(DummyData.dummyData);
    super.initState();
  }
}
