import 'dart:io';
import 'package:peaman/services/storage_services/storage_provider.dart';

class PStorageProvider {
  // upload file
  static Future<String?> uploadFile({
    required final String path,
    required final File file,
    final Function(double)? onProgressUpdate,
  }) async {
    return await StorageProvider(
      file: file,
      path: path,
      onProgressUpdate: onProgressUpdate,
    ).uploadFile();
  }

  // upload files
  static Future<List<String>?> uploadFiles({
    required final String path,
    required final List<File> files,
    final Function(double)? onProgressUpdate,
  }) async {
    return await StorageProvider(
      files: files,
      path: path,
      onProgressUpdate: onProgressUpdate,
    ).uploadFiles();
  }
}
