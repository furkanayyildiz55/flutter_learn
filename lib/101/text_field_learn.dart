import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldLearn extends StatefulWidget {
  const TextFieldLearn({super.key});

  @override
  State<TextFieldLearn> createState() => _TextFieldLearnState();
}

class _TextFieldLearnState extends State<TextFieldLearn> {
  final key = GlobalKey();

  FocusNode focusNodeOne = FocusNode();
  FocusNode focusNoTwo = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            TextField(
              maxLength: 20,
              keyboardType: TextInputType.emailAddress,
              //Yazım yardımlarının ne olacağı hakkında klavyeye bilgi sağlar
              autofillHints: const [AutofillHints.email],
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.mail),
                border: OutlineInputBorder(),
                labelText: "Mail",
                labelStyle: TextStyle(fontSize: 25),
                //filled: true,
                //fillColor: Colors.white,
              ),
              buildCounter: (context,
                  {int? currentLength, bool? isFocused, maxLength}) {
                return _animatedContainer(context, currentLength);
              },
              //! Girilen veriyi kontrol ederek kullanıcı metinleri üzerinde kontrol sağlanabilir
              inputFormatters: [TextProjectInputFormatter()._formatter],
              //! true olduğu zaman sayfa direk textField üzerinden başlar.
              //autofocus: true,
              focusNode: focusNodeOne,
              //* newline özelliği ile focus nodelar arası geçiş sağlanabilir
              textInputAction: TextInputAction.newline,
            ),
            TextField(
              focusNode: focusNoTwo,
              minLines: 2,
              maxLines: 5,
            ),
          ],
        ),
      ),
    );
  }

  AnimatedContainer _animatedContainer(
      BuildContext context, int? currentLength) {
    return AnimatedContainer(
      key: key,
      duration: const Duration(seconds: 1),
      child: Container(
        height: 5,
        width: (MediaQuery.of(context).size.width / 20) * (currentLength ?? 0),
        color: Colors.blueAccent,
      ),
    );
  }
}

class TextProjectInputFormatter {
  final _formatter = TextInputFormatter.withFunction((oldValue, newValue) {
    print(newValue.text);
    if (newValue.text == "furkan") {
      return oldValue;
    }
    return newValue;
  });
}


//! TextDiel da focus özelliği ile bir sonraki alana klavyeden geçiş sağlanabilir bir özellik katılabilir
//! theme üzerinden InpuDecorationTheme vererek temalarını ortak ayarlayabiliyoruz