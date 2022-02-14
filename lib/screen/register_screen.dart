
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/body.dart';
import '../components/bottom_bar.dart';
import '../utils/constants.dart';
import 'package:form_field_validator/form_field_validator.dart';

class RegisterScreen extends StatelessWidget{
  final  _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body:Stack(
           children: [
          Image.asset("assets/images/png/cup_red.png", height: 100,width: 100,),
          SafeArea(
          child:SingleChildScrollView(
             padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Create account", style: Theme.of(context).textTheme.headline4?.copyWith(fontWeight: FontWeight.bold),),
                 Row(
                   children: [
                     Text("Already have account?"),
                     TextButton(onPressed: (){}, child: Text("Sign in", style: TextStyle(fontWeight: FontWeight.bold),)),
                   ]

                   ,),
                SignUpForm(formKey: _formKey,),
                const     SizedBox(height: kDefaultPadding),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(

                      onPressed: (){

                        if(_formKey.currentState?.validate()??true){

                          _formKey.currentState?.save();
                          print("It works="+ _formKey.currentState?.);
                        }
                      },
                      child: Text("Sign up", )
                  ),
                ),
                  const     SizedBox(height: kDefaultPadding),
                ]
            ),
          ),
        ),
    ]
      ),

    );
  }

}

class SignUpForm extends StatelessWidget {
  final  formKey;
  String password="";
  SignUpForm({required this.formKey});

  late String _name, _email, _password, _phone;

  @override
  Widget build(BuildContext context) {
    return   Form(
      key: formKey,
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFieldName(title:"User name"),
            TextFormField(
              decoration: InputDecoration(  hintText: "Test", ),
              validator: RequiredValidator(errorText: 'Insert name'),
            ),
            const SizedBox(height: kDefaultPadding,),
            TextFieldName(title:"Email"),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              validator: EmailValidator(errorText: 'Insert email'),
              onSaved: (val)=> _name=val!,
              decoration: InputDecoration(
                  hintText: "Test"
              ),
            ),
            const SizedBox(height: kDefaultPadding,),
            TextFieldName(title:"Phone"),
            TextFormField(
              onSaved: (val)=> _phone=val!,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                  hintText: "555-555-555"
              ),
            ),
            const SizedBox(height: kDefaultPadding,),
            TextFieldName(title:"Password"),
            TextFormField(
              onSaved: (val)=> _password=val!,
              onChanged: (val) => password = val,
              obscureText: true,
              decoration: InputDecoration(
                  hintText: "*********"
              ),
              validator: MultiValidator(
                  [
                    RequiredValidator(errorText: 'No password'),
                    MinLengthValidator(8,errorText: "Min. 8 characters"),
                    PatternValidator(r'(?=.*?[#?!@$%^&*-])', errorText: 'passwords must have at least one special character')

                  ]),
            ),
            const SizedBox(height: kDefaultPadding,),
            TextFieldName(title:"Confirm password"),
            TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                  hintText: "*********"
              ),
              validator: (val) { MatchValidator(errorText: 'passwords do not match').validateMatch(val!, password);},

            ),
          ],
        )
    );
  }
}

class TextFieldName extends StatelessWidget{

  final String title;

  const TextFieldName({Key? key, required this.title}):super(key:key);

  @override
  Widget build(BuildContext context) {
  return  Padding(
      padding: EdgeInsets.only(bottom: kDefaultPadding/3),
      child: Text(title, style:TextStyle(fontWeight: FontWeight.bold, color: kTextColor.withOpacity(0.5))));

  }
}