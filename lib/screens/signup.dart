import 'package:flutter/material.dart';
import 'package:flutter_app/app_data.dart';
import 'package:flutter_app/comp/app_button.dart';
import 'package:flutter_app/comp/pw_form_field.dart';
import 'package:flutter_app/comp/text_form_field.dart';

class AppSignUp extends StatefulWidget {
  const AppSignUp({super.key});

  @override
  State<AppSignUp> createState() => _AppSignUpState();
}

class _AppSignUpState extends State<AppSignUp> {

  TextEditingController? _emailController = TextEditingController();
  TextEditingController? _pwController = TextEditingController();
  TextEditingController? _cpwController = TextEditingController();
  bool checked = false;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: appPagePadding,
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 40),
                Text("Create Account", style: appTextHeader1),
                SizedBox(height: 10),
                Text("Connect with your friends today!", style: appTextSubHeader),
                SizedBox(height: 40),
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppTextFormField(
                        controller: _emailController,
                        fieldName: 'Email Address', 
                        hintText: 'Enter your email',
                        errormsg: 'Can\'t be empty',
                      ),
                      AppPwFormField(
                        controller: _pwController,
                        fieldName: 'Password', 
                        hintText: 'Enter your password',
                        validator: (value){
                          if(value!.isEmpty){
                            return 'Can\'t be empty';
                          }
                          return null;
                        },
                      ),
                      AppPwFormField(
                        controller: _cpwController,
                        fieldName: 'Confirm Password', 
                        hintText: 'Enter your password',
                        validator: (value){
                          if(value!.isEmpty){
                            return 'Can\'t be empty';
                          }else if(value != _pwController!.text){
                            return 'Incorrect password';
                          }
                          return null;
                        },
                      ),
                      Padding(
                        padding: appFieldPadding,
                        child: Row(
                          children: [
                            Checkbox(
                              value: checked,
                              onChanged: (value) { 
                                setState(() {
                                  checked = value!;                             
                                });
                              },                      
                            ),
                            Text("I agree to the terms and conditions")
                          ],
                        ),
                      ),
                      AppPrimaryBtn(
                        onPressed: (){
                          if(_formKey.currentState!.validate()){
                            
                          }
                        },
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 35),
                        child: Row(
                          children: [
                            Expanded(
                              child: const Divider(                        
                                thickness: 0.3,
                                endIndent: 20,
                              ),
                            ),
                            Text("Or Sign Up With"),
                            Expanded(
                              child: const Divider(                        
                                thickness: 0.3,
                                indent: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(color: Color.fromARGB(134, 102, 102, 102)),
                                  borderRadius: appBorderRadius,
                                ),
                                height: 50,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset('images/icons/facebook.png',
                                      width: 35,
                                      height: 35,
                                    ),
                                    SizedBox(width: 5),
                                    Text("Facebook")
                                  ],
                                ),
                              )
                            ),
                            SizedBox(width: 15),
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(color: Color.fromARGB(134, 102, 102, 102)),
                                  borderRadius: appBorderRadius,
                                ),
                                height: 50,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset('images/icons/google.png',
                                      width: 35,
                                      height: 35,
                                    ),
                                    SizedBox(width: 5),
                                    Text("Google")
                                  ],
                                ),
                              )
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),                
              ],
            ),
            Positioned(
              bottom: 50,
              left: 0,
              right: 0,
              child: Center(
                child: Row(   
                  mainAxisAlignment: MainAxisAlignment.center,         
                  children: [
                    Text("Already have an account?"),
                    TextButton(
                      onPressed: () {  },
                      child: Text("Login"),
                    )                
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

