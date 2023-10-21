import 'package:bmi_calculator/screens/CONST.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/icon_data.dart';
import 'package:bmi_calculator/reusable_card.dart';
import 'results.dart';
import 'screens/cal_brain.dart';

const  activecard = Color(0xFF1D1E33);
const inactivecard = Color(0xFF111328);

enum Gender{
  male,
  female,}

class InputPage extends StatefulWidget {

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectedgender;
  int height = 180;
  int weight = 60;
  int age = 20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        backgroundColor: Color(0xFF0A0E21),
        title: Text(
          'BMI Calculator',
        ),
      ),
      body: Column(
        children: <Widget> [
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                     setState(() {
                       selectedgender = Gender.male;
                     });
                    },
                    child: Reusable(colour:selectedgender == Gender.male ? activecard : inactivecard ,
                      childcard: design(
                        icon: FontAwesomeIcons.mars,
                        label: 'MALE',
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: (){
                      setState(() {
                        selectedgender= Gender.female;
                      });
                    },
                    child: Reusable(colour: selectedgender == Gender.female ? activecard:inactivecard,
                      childcard: design(
                        icon: FontAwesomeIcons.venus,
                        label: 'FEMALE',
                      ),),
                  ),
                ),
                ],
    ),),
                Expanded(
                  child: Container(
                  margin: EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                      color: Color(0xFF1D1E33),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget> [
                      Text(
                        'HEIGHT',
                        style: klabelstyle,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget> [
                          Text(
                            height.toString(),
                            style: knumberstyle,
                          ),
                          Text(
                            'cm',
                            style: klabelstyle,
                          ),],),
                          SliderTheme(
                            data: SliderTheme.of(context).copyWith(
                              thumbColor: Colors.white,
                              inactiveTrackColor:Color(0xFF8D8E98) ,
                              overlayColor: Color(0x29EB1555),
                              activeTrackColor:  Color(0xFFEB1555),
                              thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                              overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                            ),
                            child: Slider(
                                value: height.toDouble(),
                                min: 120.0,
                                max: 220.0,
                                onChanged: (double value){
                                  setState(() {
                                    height = value.round();
                                  });
                                },
                            ),
                          ),
                        ],
                      ),
                ),),
                Expanded(
                  child: Row(
                    children:<Widget> [
                      Expanded(
                        child:Reusable(colour: Color(0xFF1D1E33),
                         childcard: Column(
                         mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                             'WEIGHT',
                              style: klabelstyle,
                            ),
                                  Text(
                                  weight.toString(),
                                  style: knumberstyle,
                                ) ,
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget> [
                                   FloatingActionButton(onPressed: (){
                                     setState(() {
                                       weight++;
                                     });
                                   },
                                 backgroundColor: Color(0xFF4C4F5E),
                                 child: Icon(
                                  Icons.add,
                                  color: Colors.white,),
                           ),
                              SizedBox(width: 10.0,),
                              FloatingActionButton(onPressed: (){
                                setState(() {
                                  weight--;
                                });
                              },
                              backgroundColor: Color(0xFF4C4F5E),
                              child: Icon(
                                 FontAwesomeIcons.minus,
                                   color: Colors.white,),
                               ),
                              ],
                            ),
                         ],
                        ),
                         ),
                      ),

          Expanded(
            child: Row(
                children:<Widget> [
            Expanded(
            child:Reusable(colour: Color(0xFF1D1E33),
            childcard: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'AGE',
                  style: klabelstyle,
                ),
                    Text(
                      age.toString(),
                      style: knumberstyle,
                    ) ,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget> [
                        FloatingActionButton(onPressed: (){
                          setState(() {
                            age++;
                          });
                        },
                          backgroundColor: Color(0xFF4C4F5E),
                          child: Icon(
                            Icons.add,
                            color: Colors.white,),
                        ),
                        SizedBox(width: 10.0,),
                        FloatingActionButton(onPressed: (){
                          setState(() {
                            age--;
                          });
                        },
                          backgroundColor: Color(0xFF4C4F5E),
                          child: Icon(
                            FontAwesomeIcons.minus,
                            color: Colors.white,),
                        ),
                      ],
                    ),
                  ],
                ),),
             ),
          ],
        ),),
          ],),),

          GestureDetector(
            onTap: () {
              Calculatorbrain cal = Calculatorbrain(height : height, weight: weight);

                Navigator.push(context, MaterialPageRoute(builder: (context) => Results(
                  bmiresult: cal.calculatebmi(),
                  resulttext: cal.getresult(),
                  interpretation: cal.getinterpretation(),
                )));
               },
            child: Container(
              child: Center(
                child: Text('CALCULATE',
                  style: kbuttonstyle,),
              ),
              color: Color(0xFFEB1555),
              margin: EdgeInsets.only(top: 10.0,),
              height: 80.0,
              width: double.infinity,
            ),
          ),
    ],),);
  }
}



