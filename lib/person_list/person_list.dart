import 'dart:async';

class PersonList {
  final List<String> _names = [];

  List<String> get names => _names;

  final _controller = StreamController<List<String>>();

  Stream<List<String>> get namesListStream => _controller.stream;

  void insertName(String name) {
    _names.add(name);
    _controller.sink.add(names);
  }

  closeStream() {
    _controller.close();
  }
}
