import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var controller1 = TextEditingController();
  var controller1_1 = TextEditingController();
  var controller2 = TextEditingController();
  var controller2_1 = TextEditingController();
  var focus1 = FocusNode();
  var focus2 = FocusNode();
  var focus3 = FocusNode();
  var focus4 = FocusNode();

  int price1 = 0;
  int price2 = 0;

  String allPrice = '';

  calculate() {
    setState(() {
      controller1.text.isEmpty || controller1_1.text.isEmpty
          ? price1 = 0
          : price1 =
              ((int.parse(controller1.text) / int.parse(controller1_1.text)) *
                      1000)
                  .ceil();

      controller2.text.isEmpty || controller2_1.text.isEmpty
          ? price2 = 0
          : price2 =
              ((int.parse(controller2.text) / int.parse(controller2_1.text)) *
                      1000)
                  .ceil();

      focus1.unfocus();
      focus2.unfocus();
      focus3.unfocus();
      focus4.unfocus();
    });

    if (controller1.text.isNotEmpty &&
        controller1_1.text.isNotEmpty &&
        controller2.text.isNotEmpty &&
        controller2_1.text.isNotEmpty) {
      if (price1 == price2) {
        allPrice = 'Стоимость товаров за 1кг одинаковы';
        return;
      }
      ;
      price1 > price2
          ? allPrice = 'Второй товар дешевле на ${price1 - price2} руб'
          : allPrice = 'Первый товардешевле на ${price2 - price1} руб';
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Цена за килограмм'),
        ),
        body: SafeArea(
          child: GestureDetector(
            onTap: () {
              focus1.unfocus();
              focus2.unfocus();
              focus3.unfocus();
              focus4.unfocus();
            },
            child: SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Программа для рассчета цены за килограмм продукта. Введите цену и вес товаров:',
                      style: TextStyle(
                        color: Color.fromARGB(255, 83, 83, 83),
                        height: 1.4,
                      ),
                    ),
                    const SizedBox(height: 25),
                    const Text(
                      'Первый товар',
                      style: TextStyle(color: Colors.blue),
                    ),
                    const SizedBox(height: 15),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                          child: TextField(
                            focusNode: focus1,
                            controller: controller1,
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            decoration: InputDecoration(
                              label: const Text(
                                'Цена, руб',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Color.fromARGB(255, 109, 109, 109),
                                ),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(6),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Flexible(
                          child: TextField(
                            focusNode: focus2,
                            controller: controller1_1,
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            decoration: InputDecoration(
                              label: const Text(
                                'Вес, гр',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Color.fromARGB(255, 109, 109, 109),
                                ),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(6),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Цена за кг:         '),
                            const SizedBox(height: 5),
                            Text(
                              price1.toString(),
                              style: const TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Второй товар',
                      style: TextStyle(color: Colors.blue),
                    ),
                    const SizedBox(height: 15),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                          child: TextField(
                            focusNode: focus3,
                            controller: controller2,
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            decoration: InputDecoration(
                              label: const Text(
                                'Цена, руб',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Color.fromARGB(255, 109, 109, 109),
                                ),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(6),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Flexible(
                          child: TextField(
                            focusNode: focus4,
                            controller: controller2_1,
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            decoration: InputDecoration(
                              label: const Text(
                                'Вес, гр',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Color.fromARGB(255, 109, 109, 109),
                                ),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(6),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Цена за кг:         '),
                            const SizedBox(height: 5),
                            Text(
                              price2.toString(),
                              style: const TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: calculate,
                      child: const Text('Рассчитать'),
                    ),
                    const SizedBox(height: 20),
                    Text(allPrice),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
