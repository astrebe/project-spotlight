import 'dart:developer';
import 'dart:io';
import 'RecalledProductDatabase.dart';
import 'ApiService.dart';

import 'package:path_provider/path_provider.dart';

class DatabaseStorage {

  DateTime _mostRecentSunday(DateTime date) =>
    DateTime(date.year, date.month, date.day - date.weekday % 7);
  
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/dbcache.txt');
  } 

  Future<bool> dbCacheExists() async {
    final path = await _localPath;
    return File('$path/dbcache.txt').exists();
  }

  Future<File> writeDatabaseCache(String db) async {
    final file = await _localFile;

    // Write the file
    return file.writeAsString(db, mode: FileMode.append);
  }

  Future<RecalledProductDB> fetchOnlineAndWriteDatabaseCache() async {
    //List<RecalledProduct>? _db = <RecalledProduct>[];
    RecalledProductDB _db = RecalledProductDB();
    _db = await ApiService().getProducts();

    return _db;
  }

  //Read the file if the file's date is not a week old. Should anything go wrong
  //with reading the file, it will just fetch it from online.
  Future<RecalledProductDB> readFileIfUpdated() async {
    //List<RecalledProduct>? _db = <RecalledProduct>[];
    RecalledProductDB _db = RecalledProductDB();
    try {
      final cache = await _localFile;
      final contents = await cache.readAsString();
      final DateTime lastModified = await cache.lastModified();

      if(_mostRecentSunday(DateTime.now()).isAtSameMomentAs(_mostRecentSunday(lastModified))){
        _db.recalledProductDBFromJson(contents);
        //recalledProductFromJson(contents);
        return _db;
      } else {
        return fetchOnlineAndWriteDatabaseCache();
      }
        
    } catch (e) {
      log("$e");
      // If encountering an error, throw empty 
      return fetchOnlineAndWriteDatabaseCache();
    }
  } 
}

