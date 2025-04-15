import 'package:flutter/material.dart';

class FeedbackForm extends StatefulWidget {
  const FeedbackForm({super.key});

  @override
  State<FeedbackForm> createState() => _FeedbackFormState();
}

class _FeedbackFormState extends State<FeedbackForm> {
  final key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: key,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            spacing: 15,
            children: [
              TextFormField(
                validator: (value) {
                  if(value != null && value.isEmpty){
                    return "Feedback cant be empty";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintText: "Write your feedBack",
                  filled: true,
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.feed_sharp),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  if (key.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Feedback is submited")),
                    );
                  }
                },
                child: Text("Submit"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
