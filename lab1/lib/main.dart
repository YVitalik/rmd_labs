import 'package:flutter/material.dart';

import 'dart:math';

void main() {

  runApp(const MyApp());

}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override

  Widget build(BuildContext context) {

    return MaterialApp(

      title: 'Додаток з лічильником і стікерами',

      theme: ThemeData(

        primarySwatch: Colors.yellow,

      ),

      home: const MyHomePage(),

    );

  }

}

class MyHomePage extends StatefulWidget {

  const MyHomePage({super.key});

  @override

  State<MyHomePage> createState() => _MyHomePageState();

}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {

  int _counter = 0;

  Color _textColor = Colors.black;

  final List<Color> _colors = [

    Colors.red,

    Colors.blue,

    Colors.green,

    Colors.orange,

    Colors.purple,

    Colors.pink,

    Colors.teal,

    Colors.yellow,

  ];

  // Список емодзі-стікерів

  final List<String> _stickers = ['🎉', '😂', '🥳', '😎', '🤩', '🍀', '💥', '🎈'];

  // Список для анімованих стікерів, що будуть падати

  List<Widget> _flyingStickers = [];

  // Контролер для введеного числа

  TextEditingController _controller = TextEditingController();

  // Функція для додавання нового стікера, що з'являється у випадковому місці

  void _addFallingSticker() {

    setState(() {

      String sticker = _stickers[Random().nextInt(_stickers.length)]; // Випадковий стікер

      _flyingStickers.add(_buildFallingSticker(sticker)); // Додаємо анімований стікер

    });

  }

  // Функція для створення анімованого стікера

  Widget _buildFallingSticker(String sticker) {

    double screenWidth = MediaQuery.of(context).size.width; // Ширина екрана

    double screenHeight = MediaQuery.of(context).size.height; // Висота екрана

    // Випадкова початкова позиція стікера

    double startX = Random().nextDouble() * screenWidth;

    double startY = Random().nextDouble() * (screenHeight / 2); // Верхня половина екрана

    return AnimatedPositioned(

      duration: const Duration(seconds: 2), // Тривалість анімації

      left: startX, // Початкова позиція по горизонталі

      top: startY,  // Початкова позиція по вертикалі

      child: Text(

        sticker,

        style: const TextStyle(fontSize: 50), // Розмір тексту (стікера)

      ),

      onEnd: () {

        setState(() {

          _flyingStickers.removeAt(0); // Видаляємо стікер після завершення анімації

        });

      },

      bottom: 0, // Стікери падають вниз

    );

  }

  // Функція для збільшення лічильника або обнулення при введенні "avadakedavra"

  void _incrementCounter() {

    setState(() {

      String inputValue = _controller.text; // Отримуємо введений текст

      if (inputValue.toLowerCase() == 'avadakedavra') { // Якщо введено "avadakedavra"

        _counter = 0; // Обнулити лічильник

      } else {

        int incrementValue = int.tryParse(inputValue) ?? 1; // Якщо не число - інкремент на 1

        _counter += incrementValue; // Збільшуємо лічильник на введене число

      }

      _textColor = _colors[Random().nextInt(_colors.length)]; // Випадковий колір тексту

      _addFallingSticker(); // Додаємо новий стікер, що падає

    });

  }

@override

  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(

        title: const Text('Лічильник зі стікерами'), // Заголовок AppBar

      ),

      body: Stack(

        children: [

          // Основна частина: текст, лічильник, поле для введення і кнопка

          Center(

            child: Column(

              mainAxisAlignment: MainAxisAlignment.center, // Вирівнювання по центру

              children: <Widget>[

                const Text('Ви натиснули кнопку стільки разів:'),

                Text(

                  '$_counter', // Відображення лічильника

                  style: TextStyle(

                    fontSize: 40, // Розмір тексту

                    color: _textColor, // Колір тексту

                  ),

                ),

                const SizedBox(height: 20), // Простір між елементами

                // Поле для введення числа або "avadakedavra"

                Padding(

                  padding: const EdgeInsets.symmetric(horizontal: 50.0),

                  child: TextField(

                    controller: _controller, // Контролер для отримання введеного числа

                    keyboardType: TextInputType.text, // Тип введення - текст або числа

                    decoration: const InputDecoration(

                      labelText: 'Введіть число або avadakedavra', // Підказка для користувача

                      border: OutlineInputBorder(), // Стиль поля

                    ),

                  ),

                ),

                const SizedBox(height: 20), // Простір між полем та кнопкою

                // Кнопка для збільшення лічильника або обнулення

                ElevatedButton(

                  onPressed: _incrementCounter, // Виклик функції при натисканні

                  child: const Text(

                    'Press me!', // Текст на кнопці

                    style: TextStyle(fontSize: 24),

                  ),

                  style: ElevatedButton.styleFrom(

                    padding: const EdgeInsets.symmetric(

                      horizontal: 30, // Внутрішні відступи

                      vertical: 15,

                    ),

                  ),

                ),

              ],

            ),

          ),

          ..._flyingStickers, // Додаємо анімовані стікери в Stack

        ],

      ),

    );

  }

}

