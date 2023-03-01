import 'package:animal_sqflite/utils/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnimalDetail extends StatefulWidget {
  const AnimalDetail({Key? key}) : super(key: key);

  @override
  State<AnimalDetail> createState() => _AnimalDetailState();
}

class _AnimalDetailState extends State<AnimalDetail> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    Map animal = ModalRoute.of(context)!.settings.arguments as Map;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(CupertinoIcons.arrow_left, color: MyColor.black,),
          splashRadius: 25,
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(animal['Name'], style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        physics: const BouncingScrollPhysics(),
        children: [
          Card(
            elevation: 8,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Container(
              height: 350,
              width: width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: NetworkImage(animal['Image']),
                  fit: BoxFit.cover,
                )
              ),
            ),
          ),
          const SizedBox(height: 20,),
          const Text("Description", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),),
          const SizedBox(height: 10,),
          Text(animal['Detail'], style: TextStyle(color: MyColor.grey),),
        ],
      ),
    );
  }
}
