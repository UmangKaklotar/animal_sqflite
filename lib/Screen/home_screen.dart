import 'dart:math';

import 'package:animal_sqflite/utils/animal_list.dart';
import 'package:animal_sqflite/utils/animal_string.dart';
import 'package:animal_sqflite/utils/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Set<String> categories = Set<String>.from(MyList.animalList.map((item) => item['Category']));
    MyList.uniqueList = categories.map((category) => {'Category': category}).toList();

    MyList.animalList.map((e) {
      if(e['Category'] == "Mammals") {
        MyList.mammals.add(e);
      } else if(e['Category'] == "Birds") {
        MyList.birds.add(e);
      } else if(e['Category'] == "Reptiles") {
        MyList.reptiles.add(e);
      } else if(e['Category'] == "Amphibians") {
        MyList.amphibians.add(e);
      } else if(e['Category'] == "Invertebrates") {
        MyList.invertebrates.add(e);
      } else if(e['Category'] == "Fish") {
        MyList.fish.add(e);
      }
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Animal App", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),),
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            icon: Icon(CupertinoIcons.heart_fill, color: MyColor.red,),
            splashRadius: 25,
            onPressed: (){},
          ),
          IconButton(
            icon: Icon(CupertinoIcons.bell_fill, color: MyColor.yellow,),
            splashRadius: 25,
            onPressed: (){},
          ),
        ],
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(vertical: 10),
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            child: Row(
              children: MyList.uniqueList.map((e) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      AnimalString.category = e['Category'];
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.only(right: 20),
                    height: 50,
                    width: 140,
                    decoration: BoxDecoration(
                      color: Color((Random().nextDouble() * 0XFFFFFFFF).toInt()).withOpacity(0.5),
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(
                        color: (AnimalString.category == e['Category']) ? MyColor.black : Colors.transparent,
                        width: 2
                      ),
                    ),
                    alignment: Alignment.center,
                    child: Text(e['Category']),
                  ),
                );
              }).toList(),
            ),
          ),
          const SizedBox(height: 20),
          if(AnimalString.category == "Mammals") SizedBox(
            height: 630,
            child: GridView.count(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              physics: const BouncingScrollPhysics(),
              crossAxisCount: 2,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
              childAspectRatio: 1/1.2,
              children: MyList.mammals.map((e) {
                return GestureDetector(
                  onTap: () => Navigator.pushNamed(context, 'detail', arguments: e),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    elevation: 6,
                    child: Column(
                      children: [
                        Expanded(
                          flex: 3,
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
                                image: DecorationImage(
                                  image: NetworkImage(e['Image']),
                                  fit: BoxFit.cover,
                                )
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
                            ),
                            alignment: Alignment.center,
                            child: Text(e['Name'], style: const TextStyle(fontSize: 18),),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          if(AnimalString.category == "Birds") SizedBox(
            height: 630,
            child: GridView.count(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              physics: const BouncingScrollPhysics(),
              crossAxisCount: 2,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
              childAspectRatio: 1/1.2,
              children: MyList.birds.map((e) {
                return GestureDetector(
                  onTap: () => Navigator.pushNamed(context, 'detail', arguments: e),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    elevation: 6,
                    child: Column(
                      children: [
                        Expanded(
                          flex: 3,
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
                                image: DecorationImage(
                                  image: NetworkImage(e['Image']),
                                  fit: BoxFit.cover,
                                )
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
                            ),
                            alignment: Alignment.center,
                            child: Text(e['Name'], style: const TextStyle(fontSize: 18),),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          if(AnimalString.category == "Reptiles") SizedBox(
              height: 630,
              child: GridView.count(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                physics: const BouncingScrollPhysics(),
                crossAxisCount: 2,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                childAspectRatio: 1/1.2,
                children: MyList.reptiles.map((e) {
                  return GestureDetector(
                    onTap: () => Navigator.pushNamed(context, 'detail', arguments: e),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      elevation: 6,
                      child: Column(
                        children: [
                          Expanded(
                            flex: 3,
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
                                  image: DecorationImage(
                                    image: NetworkImage(e['Image']),
                                    fit: BoxFit.cover,
                                  )
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
                              ),
                              alignment: Alignment.center,
                              child: Text(e['Name'], style: const TextStyle(fontSize: 18),),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          if(AnimalString.category == "Amphibians") SizedBox(
              height: 630,
              child: GridView.count(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                physics: const BouncingScrollPhysics(),
                crossAxisCount: 2,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                childAspectRatio: 1/1.2,
                children: MyList.amphibians.map((e) {
                  return GestureDetector(
                    onTap: () => Navigator.pushNamed(context, 'detail', arguments: e),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      elevation: 6,
                      child: Column(
                        children: [
                          Expanded(
                            flex: 3,
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
                                  image: DecorationImage(
                                    image: NetworkImage(e['Image']),
                                    fit: BoxFit.cover,
                                  )
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
                              ),
                              alignment: Alignment.center,
                              child: Text(e['Name'], style: const TextStyle(fontSize: 18),),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          if(AnimalString.category == "Invertebrates") SizedBox(
              height: 630,
              child: GridView.count(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                physics: const BouncingScrollPhysics(),
                crossAxisCount: 2,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                childAspectRatio: 1/1.2,
                children: MyList.invertebrates.map((e) {
                  return GestureDetector(
                    onTap: () => Navigator.pushNamed(context, 'detail', arguments: e),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      elevation: 6,
                      child: Column(
                        children: [
                          Expanded(
                            flex: 3,
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
                                  image: DecorationImage(
                                    image: NetworkImage(e['Image']),
                                    fit: BoxFit.cover,
                                  )
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
                              ),
                              alignment: Alignment.center,
                              child: Text(e['Name'], style: const TextStyle(fontSize: 18),),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          if(AnimalString.category == "Fish") SizedBox(
              height: 630,
              child: GridView.count(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                physics: const BouncingScrollPhysics(),
                crossAxisCount: 2,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                childAspectRatio: 1/1.2,
                children: MyList.fish.map((e) {
                  return GestureDetector(
                    onTap: () => Navigator.pushNamed(context, 'detail', arguments: e),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      elevation: 6,
                      child: Column(
                        children: [
                          Expanded(
                            flex: 3,
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
                                  image: DecorationImage(
                                    image: NetworkImage(e['Image']),
                                    fit: BoxFit.cover,
                                  )
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
                              ),
                              alignment: Alignment.center,
                              child: Text(e['Name'], style: const TextStyle(fontSize: 18),),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
        ],
      ),
    );
  }
}
