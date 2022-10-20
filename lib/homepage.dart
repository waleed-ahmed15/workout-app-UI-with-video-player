import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_widget_cache.dart';
import 'package:trainingapp/colors.dart';
import 'package:trainingapp/dimension.dart';
import 'package:trainingapp/video_info.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List info = [];
  _fetchJsonData() {
    // Fetch data from json file\
    DefaultAssetBundle.of(context).loadString('json/info.json').then((value) {
      info = jsonDecode(value);
      print(info);
      setState(() {
        // Set data to variable
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fetchJsonData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.symmetric(
            horizontal: AppLayout.getWidth(30),
            vertical: AppLayout.getHeight(30),
          ),
          color: AppColor.homePageBackground,
          child: Column(
            children: [
              //this row contains training app and arrows with calender
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Training",
                    style: TextStyle(
                        color: AppColor.homePageTitle,
                        fontWeight: FontWeight.w700,
                        fontSize: 30),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.arrow_back_ios,
                        size: AppLayout.getHeight(20),
                      ),
                      Gap(AppLayout.getWidth(10)),
                      Icon(Icons.calendar_month_outlined,
                          size: AppLayout.getHeight(20)),
                      Gap(AppLayout.getWidth(10)),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: AppLayout.getHeight(20),
                      ),
                    ],
                  )
                ],
              ),
              Gap(AppLayout.getHeight(30)),
              // this row contains 2nd row below title heading
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Your Program",
                    style: TextStyle(
                        color: AppColor.homePageSubtitle,
                        fontWeight: FontWeight.w700,
                        fontSize: 20),
                  ),
                  Row(
                    children: [
                      Text(
                        "Details",
                        style: TextStyle(
                          color: AppColor.homePageDetail,
                          fontSize: AppLayout.getHeight(20),
                        ),
                      ),
                      Gap(AppLayout.getWidth(5)),
                      InkWell(
                        onTap: (() => Get.to(() => VideoInfoPage())),
                        child: Icon(
                          Icons.arrow_forward,
                          size: AppLayout.getHeight(20),
                          color: AppColor.homePageIcons,
                        ),
                      ),
                    ],
                  )
                ],
              ),

              SizedBox(
                height: AppLayout.getHeight(20),
              ),

              //making gradient container.
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: AppLayout.getWidth(20),
                  vertical: AppLayout.getHeight(20),
                ),
                height: AppLayout.getHeight(180),
                decoration: BoxDecoration(
                  color: Colors.red,
                  gradient: LinearGradient(
                    colors: [
                      AppColor.gradientFirst.withOpacity(0.8),
                      AppColor.gradientSecond.withOpacity(1),
                    ],
                    begin: Alignment.bottomLeft,
                    end: Alignment.centerRight,
                  ),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(5, 10),
                      blurRadius: AppLayout.getHeight(10),
                      color: AppColor.gradientFirst.withOpacity(0.2),
                    )
                  ],
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(80),
                    bottomRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                  ),
                ),
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Next workout",
                          style: TextStyle(
                              color: AppColor.homePageContainerTextSmall),
                        ),
                        Text(
                          'Legs Toning',
                          style: TextStyle(
                              color: AppColor.homePageContainerTextSmall,
                              fontSize: 20,
                              fontWeight: FontWeight.w600),
                        ),
                        Text("and Glutes Workout",
                            style: TextStyle(
                                color: AppColor.homePageContainerTextSmall,
                                fontSize: 20,
                                fontWeight: FontWeight.w600)),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Icon(
                          Icons.timer,
                          color: AppColor.homePageContainerTextSmall,
                          size: AppLayout.getHeight(20),
                        ),
                        Gap(AppLayout.getWidth(10)),
                        Text(
                          "60 mins",
                          style: TextStyle(
                            color: AppColor.homePageContainerTextSmall,
                            fontSize: AppLayout.getHeight(15),
                          ),
                        ),
                        Expanded(child: Container()),
                        Icon(
                          Icons.play_circle_fill,
                          color: AppColor.homePageContainerTextSmall,
                          size: AppLayout.getHeight(60),
                          shadows: [
                            BoxShadow(
                                offset: Offset(4, 8),
                                blurRadius: 10,
                                color: AppColor.gradientFirst.withOpacity(0.7))
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: AppLayout.getHeight(10),
              ),
              Container(
                // height: 10,
                // color: Colors.green.withOpacity(0.3),
                child: Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: AppLayout.getHeight(20)),
                      height: 120,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: AppColor.gradientSecond.withOpacity(0.3),
                              blurRadius: 40,
                              offset: Offset(8, 10)),
                          BoxShadow(
                              color: AppColor.gradientSecond.withOpacity(0.3),
                              blurRadius: 10,
                              offset: Offset(-5, -5))
                        ],
                        borderRadius: BorderRadius.circular(
                          AppLayout.getHeight(20),
                        ),
                        image: const DecorationImage(
                          image: AssetImage('assets/card.jpg'),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(right: AppLayout.getWidth(220)),
                      width: double.infinity,
                      // color: Colors.red.withOpacity(0.3),
                      child: Image.asset(
                        'assets/figure.png',
                        height: AppLayout.getHeight(120),
                        width: AppLayout.getWidth(100),
                        // fit: BoxFit.contain,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                          top: AppLayout.getHeight(40),
                          left: AppLayout.getWidth(140)),
                      width: double.infinity,
                      height: 130,
                      // color: Colors.red.withOpacity(0.3),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        // mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(),
                          Text(
                            'You are doing great',
                            style: TextStyle(
                                color: AppColor.homePageDetail,
                                fontSize: 18,
                                fontWeight: FontWeight.w600),
                          ),
                          Gap(AppLayout.getHeight(10)),
                          Text(
                            'keep it up',
                            style: TextStyle(
                              fontSize: 16,
                              color: AppColor.homePagePlanColor,
                            ),
                          ),
                          Text(
                            'stick to your plan',
                            style: TextStyle(
                              fontSize: 16,
                              color: AppColor.homePagePlanColor,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text(
                    "Area of Focus",
                    style: TextStyle(
                        color: AppColor.homePageTitle,
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: (info.length.toDouble() / 2).toInt(),
                  itemBuilder: (BuildContext context, int index) {
                    int a = 2 * index;
                    int b = 2 * index + 1;
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          height: AppLayout.getHeight(150),
                          width: AppLayout.getWidth(150),
                          padding: EdgeInsets.only(
                            bottom: AppLayout.getHeight(10),
                          ),
                          margin: EdgeInsets.only(
                            bottom: AppLayout.getHeight(15),
                          ),
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    offset: Offset(5, 5),
                                    blurRadius: 3,
                                    color: AppColor.gradientSecond
                                        .withOpacity(0.1)),
                                BoxShadow(
                                    offset: Offset(-4, -4),
                                    blurRadius: 3,
                                    color: AppColor.gradientSecond
                                        .withOpacity(0.1))
                              ],
                              color: Colors.white,
                              image: DecorationImage(
                                image: AssetImage(info[a]['img']),
                              ),
                              borderRadius: BorderRadius.circular(20)),
                          child: Center(
                              child: Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Text(info[a]['title']))),
                        ),
                        Container(
                          padding: EdgeInsets.only(
                            bottom: AppLayout.getHeight(10),
                          ),
                          margin: EdgeInsets.only(
                            bottom: AppLayout.getHeight(10),
                          ),
                          height: AppLayout.getHeight(150),
                          width: AppLayout.getWidth(150),
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    offset: Offset(4, 4),
                                    blurRadius: 50,
                                    color:
                                        AppColor.gradientFirst.withOpacity(0.1))
                              ],
                              color: Colors.white,
                              image: DecorationImage(
                                image: AssetImage(info[b]['img']),
                              ),
                              borderRadius: BorderRadius.circular(20)),
                          child: Center(
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Text(info[b]['title']),
                            ),
                          ),
                        )
                      ],
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
