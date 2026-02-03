import 'package:flutter/material.dart';
import 'package:h_w1/answer_button.dart';
import 'package:h_w1/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({required this.onSelectAnswer, super.key});

  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreen();
  }
}

class _QuestionsScreen extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;

  void answerQuestion(String selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer);

    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(context) {
    final currentQuestion = questions[currentQuestionIndex];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 227, 184, 140),
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),

            ...currentQuestion.getShuffledAnswers().map((answer) {
              return AnswerButton(
                answerText: answer,
                onTap: () {
                  answerQuestion(answer);
                },
              );
            }),

            /* AnswerButton(answerText: currentQuestion.answers[0], onTap: () {}),
        
            AnswerButton(answerText: currentQuestion.answers[1], onTap: () {}),
        
            AnswerButton(answerText: currentQuestion.answers[2], onTap: () {}),
        
            AnswerButton(answerText: currentQuestion.answers[3], onTap: () {}), */
          ],
        ),
      ),
    );
  }
}
