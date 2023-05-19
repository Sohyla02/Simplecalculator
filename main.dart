// ignore_for_file: library_private_types_in_public_api


import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator ' ,
      color: Colors.black,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
      debugShowCheckedModeBanner: true,
    );
  }
}
class HomePage extends StatefulWidget{
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}
class _HomePageState extends State<HomePage>{

   late int first, second;
   late String opp;
   late String result, text = "";
   void btnClicked(String btnText){
     if(btnText == "c"){
       print("case 1");
       result = "";
       text = "";
       first = 0;
       second = 0;
     } else if(btnText == "+" || btnText == "-" || btnText == "x" || btnText == "/"){
       first = int.parse(text);
       result = "";
       opp = btnText;
     } else if(btnText == "="){
       second = int.parse(text);
       if(opp == "+"){
         result = (first+second).toString();
       } if(opp == "-"){
         result = (first-second).toString();
       } if(opp == "x"){
         result = (first*second).toString();
       } if(opp == "/"){
       result = (first~/second).toString();
       }
     } else{
       print("case 2");
       result = int.parse(text + btnText).toString();
     }
     setState(() {
       text = result;
     });
  }



  Widget customeOutLineButton(String value){
    const EdgeInsets.all(50);

    return Expanded(
      child: OutlinedButton(
         onPressed: () => btnClicked(value) ,
        child: Text(
          value,
          style: const TextStyle(fontSize: 50),
        ),

      ),
    );
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(

      appBar: AppBar(title: const Text('Calculator application'), titleTextStyle: const TextStyle(fontSize:30, color: Colors.black54),

      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
                child: Container(
                  color: Colors.white70,
                 padding:  const EdgeInsets.all(10),
                 alignment: Alignment.bottomRight,
                 child:  Text(
                   text,
                   style: const TextStyle(
                     fontSize: 50,
                     fontWeight: FontWeight.w600,
                     color: Colors.grey
                   ),
                 ),
                )
            ),
            Row(
              children: [
                customeOutLineButton("9"),
                customeOutLineButton("8"),
                customeOutLineButton("7"),
                customeOutLineButton("+"),
              ],
            ),

            Row(
              children: [
                customeOutLineButton("6"),
                customeOutLineButton("5"),
                customeOutLineButton("4"),
                customeOutLineButton("-"),
              ],
            ),
            Row(
              children: [
                customeOutLineButton("3"),
                customeOutLineButton("2"),
                customeOutLineButton("1"),
                customeOutLineButton("x"),
              ],
            ),
            Row(
              children: [
                customeOutLineButton("c"),
                customeOutLineButton("0"),
                customeOutLineButton("="),
                customeOutLineButton("/"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}




