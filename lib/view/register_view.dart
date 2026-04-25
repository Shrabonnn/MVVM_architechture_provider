import 'package:flutter/material.dart';
import 'package:mvvm/res/components/round_button.dart';
import 'package:mvvm/utils/routes/routes_name.dart';
import 'package:mvvm/utils/utils.dart';
import 'package:mvvm/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {

  // 🔹 Controllers
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();


  FocusNode emailFocusNode = FocusNode();
  FocusNode nameFocusNode = FocusNode();
  ValueNotifier _obsecurePassword = ValueNotifier<bool>(true);

  @override
  void dispose() {
    // 🔹 Important to avoid memory leak
    emailController.dispose();
    nameController.dispose();

    emailFocusNode.dispose();
    nameFocusNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final authViewModel = Provider.of<AuthViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Register"),
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
                Utils.fieldFocusChange(context,emailFocusNode,nameFocusNode);
              },
            ),

            const SizedBox(height: 20),
            TextFormField(
              focusNode: nameFocusNode,
              controller: nameController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                hintText: "Enter Name",
                labelText: "Name",
                prefixIcon: Icon(Icons.alternate_email_outlined),
                border: OutlineInputBorder(),),
            ),



            const SizedBox(height: 30),

            RoundButton(
                title: 'Register',
                isProgress: false,
                onPress: () {
                  if(emailController.text.isEmpty){
                    Utils.flushbarErrorMessage('Please Enter Your Email', context);
                  }
                  else if(nameController.text.isEmpty){
                    Utils.flushbarErrorMessage('Please Enter Your Name', context);
                  }else{
                    Map data= {
                      "name": nameController.text.toString(),
                      "email": emailController.text.toString(),
                      "role": "admin"
                    };
                    authViewModel.registerApi(data,context);
                    print('Hit api');
                    print(data);
                  }
                })

          ],
        ),
      ),
    );
  }
}