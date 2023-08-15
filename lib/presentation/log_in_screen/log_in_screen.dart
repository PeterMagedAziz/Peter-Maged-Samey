import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:peter_s_application1/core/app_export.dart';
import 'package:peter_s_application1/presentation/profile_screen/profile_screen.dart';
import 'package:peter_s_application1/widgets/custom_checkbox_button.dart';
import 'package:peter_s_application1/widgets/custom_elevated_button.dart';
import 'package:peter_s_application1/widgets/custom_text_form_field.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../register_screen/register_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isLoading = false;
  bool rememberMe = false;

  Future<void> login() async {
    setState(() {
      isLoading = true;
    });

    final response = await http.post(
      Uri.parse('https://dummyjson.com/auth/login'),
      body: {
        'username': usernameController.text,
        'password': passwordController.text,
      },
    );

    if (response.statusCode == 200) {
      final userData = jsonDecode(response.body);
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('image', userData['image']);
      await prefs.setString('username', userData['username']);
      await prefs.setString('email', userData['email']);
      await prefs.setString('gender', userData['gender']);

      if (rememberMe) {
        await prefs.setBool('rememberMe', true);
        await prefs.setString('savedUsername', usernameController.text);
        await prefs.setString('savedPassword', passwordController.text);
      } else {
        await prefs.setBool('rememberMe', false);
        await prefs.remove('savedUsername');
        await prefs.remove('savedPassword');
      }

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => ProfileScreen()),
      );
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Login Failed'),
          content: Text('Invalid username or password.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('OK'),
            ),
          ],
        ),
      );
    }

    setState(() {
      isLoading = false;
    });
  }

  // TextEditingController usernameController = TextEditingController();
  // TextEditingController passwordController = TextEditingController();
  // bool isLoading = false;
  // bool rememberMe = false;
  //
  //
  // Future<void> login() async {
  //   setState(() {
  //     isLoading = true;
  //   });
  //
  //   final response = await http.post(
  //     Uri.parse('https://dummyjson.com/auth/login'),
  //     body: {
  //       'username': usernameController.text,
  //       'password': passwordController.text,
  //     },
  //   );
  //
  //   if (response.statusCode == 200) {
  //     final userData = jsonDecode(response.body);
  //     final prefs = await SharedPreferences.getInstance();
  //     await prefs.setString('image', userData['image']);
  //     await prefs.setString('username', userData['username']);
  //     await prefs.setString('email', userData['email']);
  //     await prefs.setString('gender', userData['gender']);
  //
  //     if (rememberMe) {
  //       await prefs.setBool('rememberMe', true);
  //       await prefs.setString('savedUsername', usernameController.text);
  //       await prefs.setString('savedPassword', passwordController.text);
  //     } else {
  //       await prefs.setBool('rememberMe', false);
  //       await prefs.remove('savedUsername');
  //       await prefs.remove('savedPassword');
  //     }
  //
  //     Navigator.pushReplacement(
  //       context,
  //       MaterialPageRoute(builder: (context) => ProfileScreen()),
  //     );
  //   } else {
  //     showDialog(
  //       context: context,
  //       builder: (context) => AlertDialog(
  //         title: Text('Login Failed'),
  //         content: Text('Invalid username or password.'),
  //         actions: [
  //           TextButton(
  //             onPressed: () => Navigator.pop(context),
  //             child: Text('OK'),
  //           ),
  //         ],
  //       ),
  //     );
  //   }
  //
  //   setState(() {
  //     isLoading = false;
  //   });
  // }
  //
  // @override
  // void initState() {
  //   super.initState();
  //   loadSavedCredentials();
  // }
  //
  // Future<void> loadSavedCredentials() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   final rememberMeValue = prefs.getBool('rememberMe') ?? false;
  //
  //   setState(() {
  //     rememberMe = rememberMeValue;
  //     if (rememberMe) {
  //       usernameController.text = prefs.getString('savedUsername') ?? '';
  //       passwordController.text = prefs.getString('savedPassword') ?? '';
  //     }
  //   });
  // }

  // Future<void> login() async {
  //   setState(() {
  //     isLoading = true;
  //   });
  //
  //   final response = await http.post(
  //     Uri.parse('https://dummyjson.com/auth/login'),
  //     body: {
  //       'username': usernameController.text,
  //       'password': passwordController.text,
  //     },
  //   );
  //
  //   if (response.statusCode == 200) {
  //     final userData = jsonDecode(response.body);
  //     final prefs = await SharedPreferences.getInstance();
  //     await prefs.setString('image', userData['image']);
  //     await prefs.setString('username', userData['username']);
  //     await prefs.setString('email', userData['email']);
  //     await prefs.setString('gender', userData['gender']);
  //
  //     Navigator.pushReplacement(
  //       context,
  //       MaterialPageRoute(builder: (context) => ProfileScreen()),
  //     );
  //   } else {
  //     showDialog(
  //       context: context,
  //       builder: (context) => AlertDialog(
  //         title: Text('Login Failed'),
  //         content: Text('Invalid username or password.'),
  //         actions: [
  //           TextButton(
  //             onPressed: () => Navigator.pop(context),
  //             child: Text('OK'),
  //           ),
  //         ],
  //       ),
  //     );
  //   }
  //
  //   setState(() {
  //     isLoading = false;
  //   });
  // }


  bool isCheckbox = false;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: theme.colorScheme.onPrimary,
        resizeToAvoidBottomInset: false,
        body: Form(
          key: _formKey,
          child: SizedBox(
            width: double.maxFinite,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: getVerticalSize(
                    248,
                  ),
                  width: double.maxFinite,
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Align(
                        alignment: Alignment.topCenter,
                        child: SizedBox(
                          height: getVerticalSize(
                            199,
                          ),
                          width: double.maxFinite,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              CustomImageView(
                                imagePath: ImageConstant.imgRectangle1135,
                                height: getVerticalSize(
                                  199,
                                ),
                                width: getHorizontalSize(
                                  393,
                                ),
                                radius: BorderRadius.circular(
                                  getHorizontalSize(
                                    10,
                                  ),
                                ),
                                alignment: Alignment.center,
                              ),
                              CustomImageView(
                                imagePath: ImageConstant.imgGraphics,
                                height: getVerticalSize(
                                  199,
                                ),
                                width: getHorizontalSize(
                                  393,
                                ),
                                alignment: Alignment.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                      CustomImageView(
                        imagePath: ImageConstant.imgRectangle1136,
                        height: getSize(
                          116,
                        ),
                        width: getSize(
                          116,
                        ),
                        radius: BorderRadius.circular(
                          getHorizontalSize(
                            8,
                          ),
                        ),
                        alignment: Alignment.bottomCenter,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: getPadding(
                    top: 25,
                  ),
                  child: Text(
                    "Log in to your account",
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: theme.textTheme.titleLarge,
                  ),
                ),
                Padding(
                  padding: getPadding(
                    left: 24,
                    top: 20,
                    right: 24,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Username",
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: CustomTextStyles.bodyMediumBluegray400,
                      ),
                      CustomTextFormField(
                        controller: usernameController,
                        margin: getMargin(
                          top: 7,
                        ),
                        contentPadding: getPadding(
                          left: 8,
                          top: 13,
                          bottom: 13,
                        ),
                        textStyle: theme.textTheme.bodyMedium!,
                        hintText: "ahmed0saber",
                        hintStyle: theme.textTheme.bodyMedium!,
                        textInputAction: TextInputAction.next,
                        suffix: Container(
                          margin: getMargin(
                            left: 30,
                            top: 14,
                            right: 8,
                            bottom: 14,
                          ),
                          child: CustomImageView(
                            svgPath: ImageConstant.imgClose,
                          ),
                        ),
                        suffixConstraints: BoxConstraints(
                          maxHeight: getVerticalSize(
                            44,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: getPadding(
                    left: 24,
                    top: 22,
                    right: 24,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Password",
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: CustomTextStyles.bodyMediumBluegray400,
                      ),
                      CustomTextFormField(
                        controller: passwordController,
                        margin: getMargin(
                          top: 7,
                        ),
                        contentPadding: getPadding(
                          left: 8,
                          top: 12,
                          bottom: 12,
                        ),
                        textStyle: theme.textTheme.bodyLarge!,
                        hintText: "••••••••",
                        hintStyle: theme.textTheme.bodyLarge!,
                        textInputType: TextInputType.visiblePassword,
                        suffix: Container(
                          margin: getMargin(
                            left: 30,
                            top: 14,
                            right: 8,
                            bottom: 14,
                          ),
                          child: CustomImageView(
                            svgPath: ImageConstant.imgCheckmark,
                          ),
                        ),
                        suffixConstraints: BoxConstraints(
                          maxHeight: getVerticalSize(
                            44,
                          ),
                        ),
                        obscureText: true,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: getPadding(
                    left: 24,
                    top: 22,
                    right: 24,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomCheckboxButton(
                        text: "Remember me",
                        value: isCheckbox,
                        margin: getMargin(
                          bottom: 1,
                        ),
                        textStyle: theme.textTheme.titleSmall!,
                        onChange: (value) {
                          setState(() {
                            isCheckbox = value;
                          });
                        },
                      ),
                      Container(
                        height: getVerticalSize(
                          17,
                        ),
                        width: getHorizontalSize(
                          123,
                        ),
                        margin: getMargin(
                          top: 1,
                        ),
                        child: Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: Text(
                                "Forgot password?",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: theme.textTheme.titleSmall,
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: SizedBox(
                                width: getHorizontalSize(
                                  123,
                                ),
                                child: Divider(
                                  height: getVerticalSize(
                                    1,
                                  ),
                                  thickness: getVerticalSize(
                                    1,
                                  ),
                                  color: appTheme.blueA200,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                CustomElevatedButton(
                  text: "Log in",
                  margin: getMargin(
                    left: 24,
                    top: 20,
                    right: 24,
                  ),
                  onTap: isLoading ? null : login,
                    child: isLoading
                    ? CircularProgressIndicator()
                        : Text('Login'),
                  buttonStyle: CustomButtonStyles.fillPrimary.copyWith(
                      fixedSize: MaterialStateProperty.all<Size>(Size(
                    double.maxFinite,
                    getVerticalSize(
                      44,
                    ),
                  ))),
                  buttonTextStyle: CustomTextStyles.titleSmallOnPrimary,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: getPadding(
                      left: 24,
                      top: 22,
                      bottom: 5,
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: getPadding(
                            bottom: 1,
                          ),
                          child: Text(
                            "Don’t have an account?",
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: theme.textTheme.bodyMedium,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            // Navigate to the register screen
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RegisterScreen(),
                              ),
                            );
                          },
                          child: Container(
                            height: getVerticalSize(
                              17,
                            ),
                            width: getHorizontalSize(
                              58,
                            ),
                            margin: getMargin(
                              left: 6,
                              top: 1,
                            ),
                            child: Stack(
                              alignment: Alignment.bottomCenter,
                              children: [
                                Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "Register",
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: theme.textTheme.titleSmall,
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child: SizedBox(
                                    width: getHorizontalSize(
                                      58,
                                    ),
                                    child: Divider(
                                      height: getVerticalSize(
                                        1,
                                      ),
                                      thickness: getVerticalSize(
                                        1,
                                      ),
                                      color: appTheme.blueA200,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
