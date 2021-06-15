import 'package:hive/hive.dart';

part 'ian_model.g.dart';

@HiveType(typeId: 1, adapterName: "UserToken")
class Token extends HiveObject {
  Token({
    required this.jwt,
    required this.heading,
    required this.type,
    required this.icon,
    required this.bgcolor,
    required this.hideAfter,
    required this.reload,
    required this.reloadTo,
    required this.message,
    required this.status,
    required this.actionProceed,
    required this.email,
    required this.refresh,
    required this.accessToken,
    required this.showLoginModal,
    required this.resetForm,
    required this.isCompany,
  });

  @HiveField(15)
  final String jwt;
  @HiveField(16)
  final String heading;
  @HiveField(0)
  final String type;
  @HiveField(1)
  final String icon;
  @HiveField(2)
  final String bgcolor;
  @HiveField(3)
  final int hideAfter;
  @HiveField(4)
  final bool reload;
  @HiveField(5)
  final String reloadTo;
  @HiveField(6)
  final String message;
  @HiveField(7)
  final int status;
  @HiveField(8)
  final bool actionProceed;
  @HiveField(9)
  final dynamic email;
  @HiveField(10)
  final String refresh;
  @HiveField(11)
  final String accessToken;
  @HiveField(12)
  final bool showLoginModal;
  @HiveField(13)
  final bool resetForm;
  @HiveField(14)
  final bool isCompany;

  factory Token.fromUser(Token token) {
    return Token(
      jwt: token.jwt,
      heading: token.heading,
      type: token.type,
      icon: token.icon,
      bgcolor: token.bgcolor,
      hideAfter: token.hideAfter,
      reload: token.reload,
      reloadTo: token.reloadTo,
      message: token.message,
      status: token.status,
      actionProceed: token.actionProceed,
      email: token.email,
      refresh: token.refresh,
      accessToken: token.accessToken,
      showLoginModal: token.showLoginModal,
      resetForm: token.resetForm,
      isCompany: token.isCompany,
    );
  }
}
