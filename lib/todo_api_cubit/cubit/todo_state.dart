// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc_beginner_test/todo_api_cubit/models/todo_model.dart';

abstract class TodoState {}

class InitTodoState extends TodoState {}

class LoadingTodoState extends TodoState {}

class ErrorTodoState extends TodoState {
  final String message;
  ErrorTodoState(this.message);
}

class ResponseTodoState extends TodoState {
  final List<TodoModel> todos;
  ResponseTodoState(
    this.todos,
  );
}
