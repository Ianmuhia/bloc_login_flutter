import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:login_test/dao/newuser_dao.dart';
import 'package:login_test/main.dart';
import 'package:login_test/model/api_model.dart';
import 'package:login_test/model/ian_model.dart';
// import 'package:login_test/model/ian_model.dart';

// final _tenantCompanyRegisterEndpoint =
//     "http://192.168.0.101:8080/auth/register_tenant_company/";
final _loginEndpoint = "http://192.168.0.102:8080/auth/login_user/";
final _tenantIndividualRegsiterEndpoint =
    "http://192.168.0.102:8080/auth/register_tenant/";

// Response response;
var dio = Dio();

Future<Tokenn> getToken(UserLogin userLogin) async {
  print(_loginEndpoint);
  Response response;
  response = await dio.post(
    _loginEndpoint,
    data: jsonEncode(userLogin.toDatabaseJson()),
    options: Options(
      method: 'POST',
      contentType: 'application/json; charset=UTF-8',
      responseType: ResponseType.json,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    ),
  );
  if (response.statusCode == 200) {
    print("succes");
    print("Data :" + response.data.toString());
    print("Headers :" + response.headers.toString());
    print("Message :" + response.statusMessage.toString());
    print("StatusCode :" + response.statusCode.toString());
    try {
      Hive.box(API_BOX).add(response.data);
      print("added data to hive box");
    } catch (e) {
      e.toString();
    }

    return Tokenn.fromJson(response.data);
  } else if (response.statusCode == 400) {
    print("StatusCode :" + response.statusCode.toString());
    print("Print user not found");
    return response.data;
  } else {
    throw response.data;
  }
}

Future<Token> getToken2(UserLogin userLogin) async {
  print(_loginEndpoint);
  Response response;
  response = await dio.post(
    _loginEndpoint,
    data: jsonEncode(userLogin.toDatabaseJson()),
    options: Options(
      method: 'POST',
      contentType: 'application/json; charset=UTF-8',
      responseType: ResponseType.json,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    ),
  );
  if (response.statusCode == 200) {
    print("succes");
    print("Data :" + response.data.toString());
    print("Headers :" + response.headers.toString());
    print("Message :" + response.statusMessage.toString());
    print("StatusCode :" + response.statusCode.toString());
    // var test = Token.fromUser(response.data);
    // print(test);
    // return test;
    return response.data;
    // return Tokenn.fromJson(response.data);
  } else if (response.statusCode == 400) {
    print("StatusCode :" + response.statusCode.toString());
    print("Print user not found");
    return response.data;
  } else {
    throw response.data;
  }
}

Future<TenantIndividualRegister> Register(
    TenantIndividualRegister tenantIndividualRegister) async {
  print(_tenantIndividualRegsiterEndpoint);

  final http.Response response = await http.post(
    Uri.parse(_tenantIndividualRegsiterEndpoint),
    // _tenantIndividualRegsiterEndpoint,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(tenantIndividualRegister.toJson()),
  );

  print(response.body);
  if (response.statusCode == 200) {
    print("Success");
    var test = json.decode(response.body);
    print(test);
    return TenantIndividualRegister.fromJson(json.decode(response.body));
  } else {
    var test = json.decode(response.body);
    print(test);
    print(json.decode(response.body).toString());
    throw Exception(json.decode(response.body));
  }
}

Future<TenantCompanyRegister> tenantCompRegister(
    TenantCompanyRegister tenantCompanyRegister) async {
  print(_tenantIndividualRegsiterEndpoint);

  final http.Response response = await http.post(
    Uri(),
    // _tenantCompanyRegisterEndpoint,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(tenantCompanyRegister.toJson()),
  );

  print(response.body);
  if (response.statusCode == 200) {
    print("Success");
    var test = json.decode(response.body);
    print(test);
    return TenantCompanyRegister.fromJson(json.decode(response.body));
  } else {
    var test = json.decode(response.body);
    print(test);
    print(json.decode(response.body).toString());
    throw Exception(json.decode(response.body));
  }
}
