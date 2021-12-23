import 'package:crud/data/dummy_users.dart';
import 'package:crud/models/user.dart';
import 'package:mobx/mobx.dart';

part 'users.g.dart';

class Users = _Users with _$Users;

abstract class _Users with Store {
  @observable
  Map<String, User> _users = {...DUMMY_USERS};

  @observable
  User? userForEdit;

  Map<String, User> get getUsers => {..._users};

  User? get getEditUser => userForEdit;

  int get totalUsers => _users.length;

  @action
  void removerUser(User user) {
    final dataCopied = {..._users};
    dataCopied.removeWhere((key, value) => key == user.id);
    _users = dataCopied;
  }

  @action
  void setEditUser(User? user) {
    userForEdit = user;
  }

  @action
  void editUser(User user) {
    final newUsers = {..._users};
    newUsers.update(user.id, (value) {
      return user;
    });
    _users = newUsers;
  }

  @action
  void addNewUser(User user) {
    final newUsers = {...getUsers};
    final bool validation =
        newUsers.values.any((element) => element.id == user.id);
    if (validation) {
      editUser(user);
    } else {
      newUsers[user.id] = user;
      _users = newUsers;
    }
  }
}
