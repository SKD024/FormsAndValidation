import 'package:flutter/material.dart';

class FormsAndValidation extends StatefulWidget {
  const FormsAndValidation({Key? key}) : super(key: key);

  @override
  State<FormsAndValidation> createState() => _FormsAndValidationState();
}

class _FormsAndValidationState extends State<FormsAndValidation> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  String? email;
  final emailFocusNode = FocusNode();
  bool hidePassword = true;
  final ageControlller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Forms and Validation',
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                TextField(
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    labelText: 'Full Name',
                    hintText: 'Enter your full name',
                    isDense: true,
                    suffixIcon: const Icon(
                      Icons.home,
                      //color: Colors.red,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(color: Colors.red),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(color: Colors.green),
                    ),
                    // enabled: false,
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(color: Colors.red),
                    ),
                    suffixIconColor: Colors.green,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.emailAddress,
                  controller: emailController,
                  focusNode: emailFocusNode,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    hintText: 'Enter Your Email',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Email is required';
                    }
                    if (!value.contains('@') && !value.contains('.')) {
                      return 'Enter a Valid Email';
                    }
                  },
                  onChanged: (value) {
                    print('Clicked: $value');
                    email = value;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    suffixIcon: GestureDetector(
                      onTap: () {
                        hidePassword = !hidePassword;
                        setState(() {});
                      },
                      child: Icon(hidePassword
                          ? Icons.visibility
                          : Icons.visibility_off),
                    ),
                    labelText: 'Password',
                    hintText: 'Enter Your Password',
                    border: const OutlineInputBorder(),
                  ),
                  obscureText: hidePassword,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Password is required';
                    }
                    if (value.length < 6) {
                      return 'Password length must be 6';
                    }
                  },
                  onChanged: (value) {
                    print('Clicked: $value');
                    email = value;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  controller: ageControlller,
                  decoration: const InputDecoration(
                    labelText: 'Age',
                    hintText: 'Enter Your Age',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Age is required';
                    }
                    if ((int.tryParse(value) ?? 0) < 18) {
                      return 'You must be greater than 18 years';
                    }
                  },
                  onChanged: (value) {
                    print('Clicked: $value');
                    email = value;
                  },
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            formKey.currentState?.save();
            final isValidated = formKey.currentState?.validate();
            print('email from on changed: $email');
            if (isValidated ?? false) {
              final ec = emailController.text;
              print('email from controller: $ec');
              emailFocusNode.unfocus();
            } else {
              print('Please Enter all required fields');
            }
          },
          label: const Text('Submit'),
        ),
      ),
    );
  }
}
