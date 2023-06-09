import 'package:flutter/material.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Center(
          child: Text("Login"),
        ),
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                decoration: InputDecoration(
                  hintText: "Email"
                )
              ),

              TextFormField(
                decoration: InputDecoration(
                  hintText: "Password"
                ),
              )

              ,InkWell(
                onTap: (){

                },
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(5)

                  ),
                  child: const Center(child: Text("Login", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),)),
                ),
              )
            ],
          ),
        ),
      )
    );
  }


  Future<void> shiku() async{
    Future.delayed(Duration(seconds: 3));
    print("SHiku print");
  }


}
