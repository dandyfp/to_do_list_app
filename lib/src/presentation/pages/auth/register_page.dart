import 'package:flutter/material.dart';
import 'package:todo_list_app/src/presentation/misc/constant.dart';
import 'package:todo_list_app/src/presentation/misc/methods.dart';
import 'package:todo_list_app/src/presentation/misc/style.dart';
import 'package:todo_list_app/src/presentation/misc/validator.dart';
import 'package:todo_list_app/src/presentation/widgets/button.dart';
import 'package:todo_list_app/src/presentation/widgets/textfield.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

TextEditingController nameController = TextEditingController();
TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();

bool isObscure = true;
bool isLoadingRegister = false;

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: Column(
              children: [
                verticalSpace(100),
                Text(
                  'Register',
                  style: blackSemiBoldTextStyle.copyWith(fontSize: 20),
                ),
                verticalSpace(30),
                KTextField(
                  label: 'Name',
                  maxLines: 1,
                  minLines: 1,
                  controller: nameController,
                  borderColor: Colors.black,
                  keyboardType: TextInputType.name,
                  textInputAction: TextInputAction.next,
                  validator: Validator.emailValidator.call,
                  placeholder: 'Enter your email',
                ),
                verticalSpace(10),
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
                  isLoading: isLoadingRegister,
                  isDisabled: isLoadingRegister,
                  onPressed: () {},
                  child: Center(
                    child: Text(
                      'Register',
                      style: whiteMediumTextStyle.copyWith(fontSize: 14),
                    ),
                  ),
                ),
              ],
            ),
          ),
          verticalSpace(10),
        ],
      ),
    );
  }
}
