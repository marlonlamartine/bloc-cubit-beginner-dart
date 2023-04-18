import 'package:bloc_beginner_test/person_form/person.dart';
import 'package:flutter/material.dart';

class PersonForm extends StatefulWidget {
  const PersonForm({super.key});

  @override
  State<PersonForm> createState() => _PersonFormState();
}

class _PersonFormState extends State<PersonForm> {
  late TextEditingController _nameController;
  Person person = Person();

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulario pessoas'),
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
                        person.insertName(_nameController.text);
                      },
                      icon: const Icon(Icons.arrow_circle_right_outlined)),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text('new name'),
            StreamBuilder<String>(
              stream: person.namesStream,
              initialData: '',
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return const Text('Há erro na stream');
                } else {
                  return Text(
                    '${snapshot.data}',
                    style: Theme.of(context).textTheme.headline2,
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
