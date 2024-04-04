import 'package:flutter/material.dart';

class FormLearnView extends StatefulWidget {
  const FormLearnView({super.key});

  @override
  State<FormLearnView> createState() => _FormLearnViewState();
}

class _FormLearnViewState extends State<FormLearnView> {
  final GlobalKey<FormState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: _key,
        onChanged: () {},
        autovalidateMode: AutovalidateMode.always,
        child: Column(
          children: [
            TextFormField(validator: FormFieldValidator().isNotEmpty),
            DropdownButtonFormField<String>(
              value: "a",
              validator: FormFieldValidator().isNotEmpty,
              items: const [
                DropdownMenuItem(
                  value: "a",
                  child: Text("a"),
                ),
                DropdownMenuItem(
                  value: "a",
                  child: Text("b"),
                ),
                DropdownMenuItem(
                  value: "a",
                  child: Text("b"),
                ),
              ],
              onChanged: (value) {},
            ),
            ElevatedButton(
              onPressed: () {
                if (_key.currentState?.validate() ?? false) {
                  print("Okey");
                }
              },
              child: const Text("Save"),
            ),
          ],
        ),
      ),
    );
  }
}

class FormFieldValidator {
  String? isNotEmpty(String? data) {
    return (data?.isNotEmpty ?? false) ? null : ValidatorMessage.isEmpty;
  }
}

class ValidatorMessage {
  static const isEmpty = "Bu alan boş geçilemez";
}
