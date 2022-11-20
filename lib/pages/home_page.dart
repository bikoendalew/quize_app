import 'package:flutter/material.dart';
import 'package:quize_app/pages/game_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double? dh,dw;
  double currentDifficulty=0;
  final List<String> difficulty=["Easy","Medium","Hard"];
  @override
  Widget build(BuildContext context) {
    dh=MediaQuery.of(context).size.height;
    dw=MediaQuery.of(context).size.width;
    return Scaffold(
      body:SafeArea(
          child:Container(
            padding: EdgeInsets.symmetric(horizontal:dw!*0.05),
        child:Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize:MainAxisSize.max,
            children: [
 title(),
              widgetSilder(),
              _startGameButton()
            ],
          ),
        ) ,
          )
      )
    );
  }
  Widget title(){
    return Column(
      children: [
       const  Text('Quize App',style: TextStyle(fontSize: 50,color: Colors.white,fontWeight: FontWeight.w500)),
        Text(difficulty[currentDifficulty.toInt()],style: const TextStyle(fontSize: 30,color: Colors.white,fontWeight: FontWeight.w500)),

      ],
    );
  }
  Widget widgetSilder(){

    return Slider(
      label: 'Difficulty',
        min:0,
        max:2,
        divisions:2,
        value: currentDifficulty, onChanged: (value){
      setState((){
       currentDifficulty=value;
     });
    });
  }
  Widget _startGameButton() {
    return MaterialButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext _context) {
              return GamePage(dL: difficulty[currentDifficulty.toInt()].toLowerCase(),);
            },
          ),
        );
      },
      color: Colors.blue,
      minWidth: dw! * 0.80,
      height: dh! * 0.10,
      child: const Text(
        "Start",
        style: TextStyle(color: Colors.white, fontSize: 25),
      ),
    );
  }
}
