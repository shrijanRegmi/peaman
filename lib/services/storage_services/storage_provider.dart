import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';

class StorageProvider {
  final String? path;
  final File? file;
  final List<File>? files;
  final Function(double)? onProgressUpdate;
  StorageProvider({
    this.file,
    this.path,
    this.files,
    this.onProgressUpdate,
  });

  // save file to firebase storage
  Future<String?> uploadFile() async {
    if (path != null && file != null) {
      try {
        var _downloadUrl = '';
        final _storage = FirebaseStorage.instance;
        final _ref = _storage.ref().child(path!);
        final _uploadTask = _ref.putFile(file!);

        _uploadTask.snapshotEvents.listen((event) {
          var _progress =
              event.bytesTransferred.toDouble() / event.totalBytes.toDouble();
          if (onProgressUpdate != null) onProgressUpdate!(_progress);
        });
        await _uploadTask.whenComplete(() => print('Upload Complete'));
        _downloadUrl = await _ref.getDownloadURL();

        return _downloadUrl;
      } catch (e) {
        print(e);
        print('Error!!!: Uploading image to firebase storage');
      }
    }

    return null;
  }

  // save files to firebase storage
  Future<List<String>?> uploadFiles() async {
    final _downloadUrls = <String>[];
    try {
      if (path != null) {
        for (int i = 0; i < (files ?? []).length; i++) {
          final _file = files![i];
          final _storage = FirebaseStorage.instance;
          final _ref = _storage.ref().child('$path\_$i');
          final _uploadTask = _ref.putFile(_file);

          _uploadTask.snapshotEvents.listen((event) {
            var _progress =
                event.bytesTransferred.toDouble() / event.totalBytes.toDouble();
            if (onProgressUpdate != null) onProgressUpdate!(_progress);
          });

          await _uploadTask.whenComplete(() => print('Upload Complete'));
          final _downloadUrl = await _ref.getDownloadURL();
          _downloadUrls.add(_downloadUrl);
        }
      } else {
        throw Future.error('Path was not provided');
      }

      return _downloadUrls;
    } catch (e) {
      print(e);
      print('Error!!!: Uploading image to firebase storage');
    }
    return null;
  }
}
