// class MultipleFileUploader extends StatefulWidget {
//   @override
//   _MultipleFileUploaderState createState() => _MultipleFileUploaderState();
// }

// class _MultipleFileUploaderState extends State<MultipleFileUploader> {
//   final supabase = Supabase.instance.client;
//   List<String> uploadedFileUrls = [];

//   // Function to upload multiple files
//   Future<void> uploadMultipleFiles(String bucketName, String folderPath) async {
//     try {
//       final result = await FilePicker.platform.pickFiles(allowMultiple: true);
//       if (result != null) {
//         for (var file in result.files) {
//           final fileToUpload = File(file.path!);
//           final fileName = file.name;

//           // Upload file to Supabase Storage
//           await supabase.storage.from(bucketName).upload('$folderPath/$fileName', fileToUpload);

//           // Generate and store the public URL
//           final publicUrl = supabase.storage.from(bucketName).getPublicUrl('$folderPath/$fileName');
//           uploadedFileUrls.add(publicUrl);
//         }

//         // Refresh UI with the uploaded files
//         setState(() {});
//         ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Files uploaded successfully!')));
//       }
//     } catch (e) {
//       print('Error uploading files: $e');
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error uploading files!')));
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Upload & List Files')),
//       body: Column(
//         children: [
//           ElevatedButton(
//             onPressed: () => uploadMultipleFiles('my-bucket', 'my-folder'),
//             child: Text('Upload Files'),
//           ),
//           Expanded(
//             child: ListView.builder(
//               itemCount: uploadedFileUrls.length,
//               itemBuilder: (context, index) {
//                 return ListTile(
//                   leading: Image.network(uploadedFileUrls[index], width: 50, height: 50),
//                   title: Text('File ${index + 1}'),
//                   subtitle: Text(uploadedFileUrls[index]),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }



//   final ImagePicker _picker = ImagePicker();
//   // XFile? image;
//   List<XFile>images
//   File? imageFile;
//   Future pickUserImage() async {
//     emit(PickImageLoadingState());
//     // image = await _picker.pickImage(source: ImageSource.gallery);
//     images = await _picker.pickMultiImage();
//     imageFile = File(image!.path);
//     emit(PickImageSuccessState());
//   }
