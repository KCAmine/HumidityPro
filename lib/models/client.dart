import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:humidity_pro/view/create_case_page.dart';


class Client {
  final int id; 
  final String name;
  final int phone;
  final String email;

  const Client ( {
    required this.id, 
    required this.name, 
    required this.phone,
    required this.email
  });

 Map<String, Object?> toMap() {
  return {'id': id, 'name': name, 'phone': phone , 'email': email};
 }

  // Implement toString to make it easier to see information about
  // each dog when using the print statement.

   @override
  String toString() {
    return 'Client{id: $id, name: $name, phone, $phone, email: $email}';
  }

}