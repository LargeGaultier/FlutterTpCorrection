// import 'package:camera/camera.dart';
// import 'package:flutter/material.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:path_provider/path_provider.dart';

// class CameraPage extends StatefulWidget {
//   final List<CameraDescription> cameras;

//   CameraPage({required this.cameras});

//   @override
//   _CameraPageState createState() => _CameraPageState();
// }

// class _CameraPageState extends State<CameraPage> {
//   CameraController? _cameraController;

//   @override
//   void initState() {
//     super.initState();
//     _initCamera();
//   }

//   // Initialiser la caméra
//   Future<void> _initCamera() async {
//     final status = await Permission.camera.request();
//     if (status.isGranted) {
//       _cameraController = CameraController(widget.cameras[0], ResolutionPreset.medium);
//       await _cameraController!.initialize();
//       setState(() {}); // Mettre à jour l'interface une fois que la caméra est prête
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Permission caméra refusée')),
//       );
//     }
//   }

//   // Capturer une image avec la caméra
//   Future<void> _takePicture() async {
//     if (!_cameraController!.value.isInitialized) return;

//     try {
//       final directory = await getApplicationDocumentsDirectory();
//       final path = '${directory.path}/picture.jpg';
//       await _cameraController!.takePicture();

//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Image capturée : $path')));
//     } catch (e) {
//       print('Erreur lors de la capture de l\'image : $e');
//     }
//   }

//   @override
//   void dispose() {
//     _cameraController?.dispose(); // Libérer les ressources de la caméra
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Caméra'),
//       ),
//       body: Column(
//         children: [
//           _cameraController == null || !_cameraController!.value.isInitialized
//               ? Container() // Si la caméra n'est pas initialisée, n'affiche rien
//               : AspectRatio(
//                   aspectRatio: _cameraController!.value.aspectRatio,
//                   child: CameraPreview(_cameraController!), // Afficher la vue caméra
//                 ),
//           const SizedBox(height: 20),
//           ElevatedButton(
//             onPressed: _takePicture,
//             child: Text('Prendre une photo'),
//           ),
//         ],
//       ),
//     );
//   }
// }