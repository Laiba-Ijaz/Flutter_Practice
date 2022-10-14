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
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
                  child: TextFormField(
                    obscureText: false,
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
                InkWell(
                  onTap: () async{

                   setState(() {
                     changeButton = true;
                   });
                   await Future.delayed(const Duration(seconds: 1));
                   Navigator.pushNamed(context, MyRoutes.homeRoute);
                  },
                  child: AnimatedContainer(
                    duration: const Duration(seconds: 1),
                    width: changeButton? 50:150,
                    height: 50,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.deepPurpleAccent,
                      borderRadius: BorderRadius.circular(changeButton ? 50 :10),
                    ),
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
            )
          ],
        ),
      ),
    );
  }
}
