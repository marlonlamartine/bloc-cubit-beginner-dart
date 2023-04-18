import 'dart:convert';

import 'package:bloc_beginner_test/todo_api_cubit/models/todo_model.dart';
import 'package:http/http.dart' as http;

class TodoRepository {
  Future<List<TodoModel>> getAll() async {
    const url = 'https://jsonplaceholder.typicode.com/todos';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as List;
      final result = json.map((e) {
        return TodoModel(
            id: e['id'],
            userId: e['userId'],
            title: e['title'],
            completed: e['completed']);
      }).toList();
      return result;
    } else {
      throw "Something went wrong - code ${response.statusCode}";
    }
  }
}
