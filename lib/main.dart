//import 'package:bloc_beginner_test/widgets/home_page.dart';
//import 'package:bloc_beginner_test/widgets/person_form.dart';
//import 'package:bloc_beginner_test/person_list/person_form_list.dart';
import 'package:bloc_beginner_test/todo_api_cubit/cubit/todo_cubit.dart';
import 'package:bloc_beginner_test/todo_api_cubit/pages/todo_page.dart';
import 'package:bloc_beginner_test/todo_api_cubit/repository/todo_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const BlocApp());
}

class BlocApp extends StatelessWidget {
  const BlocApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TodoCubit(TodoRepository()),
      child: const MaterialApp(
        title: 'Flutter para Iniciantes - BLoC',
        debugShowCheckedModeBanner: false,
        home: TodoPage(),
      ),
    );
  }
}
