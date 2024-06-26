import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:peaman/peaman.dart';

abstract class PeamanStorageRepository {
  Future<PeamanEither<String, PeamanError>> uploadFile({
    required final String path,
    required final File file,
    final String? fileName,
    final Function(double)? onProgress,
  });

  Future<PeamanEither<List<String>, PeamanError>> uploadFiles({
    required final String path,
    required final List<File> files,
    final String? fileName,
    final Function(double)? onProgress,
  });
}

class PeamanStorageRepositoryImpl extends PeamanStorageRepository {
  final _storage = FirebaseStorage.instance;

  @override
  Future<PeamanEither<String, PeamanError>> uploadFile({
    required String path,
    required File file,
    String? fileName,
    Function(double p1)? onProgress,
  }) {
    final _millis = DateTime.now().millisecondsSinceEpoch;
    return runAsyncCall(
      future: () async {
        final _fileName = fileName ?? _millis;

        final _ref = _storage.ref().child('$path/$_fileName');
        final _uploadTask = _ref.putFile(file);

        _uploadTask.snapshotEvents.listen((event) {
          var _progress =
              event.bytesTransferred.toDouble() / event.totalBytes.toDouble();
          if (onProgress != null) onProgress(_progress);
        });
        await _uploadTask.whenComplete(() {});
        final _downloadUrl = await _ref.getDownloadURL();
        return Success(_downloadUrl);
      },
      onError: Failure.new,
    );
  }

  @override
  Future<PeamanEither<List<String>, PeamanError>> uploadFiles({
    required String path,
    required List<File> files,
    String? fileName,
    Function(double p1)? onProgress,
  }) {
    final _millis = DateTime.now().millisecondsSinceEpoch;
    return runAsyncCall(
      future: () async {
        final _uploadTaskFutures = <Future>[];
        final _downloadUrlFutures = <Future<String>>[];

        final _fileName = fileName ?? _millis;

        for (var i = 0; i < files.length; i++) {
          final _file = files[i];
          final _ref = _storage.ref().child('$path/${i}_$_fileName');
          final _uploadTask = _ref.putFile(_file);

          final _uploadTaskFuture = _uploadTask.whenComplete(() => {});
          _uploadTask.snapshotEvents.listen((event) {
            var _progress =
                event.bytesTransferred.toDouble() / event.totalBytes.toDouble();
            if (onProgress != null) onProgress(_progress);
          });
          _uploadTaskFutures.add(_uploadTaskFuture);
        }

        await Future.wait(_uploadTaskFutures);

        for (int i = 0; i < files.length; i++) {
          final _storage = FirebaseStorage.instance;
          final _ref = _storage.ref().child('$path/${i}_$_fileName');

          final _downloadUrlFuture = _ref.getDownloadURL();
          _downloadUrlFutures.add(_downloadUrlFuture);
        }
        final _result = await Future.wait(_downloadUrlFutures);

        return Success(_result);
      },
      onError: Failure.new,
    );
  }
}
