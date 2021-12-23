// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Users on _Users, Store {
  final _$_usersAtom = Atom(name: '_Users._users');

  @override
  Map<String, User> get _users {
    _$_usersAtom.reportRead();
    return super._users;
  }

  @override
  set _users(Map<String, User> value) {
    _$_usersAtom.reportWrite(value, super._users, () {
      super._users = value;
    });
  }

  final _$userForEditAtom = Atom(name: '_Users.userForEdit');

  @override
  User? get userForEdit {
    _$userForEditAtom.reportRead();
    return super.userForEdit;
  }

  @override
  set userForEdit(User? value) {
    _$userForEditAtom.reportWrite(value, super.userForEdit, () {
      super.userForEdit = value;
    });
  }

  final _$_UsersActionController = ActionController(name: '_Users');

  @override
  void removerUser(User user) {
    final _$actionInfo =
        _$_UsersActionController.startAction(name: '_Users.removerUser');
    try {
      return super.removerUser(user);
    } finally {
      _$_UsersActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEditUser(User? user) {
    final _$actionInfo =
        _$_UsersActionController.startAction(name: '_Users.setEditUser');
    try {
      return super.setEditUser(user);
    } finally {
      _$_UsersActionController.endAction(_$actionInfo);
    }
  }

  @override
  void editUser(User user) {
    final _$actionInfo =
        _$_UsersActionController.startAction(name: '_Users.editUser');
    try {
      return super.editUser(user);
    } finally {
      _$_UsersActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addNewUser(User user) {
    final _$actionInfo =
        _$_UsersActionController.startAction(name: '_Users.addNewUser');
    try {
      return super.addNewUser(user);
    } finally {
      _$_UsersActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
userForEdit: ${userForEdit}
    ''';
  }
}
