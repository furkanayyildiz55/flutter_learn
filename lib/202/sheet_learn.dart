import 'package:flutter/material.dart';

class SheetLearn extends StatefulWidget {
  const SheetLearn({super.key});

  @override
  State<SheetLearn> createState() => _SheetLearnState();
}

class _SheetLearnState extends State<SheetLearn> with ProductSheetMixin {
  final Color _backgrounColor = Colors.white;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backgrounColor,
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result =
              await showCustomSheet(context, const Center(child: Text("Test")));
          if (result is bool) {}
          //inspect(result);
        },
        child: const Icon(Icons.share),
      ),
    );
  }
}

mixin ProductSheetMixin {
  Future<T?> showCustomSheet<T>(BuildContext context, Widget child) async {
    return showModalBottomSheet<T>(
      //açılan modal ekranının arka plan rengini değiştirir
      backgroundColor: Colors.white,
      //Modalın arkasındaki ekranın rengini değiştirir veya transparan kalır.
      //barrierColor: Colors.black,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      //Ekranın tamamına yayılmasını sağlar, childdaki sınırladnırma ile bu azaltıalabilir
      //isScrollControlled: true,
      context: context,
      builder: (context) {
        return _CustomMainSheet(
          child: child,
        );
      },
    );
  }
}

class _CustomMainSheet extends StatelessWidget {
  const _CustomMainSheet({required this.child});

  final Widget child;
  final Color _backgrounColor = Colors.transparent;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: _backgrounColor,
      //Sized box ile ekranın yüzde 70 ini kaplaması sağlandı
      height: MediaQuery.of(context).size.height * 0.7,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Column(
            children: [
              SizedBox(
                height: 40,
                child: Stack(
                  children: [
                    Divider(
                      color: Colors.black26,
                      thickness: 3,
                      indent: MediaQuery.of(context).size.width * 0.45,
                      endIndent: MediaQuery.of(context).size.width * 0.45,
                    ),
                    Positioned(
                      top: 0,
                      right: 10,
                      child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(Icons.close),
                        ),
                      ),
                    ),
                    Expanded(child: child)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
