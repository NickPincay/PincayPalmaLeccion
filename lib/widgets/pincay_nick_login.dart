import 'package:flutter/material.dart';
import 'package:pincay_nick_leccion/widgets/pincay_nick_home.dart';

class PincayNickLogin extends StatefulWidget {
  const PincayNickLogin({super.key});

  @override
  State<PincayNickLogin> createState() => _PincayNickLoginState();
}

class _PincayNickLoginState extends State<PincayNickLogin> {
  TextEditingController emailController = TextEditingController();
  TextEditingController claveController = TextEditingController();

  void _pincayPalmaLogin() {
    const correctEmail = 'admin@ug.edu.ec';
    const correctPassword = '123';

    if (emailController.text.isEmpty || claveController.text.isEmpty) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Advertencia'),
            content: const Text('Por favor, complete todos los campos.'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    } else if (emailController.text == correctEmail &&
        claveController.text == correctPassword) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const PincayNickHome()),
      );
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Advertencia'),
            content: const Text('Correo o clave incorrecta.'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Pincay Palma Nick Lee',
            style: TextStyle(fontWeight: FontWeight.w400),
          ),
        ),
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
        Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(
                      Icons.email,
                      size: 20,
                    ),
                    labelText: 'Correo',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 25.0),
                TextFormField(
                  controller: claveController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(
                      Icons.lock,
                      size: 20,
                    ),
                    labelText: 'Clave',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 25.0),
                SizedBox(
                  width: double.infinity,
                  child: TextButton.icon(
                    onPressed: _pincayPalmaLogin,
                    icon: const Icon(
                      Icons.login,
                      color: Colors.white,
                      size: 20,
                    ),
                    label: const Text(
                      'Contectar',
                      style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    style: ButtonStyle(
                      backgroundColor:
                          WidgetStateProperty.all<Color>(Colors.green.shade800),
                      shape: WidgetStateProperty.all<OutlinedBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
                        const EdgeInsets.symmetric(vertical: 13.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Text('Lección del segundo parcial: Flutter'),
          ),
        ),
      ],
    );
  }
}
