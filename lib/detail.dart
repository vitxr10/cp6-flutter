import 'package:flutter/material.dart';

class Detail extends StatelessWidget {
  final String name;
  final String email;
  final String? sexo;

  const Detail({Key? key, required this.name, required this.email, this.sexo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Page'),
        backgroundColor: Colors.amber,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            elevation: 4.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(16),
                  child: CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.amber,
                    child: Text(
                      name[0].toUpperCase(),
                      style: TextStyle(fontSize: 40, color: Colors.white),
                    ),
                  ),
                ),
                ListTile(
                  title: Center(
                    child: Text(
                      name,
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 8),
                      Text(
                        'Email: $email',
                        style: TextStyle(fontSize: 16),
                      ),
                      if (sexo != null)
                        Text(
                          'Sexo: $sexo',
                          style: TextStyle(fontSize: 16),
                        ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amber,
                      foregroundColor: Colors.white,
                    ),
                    child: const Text('OK'),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
