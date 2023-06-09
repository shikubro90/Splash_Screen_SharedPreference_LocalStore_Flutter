import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:splashscreen/login_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String email = '', age = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
    setState(() {

    });
  }

  void loadData() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    email = sp.getString("email") ?? '';
    age = sp.getString('age') ?? '';
  }

  void logout() async{
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.remove('email'.toString());
    sp.remove('age'.toString());
    sp.setBool('status', false);
    Navigator.push(context as BuildContext, MaterialPageRoute(builder: (context)=> LoginScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.teal,
        title: Center(child: Text("Home", style: TextStyle(color: Colors.white),)),
          actions: [
            PopupMenuButton(

              onSelected: (value){
                if(value =='logout'){
                  logout();
                }
              },

            icon: Icon(Icons.more_horiz_outlined, color: Colors.white),
            itemBuilder: (context)=>[
              const PopupMenuItem(child: Text("Logout"), value: 'logout',)
                ])
          ],
      ),
        body: SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Center(
                child: Text(
              "Welcome To Home",
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
            )),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Email"),
                Text(email.toString()),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Age"),
                Text(age.toString()),
              ],
            ),
          )
        ],
      ),
    ));
  }
}
