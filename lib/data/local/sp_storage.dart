import 'package:shared_preferences/shared_preferences.dart';

class SpStorage{
  static late SharedPreferences sharedPreferences;

/// singleton. only one instance is created and initialized and used through out the app
  Future<SpStorage> initSharedPreference() async{
    sharedPreferences = await SharedPreferences.getInstance();
    return this;
  }

  storeString({required String key,required String value}) {
    return sharedPreferences.setString(key, value);
  }

  storeInt({required String key,required int value}) {
    return sharedPreferences.setInt(key, value);
  }

  storeBool({required String key,required bool value}) {
    return sharedPreferences.setBool(key, value);
  }

  String retrieveString({required String key}) {
    return sharedPreferences.getString(key)??""; /// if null, return ""
  }

  int retrieveInt({required String key}) {
    return sharedPreferences.getInt(key)??0; /// if null, return 0
  }

  bool retrieveBool({required String key}){
    return sharedPreferences.getBool(key)??false; /// if null, return false
  }

  Future<bool> removeValue({required String key}){
    return sharedPreferences.remove(key);
  }

  Future<bool> clearStorage(){
    return sharedPreferences.clear();
  }

}