import 'dart:math';

import 'package:animal_sqflite/utils/animal_list.dart';
import 'package:animal_sqflite/utils/animal_string.dart';
import 'package:animal_sqflite/utils/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(MyList.animalList[Random().nextInt(MyList.animalList.length)]['Image']),
            fit: BoxFit.cover,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text("Ready To\nWatch ?",
                style: TextStyle(
                  fontSize: 35,
                  color: MyColor.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(AnimalString.slogan, style: TextStyle(color: MyColor.white),),
            const SizedBox(height: 50),
            CupertinoButton(
              color: MyColor.grey.withOpacity(0.3),
              child: const Text("Get Started"),
              onPressed: () => Navigator.pushReplacementNamed(context, 'home'),
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
