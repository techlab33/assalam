import 'package:flutter/material.dart';
import 'package:translator/translator.dart';


class TranslatorPage extends StatefulWidget {
  @override
  _TranslatorPageState createState() => _TranslatorPageState();
}

class _TranslatorPageState extends State<TranslatorPage> {
  final TextEditingController _textEditingController = TextEditingController();
  String _translatedText = '';
  String _selectedLanguage = 'es'; // Default language is Spanish

  void _translateText(String text, String toLanguage) async {
    GoogleTranslator translator = GoogleTranslator();

    var translation = await translator.translate(text, to: toLanguage);

    setState(() {
      _translatedText = translation.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Text Translator'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextFormField(
              controller: _textEditingController,
              decoration: InputDecoration(labelText: 'Enter Text'),
            ),
            SizedBox(height: 20.0),
            DropdownButton<String>(
              value: _selectedLanguage,
              onChanged: (String? newValue) {
                if(newValue != null) {
                  setState(() {
                    _selectedLanguage = newValue;
                  });
                }
              },
              items: <String>['es', 'bn', 'fr', 'de'] // Add more languages as needed
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(height: 20.0),
            TextButton(
              onPressed: () {
                _translateText(_textEditingController.text, _selectedLanguage);
              },
              child: Text('Translate'),
            ),
            SizedBox(height: 20.0),
            _translatedText.isNotEmpty
                ? Text(
              'Translated Text: $_translatedText',
              style: TextStyle(fontSize: 18.0),
            )
                : Container(),
          ],
        ),
      ),
    );
  }
}
