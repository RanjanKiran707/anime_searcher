import 'package:shared_preferences/shared_preferences.dart';

class Spfbloc {
  static Spfbloc _spfBloc;

  Spfbloc._internal();
  factory Spfbloc() {
    if (_spfBloc == null) {
      _spfBloc = Spfbloc._internal();
    }
    return _spfBloc;
  }

  SharedPreferences preferences;
}
