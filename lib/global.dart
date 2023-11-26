import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:thibiti/data/local/sp_storage.dart';
import 'package:thibiti/firebase_options.dart';

class Global {
  static late SpStorage spStorage;
  static Future init() async{
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

    spStorage = await SpStorage().initSharedPreference();
  }
}