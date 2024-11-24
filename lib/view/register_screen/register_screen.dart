import 'package:flutter/material.dart';
import 'package:sample_news_app/controller/login_screen_controller.dart';
import 'package:sample_news_app/utils/color_constants.dart';
import 'package:sample_news_app/utils/image_constants.dart';
import 'package:sample_news_app/view/login_screen/login_screen.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController conPassController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool premiumValue = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) async {
        await LoginScreencontroller.initsharedPref();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.BackgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 60),
              Text(
                "Welcome To",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: ColorConstants.TextColor),
              ),
              SizedBox(height: 30),
              Container(
                height: 150,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(ImageConstants.mainLogo),
                        fit: BoxFit.cover)),
              ),
              SizedBox(height: 10),
              Text(
                "NEWS WORLD",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: ColorConstants.TextColor),
              ),
              SizedBox(height: 20),
              // Email Field
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  fillColor: ColorConstants.TextColor,
                  filled: true,
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  hintText: "Your Email Address",
                  hintStyle: TextStyle(
                      color: Colors.grey.shade500,
                      fontSize: 16,
                      fontWeight: FontWeight.normal),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.grey.shade400,
                      )),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Color(0xff1a75d2),
                      )),
                  errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.red.shade400,
                      )),
                  focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.red.shade400,
                      )),
                  disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.grey.shade400,
                      )),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.grey.shade400,
                      )),
                ),
                validator: (value) {
                  String pattern =
                      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
                  if (value != null && RegExp(pattern).hasMatch(value)) {
                    return null;
                  } else {
                    return "Enter a valid email";
                  }
                },
              ),
              SizedBox(height: 10),
              // Password Field
              TextFormField(
                controller: passController,
                decoration: InputDecoration(
                    fillColor: ColorConstants.TextColor,
                    filled: true,
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    hintText: "Your Password",
                    hintStyle: TextStyle(
                        color: Colors.grey.shade500,
                        fontSize: 16,
                        fontWeight: FontWeight.normal),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.grey.shade400,
                        )),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Color(0xff1a75d2),
                        )),
                    errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.red.shade400,
                        )),
                    suffixIcon: Icon(
                      Icons.visibility_off_rounded,
                      color: Colors.grey,
                    )),
                validator: (value) {
                  if (value != null && value.length < 6) {
                    return "Password must contain at least 6 characters";
                  } else {
                    return null;
                  }
                },
              ),
              SizedBox(height: 10),
              // Confirm Password Field
              TextFormField(
                controller: conPassController,
                decoration: InputDecoration(
                    fillColor: ColorConstants.TextColor,
                    filled: true,
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    hintText: "Confirm Your Password",
                    hintStyle: TextStyle(
                        color: Colors.grey.shade500,
                        fontSize: 16,
                        fontWeight: FontWeight.normal),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.grey.shade400,
                        )),
                    focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.red.shade400,
                        )),
                    suffixIcon: Icon(
                      Icons.visibility_off_rounded,
                      color: Colors.grey,
                    )),
                validator: (value) {
                  if (value != null && value.isEmpty) {
                    return "Enter a valid password";
                  } else if (conPassController.text == passController.text) {
                    return null;
                  } else {
                    return "Password didn't match";
                  }
                },
              ),
              SizedBox(height: 40),
              InkWell(
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    LoginScreencontroller.addData(emailController.text,
                        passController.text, premiumValue);
                    // Navigate to LoginScreen and pass the premiumValue
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginScreen(user: premiumValue),
                      ),
                    );
                  } else {
                    print("registration failed");
                  }
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Color(0xff1a75d2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: upgradeToPremium,
                child: Text("Upgrade to Premium"),
                style: ElevatedButton.styleFrom(
                    backgroundColor: ColorConstants.WarningColor),
              ),
              SizedBox(height: 20),
              Text(
                premiumValue ? "Premium: Active" : "Premium: Not Active",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: premiumValue ? Colors.green : Colors.red,
                ),
                textAlign: TextAlign.center,
              ),
              Spacer(),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Already have an account?",
                    style: TextStyle(
                      color: ColorConstants.TextColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Sign In",
                      style: TextStyle(
                        color: Color(0xff1a75d2),
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void upgradeToPremium() async {
    bool isUpgradeSuccessful = await Future.delayed(
      Duration(seconds: 2),
      () => true,
    );

    setState(() {
      premiumValue = isUpgradeSuccessful;
    });

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title:
            Text(isUpgradeSuccessful ? "Upgrade Successful" : "Upgrade Failed"),
        content: Text(
          isUpgradeSuccessful
              ? "You are now a Premium User!"
              : "There was an issue upgrading to Premium. Please try again.",
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("OK"),
          ),
        ],
      ),
    );
  }
}
