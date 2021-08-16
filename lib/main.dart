import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        
        primarySwatch: Colors.pink,//3
      ),
      home: MyHomePage(title: 'Calculator'),//2
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String output="0";
  
  String _output="0";
  double num1=0.0;
  double num2=0.0;
  String operand="";

  void butttonPressed(String buttonText) {
    if(buttonText == "CLEAR"){
      _output="0";
      num1=0.0;
      num2=0.0;
      operand="";
    }
    else if(buttonText == "+" || buttonText == "-" || buttonText == "X" || buttonText == "/"){
      num1 = double.parse(output);
      operand=buttonText;
      _output="0";
    }
    else if(buttonText == "."){
      if(_output.contains(".")){
        print("Alredy decimal");
        return;
      }
      else{
        _output=_output + buttonText;
      }
    }
    else if(buttonText == "="){
      num2 = double.parse(output);

      if(operand == "+"){
        _output = (num1+num2).toString();
      }

      if(operand == "-"){
        _output = (num1-num2).toString();
      }

      if(operand == "X"){
        _output = (num1*num2).toString();
      }

      if(operand == "/"){
        _output = (num1/num2).toString();
      }

      num1 =  0.0;
      num2 = 0.0;
      operand = "";

    }else{
        _output=_output + buttonText;
      }
      print(output);

      setState(() {
        output = double.parse(_output).toStringAsFixed(2);
      });


  }

  Widget buildbutton(String buttonText){
     return new Expanded(
        child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: new OutlinedButton(
        child: new Text(buttonText,
        style: TextStyle(fontSize: 20.0,
        fontWeight: FontWeight.bold
        ),),
        onPressed: (){ 
          butttonPressed(buttonText) ;
           },
        ),
      ),
      );
 }

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
         title: Text(widget.title),
      ),
      body: Container(

        child:  Column(children: <Widget>[
          new Container(
            alignment: Alignment.centerRight,
            padding: new EdgeInsets.symmetric(
              vertical: 28.0,
              horizontal: 14.0
            ),
            child: new Text(output, style: new TextStyle(
              fontSize: 46,
              fontWeight: FontWeight.bold
            ),)),
          new Expanded(child: new Divider(),), 
          
          
             Column(children: [
             Row(children: [
           
             buildbutton("7"),
             buildbutton("8"),
             buildbutton("9"), 
             buildbutton("/")
            ]),
              Row(children: [
           
             buildbutton("4"),
             buildbutton("5"),
             buildbutton("6"), 
             buildbutton("X")
            ]),
              Row(children: [
           
             buildbutton("1"),
             buildbutton("2"),
             buildbutton("3"), 
             buildbutton("-")
            ]),
              Row(children: [
           
             buildbutton("."),
             buildbutton("0"),
             buildbutton("00"), 
             buildbutton("+")
            ]),
              Row(children: [
           
             buildbutton("CLEAR"),
             buildbutton("=")
          
            ])
          ])

           

        ],),

      
      )//1
     
    );
  }

}
