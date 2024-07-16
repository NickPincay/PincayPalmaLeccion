import 'package:flutter/material.dart';

class PincayNickHome extends StatefulWidget {
  const PincayNickHome({super.key});

  @override
  State<PincayNickHome> createState() => _PincayNickHomeState();
}

class _PincayNickHomeState extends State<PincayNickHome> {
  final cedulaController = TextEditingController();
  final nombresController = TextEditingController();
  final apellidosController = TextEditingController();
  final fechaController = TextEditingController();
  String? _selectedCity;
  String? _selectedGender;

  bool? _isAccountActive;
  List<String> cities = ['Guayaquil', 'Quito', 'Cuenca'];
  List<String> genders = ['Masculino', 'Femenino'];
  bool activarCuenta = false;

  final _formKey = GlobalKey<FormState>();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        fechaController.text = "${picked.toLocal()}".split(' ')[0];
      });
    }
  }

  void _submitForm() {
    if (_formKey.currentState?.validate() == true) {
      // Aquí puedes manejar el envío del formulario.
      // Por ejemplo, puedes imprimir los valores ingresados.
      print('Cédula: ${cedulaController.text}');
      print('Nombres: ${nombresController.text}');
      print('Apellidos: ${apellidosController.text}');
      print('Fecha de Nacimiento: ${fechaController.text}');
      print('Ciudad: $_selectedCity');
      print('Sexo: $_selectedGender');
      print('Cuenta Activa: $_isAccountActive');
    }
  }

  void _goBack() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Registro de datos',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.orange.shade700,
      ),
      body: _pincayPalmaBody(),
    );
  }

  Stack _pincayPalmaBody() {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/background.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Form(
              key: _formKey,
              child: Expanded(
                child: ListView(
                  padding: const EdgeInsets.all(16.0),
                  children: [
                    TextFormField(
                      controller: cedulaController,
                      decoration: const InputDecoration(
                        labelText: 'Cédula',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor, ingrese la cédula';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 15),
                    TextFormField(
                      controller: nombresController,
                      decoration: const InputDecoration(
                        labelText: 'Nombres',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor, ingrese los nombres';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 15),
                    TextFormField(
                      controller: apellidosController,
                      decoration: const InputDecoration(
                        labelText: 'Apellidos',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor, ingrese los apellidos';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 15),
                    TextFormField(
                      controller: fechaController,
                      decoration: InputDecoration(
                        labelText: 'Fecha Nacimiento',
                        border: const OutlineInputBorder(),
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.calendar_today),
                          onPressed: () {
                            _selectDate(context);
                          },
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor, ingrese la fecha de nacimiento';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 15),
                    DropdownButtonFormField<String>(
                      value: _selectedCity,
                      hint: const Text('Ciudad'),
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                      items: cities.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          _selectedCity = value;
                        });
                      },
                      validator: (value) {
                        if (value == null) {
                          return 'Por favor, seleccione una ciudad';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 15),
                    DropdownButtonFormField<String>(
                      value: _selectedGender,
                      hint: const Text('Sexo'),
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                      items: genders.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          _selectedGender = value;
                        });
                      },
                      validator: (value) {
                        if (value == null) {
                          return 'Por favor, seleccione un sexo';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 15),
                    Row(
                      children: [
                        const Text('Activar Cuenta'),
                        Checkbox(
                          value: _isAccountActive == true,
                          onChanged: (value) {
                            setState(() {
                              _isAccountActive = value;
                            });
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: _submitForm,
                          child: const Text('Añadir'),
                        ),
                        ElevatedButton(
                          onPressed: _goBack,
                          child: const Text('Regresar'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
