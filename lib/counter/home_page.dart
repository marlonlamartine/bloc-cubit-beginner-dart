import 'package:bloc_beginner_test/counter/meu_bloc.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  MeuBloc bloc = MeuBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter para Iniciantes - BLoC'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            StreamBuilder<int>(
              stream: bloc.minhaStream,
              initialData: 0,
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return const Text('Há um erro na Stream');
                } else {
                  return Text(
                    '${snapshot.data}',
                    style: Theme.of(context).textTheme.headline4,
                  );
                }
              },
            ),
            Row(
              children: [
                TextButton(
                    onPressed: bloc.incrementar,
                    child: const Text('Incrementar')),
                TextButton(
                    onPressed: bloc.decrementar,
                    child: const Text('Decrementar')),
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    bloc.fecharStream();
    super.dispose();
  }
}
