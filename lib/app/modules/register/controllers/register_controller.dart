import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tugas_10/app/data/user.dart';
import 'package:tugas_10/app/modules/login/views/login_view.dart';

class RegisterController extends GetxController {
  //TODO: Implement RegisterController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  doRegister({
    required String username,
    required String password,
    required String confirmPassword,
    required String address,
    required String name,
    required String phoneNumber,
    required String email,
  }){


    User newUser = User(
                      username: username,
                      password: password, 
                      name: name,
                      phoneNumber: phoneNumber, 
                      address: address,
                      email: email
                    );

    UserProvider().insert(newUser);
       Get.snackbar(
      "Sukses",
        "Login berhasil!",
        backgroundColor: Colors.green,
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.white
      );
      Get.to(LoginView());
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
