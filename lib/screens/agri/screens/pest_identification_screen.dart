import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'dart:io' as io;

class PestIdentificationScreen extends StatefulWidget {
  const PestIdentificationScreen({super.key});

  @override
  State<PestIdentificationScreen> createState() => _PestDetectionWidgetState();
}

class _PestDetectionWidgetState extends State<PestIdentificationScreen> {
  Uint8List? _webImage;
  io.File? _mobileImage;
  String _response = '';
  bool _isLoading = false;

  final String apiKey = "rOc1cQXUactqmIFjzJeo";
  final picker = ImagePicker();

  Future<void> pickFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    _handlePickedFile(pickedFile);
  }

  Future<void> pickFromCamera() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    _handlePickedFile(pickedFile);
  }

  void _handlePickedFile(XFile? pickedFile) {
    if (pickedFile != null) {
      setState(() {
        if (kIsWeb) {
          pickedFile.readAsBytes().then((value) {
            _webImage = value;
            _response = '';
          });
        } else {
          _mobileImage = io.File(pickedFile.path);
          _response = '';
        }
      });
    }
  }

  Future<void> detectPest() async {
    setState(() => _isLoading = true);

    try {
      Uint8List? imageBytes;

      if (kIsWeb && _webImage != null) {
        imageBytes = _webImage;
      } else if (!kIsWeb && _mobileImage != null) {
        imageBytes = await _mobileImage!.readAsBytes();
      }

      if (imageBytes == null) {
        setState(() {
          _response = '❌ No image selected!';
          _isLoading = false;
        });
        return;
      }

      final base64Image = base64Encode(imageBytes);
      final response = await http.post(
        Uri.parse("https://serverless.roboflow.com/pest-detection-qbalv/3?api_key=$apiKey"),
        headers: {"Content-Type": "application/x-www-form-urlencoded"},
        body: base64Image,
      );

      final decoded = json.decode(response.body);
      if (decoded["predictions"] != null && decoded["predictions"].isNotEmpty) {
        setState(() {
          _response = "✅ Pest Detected: ${decoded['predictions'][0]['class']}";
        });
      } else {
        setState(() {
          _response = "✅ No pest confidently detected.";
        });
      }
    } catch (e) {
      setState(() {
        _response = "❌ Error: ${e.toString()}";
      });
    } finally {
      setState(() => _isLoading = false);
    }
  }

  Widget showSelectedImage() {
    if (kIsWeb && _webImage != null) {
      return Image.memory(_webImage!, height: 200);
    } else if (!kIsWeb && _mobileImage != null) {
      return Image.file(_mobileImage!, height: 200);
    } else {
      return const SizedBox.shrink();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pest Detection'),
        backgroundColor: Colors.green.shade700,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.green.shade100,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  showSelectedImage(),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton.icon(
                        onPressed: pickFromCamera,
                        icon: const Icon(Icons.camera_alt,color: Colors.black,size: 25),
                        label: const Text("Camera",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18)),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green.shade300,
                        ),
                      ),
                      ElevatedButton.icon(
                        onPressed: pickFromGallery,
                        icon: const Icon(Icons.photo,color: Colors.black,size:25),
                        label: const Text("Gallery",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18)),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green.shade300,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton.icon(
                    onPressed: detectPest,
                    icon: const Icon(Icons.bug_report,color: Colors.black,size:25),
                    label: const Text("Detect Pest",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize:18)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green.shade400,
                      minimumSize: const Size(double.infinity, 50),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            if (_isLoading) const CircularProgressIndicator(),
            if (_response.isNotEmpty)
              Container(
                margin: const EdgeInsets.only(top: 16),
                padding: const EdgeInsets.all(16),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.green.shade50,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.green.shade200),
                ),
                child: Text(
                  _response,
                  style: const TextStyle(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
