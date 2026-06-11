import 'package:flutter/material.dart';
import 'package:lms/presentation/widgets/common_custom_app_bar_widget.dart';
import 'package:lms/presentation/widgets/common_custome_button_widget.dart';
import 'package:lms/presentation/widgets/common_text_form_widget_field.dart';
import 'package:lms/presentation/widgets/reusablebackground/reusablebackground.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController shortAnswerController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Reusablebackground(
      child: LayoutBuilder(
        builder: (context, constraints) {
          final bool _isTablet = constraints.maxWidth > 600;
          return SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: _isTablet ? 80 : 66),
                  CommonCustomAppBarWidget(
                    isTablet: _isTablet,
                    showBackButton: true,
                    title: "Edit Profile",
                    onBackButtonPressed: () {
                      Navigator.pop(context);
                    },
                    onShareButtonPressed: () {
                      print('share');
                    },
                    showShareButton: false,
                  ),
                  SizedBox(height: _isTablet ? 35 : 30),
                  CommonTextFormField(
                    isTablet: _isTablet,
                    hintText: "Enter your full name",
                    controller: userNameController,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "enter user name";
                      }

                      return null;
                    },
                  ),
                  SizedBox(height: _isTablet ? 22 : 18),
                  CommonTextFormField(
                    isTablet: _isTablet,
                    hintText: "Email Address",
                    controller: emailController,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "enter email address";
                      } else if (!RegExp(
                        r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$',
                      ).hasMatch(value)) {
                        return "enter a valid email address";
                      }

                      return null;
                    },
                  ),

                  SizedBox(height: _isTablet ? 22 : 18),
                  CommonTextFormField(
                    isTablet: _isTablet,
                    hintText: "A short sentence about yourself...",
                    controller: shortAnswerController,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "enter a short answer";
                      }

                      return null;
                    },
                  ),
                  SizedBox(height: _isTablet ? 22 : 18),
                  CommonTextFormField(
                    isTablet: _isTablet,
                    hintText: "Mobile Number",
                    controller: phoneNumberController,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "enter mobile number";
                      }

                      return null;
                    },
                  ),
                  SizedBox(height: _isTablet ? 28 : 24),

                  CommonCustomeButtonWidget(
                    isTablet: _isTablet,
                    text: "Save Changes",
                    onTap: () async {
                      print('login');
                      if (_formKey.currentState!.validate()) {
                        print('login');
                        // await authProvider.loginProvider(
                        //   userNameController.text.trim(),
                        //   passwordController.text.trim(),
                        // );

                        /// ✅ SUCCESS
                        // if (authProvider.success != null) {
                        //   ScaffoldMessenger.of(context).showSnackBar(
                        //     SnackBar(
                        //       content: Text(authProvider.success!.message),
                        //       backgroundColor: Colors.green,
                        //     ),
                        //   );

                        //   Navigator.pushReplacementNamed(
                        //     context,
                        //     '/custombottomnavbarwidget',
                        //   );
                        // }

                        /// ❌ FAILURE
                        // if (authProvider.failure != null) {
                        //   ScaffoldMessenger.of(context).showSnackBar(
                        //     SnackBar(
                        //       content: Text(
                        //         authProvider.failure!.message ?? '',
                        //       ),
                        //       backgroundColor: Colors.red,
                        //     ),
                        //   );
                        // }
                      }
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
