import 'package:flutter/material.dart';

class SteperCollege extends StatefulWidget {
  const SteperCollege({super.key});

  @override
  State<SteperCollege> createState() => _SteperCollegeState();
}

class _SteperCollegeState extends State<SteperCollege> {
  int currentStep= 0;
  List<Step> menuitem= [

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(' Stepper '),
      ),
      body: Stepper(
        currentStep: currentStep,
        onStepContinue: (){
           if(currentStep !=2){
             setState(() {
               currentStep +=1;
             });
           }
        },
          onStepCancel: (){
         if(currentStep!= 0){
           setState(() {
             currentStep -=1;
           });
         }
          },
          onStepTapped: (int newindex){
          setState(() {
            currentStep=newindex;
          });
          },

        type: StepperType.horizontal,
          steps: [
            Step(
                state: StepState.indexed,
                isActive: currentStep ==0,
                title: Text('Arafat'),
                content: Text('Student')),
            Step(
                state: StepState.indexed,
                isActive: currentStep ==1,
                title: Text('Zaman'), content: Text('Brur')),
            Step(
                state: StepState.indexed,
                isActive: currentStep ==2,
                title: Text('Arafat'), content: Text('Student')),
          ]
      ),
    );
  }
}
