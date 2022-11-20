import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quize_app/provider/game_page_provider.dart';
class GamePage extends StatelessWidget {
  final String dL;
  GamePage({required this.dL});
  double? width,height;
 GamePageProvider? gamePageProvider;
  @override
  Widget build(BuildContext context) {
    width=MediaQuery.of(context).size.width;
    height=MediaQuery.of(context).size.height;
    return ChangeNotifierProvider(
        create: (context)=>GamePageProvider(context: context,difficultyLevel: dL),
        child:  buildUi(),
    );
  }
  Widget buildUi(){
    return Builder(
        builder:(context) {
          gamePageProvider=context.watch<GamePageProvider>();
          if(gamePageProvider!.questionList!=null){
            return Scaffold(
                body:SafeArea(
                    child:Container(
                      padding: EdgeInsets.symmetric(horizontal:width!*0.05),
                      child:gameUi(),
                    )
                )
            );
          }
          else{
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        }
          );


  }

  Widget gameUi(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        question(),
        Column(
          children: [
            trueButton(),
            SizedBox(height: height!*0.01,),
            falseButton(),
          ],
        )
      ],
    );
  }
  Widget question(){
    return  Text(gamePageProvider!.getCurrentQustionText(),style:const TextStyle(color: Colors.white,fontSize:25,fontWeight: FontWeight.w500));
  }
  Widget trueButton(){
    return MaterialButton(
      onPressed: (){
        gamePageProvider?.answerQuestion("True");
      },
        color:Colors.green,
        minWidth: width!*0.80,
        height: height!*0.10,
        child: const Text('True',style:TextStyle(color: Colors.white,fontSize:25,))
    );
  }
  Widget falseButton(){
    return MaterialButton(
        onPressed: (){
          gamePageProvider?.answerQuestion("False");
        },
        color:Colors.red,
        minWidth: width!*0.80,
        height: height!*0.10,
        child: const Text('False',style:TextStyle(color: Colors.white,fontSize:25,))
    );
  }
}
