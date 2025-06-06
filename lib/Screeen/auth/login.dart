
  import 'package:card_swiper/card_swiper.dart';
import 'package:client/Screeen/auth/forget_pass.dart';
import 'package:client/Screeen/auth/register.dart';
import 'package:client/Widgets/auth_button.dart';
import 'package:client/Widgets/google_button.dart';
import 'package:client/Widgets/text_widget.dart';
import 'package:client/consts/consts.dart';
import 'package:client/services/global_methods.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

  class LoginScreen extends StatefulWidget {
    static const routeName = '/LoginScreen';
    const LoginScreen({super.key});

    @override
    State<LoginScreen> createState() => _LoginScreenState();
  }

  class _LoginScreenState extends State<LoginScreen> {
    final _emailTextController=TextEditingController();
    final _passTextController=TextEditingController();
    final _passFocusNode=FocusNode();
    final _formKey=GlobalKey<FormState>();
    var _obscureText=true;
    @override
    void dispose() {
      _emailTextController.dispose();
      _passTextController.dispose();
      _passFocusNode.dispose();
      super.dispose();
    }
    void _submitFormOnLogin()  {
      final isValid= _formKey.currentState!.validate();
      FocusScope.of(context).unfocus();
      if(isValid){
        print('The form is valid');
      }
    }
    @override
    Widget build(BuildContext context) {
      return  Scaffold(
        body: Stack(
          children: [
            Swiper(
              duration: 800,
              autoplayDelay: 8000,
              itemBuilder: (BuildContext, int index){
                return Image.asset(
                  Constss.authImagesPaths[index],
                  fit: BoxFit.cover,);

              },
              autoplay: true,
              itemCount: Constss.authImagesPaths.length,
            ),
            Container(
              color: Colors.black.withOpacity(0.7),
            ),
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const SizedBox(
                      height: 120,
                    ),
                    TextWidget(
                      text: 'Welcome Back',
                      color: Colors.white,
                      textSize: 30,
                      isTitle: true,
                    ),
                    const SizedBox(
                      height:8,
                    ),
                    TextWidget(
                      text: 'Sign in to continue',
                      color: Colors.white,
                      textSize: 18,
                      isTitle: false,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Form(
                      key:_formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            textInputAction:TextInputAction.next,
                            onEditingComplete:()=>FocusScope.of(context)
                                .requestFocus(_passFocusNode),
                            controller: _emailTextController,
                            keyboardType: TextInputType.emailAddress,
                            validator: (value){
                              if(value!.isEmpty || !value.contains('@')){
                                return 'Please enter a valid email address';
                              }
                              else {
                                return null;
                              }
                            },
                            style: const TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              hintText: 'Email',
                              hintStyle: const TextStyle(color: Colors.white),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)
                              ),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white)

                              )

                            ),

                          ),
                          SizedBox(
                            height: 12,
                          ),
                          //password
                          TextFormField(
                            textInputAction:TextInputAction.done,
                            onEditingComplete:(){
                              _submitFormOnLogin();
                            },
                            controller: _passTextController,
                            focusNode: _passFocusNode,
                            obscureText: _obscureText,
                            keyboardType: TextInputType.visiblePassword,
                            validator: (value){
                              if(value!.isEmpty || value.length<7){
                                return 'Please enter a valid password';
                              }
                              else {
                                return null;
                              }
                            },
                            style: const TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                                suffixIcon: GestureDetector(
                                  onTap: (){
                                    setState(() {
                                      _obscureText =! _obscureText;
                                    }
                                    );

                                    },

                                    child: Icon(
                                        _obscureText?
                                        Icons.visibility: Icons.visibility_off,
                                      color: Colors.white,
                                    )
                                ),
                                hintText: 'Password',
                                hintStyle: const TextStyle(color: Colors.white),
                                enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white)
                                ),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white)

                                )

                            ),

                          )
                          ]
                    )
                    ),
                    const SizedBox(
                      height: 10,
                    ),

                    Align(
                      alignment: Alignment.topRight,
                      child: TextButton(
                          onPressed: (){
                            GlobalMethods.navigateTo(
                                ctx: context,
                                routeName: ForgetPasswordScreen.routeName);
                          },
                          child: Text(

                            'Forgot Password?',
                            maxLines:1,
                            style: TextStyle
                              (color: Colors.lightBlue,
                                fontSize: 16,
                                decoration: TextDecoration.underline,
                              fontStyle: FontStyle.italic,
                            ),

                          )
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    AuthButton(
                      fct: _submitFormOnLogin,
                      buttonText: 'Login',
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                     const GoogleButton(),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        const Expanded(
                            child: Divider(
                          color: Colors.white,
                          thickness: 2,
                        )
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        TextWidget(
                          text: 'OR',
                          color: Colors.white,
                          textSize: 16,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        const Expanded(
                            child: Divider(
                              color: Colors.white,
                              thickness: 2,
                        )
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    AuthButton(fct: (){},
                        primary: Colors.black,
                        buttonText:'Continues as a guest'
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    RichText(text: TextSpan(
                        text: 'Don\'t have an account? ',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),

                      children: [
                        TextSpan(
                          text: '   Sign up',
                          style: const TextStyle(
                            color: Colors.lightBlue,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                        ),
                          recognizer: TapGestureRecognizer()..onTap=() {
                            GlobalMethods.navigateTo(
                                ctx: context,
                                routeName: RegisterScreen.routeName);
                          }
                        )
                      ]

                    ))

                  ],
                ),
              ),
            )
          ],
        ),
      );
    }
  }
