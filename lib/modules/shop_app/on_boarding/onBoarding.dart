import 'package:flutter/material.dart';
import 'package:sala/modules/shop_app/login/login.dart';
import 'package:sala/shared/network/cashe_helper.dart';
import 'package:sala/shared/styles/color.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ModelBoarding {
  final String img;
  final String title;
  final String title2;

  ModelBoarding({required this.img, required this.title, required this.title2});
}

class OnBoarding extends StatefulWidget {
  OnBoarding({Key? key}) : super(key: key);

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  List<ModelBoarding> Model1 = [
    ModelBoarding(
        img: 'image/start.png',
        title: "Welcome To Cozmo",
        title2: "Your new destination for online shopping ...."),
    ModelBoarding(
        img: 'image/platforms.png',
        title: "Cozmo Platforms ",
        title2: "You can find Cozmo on all platforms web, desktop, mobile...."),
    ModelBoarding(
        img: 'image/pay.png',
        title: "Cozmo Pay",
        title2: "You easily use your credit card, PayBall  ...."),
    ModelBoarding(
        img: 'image/delivery.png',
        title: "Cozmo Delivery",
        title2: "We can deliver your products wherever you are ...."),
  ];

  PageController page_view = PageController();

  bool last = false;

  void submit() {
    CacheHelper.saveData(key: 'onBoarding', value: true).then((value) {
      if (value!)
        Navigator.pushAndRemoveUntil(context,
            MaterialPageRoute(builder: (context) {
          return login();
        }), (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
              onPressed: () {
                submit();
              },
              child: Text(
                "SKIP",
                style: TextStyle(
                    color: CozmoColor2,
                    fontSize: 20,
                    fontWeight: FontWeight.w700),
              ))
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: page_view,
              onPageChanged: (index) {
                if (Model1.length - 1 == index) {
                  setState(() {
                    last = true;
                  });
                } else {
                  setState(() {
                    last = false;
                  });
                }
              },
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) => ItemBoard(Model1[index]),
              itemCount: Model1.length,
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Row(
              children: [
                SmoothPageIndicator(
                  controller: page_view,
                  count: Model1.length,
                  effect: ExpandingDotsEffect(
                      dotColor: Colors.black26,
                      activeDotColor: CozmoColor2,
                      dotHeight: 13,
                      dotWidth: 13,
                      expansionFactor: 4,
                      spacing: 5),
                ),
                Spacer(),
                FloatingActionButton(
                  onPressed: () {
                    if (last) {
                      submit();
                    } else {
                      page_view.nextPage(
                          duration: Duration(milliseconds: 700),
                          curve: Curves.easeInQuart);
                    }
                  },
                  child: Icon(Icons.arrow_forward_ios_rounded),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget ItemBoard(ModelBoarding model) {
    return Padding(
      padding: const EdgeInsets.only(right: 30.0, left: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child: Image(
            image: AssetImage('${model.img}'),
            // fit: BoxFit.fitWidth,
          )),
          SizedBox(
            height: 30,
          ),
          Text(
            "${model.title}",
            style: TextStyle(
                color: CozmoColor2, fontSize: 30, fontWeight: FontWeight.w700),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            "${model.title2}",
            style: TextStyle(
                color: CozmoColor1, fontSize: 14, fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}
