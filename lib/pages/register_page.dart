import 'package:fisrt_app/services/auth/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:fisrt_app/components/my_textfield.dart';
import 'package:fisrt_app/components/my_button.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fisrt_app/themes/themed_logo.dart';

class RegisterPage extends StatefulWidget{
  final void Function()? onTap;

  const RegisterPage({
    super.key,
    required this.onTap,
  }
  );

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage>{
  //Text editing controllers
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmpasswordController = TextEditingController();

  //regiter method
  void register() async{
    //get auth service
    final _authService = AuthService();

    // check if password match -> create user
    if(passwordController.text == confirmpasswordController.text){
      //try creating user
      try{
        await _authService.signUpWithEmailPassword(emailController.text, passwordController.text,);
      }
      // display  any errors
      catch (e){
        showDialog(
            context: context,
            builder: (context)=>AlertDialog(
              title: Text(e.toString()),
            ),
        );
      }
    }
    // if password don't match -> show error
    else{
      showDialog(
        context: context,
        builder: (context)=>const AlertDialog(
          title: Text("!UPS! las contraseñas no coinciden"),
        ),
      );
    }
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
              SvgPicture.asset("assets/Logo_light.svg",
                width:  100,
                height: 100,
              ),

              const SizedBox(height: 35),

              //message, app slogan
              Text(
                "VOHGO",
                style: TextStyle(
                  fontSize: 16,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),

              const SizedBox(height: 25),

              //message, app slogan
              Text(
                "¡Creemos una cuenta para ti!",
                style: TextStyle(
                  fontSize: 16,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),

              const SizedBox(height: 25),

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
              const SizedBox(height: 10),

              // password textfield
              MyTextField(
                controller: confirmpasswordController,
                hinText: "Confirma tu contraseña",
                obscureText: true,
              ),

              const SizedBox(height: 25),

              // sign in button
              MyButton(
                  text: "Registrarse",
                  onTap: register),

              const SizedBox(height: 25),

              // Already have an account ? Login here
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "¿Ya tienes una cuenta?",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary
                    ),
                  ),
                  const SizedBox(width: 4),

                  GestureDetector(
                    onTap: widget.onTap,
                    child: Text(
                      "Ingresa aquí",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ),

              const SizedBox(height: 70),

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
}}