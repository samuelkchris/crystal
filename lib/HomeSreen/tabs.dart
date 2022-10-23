import 'package:flutter/material.dart';
import 'package:flutter_greetings/flutter_greetings.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_delivery_app/Constants/colors.dart';
import 'package:food_delivery_app/Constants/constant.dart';
import 'package:food_delivery_app/Constants/style.dart';
import 'package:food_delivery_app/Root/auth/auth_util.dart';
import 'package:food_delivery_app/Root/backend/backend.dart';
import 'package:food_delivery_app/Root/flutter_flow/flutter_flow_theme.dart';

import 'foodDetail.dart';

// ...
class AppB extends StatefulWidget {
  @override
  _AppBState createState() => _AppBState();
}

class _AppBState extends State<AppB> {
  int selectedFoodCard = 0;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<UsersRecord>(
        stream: UsersRecord.getDocument(currentUserReference),
        builder: (context, snapshot) {
          // Customize what your widget looks like when it's loading.
          if (!snapshot.hasData) {
            return Center(
              child: SizedBox(
                width: 40,
                height: 40,
                child: SpinKitChasingDots(
                  color: FlutterFlowTheme.primaryColor,
                  size: 40,
                ),
              ),
            );
          }
          final homePageUsersRecord = snapshot.data;
          return MaterialApp(
              debugShowCheckedModeBanner: false,
              home: DefaultTabController(
                  length: 4,
                  child: Scaffold(
                    backgroundColor: AppColors.white,
                    body: ListView(
                        shrinkWrap: true,
                        physics: ClampingScrollPhysics(),
                        padding: EdgeInsets.only(left: 0, top: 0),
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 0),
                                  child: Text(
                                    YonoGreetings.showGreetings(),
                                    style: FlutterFlowTheme.title2.override(
                                        fontFamily: 'Lexend Deca',
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 4, 0, 0),
                                  child: Text(
                                    homePageUsersRecord.displayName,
                                    style: FlutterFlowTheme.title2.override(
                                        fontFamily: 'Lexend Deca',
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8, 0, 0, 0),
                                  child: Image.asset(
                                    'assets/images/waving-hand-sign_emoji-modifier-fitzpatrick-type-5_1f44b_1f3fe.png',
                                    width: 36,
                                    height: 36,
                                    fit: BoxFit.cover,
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(height: 10),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(width: 20),
                              Icon(
                                Icons.search,
                                color: AppColors.secondary,
                                size: 25,
                              ),
                              SizedBox(width: 10),
                              Expanded(
                                  child: TextField(
                                decoration: InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 2,
                                          color: AppColors.lighterGray)),
                                  hintText: 'Search..',
                                  hintStyle: TextStyle(
                                      color: AppColors.lightGray,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500),
                                ),
                              )),
                              SizedBox(width: 20),
                            ],
                          ),
                          SizedBox(height: 25),
                          Padding(
                            padding: const EdgeInsets.only(left: 20, top: 0),
                            child: PrimaryText(
                                text: 'Categories',
                                fontWeight: FontWeight.w700,
                                size: 22),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20, top: 10),
                            child: TabBar(isScrollable: true, tabs: [
                              foodCategoryCard(foodCategoryList[0]['imagePath'],
                                  foodCategoryList[0]['name'], 0),
                              foodCategoryCard(foodCategoryList[1]['imagePath'],
                                  foodCategoryList[1]['name'], 1),
                              foodCategoryCard(foodCategoryList[2]['imagePath'],
                                  foodCategoryList[2]['name'], 2),
                              foodCategoryCard(foodCategoryList[3]['imagePath'],
                                  foodCategoryList[3]['name'], 3),
                            ]),
                          ),
                          Container(
                              height: 600,
                              child: TabBarView(
                                children: [
                                  pizza(),
                                  Cupcake(),
                                  Birthcake(),
                                  Fastfood()
                                ],
                              )),
                        ]),
                  )));
        });
  }

  Widget Fastfood() {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 25),
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 0),
                child: PrimaryText(
                    text: 'Popular', fontWeight: FontWeight.w700, size: 22),
              ),
              Column(
                children: List.generate(
                  popularFoodList.length,
                  (index) => popularFoodCard(
                      fastFoodList[index]['imagePath'],
                      fastFoodList[index]['name'],
                      fastFoodList[index]['Price'],
                      fastFoodList[index]['star']),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget pizza() {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 25),
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 0),
                child: PrimaryText(
                    text: 'Popular', fontWeight: FontWeight.w700, size: 22),
              ),
              Column(
                children: List.generate(
                  popularFoodList.length,
                  (index) => popularFoodCard(
                      popularFoodList[index]['imagePath'],
                      popularFoodList[index]['name'],
                      popularFoodList[index]['Price'],
                      popularFoodList[index]['star']),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget Cupcake() {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 25),
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 0),
                child: PrimaryText(
                    text: 'Popular', fontWeight: FontWeight.w700, size: 22),
              ),
              Column(
                children: List.generate(
                  popularFoodList.length,
                  (index) => popularFoodCard(
                      CupcakesList[index]['imagePath'],
                      CupcakesList[index]['name'],
                      CupcakesList[index]['Price'],
                      CupcakesList[index]['star']),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget Birthcake() {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 25),
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 0),
                child: PrimaryText(
                    text: 'Popular', fontWeight: FontWeight.w700, size: 22),
              ),
              Column(
                children: List.generate(
                  popularFoodList.length,
                  (index) => popularFoodCard(
                      BirthDayCakes[index]['imagePath'],
                      BirthDayCakes[index]['name'],
                      BirthDayCakes[index]['Price'],
                      BirthDayCakes[index]['star']),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget popularFoodCard(
      String imagePath, String name, String Price, String star) {
    return GestureDetector(
      onTap: () => {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => FoodDetail(imagePath, name, Price)))
      },
      child: Container(
        margin: EdgeInsets.only(right: 25, left: 20, top: 25),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: [BoxShadow(blurRadius: 10, color: AppColors.lighterGray)],
          color: AppColors.white,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 25, left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: AppColors.primary,
                            size: 20,
                          ),
                          SizedBox(width: 10),
                          PrimaryText(
                            text: 'top of the week',
                            size: 16,
                          )
                        ],
                      ),
                      SizedBox(height: 15),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 2.2,
                        child: PrimaryText(
                            text: name, size: 22, fontWeight: FontWeight.w700),
                      ),
                      PrimaryText(
                          text: Price, size: 18, color: AppColors.lightGray),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 45, vertical: 20),
                      decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          )),
                      child: Icon(Icons.add, size: 20),
                    ),
                    SizedBox(width: 20),
                    SizedBox(
                      child: Row(
                        children: [
                          Icon(Icons.star, size: 12),
                          SizedBox(width: 5),
                          PrimaryText(
                            text: star,
                            size: 18,
                            fontWeight: FontWeight.w600,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Container(
              transform: Matrix4.translationValues(30.0, 25.0, 0.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: [
                    BoxShadow(color: Colors.grey[400], blurRadius: 20)
                  ]),
              child: Hero(
                tag: imagePath,
                child: Image.asset(imagePath,
                    width: MediaQuery.of(context).size.width / 2.9),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget foodCategoryCard(String imagePath, String name, int index) {
    return GestureDetector(
      onTap: () => {
        setState(
          () => {
            print(index),
            selectedFoodCard = index,
          },
        ),
      },
      child: Container(
        margin: EdgeInsets.only(right: 0, top: 0, bottom: 0),
        padding: EdgeInsets.symmetric(vertical: 25, horizontal: 20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color:
                selectedFoodCard == index ? AppColors.primary : AppColors.white,
            boxShadow: [
              BoxShadow(
                color: AppColors.lighterGray,
                blurRadius: 15,
              )
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset(imagePath, width: 40),
            PrimaryText(text: name, fontWeight: FontWeight.w800, size: 16),
            RawMaterialButton(
                onPressed: () => {},
                fillColor: selectedFoodCard == index
                    ? AppColors.white
                    : AppColors.tertiary,
                shape: CircleBorder(),
                child: Icon(Icons.chevron_right_rounded,
                    size: 20,
                    color: selectedFoodCard == index
                        ? AppColors.black
                        : AppColors.white))
          ],
        ),
      ),
    );
  }
}
