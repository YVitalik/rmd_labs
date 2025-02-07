
import 'package:flutter/material.dart';



void main() {

 runApp(const MyApp());

}

class MyApp extends StatelessWidget {

 const MyApp({super.key});



 @override

 Widget build(BuildContext context) {

   return MaterialApp(

     title: 'Flutter Demo',

     theme: ThemeData(

       primarySwatch: Colors.blue,

     ),

     home: const LoginPage(),

   );

 }

}

class CustomButton extends StatelessWidget {

 final String text;

 final VoidCallback onPressed;



 const CustomButton({required this.text, required this.onPressed, super.key});



 @override

 Widget build(BuildContext context) {

   return ElevatedButton(

     onPressed: onPressed,

     style: ElevatedButton.styleFrom(

       padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),

     ),

     child: Text(

       text,

       style: const TextStyle(fontSize: 18),

     ),

   );

 }

}

class LoginPage extends StatelessWidget {

 const LoginPage({super.key});



 @override

 Widget build(BuildContext context) {

   return Scaffold(

     appBar: AppBar(title: const Text('Логін')),

     body: Center(

       child: Column(

         mainAxisAlignment: MainAxisAlignment.center,

         children: <Widget>[

           Padding(

           padding: const EdgeInsets.symmetric(horizontal: 20.0),

           child:  TextField(

             decoration: InputDecoration(labelText: 'Введіть логін'),

           )

           ),

           Padding(

           padding: const EdgeInsets.symmetric(horizontal: 20.0),

           child: TextField(

             decoration: InputDecoration(labelText: 'Введіть пароль'),

             obscureText: true,

           ),

           ),

           const SizedBox(height: 20),

           CustomButton(

             text: 'Увійти',

             onPressed: () {

               Navigator.push(

                 context,

                 MaterialPageRoute(builder: (context) => const HomePage()),

               );

             },

           ),

           const SizedBox(height: 10),

           CustomButton(

             text: 'Реєстрація',

             onPressed: () {

               Navigator.push(

                 context,

                 MaterialPageRoute(builder: (context) => const RegisterPage()),

               ); // Перехід на сторінку реєстрації

             },

           ),

         ],

       ),

     ),

   );

 }

}



// Сторінка реєстрації

class RegisterPage extends StatelessWidget {

 const RegisterPage({super.key});



 @override

 Widget build(BuildContext context) {

   return Scaffold(

     appBar: AppBar(title: const Text('Реєстрація')), // Заголовок

     body: Center(

       child: Column(

         mainAxisAlignment: MainAxisAlignment.center,

         children: <Widget>[

           Padding(

           padding: const EdgeInsets.symmetric(horizontal: 20.0),

           child: TextField(

             decoration: InputDecoration(labelText: 'Введіть логін'), // Поле для логіну

           ),

           ),

           Padding(

           padding: const EdgeInsets.symmetric(horizontal: 20.0),

           child: TextField(

             decoration: InputDecoration(labelText: 'Введіть пароль'), // Поле для пароля

             obscureText: true,

           ),

           ),

           Padding(

           padding: const EdgeInsets.symmetric(horizontal: 20.0),

           child: TextField(

             decoration: InputDecoration(labelText: 'Підтвердіть пароль'), // Поле для підтвердження

             obscureText: true,

           ),

           ),

           const SizedBox(height: 20),

           CustomButton(

             text: 'Зареєструватися',

             onPressed: () {

               Navigator.push(

                 context,

                 MaterialPageRoute(builder: (context) => const ProfilePage()),

               ); // Перехід на сторінку профілю після реєстрації

             },

           ),

         ],

       ),

     ),

   );

 }

}



// Сторінка профілю

class ProfilePage extends StatelessWidget {

 const ProfilePage({super.key});



 @override

 Widget build(BuildContext context) {

   return Scaffold(

     appBar: AppBar(title: const Text('Профіль користувача')), // Заголовок

     body: Center(

       child: Column(

         mainAxisAlignment: MainAxisAlignment.center,

         children: <Widget>[

           const CircleAvatar(

             radius: 50,

             backgroundColor: Colors.blue,

             child: Icon(Icons.person, size: 50, color: Colors.white), // Іконка користувача

           ),

           const SizedBox(height: 20),

           const Text('Ім\'я користувача', style: TextStyle(fontSize: 24)),

           const SizedBox(height: 20),

           CustomButton(

             text: 'На головну',

             onPressed: () {

               Navigator.push(

                 context,

                 MaterialPageRoute(builder: (context) => const HomePage()),

               ); // Перехід на головну сторінку

             },

           ),

         ],

       ),

     ),

   );

 }

}



// Головна сторінка додатку

class HomePage extends StatelessWidget {

 const HomePage({super.key});



 @override

 Widget build(BuildContext context) {

   return Scaffold(

     appBar: AppBar(title: const Text('Головна сторінка')), // Заголовок

     body: Center(

       child: Column(

         mainAxisAlignment: MainAxisAlignment.center,

         children: <Widget>[

           const Text(

             'Ласкаво просимо на головну сторінку!',

             style: TextStyle(fontSize: 24),

           ),

           const SizedBox(height: 20),

           CustomButton(

             text: 'Перейти в профіль',

             onPressed: () {

               Navigator.push(

                 context,

                 MaterialPageRoute(builder: (context) => const ProfilePage()),

               ); // Перехід на сторінку профілю

             },

           ),

         ],

       ),

     ),

   );

 }

}

