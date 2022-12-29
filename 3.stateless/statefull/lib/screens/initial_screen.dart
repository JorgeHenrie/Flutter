import 'package:flutter/material.dart';
import 'package:statefull/components/task.dart';
import 'package:statefull/data/taks_dao.dart';
import 'package:statefull/data/task_inherited.dart';
import 'package:statefull/screens/form_screen.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {});
              },
              icon: Icon(Icons.refresh)),
        ],
        title: const Text('Lista de cursos'),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 8, bottom: 70),
        //Future é responsável por pegar os dados que vamos construir as telas
        //Builder constrói a tela
        //snapshot: responsável pelos dados de findall
        child: FutureBuilder<List<Task>>(
            future: TaksDao().findAll(),
            builder: (context, snapshot) {
              List<Task>? items = snapshot.data;
              //Só carrega as tarefas que estão na tela, ou seja, no scroll
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  return Center(
                    child: Column(
                      children: [
                        CircularProgressIndicator(),
                        Text(
                          'Carregando',
                        )
                      ],
                    ),
                  );
                  break;

                case ConnectionState.waiting:
                  return Center(
                    child: Column(
                      children: [
                        CircularProgressIndicator(),
                        Text(
                          'Carregando',
                        )
                      ],
                    ),
                  );
                  break;

                case ConnectionState.active:
                  return Center(
                    child: Column(
                      children: [
                        CircularProgressIndicator(),
                        Text(
                          'Carregando',
                        )
                      ],
                    ),
                  );
                  break;

                case ConnectionState.done:
                  if (snapshot.hasData && items != null) {
                    if (items.isNotEmpty) {
                      return ListView.builder(
                          itemCount: items.length,
                          itemBuilder: (BuildContext context, int index) {
                            final Task tarefa = items[index];
                            return tarefa;
                          });
                    }
                    return Center(
                      child: Column(
                        children: [
                          Icon(Icons.error_outline, size: 128),
                          Text(
                            'Não há uma nenhuma tarefa',
                            style: TextStyle(fontSize: 32),
                          ),
                        ],
                      ),
                    );
                  }
                  return Text('Erro ao carregar tarefas');
                  break;

                default:
              }
              return Text('Erro desconhecido');
            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (contextNew) => FormScreen(
                taskContext: context,
              ),
            ),
          ).then((value) => setState(() {
                print('Recarregando tela inicial');
              }));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
