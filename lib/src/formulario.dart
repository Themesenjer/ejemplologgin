import 'package:flutter/material.dart';

class FormularioScreen extends StatefulWidget {
  const FormularioScreen({super.key});

  @override
  State<FormularioScreen> createState() => _FormularioScreenState();
}

class _FormularioScreenState extends State<FormularioScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _apellidoController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  String? _generoSeleccionado;
  String? _estadoCivilSeleccionado;
  final List<String> _estadosCiviles = [
    'Soltero',
    'Casado',
    'Divorciado',
    'Viudo',
    'Unión Libre',
  ];

  double _circleScale = 1.0;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Registro de Usuario'),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      backgroundColor: Colors.purple[100],
      body: Center(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.1, vertical: screenHeight * 0.05),
          padding: const EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 5,
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  MouseRegion(
                    onEnter: (event) {
                      setState(() {
                        _circleScale = 1.1;
                      });
                    },
                    onExit: (event) {
                      setState(() {
                        _circleScale = 1.0;
                      });
                    },
                    child: GestureDetector(
                      onTap: () {
                        print('Círculo presionado');
                      },
                      child: Center(
                        child: AnimatedScale(
                          duration: const Duration(milliseconds: 200),
                          scale: _circleScale,
                          child: Container(
                            width: 80.0,
                            height: 80.0,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.deepPurpleAccent.withOpacity(0.8),
                              image: const DecorationImage(
                                image: AssetImage('images/Lobo2.jpg'),
                                fit: BoxFit.cover,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.deepPurple.withOpacity(0.5),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30.0),

                  // Sección Información Personal
                  Card(
                    margin: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const Text(
                            'Información Personal',
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0, color: Colors.deepPurple),
                          ),
                          const SizedBox(height: 15.0),
                          TextFormField(
                            controller: _nombreController,
                            decoration: const InputDecoration(
                              labelText: 'Nombre',
                              border: OutlineInputBorder(),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Por favor, ingresa tu nombre';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 15.0),
                          TextFormField(
                            controller: _apellidoController,
                            decoration: const InputDecoration(
                              labelText: 'Apellido',
                              border: OutlineInputBorder(),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Por favor, ingresa tu apellido';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 15.0),
                          TextFormField(
                            controller: _emailController,
                            decoration: const InputDecoration(
                              labelText: 'Correo Electrónico',
                              border: OutlineInputBorder(),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Por favor, ingresa tu correo electrónico';
                              }
                              if (!value.contains('@')) {
                                return 'Por favor, ingresa un correo electrónico válido';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.emailAddress,
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Sección Información Adicional
                  Card(
                    margin: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const Text(
                            'Información Adicional',
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0, color: Colors.deepPurple),
                          ),
                          const SizedBox(height: 15.0),
                          const Text(
                            'Género',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Row(
                            children: <Widget>[
                              Radio<String>(
                                value: 'Masculino',
                                groupValue: _generoSeleccionado,
                                onChanged: (String? value) {
                                  setState(() {
                                    _generoSeleccionado = value;
                                  });
                                },
                              ),
                              const Text('Masculino'),
                              const SizedBox(width: 20.0),
                              Radio<String>(
                                value: 'Femenino',
                                groupValue: _generoSeleccionado,
                                onChanged: (String? value) {
                                  setState(() {
                                    _generoSeleccionado = value;
                                  });
                                },
                              ),
                              const Text('Femenino'),
                              const SizedBox(width: 20.0),
                              Radio<String>(
                                value: 'Otro',
                                groupValue: _generoSeleccionado,
                                onChanged: (String? value) {
                                  setState(() {
                                    _generoSeleccionado = value;
                                  });
                                },
                              ),
                              const Text('Otro'),
                            ],
                          ),
                          if (_generoSeleccionado == null)
                            const Padding(
                              padding: EdgeInsets.only(top: 5.0),
                              child: Text(
                                'Por favor, selecciona tu género',
                                style: TextStyle(color: Colors.red),
                              ),
                            ),
                          const SizedBox(height: 15.0),
                          const Text(
                            'Estado Civil',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          DropdownButtonFormField<String>(
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                            ),
                            value: _estadoCivilSeleccionado,
                            hint: const Text('Selecciona tu estado civil'),
                            items: _estadosCiviles.map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (String? value) {
                              setState(() {
                                _estadoCivilSeleccionado = value;
                              });
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Por favor, selecciona tu estado civil';
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 30.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            print('Guardar presionado');
                            print('Nombre: ${_nombreController.text}');
                            print('Apellido: ${_apellidoController.text}');
                            print('Email: ${_emailController.text}');
                            print('Género: $_generoSeleccionado');
                            print('Estado Civil: $_estadoCivilSeleccionado');
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Datos guardados')),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepPurple,
                          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                          textStyle: const TextStyle(fontSize: 18),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        child: const Text('Guardar', style: TextStyle(color: Colors.white)),
                      ),
                      OutlinedButton(
                        onPressed: () {
                          print('Salir presionado');
                          Navigator.pop(context);
                        },
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: Colors.orangeAccent, width: 2),
                          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                          textStyle: const TextStyle(fontSize: 18),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        child: const Text('Salir', style: TextStyle(color: Colors.orangeAccent)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}