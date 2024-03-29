import 'package:mobx/mobx.dart';
import '../../../core/enums/main_page_enums.dart';

part 'navigation_store.g.dart';

class NavigationStore = _NavigationStore with _$NavigationStore;

abstract class _NavigationStore with Store {
  @observable
  ScreenType currentScreen = ScreenType.HOME;

  @action
  void changeScreen(ScreenType newScreen) {
    currentScreen = newScreen;
  }
}
