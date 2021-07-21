import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:test_app/models/Users.dart';

class PlaceholderProvider with ChangeNotifier {
  //Providers, inital value variables
  bool _loadingData = false;
  List<Users> _users = [];

  //Providers, call variable
  bool get loadingData => this._loadingData;
  List get users => this._users;

  //Providers, Set value to variable
  set loadingData(bool value) {
    this._loadingData = value;
    notifyListeners();
  }

  set users(List<Users> value) {
    this._users = value;
    notifyListeners();
  }

  //GET USERS
  Future<bool> getUsersJsonPlaceHolder() async {
    String url = "https://jsonplaceholder.typicode.com/users";
    try {
      this.loadingData = true;
      final resp = await http.get(Uri.parse(url));

      if (resp.statusCode == 200 || resp.statusCode == 200) {
        final users = usersFromJson(resp.body);

        this.users = users;
        this.loadingData = false;
        return true;
      } else {
        this.loadingData = false;
        return false;
      }
    } catch (e) {
      this.loadingData = false;
      return false;
    }
  }
}
