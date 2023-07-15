import 'package:flutter/material.dart';
import 'package:dart_openai/dart_openai.dart';

void main() {
  runApp(AiChat());
}

class AiChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Set the OpenAI API key from the .env file.
    OpenAI.apiKey = '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';

    return MaterialApp(
      title: 'ChatGPT Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChatPage(),
    );
  }
}

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  late TextEditingController _inputController;
  late List<String> _chatHistory;

  @override
  void initState() {
    super.initState();
    _inputController = TextEditingController();
    _chatHistory = [];
  }

  @override
  void dispose() {
    _inputController.dispose();
    super.dispose();
  }

  Future<void> _sendMessage() async {
    final userInput = _inputController.text.trim();
    if (userInput.isNotEmpty) {
      setState(() {
        _chatHistory.add('User: $userInput');
      });

      try {
        final chatCompletion = await OpenAI.instance.chat.create(
          model: "gpt-3.5-turbo",
          messages: [
            OpenAIChatCompletionChoiceMessageModel(
              content: userInput,
              role: OpenAIChatMessageRole.user,
            ),
          ],
        );

        final botReply = chatCompletion.choices.first.message.content;
        setState(() {
          _chatHistory.add('ChatGPT: $botReply');
        });
      } catch (e) {
        print('An error occurred: $e');
      }

      _inputController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ChatGPT Demo'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _chatHistory.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_chatHistory[index]),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _inputController,
                    decoration: InputDecoration(
                      hintText: 'Type your message...',
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: _sendMessage,
                  child: Text('Send'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
