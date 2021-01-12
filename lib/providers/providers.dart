import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import '../providers/AdmobAds.dart';

class Providers {
  static List<SingleChildWidget> providers() => [
        ChangeNotifierProvider<AdmobAds>(
          create: (_) => AdmobAds(),
        ),
      ];
}
