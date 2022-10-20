import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:trainingapp/colors.dart';
import 'package:trainingapp/dimension.dart';

class VideoInfoPage extends StatefulWidget {
  const VideoInfoPage({super.key});

  @override
  State<VideoInfoPage> createState() => _VideoInfoPageState();
}

class _VideoInfoPageState extends State<VideoInfoPage> {
  List info = [];
  _fetchJsonData() {
    // Fetch data from json file\
    DefaultAssetBundle.of(context)
        .loadString('json/videoinfo.json')
        .then((value) {
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
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                AppColor.gradientFirst.withOpacity(0.9),
                AppColor.gradientSecond,
              ],
              begin: FractionalOffset(0.0, 0.4),
              end: Alignment.topRight,
            ),
          ),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(
                    left: AppLayout.getWidth(20),
                    right: AppLayout.getWidth(20),
                    top: AppLayout.getHeight(20)),
                width: double.infinity,
                height: AppLayout.getHeight(200),
                // color: Colors.red.withOpacity(0.2),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            Get.back();
                          },
                          child: Icon(
                            Icons.arrow_back_ios,
                            color: AppColor.homePageContainerTextSmall,
                            size: 20,
                          ),
                        ),
                        Icon(Icons.info_outline,
                            color: AppColor.homePageContainerTextSmall,
                            size: 20),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(),
                        Text(
                          'Legs Toning',
                          style: TextStyle(
                              color: AppColor.secondPageTitleColor,
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: AppLayout.getHeight(5),
                        ),
                        Text("and Glutes Workout",
                            style: TextStyle(
                                color: AppColor.secondPageTitleColor,
                                fontSize: 20,
                                fontWeight: FontWeight.w500))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: EdgeInsets.all(AppLayout.getHeight(5)),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            gradient: LinearGradient(
                              colors: [
                                AppColor.secondPageContainerGradient1stColor
                                    .withOpacity(0.9),
                                AppColor.secondPageContainerGradient2ndColor
                                    .withOpacity(0.9),
                              ],
                              begin: Alignment.bottomLeft,
                              end: Alignment.topRight,
                            ),
                          ),
                          child: Row(children: [
                            Icon(
                              Icons.timer_outlined,
                              color: AppColor.homePageContainerTextBig,
                            ),
                            Text(
                              "68 mins",
                              style: TextStyle(
                                  color: AppColor.homePageContainerTextBig),
                            )
                          ]),
                        ),
                        Container(
                          padding: EdgeInsets.all(AppLayout.getHeight(5)),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            // color: Colors.white.withOpacity(0.1),
                            gradient: LinearGradient(
                              colors: [
                                AppColor.secondPageContainerGradient1stColor
                                    .withOpacity(0.9),
                                AppColor.secondPageContainerGradient2ndColor
                                    .withOpacity(0.9),
                              ],
                              begin: Alignment.bottomLeft,
                              end: Alignment.topRight,
                            ),
                          ),
                          child: Row(children: [
                            Icon(
                              Icons.handyman_outlined,
                              color: AppColor.homePageContainerTextBig,
                            ),
                            Text(
                              "Resistent band,Kettlebell",
                              style: TextStyle(
                                  color: AppColor.homePageContainerTextBig),
                            )
                          ]),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Gap(30),
              Expanded(
                  child: Container(
                padding: EdgeInsets.only(
                    left: AppLayout.getWidth(20),
                    right: AppLayout.getWidth(20),
                    top: AppLayout.getHeight(20)),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(70),
                  ),
                ),
                child: Column(children: [
                  Row(
                    children: [
                      Text(
                        'Circuit 1 : Legs Toning',
                        style: TextStyle(
                            color: AppColor.circuitsColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      Expanded(child: Container()),
                      Icon(
                        Icons.loop_outlined,
                        color: AppColor.loopColor,
                      ),
                      Text(
                        ' 3 sets',
                        style: TextStyle(
                            color: AppColor.setsColor,
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  )
                ]),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
