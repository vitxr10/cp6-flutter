import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:form/detail.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Form Demo';

    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(appTitle),
          backgroundColor: Colors.amber,
        ),
        body: const MyCustomForm(),
      ),
    );
  }
}

//---------------------------------------------------------------------------//
// Define a custom Form widget.
class MyCustomForm extends StatefulWidget {
  const MyCustomForm({Key? key}) : super(key: key);

  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

// Define a corresponding State class.
// This class holds data related to the form.
class MyCustomFormState extends State<MyCustomForm> {
  final emailController = TextEditingController();
  final senhaController = TextEditingController();
  final nameController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  String? sexoSelecionado;
  List<String> dropDownOptions = [
    "Masculino",
    "Feminino",
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.

    return Form(
      key: _formKey,
      child: ListView(
        padding: const EdgeInsets.all(32),
        children: <Widget>[
          buildName(),
          const SizedBox(
            height: 24,
          ),
          buildEmail(),
          const SizedBox(
            height: 24,
          ),
          buildPassword(),
          const SizedBox(
            height: 24,
          ),
          DropdownButton<String>(
              hint: const Text('Sexo'),
              borderRadius: BorderRadius.circular(10),
              dropdownColor: Colors.amber,
              value: sexoSelecionado,
              items: dropDownOptions
                  .map((l) => DropdownMenuItem(
                        value: l,
                        child: Text(l),
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  sexoSelecionado = value;
                });
              }),
          const SizedBox(
            height: 24,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.amber,
              foregroundColor: Colors.white,
            ),
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Detail(
                            name: nameController.text,
                            email: emailController.text,
                            sexo: sexoSelecionado,
                          ),
                          ),
                ).then((_) {
        // Limpa os campos após a navegação
        nameController.clear();
        emailController.clear();
        senhaController.clear();
        setState(() {
          sexoSelecionado = null;
        });
       });
                
              }
            },
            child: const Text('Submit'),
            
          )
        ],
      ),
    );
  }

  Widget buildName() => TextFormField(
        controller: nameController,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Obrigatório informar o nome';
          }
          return null;
        },
        decoration: InputDecoration(
          hintText: 'Your name',
          labelText: 'Nome',
          border: const OutlineInputBorder(),
          prefixIcon: const Icon(Icons.person),
          suffixIcon: IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              nameController.clear();
            },
          ),
        ),
        keyboardType: TextInputType.emailAddress,
      );

  Widget buildEmail() => TextFormField(
        controller: emailController,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Obrigatório informar o e-mail';
          }
          return null;
        },
        decoration: InputDecoration(
          hintText: 'email@example.com',
          labelText: 'E-mail',
          border: const OutlineInputBorder(),
          prefixIcon: const Icon(Icons.email),
          suffixIcon: IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              emailController.clear();
            },
          ),
        ),
        keyboardType: TextInputType.emailAddress,
      );

  Widget buildPassword() => TextFormField(
        controller: senhaController,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Obrigatório informar a senha';
          }
          if (value.length < 6) {
            return 'A senha deve ter no mínimo 6 caracteres';
          }
          return null;
        },
        obscureText: true,
        decoration: InputDecoration(
          hintText: 'Your Password...',
          labelText: 'Password',
          border: OutlineInputBorder(),
          prefixIcon: Icon(Icons.password_sharp),
          suffixIcon: IconButton(
            icon: const Icon(Icons.clear),
            onPressed: () {
              senhaController.clear();
            },
          ),
        ),
      );
}
