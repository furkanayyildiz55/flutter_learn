import 'package:url_launcher/url_launcher.dart';

mixin LaunchMixin {
  Future<void> launchURL(Uri Url) async {
    if (await canLaunchUrl(Url)) {
      if (!await launchUrl(Url)) {
        throw Exception('Could not launch $Url');
      }
    }
  }
}


//Mixinler construtoru olmayan sınıflardır

//mixin LaunchMixin on State<StatefulWidget> şeklindeki kullanımlarad 
//bu mixin'in sadece on idafesinden sonra gelene özellikteki veri yapsının(class, state vs) kullanabileceğini gösterir