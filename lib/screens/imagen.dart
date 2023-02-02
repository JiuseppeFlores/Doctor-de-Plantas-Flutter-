// ignore_for_file: avoid_print

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Imagen extends StatefulWidget {
  const Imagen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ImagenState createState() => _ImagenState();
}

class _ImagenState extends State<Imagen> {
  File? imagen;
  final picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Selecciona una imagen"),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(children: [
              ElevatedButton(
                onPressed: () {
                  opciones(context);
                },
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.green),
                ),
                child: const Text("Selecciona una imagen"),
              ),
              const SizedBox(
                height: 30,
              ),
              // ignore: unnecessary_null_comparison
              imagen == null ? const Center() : Image.file(imagen!),
            ]),
          )
        ],
      ),
    );
  }

  opciones(context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            contentPadding: const EdgeInsets.all(0),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      createImage('take');
                    },
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: const BoxDecoration(
                        border: Border(
                            bottom: BorderSide(width: 1, color: Colors.grey)),
                      ),
                      child: Row(
                        children: const [
                          Expanded(
                            child: Text(
                              "Tomar una foto",
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          Icon(
                            Icons.camera_alt,
                            color: Colors.green,
                          )
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      createImage('select');
                    },
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        children: const [
                          Expanded(
                            child: Text(
                              "Seleccionar una foto",
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          Icon(
                            Icons.image,
                            color: Colors.green,
                          )
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: const BoxDecoration(
                        color: Colors.red,
                      ),
                      child: Row(
                        children: const [
                          Expanded(
                            child: Text(
                              "Cancelar",
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }

  Future createImage(option) async {
    // ignore: unused_local_variable
    PickedFile? pickedFile;
    switch (option) {
      case 'take':
        pickedFile = await picker.getImage(source: ImageSource.camera);
        break;
      case 'select':
        pickedFile = await picker.getImage(source: ImageSource.gallery);
        break;
    }

    setState(() {
      if (pickedFile != null) {
        imagen = File(pickedFile.path);
      } else {
        print('No seleccionaste ninguna foto');
      }
    });

    // ignore: use_build_context_synchronously
    Navigator.of(context).pop();
  }
}
