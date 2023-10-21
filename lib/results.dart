import 'package:bmi_calculator/screens/CONST.dart';
import 'package:bmi_calculator/reusable_card.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/reusable_card.dart';
import 'input_page.dart';

class Results extends StatelessWidget {

   Results({required this.bmiresult, required this.interpretation , required this.resulttext});

   final String bmiresult;
   final String resulttext;
   final String interpretation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF0A0E21),
        title: Text('BMI CALCULATOR'),
      ),
      body:Column(
        children : <Widget> [
          Text('Your Result',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 50.0,
          ),),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                        color: Color(0xFF1D1E33),
                        borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget> [
                        Text(
                          resulttext,
                          style:  TextStyle(
                            fontSize: 18.0,
                            color: Colors.green,
                          ),
                        ),
                        Text(
                          bmiresult,
                          style: kbmitext,
                        ),
                        Text(
                          interpretation,
                          textAlign: TextAlign.center,
                          style: ktext,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context, MaterialPageRoute(builder: (context) => InputPage()));
            },
            child: Container(
              child: Center(
                child: Text('RE-CALCULATE',
                  style: kbuttonstyle,),
              ),
              color: Color(0xFFEB1555),
              margin: EdgeInsets.only(top: 10.0,),
              height: 80.0,
              width: double.infinity,
            ),
          ),
        ],
      ),
    );
  }
}
