import 'package:game_catalog/helper/view_state.dart';
import 'package:game_catalog/model/game.dart';
import 'package:game_catalog/resources/connector.dart';

class HomeController {
  final connector = Connector();
  List<Game> gameList = [];
  ViewState viewState = ViewState.loading;

  Future<void> getGameList() async {
    viewState = ViewState.loading;
    gameList = await connector.getGameList();

    if (gameList.isNotEmpty) {
      viewState = ViewState.loaded;
    } else {
      viewState = ViewState.empty;
    }
  }
}