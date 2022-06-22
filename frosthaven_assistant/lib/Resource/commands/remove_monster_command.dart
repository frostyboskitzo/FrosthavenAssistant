
import '../../services/service_locator.dart';
import '../action_handler.dart';
import '../game_state.dart';

class RemoveMonsterCommand extends Command {
  final GameState _gameState = getIt<GameState>();
  final List<Monster> names;
  final List<Monster> _monsters = [];

  RemoveMonsterCommand(this.names);

  @override
  void execute() {
    List<ListItemData> newList = [];
    for (var item in _gameState.currentList) {
      if (item is Monster) {
        bool remove = false;
        for (var name in names) {
          if (item.id == name.id) {
            remove = true;
            break;
          }
        }
        if (!remove) {
          newList.add(item);
        }
      } else {
        newList.add(item);
      }
    }
    _gameState.currentList = newList;
  }

  @override
  void undo() {
    //TODO: implement (and retain index)
    //_gameState.currentList.add(_character);
  }
}