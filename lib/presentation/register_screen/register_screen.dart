import 'package:flutter/material.dart';
import 'package:peter_s_application1/core/app_export.dart';
import 'package:peter_s_application1/widgets/custom_checkbox_button.dart';
import 'package:peter_s_application1/widgets/custom_elevated_button.dart';
import 'package:peter_s_application1/widgets/custom_text_form_field.dart';
import 'package:http/http.dart' as http;

class RegisterScreen extends StatefulWidget {
  RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isCheckbox = false;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Future<void> registerUser() async {
    final response = await http.post(
      Uri.parse('https://dummyjson.com/users/add'),
      body: {
        'username': nameController.text,
        'email': emailController.text,
        'password': passwordController.text,
      },
    );

    if (response.statusCode == 200) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Registration Successful'),
            content: Text('You can now login with your credentials'),
            actions: [
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.pushReplacementNamed(context, '/login');
                },
              ),
            ],
          );
        },
      );
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Registration Failed'),
            content: Text('Something went wrong'),
            actions: [
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
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
                    top: 24,
                  ),
                  child: Text(
                    "Create new account",
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: theme.textTheme.titleLarge,
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
                        "Username",
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: CustomTextStyles.bodyMediumBluegray400,
                      ),
                      CustomTextFormField(
                        controller: nameController,
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
                        "Email",
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: CustomTextStyles.bodyMediumBluegray400,
                      ),
                      CustomTextFormField(
                        controller: emailController,
                        margin: getMargin(
                          top: 7,
                        ),
                        contentPadding: getPadding(
                          left: 8,
                          top: 13,
                          bottom: 13,
                        ),
                        textStyle: theme.textTheme.bodyMedium!,
                        hintText: "ahmed0saber33@gmail.com",
                        hintStyle: theme.textTheme.bodyMedium!,
                        textInputAction: TextInputAction.next,
                        textInputType: TextInputType.emailAddress,
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
                    children:
                    [
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
                          114,
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
                                "Have a problem?",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: theme.textTheme.titleSmall,
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: SizedBox(
                                width: getHorizontalSize(
                                  114,
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
                  text: "Register",
                  margin: getMargin(
                    left: 24,
                    top: 20,
                    right: 24,
                  ),
                  buttonStyle: CustomButtonStyles.fillPrimary.copyWith(
                      fixedSize: MaterialStateProperty.all<Size>(Size(
                    double.maxFinite,
                    getVerticalSize(
                      44,
                    ),
                  ))),
                  buttonTextStyle: CustomTextStyles.titleSmallOnPrimary,
                  onTap: registerUser,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: getPadding(
                      left: 24,
                      top: 23,
                      bottom: 5,
                    ),
                    child: Row(
                      children: [
                        Text(
                          "Already have an account?",
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: theme.textTheme.bodyMedium,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacementNamed(context, '/login');
                          },
                          child: Container(
                            height: getVerticalSize(
                              17,
                            ),
                            width: getHorizontalSize(
                              42,
                            ),
                            margin: getMargin(
                              left: 6,
                            ),
                            child: Stack(
                              alignment: Alignment.bottomCenter,
                              children: [
                                Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "Log in ",
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: theme.textTheme.titleSmall,
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child: SizedBox(
                                    width: getHorizontalSize(
                                      42,
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







// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
//
// class RegisterScreen extends StatefulWidget {
//   RegisterScreen({Key? key}) : super(key: key);
//
//   @override
//   _RegisterScreenState createState() => _RegisterScreenState();
// }
//
// class _RegisterScreenState extends State<RegisterScreen> {
//   TextEditingController nameController = TextEditingController();
//   TextEditingController emailController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();
//   bool isCheckbox = false;
//   GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//
//   Future<void> registerUser() async {
//     final response = await http.post(
//       Uri.parse('https://dummyjson.com/users/add'),
//       body: {
//         'username': nameController.text,
//         'email': emailController.text,
//         'password': passwordController.text,
//       },
//     );
//
//     if (response.statusCode == 200) {
//       showDialog(
//         context: context,
//         builder: (BuildContext context) {
//           return AlertDialog(
//             title: Text('Registration Successful'),
//             content: Text('You can now login with your credentials'),
//             actions: [
//               TextButton(
//                 child: Text('OK'),
//                 onPressed: () {
//                   Navigator.of(context).pop();
//                   Navigator.pushReplacementNamed(context, '/login');
//                 },
//               ),
//             ],
//           );
//         },
//       );
//     } else {
//       showDialog(
//         context: context,
//         builder: (BuildContext context) {
//           return AlertDialog(
//             title: Text('Registration Failed'),
//             content: Text('Something went wrong'),
//             actions: [
//               TextButton(
//                 child: Text('OK'),
//                 onPressed: () {
//                   Navigator.of(context).pop();
//                 },
//               ),
//             ],
//           );
//         },
//       );
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: Colors.white,
//         resizeToAvoidBottomInset: false,
//         body: Form(
//           key: _formKey,
//           child: SingleChildScrollView(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 SizedBox(
//                   height: 248,
//                   width: double.infinity,
//                   child: Stack(
//                     alignment: Alignment.bottomCenter,
//                     children: [
//                       Align(
//                         alignment: Alignment.topCenter,
//                         child: SizedBox(
//                           height: 199,
//                           width: double.infinity,
//                           child: Stack(
//                             alignment: Alignment.center,
//                             children: [
//                               Container(
//                                 height: 199,
//                                 width: double.infinity,
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(10),
//                                   image: DecorationImage(
//                                     image: AssetImage(
//                                         'assets/images/rectangle1135.jpg'),
//                                     fit: BoxFit.cover,
//                                   ),
//                                 ),
//                               ),
//                               Container(
//                                 height: 199,
//                                 width: double.infinity,
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(10),
//                                   image: DecorationImage(
//                                     image: AssetImage(
//                                         'assets/images/graphics.jpg'),
//                                     fit: BoxFit.cover,
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                       Container(
//                         height: 116,
//                         width: 116,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(8),
//                           image: DecorationImage(
//                             image:
//                                 AssetImage('assets/images/rectangle1136.jpg'),
//                             fit: BoxFit.cover,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.only(top: 24),
//                   child: Text(
//                     "Create new account",
//                     overflow: TextOverflow.ellipsis,
//                     textAlign: TextAlign.left,
//                     style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//                   ),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.fromLTRB(24, 22, 24, 0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         "Username",
//                         overflow: TextOverflow.ellipsis,
//                         textAlign: TextAlign.left,
//                         style: TextStyle(
//                             fontSize: 16, color: Colors.blueGrey[400]),
//                       ),
//                       TextFormField(
//                         controller: nameController,
//                         decoration: InputDecoration(
//                           contentPadding: EdgeInsets.fromLTRB(8, 13, 8, 13),
//                           hintText: "ahmed0saber",
//                           hintStyle: TextStyle(fontSize: 16),
//                           suffixIcon: Container(
//                             margin: EdgeInsets.fromLTRB(30, 14, 8, 14),
//                             child: Image.asset('assets/images/close.png'),
//                           ),
//                         ),
//                         style: TextStyle(fontSize: 16),
//                         textInputAction: TextInputAction.next,
//                       ),
//                     ],
//                   ),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.fromLTRB(24, 22, 24, 0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         "Email",
//                         overflow: TextOverflow.ellipsis,
//                         textAlign: TextAlign.left,
//                         style: TextStyle(
//                             fontSize: 16, color: Colors.blueGrey[400]),
//                       ),
//                       TextFormField(
//                         controller: emailController,
//                         decoration: InputDecoration(
//                           contentPadding: EdgeInsets.fromLTRB(8, 13, 8, 13),
//                           hintText: "ahmed0saber33@gmail.com",
//                           hintStyle: TextStyle(fontSize: 16),
//                           suffixIcon: Container(
//                             margin: EdgeInsets.fromLTRB(30, 14, 8, 14),
//                             child: Image.asset('assets/images/close.png'),
//                           ),
//                         ),
//                         style: TextStyle(fontSize: 16),
//                         textInputAction: TextInputAction.next,
//                         keyboardType: TextInputType.emailAddress,
//                       ),
//                     ],
//                   ),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.fromLTRB(24, 22, 24, 0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         "Password",
//                         overflow: TextOverflow.ellipsis,
//                         textAlign: TextAlign.left,
//                         style: TextStyle(
//                             fontSize: 16, color: Colors.blueGrey[400]),
//                       ),
//                       TextFormField(
//                         controller: passwordController,
//                         decoration: InputDecoration(
//                           contentPadding: EdgeInsets.fromLTRB(8, 12, 8, 12),
//                           hintText: "••••••••",
//                           hintStyle: TextStyle(fontSize: 20),
//                           suffixIcon: Container(
//                             margin: EdgeInsets.fromLTRB(30, 14, 8, 14),
//                             child: Image.asset('assets/images/checkmark.png'),
//                           ),
//                         ),
//                         style: TextStyle(fontSize: 20),
//                         textInputAction: TextInputAction.done,
//                         keyboardType: TextInputType.visiblePassword,
//                         obscureText: true,
//                       ),
//                     ],
//                   ),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.fromLTRB(24, 22, 24, 0),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Row(
//                         children: [
//                           Checkbox(
//                             value: isCheckbox,
//                             onChanged: (value) {
//                               setState(() {
//                                 isCheckbox = value!;
//                               });
//                             },
//                           ),
//                           Text(
//                             "Remember me",
//                             overflow: TextOverflow.ellipsis,
//                             textAlign: TextAlign.left,
//                             style: TextStyle(fontSize: 16),
//                           ),
//                         ],
//                       ),
//                       Container(
//                         height: 17,
//                         width: 114,
//                         child: Stack(
//                           alignment: Alignment.bottomCenter,
//                           children: [
//                             Align(
//                               alignment: Alignment.center,
//                               child: Text(
//                                 "Have a problem?",
//                                 overflow: TextOverflow.ellipsis,
//                                 textAlign: TextAlign.left,
//                                 style: TextStyle(fontSize: 16),
//                               ),
//                             ),
//                             Align(
//                               alignment: Alignment.bottomCenter,
//                               child: Divider(
//                                 height: 1,
//                                 thickness: 1,
//                                 color: Colors.blue[200],
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 ElevatedButton(
//                   onPressed: registerUser,
//                   child: Text("Register"),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.only(left: 24, top: 23, bottom: 5),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text(
//                         "Already have an account? ",
//                         style: TextStyle(fontSize: 16),
//                       ),
//                       GestureDetector(
//                         onTap: () {
//                           Navigator.pushReplacementNamed(context, '/login');
//                         },
//                         child: Text(
//                           "Log in",
//                           style: TextStyle(
//                               fontSize: 16, fontWeight: FontWeight.bold),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
