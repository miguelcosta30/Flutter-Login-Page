import 'package:flutter/material.dart';

Widget form(String text, Icon icon, context, bool validator,
    TextEditingController _emailController, String handler) {
  return Container(
    width: MediaQuery.of(context).size.width / 1.2,
    height: validator ? 55 : 45,
    margin: const EdgeInsets.only(top: 16),
    padding: const EdgeInsets.only(top: 4, left: 16, right: 16, bottom: 4),
    decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(50)),
        color: Colors.white,
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)]),
    child: TextField(
      obscureText: handler == 'password' ? true : false,
      controller: _emailController,
      decoration: InputDecoration(
          hintText: validator ? null : text,
          errorText: validator
              ? _validationHandler(handler, _emailController.text)
              : null,
          border: InputBorder.none,
          icon: icon),
    ),
  );
}

String? _validationHandler(String handler, String value) {
  switch (handler) {
    case "email":
      return validateEmail(value);
    case "password":
      return validatePassword(value);
  }
  return null;
}

String? validateEmail(String value) {
  if (value.isEmpty) {
    return "Email can't be empty";
  }
  if (checkEmail(value) == false) {
    return "Not a valid email";
  }
  return null;
}

String? validatePassword(String value) {
  if (value.isEmpty) {
    return "Password can't be empty";
  }

  if (value.length < 5) {
    return "Password it's to small";
  }

  return null;
}

bool checkEmail(String string) {
  final emailRegex = RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
  return emailRegex.hasMatch(string);
}
