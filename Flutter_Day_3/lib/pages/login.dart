import 'package:flutter/material.dart';
import 'package:flutter_day_three/utils/routes.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String name="";
  bool changeButton = false;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  moveToHome(BuildContext context) async{
    if(_formKey.currentState!.validate()){
    setState(() {
      changeButton = true;
    });
    await Future.delayed(const Duration(seconds: 1));
    await Navigator.pushNamed(context, MyRoutes.homeRoute);
    setState(() {
      changeButton = false;
    });
    _usernameController.clear();
    _passwordController.clear();
    }
  }
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Image.asset('assets/images/login_image.png',fit: BoxFit.cover, ),
            ),
            Text('Welcome $name',
            style: const TextStyle(
            fontWeight: FontWeight.bold,
              fontSize: 24
              ),
            ),
            const SizedBox(height: 20,),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
                    child: TextFormField(
                      controller: _usernameController,
                      obscureText: false,
                      validator: (value){
                        if(value!.isEmpty){
                          return 'Username can not be empty';
                        }
                        return null;
                      },
                      decoration:InputDecoration(
                        hintText: 'Robbin',
                        labelText: 'Enter Username',
                        prefixIcon: const Icon(Icons.person),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0)
                        )
                      ),
                      onChanged: (value){
                        name = value;
                        setState(() {});
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                    child: TextFormField(
                      obscureText: true,
                      controller: _passwordController,
                      validator: (value){
                        if(value!.isEmpty){
                          return 'Password cannot be null';
                        }
                        else if(value.length<6){
                          return "Password length should be at least 6";
                        }
                        
                        return null;
                      },
                      decoration:InputDecoration(
                          hintText: '1234567',
                          labelText: 'Enter Password',
                          prefixIcon: const Icon(Icons.lock_outline),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0)
                          )
                      ),
                    ),
                  ),
                  const SizedBox(height: 30.0,),
                  Material(
                    borderRadius: BorderRadius.circular(changeButton ? 50 :10),
                    color: Colors.deepPurpleAccent,
                    child: InkWell(
                      onTap: () =>moveToHome(context),
                      child: AnimatedContainer(
                        duration: const Duration(seconds: 1),
                        width: changeButton? 50:150,
                        height: 50,
                        alignment: Alignment.center,
                        child: changeButton ? const Icon(Icons.done, color: Colors.white,): const Text(
                          'Login',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.white
                          ),
                        ),
                      ),
                    ),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  //   child: SizedBox(
                  //     width: double.infinity,
                  //     height: 60,
                  //     child: ElevatedButton(
                  //       onPressed: () {
                  //         Navigator.pushNamed(context, MyRoutes.homeRoute);
                  //       },
                  //       style: ElevatedButton.styleFrom(
                  //         shape: RoundedRectangleBorder(
                  //           borderRadius: BorderRadius.circular(20.0)
                  //         ),
                  //         elevation: 5,
                  //         primary: Colors.deepPurpleAccent,
                  //         onPrimary: Colors.white,
                  //         shadowColor: Colors.deepPurpleAccent,
                  //       ),
                  //       child: const Text('Login'),
                  //     ),
                  //   )
                  // ),
                 const Padding(
                   padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                   child: Text('Forgot Password'),
                 )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
