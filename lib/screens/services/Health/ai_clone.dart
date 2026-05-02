import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:image_picker/image_picker.dart';

class AiChatScreen extends StatefulWidget {
  const AiChatScreen({super.key});

  @override
  State<AiChatScreen> createState() => _AiChatScreenState();
}

class _AiChatScreenState extends State<AiChatScreen> {
  final TextEditingController _textController = TextEditingController();
  final List<Map<String, String>> _chatHistory = [];
  late final GenerativeModel _model;
  bool _isLoading = false;
  File? _image;

  @override
  void initState() {
    super.initState();
    _model = GenerativeModel(
      model: 'gemini-1.5-flash',
      apiKey: 'YOUR_API_KEY', // Replace with your actual key
    );
  }

  Widget _buildHighlightedText(String text) {
    final keywords = [
      'tablet', 'symptom', 'doctor', 'fever', 'pain', 'cold', 'cough',
      'headache', 'consult', 'medicine', 'dolo', 'paracetamol',
      'azithromycin', 'crocin', 'ibuprofen', 'cetirizine', 'vomiting',
      'diarrhea', 'infection', 'dose', 'prescription', 'antibiotic',
      'home', 'remedy', 'prescribed', 'relief',
    ];

    final disclaimerPhrases = [
      'this advice is not a substitute for professional medical consultation',
      'not a substitute for medical advice',
      'this is not a medical diagnosis',
    ];

    final lines = text.trim().split('\n');
    final List<TextSpan> spans = [];
    bool disclaimerShown = false;

    for (var line in lines) {
      final lowerLine = line.toLowerCase().trim();

      if (disclaimerPhrases.any((phrase) => lowerLine.contains(phrase))) {
        if (!disclaimerShown) {
          spans.add(const TextSpan(
            text: "\nNote: This is not a substitute for professional medical advice.\n",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14,
              color: Colors.grey,
              fontStyle: FontStyle.italic,
            ),
          ));
          disclaimerShown = true;
        }
        continue;
      }

      final isBullet = line.startsWith('-') || RegExp(r'^\d+[.)]').hasMatch(line);

      if (isBullet) {
        spans.add(TextSpan(
          text: line + '\n',
          style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ));
        continue;
      }

      final pattern = RegExp(r'\b\w+\b');
      int currentIndex = 0;
      for (final match in pattern.allMatches(line)) {
        if (match.start > currentIndex) {
          spans.add(TextSpan(
            text: line.substring(currentIndex, match.start),
            style: const TextStyle(color: Colors.black),
          ));
        }

        final word = match.group(0)!;
        final isKeyword = keywords.contains(word.toLowerCase());

        spans.add(TextSpan(
          text: word,
          style: TextStyle(
            fontWeight: isKeyword ? FontWeight.bold : FontWeight.normal,
            color: Colors.black,
          ),
        ));

        currentIndex = match.end;
      }

      if (currentIndex < line.length) {
        spans.add(TextSpan(
          text: line.substring(currentIndex),
          style: const TextStyle(color: Colors.black),
        ));
      }

      spans.add(const TextSpan(text: '\n'));
    }

    return RichText(
      text: TextSpan(children: spans, style: const TextStyle(fontSize: 16)),
    );
  }

  void _sendImage() async {
    final picker = ImagePicker();
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Pick from Gallery'),
                onTap: () async {
                  Navigator.pop(context);
                  final pickedFile = await picker.pickImage(source: ImageSource.gallery);
                  if (pickedFile != null) {
                    setState(() {
                      _image = File(pickedFile.path);
                    });
                  }
                },
              ),
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: const Text('Take a Photo'),
                onTap: () async {
                  Navigator.pop(context);
                  final pickedFile = await picker.pickImage(source: ImageSource.camera);
                  if (pickedFile != null) {
                    setState(() {
                      _image = File(pickedFile.path);
                    });
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _sendMessage() async {
    if (_textController.text.isEmpty && _image == null) return;

    setState(() {
      _isLoading = true;
      _chatHistory.add({'role': 'user', 'text': _textController.text});
    });

    try {
      final response = await _model.generateContent([
        Content.multi([
          TextPart(
            '''You are a helpful medical assistant. Your role is to either provide recommendations based on user-described symptoms or to identify a tablet from an uploaded photo.

If the user provides an image of a tablet, identify the tablet, state its name, and explain its use.

If the user describes their symptoms, provide a direct and actionable recommendation. If the symptoms are mild, suggest a specific over-the-counter medication or a simple home remedy. If the symptoms are moderate or severe, strongly recommend consulting a doctor. Provide brief, simple tips for symptom relief. Do not provide a detailed diagnosis or description of the medical condition.

Always include a disclaimer that your advice is not a substitute for professional medical consultation.''',
          ),
          TextPart(_textController.text),
          if (_image != null) DataPart('image/jpeg', _image!.readAsBytesSync()),
        ]),
      ]);

      setState(() {
        _chatHistory.add({'role': 'model', 'text': response.text ?? ''});
        _image = null;
      });
    } catch (e) {
      debugPrint('Error generating content: $e');
      setState(() {
        _chatHistory.add({
          'role': 'model',
          'text': 'Sorry, I am having trouble connecting. Please try again later.\nError: $e',
        });
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
      _textController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.blue.shade100,
            Colors.blue.shade100,
            const Color.fromARGB(255, 247, 250, 199),
          ],
        ),
      ),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: const Text(
            'AI Symptoms Checker',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: _chatHistory.length,
                itemBuilder: (context, index) {
                  final message = _chatHistory[index];
                  final isUser = message['role'] == 'user';

                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    child: Align(
                      alignment: isUser
                          ? Alignment.centerRight
                          : Alignment.centerLeft,
                      child: Container(
                        decoration: BoxDecoration(
                          color: isUser
                              ? Colors.blue[200]
                              : const Color.fromARGB(255, 240, 240, 240),
                          borderRadius: BorderRadius.only(
                            topLeft: const Radius.circular(16),
                            topRight: const Radius.circular(16),
                            bottomLeft: isUser
                                ? const Radius.circular(16)
                                : const Radius.circular(0),
                            bottomRight: isUser
                                ? const Radius.circular(0)
                                : const Radius.circular(16),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.05),
                              blurRadius: 4,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        padding: const EdgeInsets.only(left: 12,right: 12,top: 12),
                        constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width * 0.8,
                        ),
                        child: _buildHighlightedText(message['text']!),
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, bottom: 20),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _textController,
                      decoration: InputDecoration(
                        hintText: 'Enter your symptoms...',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(38),
                          borderSide: const BorderSide(color: Colors.black),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(38),
                          borderSide: const BorderSide(color: Colors.black),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(38),
                          borderSide: const BorderSide(color: Colors.black),
                        ),
                      ),
                      onSubmitted: (value) {
                        if (value.isNotEmpty) {
                          _sendMessage();
                        }
                      },
                    ),
                  ),
                  IconButton(
                    icon: _isLoading
                        ? const CircularProgressIndicator()
                        : const Icon(Icons.send),
                    onPressed: _sendMessage,
                  ),
                  IconButton(
                    icon: const Icon(Icons.add_a_photo),
                    onPressed: _sendImage,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
