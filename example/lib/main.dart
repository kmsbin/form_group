import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_group/form_group.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}
class MyHomePage extends StatelessWidget {
  final FormGroupController formGroupController = FormGroupController();
  final GlobalKey<FormState> key = GlobalKey<FormState>(); 

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              child: Center(
                child: FormGroup(
                  formGroupController: formGroupController,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // FormFieldGroup(),
                      FormFieldGroup(fieldName: "nome"),
                      FormFieldGroup(fieldName: "senha"),
                      FormFieldGroup(
                        fieldName: "idade", 
                        keyboardType: TextInputType.number,
                        adapter: FormIntAdapter(),
                        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      ),
                      Container(
                        child: ElevatedButton(
                          onPressed: () {
                            // print(formGroupController.submit);
                            print(formGroupController.submitAsJson);
                          },
                          child: Text("send"),
                        ),
                      ),
                      Container(
                        child: ElevatedButton(
                          onPressed: () {
                            formGroupController.clearAll();
                          },
                          child: Text("clear"),
                        ),
                      ),
                    ],
                  ),
                )
              ),
            ),
          ),
        ),
      ),
    );
  }
}
