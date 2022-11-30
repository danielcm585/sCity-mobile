import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:scity_mobile/components/drawer.dart';
import 'package:scity_mobile/pages/auth/login_page.dart';
import 'package:scity_mobile/utils/auth/handle_register.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  bool _hidePassword = true;
  bool _hideConfirmPassword = true;

  String username = '';
  String password = '';
  String confirmPassword = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Register',
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
            height: 265,
            child: SvgPicture.asset('assets/svg/register.svg')
          ),
          Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Register',
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
                  const SizedBox(height: 20),
                  const Text('Confirm Password'),
                  const SizedBox(height: 4),
                  SizedBox(
                    height: 42,
                    child: TextField(
                      obscureText: _hideConfirmPassword,
                      onChanged: (String? newVal) {
                        setState(() { confirmPassword = newVal!; });
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() { _hideConfirmPassword = !_hideConfirmPassword; });
                          },
                          icon: _hideConfirmPassword ?
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
                            MaterialPageRoute(builder: (context) => const LoginPage())
                          );
                        }, 
                        child: const Text(
                          'Login',
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
                        if (password == confirmPassword) {
                          Fluttertoast.showToast(
                            msg: 'Konfirmasi password tidak cocok',
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                          );
                        }
                        Map<String,dynamic> resp = await handleRegister(username, password);
                        if (resp['status'] >= 400) {
                          Fluttertoast.showToast(
                            msg: resp['message'],
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                          );
                          return;
                        }
                        if (!mounted) return;
                        Navigator.pushReplacement(
                          context, 
                          MaterialPageRoute(builder: (context) => const LoginPage()),
                        );
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
                        'Register',
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