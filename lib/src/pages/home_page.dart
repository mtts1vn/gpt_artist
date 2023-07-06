import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _larguraController = TextEditingController();

  final TextEditingController _codigoController = TextEditingController();

  bool _draw = false;
  List<int> _drawCode = [];

  final Map<int, Color> _colors = {
    0: Colors.white,
    1: Colors.red,
    2: Colors.green,
    3: Colors.blue,
    4: Colors.pink,
    5: Colors.brown,
    6: Colors.purple
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 13, 13, 13),
        title: const Text('GPT CODE-Artist'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.info_outline_rounded),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                          flex: 2,
                          child: Container(
                            padding: const EdgeInsets.only(
                                left: 10, right: 10, bottom: 5),
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 34, 34, 34),
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                    color: Colors.white.withOpacity(0.2),
                                    width: .5)),
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              controller: _codigoController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Required';
                                }
                                return null;
                              },
                              decoration: const InputDecoration(
                                  labelText: 'Código',
                                  border: InputBorder.none),
                            ),
                          )),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 3,
                        child: Container(
                          padding: const EdgeInsets.only(
                              left: 10, right: 10, bottom: 5),
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 34, 34, 34),
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                  color: Colors.white.withOpacity(0.2),
                                  width: .5)),
                          child: TextFormField(
                            controller: _larguraController,
                            keyboardType: TextInputType.number,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Required';
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                                labelText: 'Largura', border: InputBorder.none),
                          ),
                        ),
                      ),
                      const Expanded(flex: 1, child: SizedBox()),
                      Expanded(
                        flex: 2,
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              if (!_draw) {
                                (_drawCode.isEmpty) ? null : _drawCode = [];
                                for (var i in _codigoController.text
                                    .trim()
                                    .replaceAll(' ', '')
                                    .split(',')) {
                                  _drawCode.add(int.parse(i));
                                }
                                if (_draw) {
                                  setState(() {});
                                } else {
                                  setState(() {
                                    _draw = true;
                                  });
                                }
                              }
                            }
                          },
                          child: const Text('Desenhar'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            (!_draw)
                ? const Center(
                    child: Text('aguardando...'),
                  )
                : Expanded(
                    child: GridView.builder(
                      itemCount: _drawCode.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: int.parse(_larguraController.text),
                          crossAxisSpacing: 0,
                          mainAxisSpacing: 0),
                      itemBuilder: (context, index) {
                        return Expanded(
                          flex: 1,
                          child: Container(
                            color: _colors[_drawCode[index]],
                          ),
                        );
                      },
                    ),
                  )
          ],
        ),
      ),
    );
  }
}
