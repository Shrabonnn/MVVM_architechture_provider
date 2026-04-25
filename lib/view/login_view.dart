import 'package:flutter/material.dart';
import 'package:mvvm/res/components/round_button.dart';
import 'package:mvvm/utils/routes/routes_name.dart';
import 'package:mvvm/utils/utils.dart';
import 'package:mvvm/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {

  // 🔹 Controllers
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();


  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  ValueNotifier _obsecurePassword = ValueNotifier<bool>(true);

  @override
  void dispose() {
    // 🔹 Important to avoid memory leak
    emailController.dispose();
    passwordController.dispose();

    emailFocusNode.dispose();
    passwordFocusNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final authViewModel = Provider.of<AuthViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            // 🔹 Email TextField
            TextFormField(
              focusNode: emailFocusNode,
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                hintText: "Enter Email",
                labelText: "Email",
                prefixIcon: Icon(Icons.alternate_email_outlined),
                border: OutlineInputBorder(),),
                onFieldSubmitted:(value){
                  Utils.fieldFocusChange(context,emailFocusNode,passwordFocusNode);
                },
            ),

            const SizedBox(height: 20),
            ValueListenableBuilder(
                valueListenable:_obsecurePassword , builder: (context,value,child){
                  return TextFormField(
                    focusNode: passwordFocusNode,
                    controller: passwordController,
                    obscureText: _obsecurePassword.value,
                    decoration: InputDecoration(
                      hintText: "Enter Password",
                      labelText: "Password",
                      prefixIcon: Icon(Icons.lock_open_rounded),
                      suffixIcon: InkWell(
                        onTap: (){
                          _obsecurePassword.value = !_obsecurePassword.value;
                        },
                        child:  _obsecurePassword.value ? Icon(Icons.remove_red_eye):Icon(Icons.remove_red_eye_outlined),
                      ),
                      border: OutlineInputBorder(),
                    ),
                  );
            }),

            // 🔹 Password TextField


            const SizedBox(height: 30),

            RoundButton(
              title: 'Log in',
              isProgress: false,
              onPress: () {
                if(emailController.text.isEmpty){
                  Utils.flushbarErrorMessage('Please Enter Your Email', context);
                }
                else if(passwordController.text.isEmpty){
                  Utils.flushbarErrorMessage('Please Enter Your Password', context);
                }
                else if(passwordController.text.length <= 6){
                  Utils.flushbarErrorMessage('Password should be at-least 6 character', context);
                }else{
                   Map data= {
                     "username": "emilys",
                     "email": emailController.text.toString(),
                     "password": passwordController.text.toString(),
                     };
                   authViewModel.loginApi(data , context);
                   print('Hit api');
                 }
              })

          ],
        ),
      ),
    );
  }
}