import 'package:fisrt_app/services/auth/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:fisrt_app/components/my_textfield.dart';
import 'package:fisrt_app/components/my_button.dart';
import 'package:fisrt_app/themes/themed_logo.dart';

class LoginPage extends StatefulWidget {
  final void Function()? onTap;

  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>{
  //Text editing controllers
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  //Login method
  void login() async {
    //get instance of auth service
    final authService = AuthService();

    //try sign in
    try {
      await authService.signInWithEmail(
        emailController.text,
        passwordController.text,);
    }

    // display any errors
    catch (e) {
      showDialog(
        context: context,
        builder: (context) =>
            AlertDialog(
              title: Text(e.toString()),
            ),
      );
    }
  }

  // forgot password
  void forgotPw(){
    showDialog(
        context: context,
        builder: (context)=>AlertDialog(
          backgroundColor: Theme.of(context).colorScheme.surface,
          title: const Text("User tapped forgot password"),
        ),
    );
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 70),
            //Logo
            const ThemedLogo(
              lightModeAsset: "assets/Logo_light.svg",
              darkModeAsset:  "assets/Logo_dark.svg",
              width:  100,
              height: 100,
            ),

            const SizedBox(height: 30),

            //message, app slogan
            Text(
              "VOHGO",
              style: TextStyle(
                fontSize: 16,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),

            const SizedBox(height: 70),

            // email textfield
            MyTextField(
                controller: emailController,
                hinText: "Correo electrónico",
                obscureText: false,
            ),
            const SizedBox(height: 10),

            // password textfield
            MyTextField(
              controller: passwordController,
              hinText: "Contraseña",
              obscureText: true,
            ),
            const SizedBox(height: 25),

            // sign in button
            MyButton(
                text: "Iniciar sesión",
                onTap: login),

            const SizedBox(height: 25),

            // not a member ? register now
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "¿No tienes cuenta?",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary
                  ),
                ),
                const SizedBox(width: 4),

                GestureDetector(
                  onTap: widget.onTap,
                  child: Text(
                    "Regístrate ahora",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),

            const SizedBox(height: 130),

            //Developed by
            Text(
              "Desarrollado por",
              style: TextStyle(
                fontSize: 12,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),

            const SizedBox(height: 1),

            //ESPEJO & ASOCIADOS logo
            const ThemedLogo(
              lightModeAsset: "assets/ESPEJO&ASOCIADOS_Logo_light.svg",
              darkModeAsset: "assets/ESPEJO&ASOCIADOS_Logo_dark.svg",
              width: 140,
              height: 140,
            ),

          ],
        )
      ),
    );
  }
}