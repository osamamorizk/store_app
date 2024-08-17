import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:store_app/Models/Login_model.dart';
import 'package:store_app/helper/api.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  void userLogin({
    required String email,
    required String password,
    String? token,
  }) {
    emit(LoginLoading());
    Api().post(
      url: 'https://student.valuxapps.com/api/login',
      data: {
        'email': email,
        'password': password,
      },
    ).then((response) {
      LoginModel loginModel = LoginModel.fromJson(response);
      print(loginModel.data!.token);
      if (response['status'] == true) {
        emit(LoginSuccess(loginModel: loginModel));
      } else {
        emit(LoginFailure(errorMessage: 'Invalid creditional'));
      }
    }).catchError((error) {
      emit(LoginFailure(errorMessage: error.toString()));
    });
  }
}
