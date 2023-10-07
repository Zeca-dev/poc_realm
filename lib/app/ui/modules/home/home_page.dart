import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poc_realm/app/domain/entities/profissao.dart';
import 'package:poc_realm/app/domain/entities/usuario.dart';
import 'package:poc_realm/app/domain/states/home_state.dart';

import 'home_cubit.dart';

class HomePage extends StatefulWidget {
  final HomeCubit homeCubit;
  const HomePage({super.key, required this.homeCubit});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    widget.homeCubit.buscarUsuarios().then((value) => print(widget.homeCubit.state));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Usuários')),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
            onPressed: () async {
              await widget.homeCubit.salvarusuario(Usuario(nome: 'Zeca', idade: 41, profissoes: [
                Profissao(nome: 'Desenvolvedor'),
                Profissao(nome: 'Bancário'),
              ]));
            },
            child: const Icon(Icons.add),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<HomeCubit, HomeState>(
              bloc: widget.homeCubit,
              builder: (context, state) {
                return Expanded(
                  child: ListView.builder(
                      itemCount: state.usuarios.length,
                      itemBuilder: ((context, index) {
                        return ListTile(
                          key: Key(widget.homeCubit.state.usuarios[index].id.toString()),
                          title: Text(
                              'Nome: ${state.usuarios[index].nome} - ${state.usuarios[index].id} '),
                          subtitle: Text(state.usuarios[index].profissoes.first.nome),
                          trailing: IconButton(
                            icon: const Icon(
                              Icons.delete,
                              color: Colors.red,
                            ),
                            onPressed: () async {
                              await widget.homeCubit
                                  .deletarusuario(widget.homeCubit.state.usuarios[index]);
                            },
                          ),
                        );
                      })),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
