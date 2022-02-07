import 'dart:async';

class LandingBloc {
  static LandingBloc _bloc;
  LandingBloc._();
  factory LandingBloc() {
    if (_bloc == null) {
      _bloc = LandingBloc._();
    }
    return _bloc;
  }
  List<int> selected = [];
  StreamController controller = StreamController<List<int>>.broadcast();

  void toggle(int x) {
    if (selected.contains(x)) {
      selected.remove(x);
    } else {
      selected.add(x);
    }
    controller.add(selected);
  }

  void clear() {
    selected.clear();
    controller.add(selected);
  }

  void dispose() {
    controller.close();
  }
}
