import 'dart:async';

import 'package:hive/hive.dart';
import 'package:login_test/dao/user_dao.dart';
import 'package:login_test/model/api_model.dart';
import 'package:login_test/model/user_model.dart';
import 'package:login_test/services/api_connection.dart';

class UserRepository {
  final userDao = UserDao();

  Future<User> authenticate({
    required String username,
    required String password,
  }) async {
    UserLogin userLogin = UserLogin(username: username, password: password);
    Tokenn token = await getToken(userLogin);
    User user = User(
      id: 0,
      username: username,
      token: token.token,
    );
    print(user.token.toString());
    print(user.username);
    print(user);
    return user;
  }

  // Future<User> authenticate2({
  //   required String username,
  //   required String password,
  // }) async {
  //   UserLogin userLogin = UserLogin(username: username, password: password);
  //   Token token = await getToken2(userLogin);
  //   Token user = UserDatabase.addToBox(token);
  // }

  Future<TenantIndividualRegister> TenantReg({
    required String password,
    required String password2,
    required String email,
    required String first_name,
    required String last_name,
    required String username,
    required String phone,
  }) async {
    TenantIndividualRegister tenantIndividualRegister =
        TenantIndividualRegister(
      username: username,
      password: password,
      last_name: last_name,
      first_name: first_name,
      email: email,
      password2: password2,
      phone: phone,
    );

    tenantIndividualRegister = await Register(tenantIndividualRegister);
    return tenantIndividualRegister;

    // return tenantIndividualRegister;
  }

  // ignore: non_constant_identifier_names
  Future<TenantCompanyRegister> TenantCompRegister({
    required String password,
    required String password2,
    required String email,
    required String company_name,
    required String username,
    required String phone,
  }) async {
    TenantCompanyRegister tenantCompanyRegister = TenantCompanyRegister(
      username: username,
      password: password,
      company_name: company_name,
      email: email,
      password2: password2,
      phone: phone,
    );

    tenantCompanyRegister = await tenantCompRegister(tenantCompanyRegister);
    return tenantCompanyRegister;
  }

  Future<void> persistToken({required User user}) async {
    // write token with the user to the database
    await userDao.createUser(user);
  }

  Future<void> deleteToken({required int id}) async {
    await userDao.deleteUser(id);
  }

  Future<bool> hasToken() async {
    var box = await Hive.openBox('API_BOX');
    print("Hive data: " + box.getAt(0));
    bool result = await userDao.checkUser(0);
    return result;
  }
}
