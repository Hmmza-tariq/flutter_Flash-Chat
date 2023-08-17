import 'package:flutter/material.dart';

import '../Components/AssessmentWidget.dart';
import '../Components/Assessments.dart';

class AbsoluteCalcScreen extends StatefulWidget {
  static String id = "AbsoluteCalc_Screen";

  @override
  _AbsoluteCalcScreenState createState() => _AbsoluteCalcScreenState();
}

class _AbsoluteCalcScreenState extends State<AbsoluteCalcScreen> {
  final AssessmentWidget assessmentWidget = AssessmentWidget();
  List<AssessmentWidget> AssessmentWidgets = [];
/*
  AssessmentWidgets.add(assessmentWidget);
*/


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        title: const Text('Absolutes Calculator'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        child: Card(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: AssessmentWidgets),
        ),
      ),
    );
    ;
  }
}
