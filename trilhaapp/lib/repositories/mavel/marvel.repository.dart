import 'dart:convert';

import 'package:dio/dio.dart';

import '../../models/characters.model.dart';
import 'package:crypto/crypto.dart' as crypto;
import 'package:convert/convert.dart';
//import 'package:flutter_dotenv/flutter_dotenv.dart';

class MarvelRepository {
  Future<CharactersModel> getCharacters(int offset) async {
    var dio = Dio();
    var ts = DateTime.now().microsecondsSinceEpoch.toString();
    var publicKey =
        '3e7f80f3fb131f556b9731cf9154a901'; //dotenv.get('MARVELPUBLICKEY');
    var privateKey =
        '4d4d44310ba74597cba4f6faad5350c798c0a5ac'; //dotenv.get('MARVELAPIKEY');
    var hash = _gererateMd5(ts + privateKey + publicKey);
    var query = 'offset=$offset&ts=$ts&apikey=$publicKey&hash=$hash';
    var result =
        await dio.get('https://gateway.marvel.com/v1/public/characters?$query');

    return CharactersModel.fromJson(result.data);
  }

  _gererateMd5(String data) {
    var content = Utf8Encoder().convert(data);
    var md5 = crypto.md5;
    var digest = md5.convert(content);
    return hex.encode(digest.bytes);
  }
}
