import 'package:flutter/material.dart';
import 'package:prueba_flutter_nasa/pages/home_page.dart';

final Map<String, Widget Function(BuildContext)> appRoutes = {
  'home': (_) => const HomePage()
};
