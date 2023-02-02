import 'dart:convert' as convert;

import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:doctor_de_plantas/screens/imagen.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _Login createState() => _Login();
}

class _Login extends State<Login> {
  bool is_loading = false;
  var ciController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login',
      theme: ThemeData(visualDensity: VisualDensity.adaptivePlatformDensity),
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/bg_login.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.all(30),
                    child: Container(
                      margin: EdgeInsets.only(
                        top: 30,
                      ),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black,
                                blurRadius: 10,
                                offset: Offset(0, 2))
                          ]),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: EdgeInsets.only(top: 70),
                            child: Text(
                              'DOCTOR DE PLANTAS',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                                color: Color.fromARGB(255, 4, 114, 44),
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(20),
                            child: Text(
                              'Ingresa tu cédula de identidad para Iniciar Sesión.',
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 0,
                              horizontal: 30,
                            ),
                            child: TextField(
                              controller: ciController,
                              keyboardType: TextInputType.number,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              autofocus: false,
                              decoration: InputDecoration(
                                hintText: 'C.I.',
                                prefixIcon: Icon(
                                  Icons.credit_card,
                                  color: Color.fromARGB(255, 9, 150, 61),
                                ),
                                contentPadding: EdgeInsets.all(10),
                                hintStyle: TextStyle(
                                  color: Color.fromARGB(255, 9, 150, 61),
                                  fontSize: 18,
                                ),
                                enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                  color: Colors.grey,
                                  width: 2,
                                )),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            padding: EdgeInsets.all(15),
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                FocusScopeNode currentFocus =
                                    FocusScope.of(context);
                                if (!currentFocus.hasPrimaryFocus) {
                                  currentFocus.unfocus();
                                }
                                iniciar_sesion();
                              },
                              child: is_loading
                                  ? CircularProgressIndicator(
                                      color: Colors.white,
                                    )
                                  : Row(
                                      children: [
                                        Icon(
                                          Icons.login,
                                          color: Colors.white,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(left: 10),
                                        ),
                                        Text(
                                          "Iniciar Sesión",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                    ),
                              style: ElevatedButton.styleFrom(
                                elevation: 5,
                                padding: EdgeInsets.all(15),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                backgroundColor:
                                    Color.fromARGB(255, 4, 114, 44),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/icon.png',
                        width: 120,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Future<void> iniciar_sesion() async {
    if (ciController.text.isNotEmpty) {
      //is_loading = true;
      var request = await http.post(
          Uri.parse(
              "http://177.222.51.21:86/doctordeplantas2/php/services/login.php"),
          body: ({'ci': ciController.text}));
      if (request.statusCode == 200) {
        //is_loading = false;
        var response = convert.jsonDecode(request.body) as Map<String, dynamic>;
        if (response['success']) {
          print_message(response['message'], AnimatedSnackBarType.success);
          print(response['data']);
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Imagen()));
        } else {
          print_message(response['message'], AnimatedSnackBarType.info);
        }
      } else {
        print_message(
            'Error al conectarse al servidor.', AnimatedSnackBarType.error);
        //is_loading = false;
      }
      //print_message('Datos aceptables', AnimatedSnackBarType.success);
    } else {
      print_message(
          'El campo C.I. es necesario.', AnimatedSnackBarType.warning);
    }
  }

  void print_message(String text, AnimatedSnackBarType type) {
    AnimatedSnackBar.material(
      text,
      type: type,
      mobileSnackBarPosition: MobileSnackBarPosition.bottom,
      desktopSnackBarPosition: DesktopSnackBarPosition.bottomLeft,
      //duration: Duration(seconds: 2),
      snackBarStrategy: RemoveSnackBarStrategy(),
    ).show(context);
  }
}
