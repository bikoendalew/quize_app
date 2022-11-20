import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
class GamePageProvider extends ChangeNotifier{
 final Dio dio=Dio();
 int currentquestioncount=0;
 final String difficultyLevel;
 final int maxQuestion=10;
 List? questionList;
 int countCorrect=0;
 BuildContext context;
GamePageProvider({required this.context,required this.difficultyLevel}){
  dio.options.baseUrl='https://opentdb.com/api.php';
  _getQuestion();

}
Future<void>_getQuestion()async{
  var response= await dio.get('',queryParameters: {'amount':10,'type':'boolean','difficulty':difficultyLevel});
  var data=jsonDecode(response.toString());
  questionList=data['results'];
 notifyListeners();
}
String getCurrentQustionText(){
  return questionList![currentquestioncount]["question"];
}
Future<void> answerQuestion(String answer) async {
  bool iscorrect=questionList![currentquestioncount]["correct_answer"]==answer;
 countCorrect+= iscorrect? 1:0;
  currentquestioncount++;
showDialog(context: context, builder:(BuildContext context){
  return AlertDialog(
    backgroundColor: iscorrect? Colors.green:Colors.red,
    title:Icon(iscorrect? Icons.check_circle:Icons.cancel_sharp,
        color:Colors.white),

  );
});
await Future.delayed(const Duration(seconds:1));
Navigator.pop(context);
if(currentquestioncount==maxQuestion){
  endgame();
}
else{
  notifyListeners();
}

}
Future<void> endgame()async{
  showDialog(context: context, builder: (BuildContext context){
    return AlertDialog(
      backgroundColor: Colors.blue,
      title:const  Text('End Game',style: TextStyle(fontSize: 25,color: Colors.white)),
      content: Text("Score $countCorrect/$maxQuestion",style: TextStyle(fontSize: 30,color: Colors.white)),
    );
  });
await Future.delayed(const Duration(seconds:3));
Navigator.pop(context);
Navigator.pop(context);
}
}
