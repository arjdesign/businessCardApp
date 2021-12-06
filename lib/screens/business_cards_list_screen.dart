import 'package:flutter/material.dart';

import 'add_business_card_screen.dart';

class BusinessCardListScreen extends StatelessWidget {
  //const BusinessCardListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // add scaffold because want to return entire page
    return Scaffold(
        appBar: AppBar(
          title: const Text('My Contacts'),
          actions: <Widget>[
            IconButton(
              onPressed: () { Navigator.of(context).pushNamed(AddBusinessCard.routeName);},
              icon: const Icon(Icons.add),
            )
          ],
        ),
        body: const Center(
          child: CircularProgressIndicator(),
        ));
  }
}
