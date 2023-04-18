import 'dart:async';

class Person {
  String _names = '';

  String get names => _names;

  final _controller = StreamController<String>();

  Stream<String> get namesStream => _controller.stream;

  void insertName(String n) {
    _names = n;
    _controller.sink.add(names);
  }

  closeStream() {
    _controller.close();
  }
}
