import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginPage extends StatelessWidget{
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //Logo
              SvgPicture.asset("assets/Logo_light.svg",
                width:  100,
                height: 100,
              ),

              const SizedBox(height: 25),

              //message, app slogan
              Text(
                  "VOHGO",
                  style: TextStyle(
                    fontSize: 16,
                    color: Theme.of(context).colorScheme.inversePrimary,
                  )
              )
            ],
          )
      ),
    );
  }
}