import 'package:game_catalog/model/game.dart';
import 'package:game_catalog/resources/repository/detail_repository.dart';
import 'package:game_catalog/resources/repository/home_repository.dart';

class Connector {
  final homeRepository = HomeRepository();
  final detailRepository = DetailRepository();

  Future<List<Game>> getGameList() => homeRepository.getGameList();

  Future<Game?> getGameDetail(int id) => detailRepository.getGameDetail(id);
}