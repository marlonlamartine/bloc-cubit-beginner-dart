import 'package:bloc_beginner_test/todo_api_cubit/cubit/todo_state.dart';
import 'package:bloc_beginner_test/todo_api_cubit/repository/todo_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoCubit extends Cubit<TodoState> {
  final TodoRepository _repository;
  TodoCubit(this._repository) : super(InitTodoState());

  Future<void> fetchTodo() async {
    emit(LoadingTodoState());
    try {
      final response = await _repository.getAll();
      emit(ResponseTodoState(response));
    } catch (e) {
      emit(ErrorTodoState(e.toString()));
    }
  }
}
