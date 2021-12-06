import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './providers//business_contacts.dart';
import './screens/business_cards_list_screen.dart';

void main() {
  // runApp is provided by flutter team.
  // we are instiating MyApp class.
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // build method is responsible to run widight.
  // here we are overiding teh build method with our own implementation.
  // @override is the stylystic sugercoating
  @override
  Widget build(BuildContext context) {
    // this does based setup by combining widgets into the App widget
    // it takes named arguments.
    // Note: Text is a class not function.
    // here "HEllo is the value that has been passed through the Text constructor.
    // named ar
    // home is the named argument
    // note: every widgit is a dart class.
    //scaffold gives base page design.
    return ChangeNotifierProvider.value(
      value:BusinessContacts(),
      child:   MaterialApp(
        title: "Business Cards",
        theme: ThemeData(colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.indigo,
        ).copyWith(secondary: Colors.amber,
        ),
         ),
        home: BusinessCardListScreen(),
    
         ),
   
    );
    
  
  }
}
