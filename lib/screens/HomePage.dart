import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Notes"),
      ),
      body: Center(
        child : Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            // margin: EdgeInsets.all(20),
            child:Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Form(
                  key: _formKey,
                    child: Column(
                      children: [
                        Image.network('https://play-lh.googleusercontent.com/WlHihFZpmBSIeeLhw66eynarQ7puIMk8WXkp1gmGJff09HDE8PK93c6hRnwcPDR0oD0',
                        width:200),
                        TextFormField(
                          decoration: InputDecoration(
                            label: Text("Email ID"),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty || !value.contains('@')) {
                              return 'Please enter valid Email';
                            }
                            return null;
                          },

                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            label: Text("Password"),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty || value.length<7) {
                              return 'Please enter valid Password';
                            }
                            return null;
                          },

                        )],

                    ),
                ),
                ElevatedButton(
                    onPressed: ()
                    {
                      _formKey.currentState!.validate();
                    if(!_formKey.currentState!.validate()){
                      return ;
                    }
                },
                    child: const Text("Submit"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}