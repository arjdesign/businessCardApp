import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/business_contacts.dart';
import '../widgets//image_input.dart';

class AddBusinessCard extends StatefulWidget {
  static const routeName = '/add-business-card';
  const AddBusinessCard({required Key key}) : super(key: key);

  @override
  _AddBusinessCardState createState() => _AddBusinessCardState();
}

class _AddBusinessCardState extends State<AddBusinessCard> {
  final _titleContoller = TextEditingController();
  late File _pickedImage;
  void _selectImage(File pickedImage){
    _pickedImage = pickedImage;
  }

  void _saveCard (){
    if(_titleContoller.text.isEmpty || _pickedImage == null) {
      return;
    }
    // we only want to dispatch so listen: false.
    Provider.of<BusinessContacts>(context, listen: false)
      .addCard(_titleContoller.text, _pickedImage);
    //leave this page
    Navigator.of(context).pop();
  }
  @override
  Widget build(BuildContext context) {
    // scaffold to havea  nice page look.
    return Scaffold(
        appBar: AppBar(
          title: const Text('Add a new card'),
        ),
        body: Column(
            // spacing on y-axis.
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // spacing in x-axis.
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              // when you put expanded, it takes all the space and leaves
              // reminder for ReaisedButton so I can remove mainAxisAlignmnet
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      children:  <Widget>[
                        TextField(
                          decoration: const InputDecoration(labelText: "Title"),
                          controller: _titleContoller,
                        ),
                        //image:
                        const SizedBox(height:10,),
                        //add container to preview image
                       CardInfoInput(_selectImage)
                      ],
                    ),
                  ),
                ),
              ),
              // all the inputs would go here
              RaisedButton.icon(
                icon: Icon(Icons.add),
                label: Text("add Card"),
                onPressed: _saveCard,
                //remove elevation of button
                elevation: 0,
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                color: Theme.of(context).accentColor,
              )
            ]));
  }
}
