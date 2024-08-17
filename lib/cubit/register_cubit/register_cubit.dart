import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:store_app/helper/api.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  userRegister(){


    Api().post(url: 'https://student.valuxapps.com/api/Rister', data: data)
  }
}
