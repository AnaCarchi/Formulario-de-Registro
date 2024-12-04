import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',  
      routes: {
        '/': (context) => const BienvenidaScreen(), 
        '/registro': (context) => const RegistroFormulario(),  
      },
    );
  }
}

class BienvenidaScreen extends StatelessWidget {
  const BienvenidaScreen({super.key}); 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bienvenida"),
        backgroundColor: Colors.pink.shade300,
      ),
      body: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.purple.shade300,
          ),
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/registro');
          },
          child: const Text("Ir al Formulario de Registro"),
        ),
      ),
    );
  }
}

class RegistroFormulario extends StatefulWidget {
  const RegistroFormulario({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _RegistroFormularioState createState() => _RegistroFormularioState();
}

class _RegistroFormularioState extends State<RegistroFormulario> {
  final _formKey = GlobalKey<FormState>();
  String? _genero;
  final List<String> _estadoCivil = []; 
  final TextEditingController _cedulaController = TextEditingController();
  final TextEditingController _nombresController = TextEditingController();
  final TextEditingController _apellidosController = TextEditingController();
  final TextEditingController _fechaController = TextEditingController();
  final TextEditingController _edadController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Formulario de Registro"),
        backgroundColor: Colors.pink.shade300,
      ),
      body: Container(
        color: const Color.fromARGB(255, 240, 220, 226),
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600),
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: _cedulaController,
                      decoration: const InputDecoration(
                        labelText: "Cédula",
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Por favor, ingrese su cédula.";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: _nombresController,
                      decoration: const InputDecoration(
                        labelText: "Nombres",
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Por favor, ingrese sus nombres.";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: _apellidosController,
                      decoration: const InputDecoration(
                        labelText: "Apellidos",
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Por favor, ingrese sus apellidos.";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: _fechaController,
                      decoration: const InputDecoration(
                        labelText: "Fecha de Nacimiento",
                        border: OutlineInputBorder(),
                        suffixIcon: Icon(Icons.calendar_today),
                      ),
                      readOnly: true,
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1900),
                          lastDate: DateTime.now(),
                        );
                        if (pickedDate != null) {
                          setState(() {
                            _fechaController.text =
                                "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
                          });
                        }
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Por favor, seleccione su fecha de nacimiento.";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: _edadController,
                      decoration: const InputDecoration(
                        labelText: "Edad",
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Por favor, ingrese su edad.";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),
                    const Text("Género:"),
                    Row(
                      children: [
                        Expanded(
                          child: RadioListTile<String>(
                            title: const Text("Masculino"),
                            value: "Masculino",
                            groupValue: _genero,
                            onChanged: (value) {
                              setState(() {
                                _genero = value;
                              });
                            },
                          ),
                        ),
                        Expanded(
                          child: RadioListTile<String>(
                            title: const Text("Femenino"),
                            value: "Femenino",
                            groupValue: _genero,
                            onChanged: (value) {
                              setState(() {
                                _genero = value;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    const Text("Estado Civil:"),
                    CheckboxListTile(
                      title: const Text("Soltero/a"),
                      value: _estadoCivil.contains("Soltero/a"),
                      onChanged: (bool? value) {
                        setState(() {
                          value!
                              ? _estadoCivil.add("Soltero/a")
                              : _estadoCivil.remove("Soltero/a");
                        });
                      },
                    ),
                    CheckboxListTile(
                      title: const Text("Casado/a"),
                      value: _estadoCivil.contains("Casado/a"),
                      onChanged: (bool? value) {
                        setState(() {
                          value!
                              ? _estadoCivil.add("Casado/a")
                              : _estadoCivil.remove("Casado/a");
                        });
                      },
                    ),
                    CheckboxListTile(
                      title: const Text("Divorciado/a"),
                      value: _estadoCivil.contains("Divorciado/a"),
                      onChanged: (bool? value) {
                        setState(() {
                          value!
                              ? _estadoCivil.add("Divorciado/a")
                              : _estadoCivil.remove("Divorciado/a");
                        });
                      },
                    ),
                    CheckboxListTile(
                      title: const Text("Viudo/a"),
                      value: _estadoCivil.contains("Viudo/a"),
                      onChanged: (bool? value) {
                        setState(() {
                          value!
                              ? _estadoCivil.add("Viudo/a")
                              : _estadoCivil.remove("Viudo/a");
                        });
                      },
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.purple.shade300,
                          ),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text("Datos guardados")),
                              );
                            }
                          },
                          child: const Text("Guardar"),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.pink.shade300,
                          ),
                          onPressed: () {
                            Navigator.pushReplacementNamed(context, '/');
                          },
                          child: const Text("Salir"),
                        ),
                      ],
                    ),
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
