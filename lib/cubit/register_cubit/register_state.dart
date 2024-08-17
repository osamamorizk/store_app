part of 'register_cubit.dart';

@immutable
sealed class RegisterState {}

final class RegisterInitial extends RegisterState {}

final class RegisterLoading extends RegisterState {}

final class RegisterSuccess extends RegisterState {
  final AuthModel authModel;

  RegisterSuccess({required this.authModel});
}

final class RegisterFailure extends RegisterState {
// final  String errorMessage;
  final AuthModel authModel;
  RegisterFailure({required this.authModel});
}
