
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/body.dart';
import '../components/bottom_bar.dart';
import '../utils/constants.dart';
import 'package:form_field_validator/form_field_validator.dart';

class RegisterScreen extends StatelessWidget{
  final  _formKey = GlobalKey<FormState>();
    String name="", email="", password="", phone="";
  setName(String name){this.name=name;}
  setEmail(String email){this.email=email;}
  setPassword(String password){this.password=password;}
  setPhone(String phone){this.phone=phone;}


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
                SignUpForm(formKey: _formKey,nameSetter:setName, passwordSetter:setPassword,emailSetter: setEmail,phoneSetter: setPhone),
                const     SizedBox(height: kDefaultPadding),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(

                      onPressed: (){

                        if(_formKey.currentState?.validate()??true){

                          _formKey.currentState?.save();
                          print("It works="+name+"="+email);
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
  final Function nameSetter;
  final Function emailSetter;
  final Function passwordSetter;
  final Function phoneSetter;
  SignUpForm({required this.formKey, required this.nameSetter, required this.emailSetter, required this.passwordSetter, required this.phoneSetter});

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
              onSaved: (val)=>nameSetter(val),
            ),
            const SizedBox(height: kDefaultPadding,),
            TextFieldName(title:"Email"),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              validator: EmailValidator(errorText: 'Insert email'),
              onSaved: (val)=> emailSetter(val),
              decoration: InputDecoration(
                  hintText: "Test"
              ),
            ),
            const SizedBox(height: kDefaultPadding,),
            TextFieldName(title:"Phone"),
            TextFormField(
              onSaved: (val)=> phoneSetter(val),
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                  hintText: "555-555-555"
              ),
            ),
            const SizedBox(height: kDefaultPadding,),
            TextFieldName(title:"Password"),
            TextFormField(
              onSaved: (val)=> phoneSetter(val),
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