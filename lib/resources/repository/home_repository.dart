// ignore_for_file: depend_on_referenced_packages

import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:game_catalog/.env.dart';
import 'package:game_catalog/model/game.dart';
import 'package:http/http.dart';

class HomeRepository {
  Future<List<Game>> getGameList() async {
    List<Game> gameList = [];

    try {
      Response response = await get(
        Uri.parse("$BASE_URL/games?key=$API_KEY")
      ).timeout(const Duration(seconds: 30));

      for (var i in jsonDecode(response.body)["results"]) {
        gameList.add(Game.fromJson(i));
      }

      return gameList;
    } catch (error) {
      if (kDebugMode) {
        print(error);
      }
    }
    return gameList;
  }
}