import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:peter_s_application1/core/app_export.dart';
import 'package:peter_s_application1/widgets/custom_elevated_button.dart';
import 'package:peter_s_application1/widgets/custom_text_form_field.dart';



class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? image;


  @override
  void initState() {
    super.initState();
    getUserInfo();
  }

  Future<void> getUserInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      image = prefs.getString('image');
      usernameController.text = prefs.getString('username') ?? '';
      emailController.text = prefs.getString('email') ?? '';
      genderController.text = prefs.getString('gender') ?? '';
    });
  }
  void logout(BuildContext? context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    Navigator.pushNamedAndRemoveUntil(
      context!,
      '/login', // Replace '/login' with the route name of your login screen
          (Route<dynamic> route) => false,
    );
  }
  // Future<void> logout() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   await prefs.clear();
  //   Navigator.pop(context);
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: theme.colorScheme.onPrimary,
        resizeToAvoidBottomInset: false,
        body: FutureBuilder<SharedPreferences>(
          future: SharedPreferences.getInstance(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final prefs = snapshot.data!;
              final image = prefs.getString('image') ?? '';
              final username = prefs.getString('username') ?? '';
              final email = prefs.getString('email') ?? '';
              final gender = prefs.getString('gender') ?? '';

              return Form(
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
                              url: image,
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
                          username,
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
                              controller: usernameController,
                              margin: getMargin(
                                top: 7,
                              ),
                              contentPadding: getPadding(
                                left: 8,
                                top: 13,
                                right: 8,
                                bottom: 13,
                              ),
                              textStyle: theme.textTheme.bodyMedium!,
                              hintText: "ahmed0saber",
                              hintStyle: theme.textTheme.bodyMedium!,
                              textInputAction: TextInputAction.next,
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
                              email,
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
                                right: 8,
                                bottom: 13,
                              ),
                              textStyle: theme.textTheme.bodyMedium!,
                              hintText: "ahmed0saber33@gmail.com",
                              hintStyle: theme.textTheme.bodyMedium!,
                              textInputAction: TextInputAction.next,
                              textInputType: TextInputType.emailAddress,
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
                              gender,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: CustomTextStyles.bodyMediumBluegray400,
                            ),
                            CustomTextFormField(
                              controller: genderController,
                              margin: getMargin(
                                top: 7,
                              ),
                              contentPadding: getPadding(
                                left: 8,
                                top: 13,
                                right: 8,
                                bottom: 13,
                              ),
                              textStyle: theme.textTheme.bodyMedium!,
                              hintText: "Male",
                              hintStyle: theme.textTheme.bodyMedium!,
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                          Navigator.pushReplacementNamed(context, '/login');
                          // Navigator.pushReplacementNamed(context, '/login');
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(builder: (context) => LoginScreen()),
                          // );
                        },
                        child: CustomElevatedButton(
                          text: "Log out",
                          margin: getMargin(
                            left: 24,
                            top: 22,
                            right: 24,
                            bottom: 5,
                          ),
                          buttonStyle: CustomButtonStyles.fillSecondaryContainer.copyWith(
                            fixedSize: MaterialStateProperty.all<Size>(
                              Size(
                                double.maxFinite,
                                getVerticalSize(
                                  44,
                                ),
                              ),
                            ),
                          ),
                          buttonTextStyle: CustomTextStyles.titleSmallOnPrimary,
                          onTap: () => logout(context),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            } else {
              return CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}
