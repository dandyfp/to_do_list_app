import 'package:flutter/material.dart';
import 'package:todo_list_app/src/presentation/misc/constant.dart';
import 'package:todo_list_app/src/presentation/misc/methods.dart';
import 'package:todo_list_app/src/presentation/misc/navigator_helper.dart';
import 'package:todo_list_app/src/presentation/misc/style.dart';
import 'package:todo_list_app/src/presentation/misc/validator.dart';
import 'package:todo_list_app/src/presentation/pages/auth/register_page.dart';
import 'package:todo_list_app/src/presentation/widgets/button.dart';
import 'package:todo_list_app/src/presentation/widgets/textfield.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

bool isObscure = true;
bool isLoadingLogin = true;

TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: ListView(
        children: [
          verticalSpace(50),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Login',
                  style: blackSemiBoldTextStyle.copyWith(fontSize: 20),
                ),
                verticalSpace(10),
                Center(
                  child: Image.asset(
                    'assets/images/illustration_login.png',
                    height: 300,
                  ),
                ),
                verticalSpace(20),
                KTextField(
                  label: 'Email',
                  maxLines: 1,
                  minLines: 1,
                  controller: emailController,
                  borderColor: Colors.black,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  validator: Validator.emailValidator.call,
                  placeholder: 'Enter your email',
                ),
                verticalSpace(10),
                KTextField(
                  label: 'Password',
                  maxLines: 1,
                  minLines: 1,
                  borderColor: Colors.black,
                  obscure: isObscure,
                  controller: passwordController,
                  keyboardType: TextInputType.visiblePassword,
                  textInputAction: TextInputAction.next,
                  validator: Validator.emailValidator.call,
                  placeholder: 'Enter your password',
                  suffixIcon: InkWell(
                    onTap: () {
                      setState(() {
                        isObscure = !isObscure;
                      });
                    },
                    child: isObscure
                        ? const Icon(Icons.visibility_off)
                        : const Icon(Icons.visibility),
                  ),
                ),
                verticalSpace(30),
                Button(
                  isLoading: isLoadingLogin,
                  isDisabled: isLoadingLogin,
                  onPressed: () {},
                  child: Center(
                    child: Text(
                      'Login',
                      style: whiteMediumTextStyle.copyWith(fontSize: 14),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      'Forgot Password ?',
                      style: blackMediumTextStyle.copyWith(fontSize: 14),
                    ),
                  ),
                ),
                verticalSpace(20),
                Center(
                  child: Column(
                    children: [
                      Text(
                        'sign in with',
                        style: blackRegularTextStyle.copyWith(fontSize: 12),
                      ),
                      verticalSpace(4),
                      InkWell(
                        onTap: () {},
                        child: Image.asset(
                          'assets/images/logo_google.png',
                          width: 25,
                          height: 25,
                        ),
                      ),
                    ],
                  ),
                ),
                verticalSpace(50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account yet? ",
                      style: blackMediumTextStyle.copyWith(fontSize: 14),
                    ),
                    InkWell(
                      onTap: () {
                        NavigatorHelper.push(context, const RegisterPage());
                      },
                      child: Text(
                        "Register now",
                        style: blackMediumTextStyle.copyWith(
                          fontSize: 14,
                          color: primaryColor,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
