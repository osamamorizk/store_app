import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:store_app/Models/auth_model.dart';
import 'package:store_app/helper/api.dart';
import 'package:store_app/helper/shared_pref.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  userRegister({
    required String email,
    required String password,
    required String name,
    required String phone,
  }) {
    emit(RegisterLoading());
    Api().post(
      url: 'https://student.valuxapps.com/api/register',
      data: {
        'email': email,
        'password': password,
        'name': name,
        'phone': phone,
      },
    ).then((response) {
      AuthModel authModel = AuthModel.fromJson(response);

      if (response['status'] == true) {
        CahedStorge.insertToCache(key: 'token', value: authModel.data!.token);

        log(authModel.data!.token);
        emit(RegisterSuccess(authModel: authModel));
      } else {
        emit(RegisterFailure(authModel: authModel));
      }
    }).catchError((error) {
      log(error.toString());
      // Fluttertoast.showToast(
      //     msg: error.toString(),
      //     toastLength: Toast.LENGTH_LONG,
      //     gravity: ToastGravity.SNACKBAR,
      //     timeInSecForIosWeb: 1,
      //     backgroundColor: Colors.green,
      //     textColor: Colors.white,
      //     fontSize: 16.0);
    });
  }
}
