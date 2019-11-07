import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


class CreatePlacePage extends StatefulWidget {
  const CreatePlacePage({Key key, this.title}) : super(key: key);

  final String title;
  @override
  _CreatePlacePageState createState() => _CreatePlacePageState();
}

class _CreatePlacePageState extends State<CreatePlacePage> {
  File _photo;
  Future _getPhoto() async {
    final image = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      _photo = image;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create your favourite place'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Column(
          children: [
            if (_photo != null) Image.file(_photo),
            RaisedButton(
              child: const Text('Take picture'),
              onPressed: () {},
            ),
            TextField(
              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(20.0),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Theme.of(context).accentColor,
                    ),
                  ),
                  labelText: 'Enter picture name'),
            ),
            const SizedBox(
              height: 5,
            ),
            TextField(
              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(20.0),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Theme.of(context).accentColor,
                    ),
                  ),
                  labelText: 'Enter description'),
            ),
            RaisedButton(
              child: const Text('Create'),
              onPressed: () {
                _getPhoto();
              },
            ),
          ],
        ),
      ),
    );
  }
}