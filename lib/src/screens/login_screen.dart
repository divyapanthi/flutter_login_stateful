import 'package:flutter/material.dart';
import 'package:login_stateful/src/api/auth_api.dart';
import 'package:login_stateful/src/mixin/validation_mixin.dart';
import 'package:login_stateful/src/screens/second_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with ValidationMixin {
  final formkey = GlobalKey<FormState>();
  String? email;
  String? password;
  String? gender;
  bool isLoading = false;


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.deepPurple,
        primarySwatch: Colors.deepPurple,
      ),
      home: Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Signup Form",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 32,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 16,),
            Card(
              margin: EdgeInsets.symmetric(horizontal: 24),
              child: Container(
                padding: EdgeInsets.all(16),
                child: Form(
                  key: formkey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children:[
                      buildEmailField(),
                      buildPasswordField(),
                      SizedBox(height: 16,),
                      buildGenderField(),
                      SizedBox(height: 16,),
                      buildSubmitButton(),
                    ]
                  ),
                ),
              ),
            ),
          ],
        ),
      )
    ),
   );
 }

  Widget buildEmailField() {
    return TextFormField(
      onSaved: (String? val){
        email = val;
      },
      keyboardType: TextInputType.emailAddress,
      validator:  validEmail,
      decoration: InputDecoration(
        labelText: "Your Email",
        hintText: "email@example.com",
        border: OutlineInputBorder(
        )
      ),
    );
  }

  Widget buildPasswordField() {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: TextFormField(
        onSaved: (String? val){
          password = val;
        },
        validator: validPassword,
        obscureText: true,
        decoration: InputDecoration(
            labelText: "Your Password",
            hintText: "********",
            border: OutlineInputBorder(
            )
        ),
      ),
    );
  }

  Widget buildGenderField() {
    return DropdownButtonFormField(
      onChanged: (String? val){},
      onSaved: (String? val){
        gender = val;
      },
      validator: validGender,
      items: [
        DropdownMenuItem(child: Text("Male"), value: "Male",),
        DropdownMenuItem(child: Text("Female"), value: "Female",),
        DropdownMenuItem(child: Text("Other"), value: "Other",),
        DropdownMenuItem(child: Text("Rather Not Say"), value: "Rather Not Say",),
      ],
      decoration: InputDecoration(
        hintText: "Your Gender",
        labelText: "Select your Gender",
        border: OutlineInputBorder(

        )
      ),
    );
  }

  Widget buildSubmitButton() {
    // return RaisedButton(
    //     onPressed: (){},
    //   child: Text("Submit"),
    //   color: Colors.blue,
    //   textColor: Colors.white,
    // );

    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
          onPressed: isLoading ? null: (){
            // formkey.currentState.reset();
            onSubmitButtonClick();
          },
          child: isLoading? CircularProgressIndicator() : Text("Submit"),
          // style: ButtonStyle(
          //   padding: MaterialStateProperty.all(EdgeInsets.all(16),),
          //   backgroundColor: MaterialStateProperty.all(Colors.green),
          // ),
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.all(16),
          ),
      ),
    );

  }

  Future<void> onSubmitButtonClick() async {
    bool validInput = formkey.currentState!.validate();
    if (validInput) {
      print("Email $email password $password and gender $gender");
      formkey.currentState!.save();
      print("Email $email password $password and gender $gender");

      /// todo submit the data.

      setState(() {
        isLoading = true;
      });
      var response = await authApi.signup(email!, password!, gender!);
      setState(() {
        isLoading = false;
      });

      if (response == null) {
        ScaffoldMessengerState message = ScaffoldMessenger.of(context);
        message.showSnackBar(
          SnackBar(content: Text("Sign up failed")),
        );
      }
      else {
        // todo navigate to the other page
        var data = await Navigator.of(context).push(
            MaterialPageRoute(
                builder: (BuildContext context) {
                  return SecondScreen(email:email!);
                }
            )
        );
        print("Data from second screen $data");
      }
    }
  }


}


