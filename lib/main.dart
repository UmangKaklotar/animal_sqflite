import 'dart:io';

import 'package:animal_sqflite/Screen/home_screen.dart';
import 'package:animal_sqflite/utils/animal_list.dart';
import 'package:animal_sqflite/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import 'Screen/animal_detail.dart';
import 'Screen/splash_screen.dart';

Future<void> copyDatabase() async {
  Directory documentsDirectory = await getApplicationDocumentsDirectory();
  String path = join(documentsDirectory.path, 'database.db');

  bool fileExists = await databaseExists(path);

  if (!fileExists) {
    ByteData data = await rootBundle.load(join('assets/database/Animals.db'));
    List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
    await File(path).writeAsBytes(bytes);
  }
}


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await copyDatabase();
  Directory documentsDirectory = await getApplicationDocumentsDirectory();
  String path = join(documentsDirectory.path, 'database.db');
  Database database = await openDatabase(path);

  MyList.animalList = await database.rawQuery('SELECT * FROM Animals');

  for (var row in MyList.animalList) {
    print(row);
  }

  runApp(
    MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          titleTextStyle: GoogleFonts.poppins(color: MyColor.black),
        ),
        textTheme: TextTheme(
          bodyText2: GoogleFonts.poppins(color: MyColor.black),
        ),
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const SplashScreen(),
        'home': (context) => const HomeScreen(),
        'detail': (context) => const AnimalDetail(),
      },
    ),
  );
}