import 'package:flutter/material.dart';
import 'package:imc/myapp.dart';
import 'data/repositories/imc_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ImcRepository.getDatabase();
  runApp(const MyApp());
}
