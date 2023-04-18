import 'package:bloc_beginner_test/person_list/person_list.dart';
import 'package:flutter/material.dart';

class PersonFormList extends StatefulWidget {
  const PersonFormList({super.key});

  @override
  State<PersonFormList> createState() => _PersonFormListState();
}

class _PersonFormListState extends State<PersonFormList> {
  final _nameController = TextEditingController();
  PersonList personList = PersonList();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List of names - Bloc beginner'),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _nameController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Insert Name',
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      personList.insertName(_nameController.text);
                    },
                    icon: const Icon(Icons.arrow_circle_right_outlined),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            StreamBuilder<List<String>>(
              stream: personList.namesListStream,
              initialData: const [],
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return const Text('Ocorreu um erro');
                } else {
                  final items = snapshot.data;
                  return Expanded(
                    child: ListView.builder(
                      itemCount: personList.names.length,
                      itemBuilder: (context, index) {
                        final item = items?[index];
                        return Text(item ?? '');
                      },
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
