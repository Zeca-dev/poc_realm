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
    widget.homeCubit.stream.listen((event) {
      if (event is HomeLoading) {
        if (event.isLoading) {
          showDialog(
            barrierDismissible: false,
            context: context,
            builder: (context) => const AlertDialog(
              content: SizedBox(
                  height: 100,
                  child: Center(
                      child: Column(
                    children: [
                      SizedBox(height: 20),
                      CircularProgressIndicator(),
                      SizedBox(height: 10),
                      Text('Aguarde...')
                    ],
                  ))),
            ),
          );
        } else {
          Future.delayed(const Duration(seconds: 3), () {
            Navigator.pop(context);
          });
        }
      }
    });

    widget.homeCubit.buscarUsuarios();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      bloc: widget.homeCubit,
      builder: (context, state) => Scaffold(
        appBar: AppBar(title: Text('Usuários: ${widget.homeCubit.state.usuarios.length}')),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            await widget.homeCubit.salvarUsuario(Usuario(nome: 'Zeca', idade: 41, profissoes: [
              Profissao(nome: 'Desenvolvedor'),
              Profissao(nome: 'Bancário'),
            ]));
          },
          child: const Icon(Icons.add),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
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
                                .deletarUsuario(widget.homeCubit.state.usuarios[index]);
                          },
                        ),
                      );
                    })),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
