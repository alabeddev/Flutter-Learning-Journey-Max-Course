import 'package:flutter/material.dart';
import 'package:h_w1/data/questions.dart';
import 'package:h_w1/start_screen.dart';
import 'package:h_w1/questions_screen.dart';
import 'package:h_w1/results_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> selectedAnswers = [];
  var activeScreen = 'start-screen';

  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        
        activeScreen = 'results-screen';
      });
    }
  }

  @override
  Widget build(context) {
    Widget screenWidget = StartScreen(switchScreen);

    if (activeScreen == 'questions-screen') {
      screenWidget = QuestionsScreen(onSelectAnswer: chooseAnswer);
    }

    if (activeScreen == 'results-screen') {
      screenWidget = ResultsScreen(chosenAnswers: selectedAnswers);
    }



    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 132, 77, 57),
                Color.fromARGB(255, 103, 76, 66),
              ],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
            ),
          ),

          child: screenWidget,
        ),
      ),
    );
  }
}
 
      //     أنشاء قوائم 

 /* Widget myListView() {
  var list = ListView(
    children: [
      ListTile(
        leading: Icon(Icons.access_alarms_sharp),
        title: Text('My alarm'),
        subtitle: Text('The body of the alam list'),
        trailing: Icon(Icons.more_vert),
      ),
    ],
  );

  return list;
} */
