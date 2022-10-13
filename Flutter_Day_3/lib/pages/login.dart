import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Image.asset('assets/images/login_image.png',fit: BoxFit.cover, ),
          ),
          const Text('Welcome to Login Screen',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22
          ),),
          const SizedBox(height: 20,),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
                child: TextFormField(
                  obscureText: false,
                  decoration:InputDecoration(
                    hintText: 'example@gmail.com',
                    labelText: 'Enter Email',
                    prefixIcon: const Icon(Icons.email_rounded),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0)
                    )
                  ),
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: SizedBox(
                  width: double.infinity,
                  height: 60,
                  child: ElevatedButton(
                    onPressed: () {  },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)
                      ),
                      elevation: 5,
                      primary: Colors.deepPurpleAccent,
                      onPrimary: Colors.white,
                      shadowColor: Colors.deepPurpleAccent,
                    ),
                    child: const Text('Login'),
                  ),
                )
              ),
             const Padding(
               padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
               child: Text('Forgot Password'),
             )
            ],
          )
        ],
      ),
    );
  }
}
