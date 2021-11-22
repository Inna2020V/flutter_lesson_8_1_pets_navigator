import 'package:flutter/material.dart';

enum GenderList { male, female }

class MyForm extends StatefulWidget {
  const MyForm({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => MyFormState();
}

class MyFormState extends State {
  final _formKey = GlobalKey<FormState>();
  GenderList _gender = GenderList.female;
  bool _choice = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
            padding: const EdgeInsets.all(10.0),
            child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      const Text(
                        'Кличка питомца:',
                        style: TextStyle(fontSize: 15.0),
                      ),
                      TextFormField(validator: (value) {
                        if (value!.isEmpty) {
                          return 'Пожалуйста введите кличку питомца';
                        }
                      }),
                      const SizedBox(height: 5.0),
                      const Text(
                        'Имя владельца:',
                        style: TextStyle(fontSize: 15.0),
                      ),
                      TextFormField(validator: (value) {
                        if (value!.isEmpty) {
                          return 'Пожалуйста введите свое имя';
                        }
                      }),
                      const SizedBox(height: 5.0),
                      const Text(
                        'Контакты владельца:',
                        style: TextStyle(fontSize: 15.0),
                        maxLines: 2,
                      ),
                      TextFormField(validator: (value) {
                        if (value!.isEmpty) {
                          return 'Пожалуйста введите свой E-mail';
                        }
                        if (!value.contains('@')) return 'Это не E-mail';
                      }),
                      const SizedBox(height: 5.0),
                      const Text(
                        'Порода питомца:',
                        style: TextStyle(fontSize: 15.0),
                      ),
                      TextFormField(validator: (value) {
                        if (value!.isEmpty) {
                          return 'Пожалуйста введите породу питомца';
                        }
                      }),
                      const SizedBox(height: 5.0),
                      const Text(
                        'Чем питается:',
                        style: TextStyle(fontSize: 15.0),
                      ),
                      CheckboxListTile(
                        value: _choice,
                        title: const Text(
                          'сухой корм',
                          style: TextStyle(fontSize: 15.0),
                        ),
                        onChanged: (bool? value) =>
                            setState(() => _choice = value!),
                      ),
                      CheckboxListTile(
                        value: _choice,
                        title: const Text(
                          'влажный корм',
                          style: TextStyle(fontSize: 15.0),
                        ),
                        onChanged: (bool? value) =>
                            setState(() => _choice = value!),
                      ),
                      CheckboxListTile(
                          value: _choice,
                          title: const Text(
                            'натуральный корм',
                            style: TextStyle(fontSize: 15.0),
                          ),
                          onChanged: (bool? value) =>
                              setState(() => _choice = value!)),
                      const SizedBox(height: 5.0),
                      const Text(
                        'Пол питомца:',
                        style: TextStyle(fontSize: 15.0),
                      ),
                      RadioListTile(
                        title: const Text('Самец'),
                        value: GenderList.male,
                        groupValue: _gender,
                        onChanged: (GenderList? value) {
                          setState(() {
                            _gender = value!;
                          });
                        },
                      ),
                      RadioListTile(
                        title: const Text('Самка'),
                        value: GenderList.female,
                        groupValue: _gender,
                        onChanged: (GenderList? value) {
                          setState(() {
                            _gender = value!;
                          });
                        },
                      ),
                      const SizedBox(height: 5.0),
                      TextButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.blue),
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            // ignore: unnecessary_null_comparison
                            if (_gender == null) {
                              'Выберите свой пол';
                            } else if (_choice == false) {
                              'Выберите корм';
                            } else {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const DetailScreen()),
                              );
                            }
                          }
                        },
                        child: const Text(
                          'Сохранить',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ))),
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.topRight,
              margin: const EdgeInsets.only(top: 20.0, right: 10.0),
              child: IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => Navigator.pop(context)),
            ),
            const SizedBox(
              height: 10,
            ),
            const Image(
              image: AssetImage('assets/images/cat.jpg'),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Форма успешно заполнена!',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}

void main() => runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
              title: const Text('Форма-опросник'),
              centerTitle: true,
            ),
            body: const MyForm()),
      ),
    );
