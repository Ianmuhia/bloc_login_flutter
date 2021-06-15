// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ian_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserToken extends TypeAdapter<Token> {
  @override
  final int typeId = 1;

  @override
  Token read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Token(
      jwt: fields[15] as String,
      heading: fields[16] as String,
      type: fields[0] as String,
      icon: fields[1] as String,
      bgcolor: fields[2] as String,
      hideAfter: fields[3] as int,
      reload: fields[4] as bool,
      reloadTo: fields[5] as String,
      message: fields[6] as String,
      status: fields[7] as int,
      actionProceed: fields[8] as bool,
      email: fields[9] as dynamic,
      refresh: fields[10] as String,
      accessToken: fields[11] as String,
      showLoginModal: fields[12] as bool,
      resetForm: fields[13] as bool,
      isCompany: fields[14] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, Token obj) {
    writer
      ..writeByte(17)
      ..writeByte(15)
      ..write(obj.jwt)
      ..writeByte(16)
      ..write(obj.heading)
      ..writeByte(0)
      ..write(obj.type)
      ..writeByte(1)
      ..write(obj.icon)
      ..writeByte(2)
      ..write(obj.bgcolor)
      ..writeByte(3)
      ..write(obj.hideAfter)
      ..writeByte(4)
      ..write(obj.reload)
      ..writeByte(5)
      ..write(obj.reloadTo)
      ..writeByte(6)
      ..write(obj.message)
      ..writeByte(7)
      ..write(obj.status)
      ..writeByte(8)
      ..write(obj.actionProceed)
      ..writeByte(9)
      ..write(obj.email)
      ..writeByte(10)
      ..write(obj.refresh)
      ..writeByte(11)
      ..write(obj.accessToken)
      ..writeByte(12)
      ..write(obj.showLoginModal)
      ..writeByte(13)
      ..write(obj.resetForm)
      ..writeByte(14)
      ..write(obj.isCompany);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserToken &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
