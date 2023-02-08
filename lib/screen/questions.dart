import 'package:flutter/material.dart';
import 'package:local_notification/data/local_notification_service.dart';
import 'package:local_notification/screen/utils/my_utils.dart';
import 'package:local_notification/screen/utils/questions/questions_data.dart';

class Questions extends StatefulWidget {
  const Questions({super.key});

  @override
  State<Questions> createState() => _QuestionsState();
}

class _QuestionsState extends State<Questions> {
  int currentId = 1;
  int currentIdTwo = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () {
              LocalNotificationService.localNotificationService
                      .cancelAllNotifications();
          }, icon: const Icon(Icons.cleaning_services_outlined))
        ],
        elevation: 0,
        title: const Text('Questions'),),
      body: PageView.builder(
        itemCount: 3,
        itemBuilder:(context, index) {
          return  Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.blue,width: 5)
        ),
        child: Column(children: [
          SizedBox(height: height(context)*0.02,),
          Padding(
            padding: EdgeInsets.all(width(context)*0.035),
            child: Container(
              height: height(context)*0.12,
              decoration: BoxDecoration(
                color: Colors.teal[50],
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(15)
              ),
              child: Column(
                children: [
                  SizedBox(height: height(context)*0.01,),
                  Center(child: Text(questionNumber[index],style: const TextStyle(fontSize: 18),)),
                  SizedBox(height: height(context)*0.01,),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: width(context)*0.03),
                    child: Text(questionWord[index]),
                  ),
                ],
              ),
              
            ),
          ),
          tabAnswer(answers('A',questionAnswerOne[index]),questionBoolOne[index]),
          tabAnswer(answers('B',questionAnswerTwo[index]),questionBoolTwo[index]),
          tabAnswer(answers('C',questionAnswerThree[index]),questionBoolThree[index]),
          tabAnswer(answers('D',questionAnswerFour[index]),questionBoolFour[index]),
          SizedBox(height: height(context)*0.1,),
          Expanded(
            child: Image.asset('assets/images/questions.png',fit: BoxFit.cover)),
        ],));
        },)
     
      );
    
  }

  answers(word,year) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width(context)*0.035,vertical: height(context)*0.008),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.teal[50],
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.black)
        ),
        width: width(context),
        height: height(context)*0.04,
        child:  Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('$word  $year',),
        ),
      ),
    );
  }

  tabAnswer(answer,isTrue) {
    return InkWell(
            onTap: () {
              if(isTrue){
              currentId++;
                LocalNotificationService.localNotificationService
                    .showNotification(id: currentId);
              } else {
                currentIdTwo++;
                LocalNotificationService.localNotificationService
                    .showNotificationTwo(id: currentId);
              }
            },
            child: answer,
          );
  }
}
