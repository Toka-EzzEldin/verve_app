import 'package:flutter/material.dart';
import 'package:verve/main_screen.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final formKey = GlobalKey<FormState>();

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool isChecked = true;
  bool isPasswordVisible = false;

  DateTime? selectedDate;

  // دالة موحدة لتصميم الحدود بلون رمادي ثابت
  InputDecoration _buildInputDecoration({
    required String labelText,
    Widget? suffixIcon,
  }) {
    return InputDecoration(
      labelText: labelText,
      labelStyle: const TextStyle(fontSize: 12, color: Colors.grey),
      floatingLabelStyle: const TextStyle(
        color: Colors.grey,
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: const BorderSide(color: Color(0xffdddddd)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: const BorderSide(color: Colors.grey, width: 1.5),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: const BorderSide(color: Colors.red),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: const BorderSide(color: Colors.red, width: 1.5),
      ),
      suffixIcon: suffixIcon,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 7),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Verve",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
              ),
              Row(
                children: const [
                  Text(
                    "Belgium",
                    style: TextStyle(fontSize: 9, color: Colors.blue),
                  ),
                  SizedBox(width: 10),
                  Icon(Icons.language_rounded),
                ],
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: SingleChildScrollView(
              child: SizedBox(
                height: MediaQuery.of(context).size.height - 40,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),

                    const Text(
                      "I’m new here",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 20),

                    // First Name (Letters & spaces only)
                    TextFormField(
                      controller: firstNameController,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.black87,
                      ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return "First Name is required";
                        }
                        final nameRegExp = RegExp(r"^[a-zA-Z\u0600-\u06FF\s]+$");
                        if (!nameRegExp.hasMatch(value.trim())) {
                          return "Enter letters only";
                        }
                        return null;
                      },
                      decoration: _buildInputDecoration(
                        labelText: "First Name",
                      ),
                    ),

                    const SizedBox(height: 12),

                    // Last Name (Letters & spaces only)
                    TextFormField(
                      controller: lastNameController,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.black87,
                      ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return "Last Name is required";
                        }
                        final nameRegExp = RegExp(r"^[a-zA-Z\u0600-\u06FF\s]+$");
                        if (!nameRegExp.hasMatch(value.trim())) {
                          return "Enter letters only";
                        }
                        return null;
                      },
                      decoration: _buildInputDecoration(labelText: "Last Name"),
                    ),

                    const SizedBox(height: 12),

                    // Email (Valid Email pattern)
                    TextFormField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.black87,
                      ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return "Email is required";
                        }
                        final emailRegExp = RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
                        if (!emailRegExp.hasMatch(value.trim())) {
                          return "Enter a valid email address";
                        }
                        return null;
                      },
                      decoration: _buildInputDecoration(
                        labelText: "Email address",
                      ),
                    ),

                    const SizedBox(height: 12),

                    // Date of Birth
                    TextFormField(
                      readOnly: true,
                      controller: TextEditingController(
                        text: selectedDate == null
                            ? ""
                            : "${selectedDate!.day.toString().padLeft(2, '0')}/"
                                "${selectedDate!.month.toString().padLeft(2, '0')}/"
                                "${selectedDate!.year}",
                      ),
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.black87,
                      ),
                      validator: (value) {
                        if (selectedDate == null) {
                          return "Date of birth is required";
                        }
                        return null;
                      },
                      onTap: () async {
                        final date = await showDatePicker(
                          context: context,
                          initialDate: DateTime(1999),
                          firstDate: DateTime(1950),
                          lastDate: DateTime.now(),
                        );

                        if (date != null) {
                          setState(() {
                            selectedDate = date;
                          });
                        }
                      },
                      decoration: _buildInputDecoration(
                        labelText: "Date of Birth",
                        suffixIcon: const Icon(
                          Icons.calendar_month_outlined,
                          size: 18,
                          color: Colors.grey,
                        ),
                      ),
                    ),

                    const SizedBox(height: 12),

                    // Password (6-12 chars, at least one letter and one number)
                    TextFormField(
                      controller: passwordController,
                      obscureText: !isPasswordVisible,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.black87,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Password is required";
                        }
                        if (value.length < 6 || value.length > 12) {
                          return "Must be 6-12 characters";
                        }
                        final passwordRegExp = RegExp(r"^(?=.*[A-Za-z])(?=.*\d)");
                        if (!passwordRegExp.hasMatch(value)) {
                          return "Must contain at least one letter and one number";
                        }
                        return null;
                      },
                      decoration: _buildInputDecoration(
                        labelText: "Password",
                        suffixIcon: IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: () {
                            setState(() {
                              isPasswordVisible = !isPasswordVisible;
                            });
                          },
                          icon: Icon(
                            isPasswordVisible
                                ? Icons.visibility
                                : Icons.visibility_outlined,
                            size: 18,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 5),

                    const Divider(color: Color(0xffeeeeee)),

                    const SizedBox(height: 5),

                    // Checkbox + Text
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 20,
                          height: 20,
                          child: Checkbox(
                            value: isChecked,
                            activeColor: const Color(0xff6750A4),
                            side: const BorderSide(
                              color: Color(0xff6750A4),
                              width: 1.5,
                            ),
                            onChanged: (value) {
                              setState(() {
                                isChecked = value ?? false;
                              });
                            },
                          ),
                        ),
                        const SizedBox(width: 7),
                        const Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(top: 1),
                            child: Text(
                              "Yes, keep me informed via email about the latest trends\n"
                              "and special offers. (not mandatory)",
                              style: TextStyle(fontSize: 9, height: 1.35),
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 18),

                    // Sign In Button
                    SizedBox(
                      width: double.infinity,
                      height: 40,
                      child: ElevatedButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const MainScreen(),
                              ),
                              (route) => false,
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xff202020),
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: const Text(
                          "Sign In",
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ),
                    ),

                    const SizedBox(height: 300), // Terms
                    const Center(
                      child: Text.rich(
                        TextSpan(
                          text:
                              "By registering for an account, you agree to our ",
                          style: TextStyle(fontSize: 9, color: Colors.black),
                          children: [
                            TextSpan(
                              text: "terms of use.",
                              style: TextStyle(color: Color(0xff6750A4)),
                            ),
                            TextSpan(text: " Please read our "),
                            TextSpan(
                              text: "privacy statement.",
                              style: TextStyle(color: Color(0xff6750A4)),
                            ),
                          ],
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
