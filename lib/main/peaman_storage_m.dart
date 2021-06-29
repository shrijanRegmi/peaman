import 'dart:io';
import 'package:peaman/services/storage_services/storage_provider.dart';

class PStorageProvider {
  // upload file
  static Future<String?> uploadFile(
    final String path,
    final File file, {
    final Function(double)? onProgressUpdate,
  }) async {
    return await StorageProvider(
      file: file,
      path: path,
      onProgressUpdate: onProgressUpdate,
    ).uploadFile();
  }

  // upload files
  static Future<List<String>?> uploadFiles(
    final String path,
    final List<File> files, {
    final Function(double)? onProgressUpdate,
  }) async {
    return await StorageProvider(
      files: files,
      path: path,
      onProgressUpdate: onProgressUpdate,
    ).uploadFiles();
  }
}
