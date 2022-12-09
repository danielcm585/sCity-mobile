import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:scity_mobile/components/drawer.dart';
import 'package:scity_mobile/pages/auth/register_page.dart';
import 'package:scity_mobile/pages/home/home_page.dart';
import 'package:scity_mobile/providers/auth_provider.dart';
import 'package:scity_mobile/utils/auth/handle_login.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  bool _hidePassword = true;

  String username = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Login',
          style: TextStyle(
            color: Colors.white
          )
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      drawer: const AppDrawer(),
      body: Column(
        children: [
          SizedBox(
            height: 350,
            child: SvgPicture.asset('assets/svg/login.svg')
          ),
          Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w800,
                      color: Color.fromRGBO(0x10,0xb9,0x81,1),
                    )
                  ),
                  const SizedBox(height: 20),
                  const Text('Username'),
                  const SizedBox(height: 4),
                  SizedBox(
                    height: 42,
                    child: TextField(
                      onChanged: (String? newVal) {
                        setState(() { username = newVal!; });
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)
                        ),
                        contentPadding: const EdgeInsets.all(10),
                      ),
                    )
                  ),
                  const SizedBox(height: 20),
                  const Text('Password'),
                  const SizedBox(height: 4),
                  SizedBox(
                    height: 42,
                    child: TextField(
                      obscureText: _hidePassword,
                      onChanged: (String? newVal) {
                        setState(() { password = newVal!; });
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() { _hidePassword = !_hidePassword; });
                          },
                          icon: _hidePassword ?
                            const Icon(Icons.visibility) : 
                            const Icon(Icons.visibility_off)
                        ),
                        contentPadding: const EdgeInsets.all(10),
                      ),
                    )
                  ),
                  Row(
                    children: [
                      const Text('Do not have an account?'),
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context, 
                            MaterialPageRoute(builder: (context) => const RegisterPage())
                          );
                        }, 
                        child: const Text(
                          'Register',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          )
                        )
                      )
                    ]
                  ),
                  const SizedBox(height: 2),
                  SizedBox(
                    width: double.maxFinite,
                    height: 42,
                    child: TextButton(
                      onPressed: () async {
                        handleLogin(context, username, password);
                      }, 
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(const Color.fromRGBO(0x10,0xb9,0x81,1)),
                        foregroundColor: MaterialStateProperty.all(Colors.white),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          )
                        )
                      ),
                      child: const Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 18
                        )
                      )
                    )
                  )
                ],
              )
            )
          )
        ],
      ),
    );
  }
}