part of 'tenant_ind_register_bloc.dart';

abstract class TenantIndRegisterState extends Equatable {
  const TenantIndRegisterState();

  @override
  List<Object> get props => [];
}

class TenantIndRegisterInitial extends TenantIndRegisterState {}

class TenantIndRegisterLoading extends TenantIndRegisterState {}

class TenantIndRegisterSuccess extends TenantIndRegisterState {}

class TenantIndRegisterError extends TenantIndRegisterState {
  final String error;

  const TenantIndRegisterError({required this.error});

  @override
  List<Object> get props => [error];

  @override
  String toString() => ' TenantIndRegisterError { error: $error }';
}
