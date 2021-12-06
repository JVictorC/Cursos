import 'package:auth_firebase/components/app_bar_widget.dart';
import 'package:auth_firebase/components/app_drawer.dart';
import 'package:auth_firebase/components/body_home_page.dart';
import 'package:auth_firebase/components/coins_prices.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: Text('Home Page', style: GoogleFonts.montserrat(),),
        widgets: [
          ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.add),
            label: Text('Add Nova Trans...', style: GoogleFonts.montserrat(),),
            
          )
        ],
      ),
      body: Column(
        children: const [
          CoinsPrices(),
          SizedBox(height: 15),
          BodyHomePage(),
        ],
      ),
      drawer: const AppDrawer(),
    );
  }
}
