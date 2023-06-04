import 'package:flutter/material.dart';
import 'package:xml/xml.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'XML Parser Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _xmlController = TextEditingController();
  bool _isValid = false;

  void _parseXmlData(String xmlString) {
    setState(() {
      _isValid = _validateXml(xmlString);
    });
  }

  bool _validateXml(String xmlString) {
    try {
      XmlDocument.parse(xmlString);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  @override
  void dispose() {
    _xmlController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('XML validator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: _xmlController,
                maxLines: null,
                decoration: InputDecoration(
                  labelText: 'Enter XML',
                ),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                child: Text('Parse and Validate'),
                onPressed: () {
                  String xmlString = _xmlController.text;
                  _parseXmlData(xmlString);
                },
              ),
              SizedBox(height: 16.0),
              Text(
                'Validation:',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8.0),
              Text(
                _isValid ? 'Valid XML' : 'Invalid XML',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  color: _isValid ? Colors.green : Colors.red,
                ),
              ),
              SizedBox(height: 16,),
              Center(
                child: Text(
                  _isValid ? _xmlController.text :"",
                  style: TextStyle(
                    
                    fontWeight: FontWeight.bold,
                    
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
