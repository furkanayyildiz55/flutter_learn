import 'dart:async';

import 'package:flutter/material.dart';

class IndicatorLearn extends StatefulWidget {
  const IndicatorLearn({super.key});

  @override
  State<IndicatorLearn> createState() => _IndicatorLearnState();
}

class _IndicatorLearnState extends State<IndicatorLearn> {
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  int status = 10;
  void startTimer() {
    Timer.periodic(const Duration(milliseconds: 90), (Timer timer) {
      setState(() {
        status++;
        print(status.toString());
        if (status == 100) {
          timer.cancel();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        const CenterProgressIndicator(),
        const ConstProgressIndicator(),
        //LinearProgressIndicator(),
        DownloadProress(
          status: status,
        )
      ]),
    );
  }
}

//! Progres indicator tema özelliklerini ana temadan almaktadır.
class CenterProgressIndicator extends StatelessWidget {
  const CenterProgressIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }
}

//! Sabit bir indicator için
class ConstProgressIndicator extends StatelessWidget {
  const ConstProgressIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: CircularProgressIndicator(
      value: 0.95,
      backgroundColor: Colors.red,
    ));
  }
}

//! Düz şekilde yüklenme efekti için

class DownloadProress extends StatefulWidget {
  final int status;
  const DownloadProress({
    super.key,
    required this.status,
  });

  @override
  State<DownloadProress> createState() => _DownloadProressState();
}

class _DownloadProressState extends State<DownloadProress> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: (MediaQuery.of(context).size.width / 100) * widget.status,
          child: const LinearProgressIndicator(
            value: 1,
          ),
        ),
        SizedBox(
          width:
              (MediaQuery.of(context).size.width / 100) * (100 - widget.status),
          child: const LinearProgressIndicator(),
        ),
      ],
    );
  }
}
