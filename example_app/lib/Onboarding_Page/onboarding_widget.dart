import 'package:example_app/Onboarding_Page/onboarding_position.dart';
import 'package:flutter/material.dart';

class OnboardingWidget extends StatelessWidget {

  final Onboarding_Position obdPosition;
  final VoidCallback nextOn_Call;
  final VoidCallback back_Call;
  final VoidCallback skip_Call;

  const OnboardingWidget({super.key, required this.obdPosition,
    required this.nextOn_Call, required this.back_Call, required this.skip_Call});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF121212),
      body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _Skip(),
              _Image(),
              _Pagecontrol(),
              _TitleAndContent(),
              _NextAndPrevButton(),
            ],
          )
      ),
    );
  }
  Widget _Skip(){
    return Container(
      alignment: AlignmentDirectional.centerStart,
      child: TextButton(
        onPressed: (){
          skip_Call.call();
        },
        child: Text('Skip',
          style: TextStyle(
              fontSize: 16,
              color: Colors.white60
          ),
        ),
      ),
    );
  }

  Widget _Image(){
    return Image.asset(
      obdPosition.Image_page(),
      height: 240,
      width: 200,
      fit: BoxFit.fill,
    );
  }

  Widget _Pagecontrol(){
    return Container(
      margin: EdgeInsets.only(top: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 4,
            width: 25,
            decoration: BoxDecoration(
              color: obdPosition == Onboarding_Position.page1
                  ? Colors.white : Colors.white60,
              borderRadius: BorderRadius.circular(60),
            ),
          ),
          Container(
            height: 4,
            width: 25,
            margin: EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              color: obdPosition == Onboarding_Position.page2
                  ? Colors.white : Colors.white60,
              borderRadius: BorderRadius.circular(60),
            ),
          ),
          Container(
            height: 4,
            width: 25,
            decoration: BoxDecoration(
              color: obdPosition == Onboarding_Position.page3
                  ? Colors.white : Colors.white60,
              borderRadius: BorderRadius.circular(60),
            ),
          ),
        ],
      ),
    );
  }

  Widget _TitleAndContent(){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 15,),
          Text(obdPosition.Title_page(),
            style: TextStyle(
              fontSize: 30,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 22,),
          Text(obdPosition.Content_page(),
            style:  TextStyle(
                fontSize: 13,
                color: Colors.white,
            ),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }

  Widget _NextAndPrevButton(){
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24).copyWith(top: 90, bottom: 24),
      child: Row(
        children: [
          TextButton(
              onPressed: (){
                back_Call.call(); },
              child: Text(
                'Back',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white70,
              )
          ),
          ),
          const Spacer(),
          ElevatedButton(
              onPressed: (){
                nextOn_Call.call();
              },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.deepPurpleAccent,
              shape:  RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              )
            ),
              child: Text(
                obdPosition == Onboarding_Position.page3
                    ? 'Get started' : 'next',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white70,
                  )
              ),
          ),
        ],
      ),
    );
  }
}
