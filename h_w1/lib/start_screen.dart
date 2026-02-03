import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:h_w1/questions_screen.dart';


class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  /* void onClick(context) {
    AlertDialog altertDialog = AlertDialog(
      title: const Text('Quiz'),
      content: const Text(
        ' هل تريد دخول الاختبار ؟',
        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
      ),
      backgroundColor: const Color.fromARGB(255, 168, 180, 155),

      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text(
            ' لا',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => QuestionsScreen()),
            );
          },
          child: const Text(
            'نعم',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );

    showDialog(
      context: context,
      builder: (context) {
        return altertDialog;
      },
    );
  }  */



  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,

        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 300,
            color: const Color.fromARGB(122, 255, 255, 255),
          ),
          const SizedBox(height: 80),

          Text(
            'Learn Flutter the fun way!',
            style: GoogleFonts.lato(color: Colors.white, fontSize: 25),
          ),
          const SizedBox(height: 30),

          OutlinedButton.icon(
            onPressed: startQuiz,
            style: OutlinedButton.styleFrom(foregroundColor: Colors.white),

            icon: Icon(Icons.arrow_right_alt),

            label: const Text(
              'Start Quiz',
              /* style: TextStyle(
              color: Colors.white,
              fontSize: 15
            ), */
            ),
          ),
        ],
      ),
    );
  }
}
