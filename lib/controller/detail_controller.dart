import 'package:game_catalog/helper/view_state.dart';
import 'package:game_catalog/model/game.dart';
import 'package:game_catalog/resources/connector.dart';

class DetailController {
  final connector = Connector();
  Game? gameDetail;
  ViewState viewState = ViewState.loading;

  Future<void> getGameDetail(int id) async {
    viewState = ViewState.loading;
    gameDetail = await connector.getGameDetail(id);

    if (gameDetail != null) {
      viewState = ViewState.loaded;
    } else {
      viewState = ViewState.empty;
    }
  }
}