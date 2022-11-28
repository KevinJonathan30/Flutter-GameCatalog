import 'package:game_catalog/model/game.dart';
import 'package:game_catalog/resources/repository/home_repository.dart';

class Connector {
  final homeRepository = HomeRepository();

  Future<List<Game>> getGameList() => homeRepository.getGameList();
}