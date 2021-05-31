import 'package:flutter/material.dart';

class AppUser {
  final String name;
  final String email;
  final String avatar;

  AppUser({
    Key? key,
    required this.name,
    required this.email,
    required this.avatar,
  });
}
