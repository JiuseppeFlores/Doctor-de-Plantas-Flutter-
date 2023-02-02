import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login',
      theme: ThemeData(visualDensity: VisualDensity.adaptivePlatformDensity),
      home: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/bg_login.jpg'),
          fit: BoxFit.cover,
        )),
        child: Scaffold(
          backgroundColor: Color.fromARGB(0, 255, 12, 12),
          body: ListView(
            children: [
              const SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/icono_app.png',
                    width: 120,
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.all(30),
                child: Container(
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
                        padding: EdgeInsets.only(top: 30, bottom: 10),
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
                        height: 40,
                      ),
                      /*InkWell(
                        onTap: () {},
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.login, color: Colors.white),
                              Padding(
                                padding: EdgeInsets.all(20),
                                child: Text(
                                  'Iniciar Sesión',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              )
                            ],
                          ),
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 4, 114, 44),
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10),
                              )),
                        ),
                      )*/
                      Container(
                        padding: EdgeInsets.all(15),
                        width: double.infinity,
                        child: ElevatedButton(
                          // ignore: avoid_print
                          onPressed: () => print("Inicio de Sesiónmmmm"),
                          child: Row(
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
                            mainAxisAlignment: MainAxisAlignment.center,
                          ),
                          style: ElevatedButton.styleFrom(
                            elevation: 5,
                            padding: EdgeInsets.all(15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            backgroundColor: Color.fromARGB(255, 4, 114, 44),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
