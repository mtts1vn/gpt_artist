import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _larguraController = TextEditingController();
  final TextEditingController _alturaController = TextEditingController();
  final TextEditingController _codigoController = TextEditingController();

  late final List<int> _drawCode = [];
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
                              controller: _larguraController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Required';
                                }
                                return null;
                              },
                              decoration: const InputDecoration(
                                  labelText: 'largura',
                                  border: InputBorder.none),
                            ),
                          )),
                      const Expanded(flex: 1, child: SizedBox()),
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
                              controller: _alturaController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Required';
                                }
                                return null;
                              },
                              decoration: const InputDecoration(
                                  labelText: 'altura',
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
                            controller: _codigoController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Required';
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                                labelText: 'código', border: InputBorder.none),
                          ),
                        ),
                      ),
                      const Expanded(flex: 1, child: SizedBox()),
                      Expanded(
                        flex: 2,
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              print('valido');
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
            (_drawCode.isEmpty)
                ? const Center(
                    child: Text('aguardando...'),
                  )
                : const Text('data')
          ],
        ),
      ),
    );
  }
}
