import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:peaman/peaman.dart';

abstract class PeamanReportRepository {
  Future<PeamanEither<PeamanReport, PeamanError>> submitReport({
    required final String id,
    required final PeamanReportedBy reportedBy,
    required final PeamanReportType reportType,
  });

  Future<PeamanEither<List<PeamanReport>, PeamanError>> getReports({
    final MyQuery Function(MyQuery)? query,
  });

  Stream<List<PeamanReport>> getReportsStream({
    final MyQuery Function(MyQuery)? query,
  });
}

class PeamanReportRepositoryImpl extends PeamanReportRepository {
  @override
  Future<PeamanEither<List<PeamanReport>, PeamanError>> getReports({
    MyQuery Function(MyQuery)? query,
  }) {
    return runAsyncCall(
      future: () async {
        final ref = PeamanReferenceHelper.reportsCol;
        final newQuery = query?.call(ref) ?? ref;
        final result = await newQuery.get().then(_reportsFromFirestore);
        return Success(result);
      },
      onError: Failure.new,
    );
  }

  @override
  Stream<List<PeamanReport>> getReportsStream({
    MyQuery Function(MyQuery)? query,
  }) {
    final ref = PeamanReferenceHelper.reportsCol;
    final newQuery = query?.call(ref) ?? ref;
    return newQuery.snapshots().map(_reportsFromFirestore);
  }

  @override
  Future<PeamanEither<PeamanReport, PeamanError>> submitReport({
    required String id,
    required PeamanReportType reportType,
    required PeamanReportedBy reportedBy,
  }) {
    final millis = DateTime.now().millisecondsSinceEpoch;
    return runTransaction(
      onTransaction: (transaction) async {
        final reportRef = PeamanReferenceHelper.reportDoc(
          reportId: id,
        );
        final reportSnap = await transaction.get(reportRef);

        reportedBy = reportedBy.copyWith(
          createdAt: reportedBy.createdAt ?? millis,
        );

        if (reportSnap.exists) {
          final reportData = reportSnap.data();
          if (reportData != null) {
            final report = PeamanReport.fromJson(reportData);

            final newReport = report.copyWith(
              reportedBys: [...report.reportedBys, reportedBy],
              reportsCount: report.reportsCount + 1,
              updatedAt: millis,
            );

            transaction.set(
              reportRef,
              newReport.toJson(),
            );

            return Success(newReport);
          }
        }

        final report = PeamanReport(
          id: id,
          type: reportType,
          reportedBys: [reportedBy],
          reportsCount: 1,
          createdAt: millis,
        );

        transaction.set(
          reportRef,
          report.toJson(),
        );

        return Success(report);
      },
      onError: Failure.new,
    );
  }

  List<PeamanReport> _reportsFromFirestore(
    final QuerySnapshot<Map<String, dynamic>> snap,
  ) {
    return snap.docs.map((e) => PeamanReport.fromJson(e.data())).toList();
  }
}
