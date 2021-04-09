import 'package:flutter/material.dart';

class Home extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new HomeState();
  }

}

/*

FORMULAE
weight = mass x surface gravity

Mercury: 0.38
Venus: 0.91
Earth: 1.00
Mars: 0.38
Jupiter: 2.34
Saturn: 1.06
Uranus: 0.92
Neptune: 1.19
Pluto: 0.06
*/

class HomeState extends State{
  int radioValue = 0;
  double _finalResult = 0.0;
  String _formattedText = "";

  final TextEditingController _weightController = new TextEditingController();

  void handleRadioChangeValue(int value) {
    setState(() {
      radioValue = value;

      switch (radioValue) {
        case 0:
          _finalResult = _calculateWeight(_weightController.text, 0.06);
          _formattedText = "Your Weight on Pluto is ${_finalResult.toStringAsFixed(1)} ";
          break;
          case 1:
            _finalResult = _calculateWeight(_weightController.text, 0.38);
            _formattedText = "Your Weight on Mars is ${_finalResult.toStringAsFixed(1)} ";
            break;
            case 2:
              _finalResult = _calculateWeight(_weightController.text, 0.91);
              _formattedText = "Your Weight on Venus is ${_finalResult.toStringAsFixed(1)} ";
              break;
      }

    });
  }



  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Weight on Planet X"),
        centerTitle: true,
        backgroundColor: Colors.black38,
      ),
      backgroundColor: Colors.blueGrey,
      body: new Container(
        alignment: Alignment.center,
        child: new ListView(
          padding: const EdgeInsets.all(2.5),
          children: [
            new Image.asset("images/planet.png",
            height: 133.0,
            width: 200.0),

            new Container(
              margin: const EdgeInsets.all(3.0),
              alignment: Alignment.center,
              child: new Column(
                children: [
                  new TextField(
                  controller: _weightController,
                  keyboardType: TextInputType.number,
                  decoration: new InputDecoration(
                    hintText: 'Your Weight on Earth',
                    labelText: 'In Kilogram',
                    icon: new Icon(Icons.person_outline)
                  ),
                  ),
                  
                  new Padding(padding: new EdgeInsets.all(5.0)),
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      new Radio<int>(

                        activeColor: Colors.brown,
                        value: 0, groupValue: radioValue, onChanged: handleRadioChangeValue,
                      ),
                      new Text('Pluto',
                        style: new TextStyle(color: Colors.white30),
                      ),

                      new Radio<int>(
                        activeColor: Colors.red,
                        value: 1, groupValue: radioValue, onChanged: handleRadioChangeValue,
                      ),
                      new Text('Mars',
                        style: new TextStyle(color: Colors.white30),
                      ),

                      new Radio<int>(
                        activeColor: Colors.orangeAccent,
                        value: 2, groupValue: radioValue, onChanged: handleRadioChangeValue,
                      ),
                      new Text('Venus',
                        style: new TextStyle(color: Colors.white30),
                      )
                    ],
                  ),

                  new Padding(padding: EdgeInsets.all(15.9)),
                  new Text(
                    _weightController.text.isEmpty ? "Please Enter Weight" : _formattedText + "kg",
                    //"$_formattedText kg",
                    style: new TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 19.5),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  double _calculateWeight(weight, multiplier) {
    if(int.parse(weight).toString().isNotEmpty  && int.parse(weight) > 0) {
      return int.parse(weight) * multiplier;

    } else {
      debugPrint('WRONG!!');
      return null;
    }
  }

}

