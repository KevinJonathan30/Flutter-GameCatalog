// ignore_for_file: depend_on_referenced_packages

import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:game_catalog/.env.dart';
import 'package:game_catalog/model/game.dart';
import 'package:http/http.dart';

class DetailRepository {
  Future<Game?> getGameDetail(int id) async {
    try {
      Response response = await get(
        Uri.parse("$BASE_URL/games/$id?key=$API_KEY")
      ).timeout(const Duration(seconds: 30));
        return Game.fromJson(jsonDecode(response.body));
    } catch (error) {
      if (kDebugMode) {
        print(error);
      }
    }
    return null;
  }
}
