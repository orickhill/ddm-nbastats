//Exemplo 7 - Estado global da aplicação com Controle Deslizante
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
void main() {
  runApp(
      ChangeNotifierProvider(
          create: (c){return ModeloControleDeslizante();},
          child: MinhaApp()
      )
  );
}

class MinhaApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Exemplo Controle Deslizante com Provider",
        home: Scaffold(
            appBar: AppBar(title: Text("Controle Deslizante com Provider")),
            body: MaterialApp(home: Center(child: TelaInicial()))));
  }
}

class TelaInicial extends StatelessWidget {

  Widget build(BuildContext context) {
    return Consumer<ModeloControleDeslizante>(
        builder: (c, m, ch){return Column(
            children: [
              Text("Valor atual: ${Provider.of<ModeloControleDeslizante>(context).valor}"),
              FloatingActionButton(
                  onPressed: (){Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ControleDeslizante()
                      )
                  );
                  }
              )
            ]
        );}
    );
  }
}

class ModeloControleDeslizante extends ChangeNotifier{
  int valor = 0;

  void atualizar(int valor){
    this.valor = valor;
    print("Valor: ${this.valor}");
    notifyListeners();
  }
}

class ControleDeslizante extends StatefulWidget {
  _ControleDeslizante createState() => _ControleDeslizante();
}

class _ControleDeslizante extends State {
  int valor = 7;
  ModeloControleDeslizante ms = ModeloControleDeslizante();

  Widget build(BuildContext context) {

    valor = Provider.of<ModeloControleDeslizante>(context).valor;

    return Center(
        child: Column(
            children: <Widget>[
              Slider(
                  value: valor.toDouble(),
                  min: 0,
                  max: 10,
                  activeColor: Colors.amber,
                  inactiveColor: Colors.black45,
                  label: "${valor.round()}",
                  onChanged: (double v) {
                    setState(() {
                      valor = v.round();
                      Provider.of<ModeloControleDeslizante>(context, listen: false).atualizar(valor);
                    });
                  },
                  semanticFormatterCallback: (double v) {
                    return "${v.round()}";
                  }
              ),
              Text("Valor: ${valor}", style: TextStyle(fontSize: 30)),
              FloatingActionButton(onPressed: (){Navigator.pop(context);}),

            ]
        )
    );
  }
}