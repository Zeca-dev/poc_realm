import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poc_realm/app/domain/entities/profissao.dart';
import 'package:poc_realm/app/domain/entities/usuario.dart';
import 'package:poc_realm/app/domain/states/home_state.dart';

import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final HomeController homeController;
  const HomePage({super.key, required this.homeController});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    widget.homeController.stream.listen((event) {
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
          Future.delayed(const Duration(seconds: 1), () {
            Navigator.pop(context);
          });
        }
      }
    });

    widget.homeController.buscarUsuarios();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeController, HomeState>(
      bloc: widget.homeController,
      builder: (context, state) => Scaffold(
        appBar: AppBar(title: Text('Usuários: ${widget.homeController.state.usuarios.length}')),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            await widget.homeController.salvarUsuario(Usuario(
                nome: 'Zeca',
                idade: 41,
                numeros: [1, 2, 3],
                estadoCivil: EstadoCivil.solteiro,
                profissoes: [
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
                        key: Key(widget.homeController.state.usuarios[index].id.toString()),
                        title: Text('Nome: ${state.usuarios[index].nome} - ${state.usuarios[index].id} '),
                        subtitle: Text(state.usuarios[index].profissoes.first.nome),
                        trailing: IconButton(
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                          onPressed: () async {
                            await widget.homeController.deletarUsuario(widget.homeController.state.usuarios[index]);
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
