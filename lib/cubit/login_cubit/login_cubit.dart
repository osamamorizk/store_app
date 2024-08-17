import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:store_app/Models/auth_model.dart';
import 'package:store_app/helper/api.dart';
import 'package:store_app/helper/shared_pref.dart';

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
      print(response);
      AuthModel authModel = AuthModel.fromJson(response);
      print(authModel.data!.token);
      if (response['status'] == true) {
        CahedStorge.insertToCache(key: 'token', value: authModel.data!.token);
        emit(LoginSuccess(authModel: authModel));
      } else {
        emit(LoginFailure(errorMessage: 'Invalid creditional'));
      }
    }).catchError((error) {
      emit(LoginFailure(errorMessage: error.toString()));
    });
  }
}
