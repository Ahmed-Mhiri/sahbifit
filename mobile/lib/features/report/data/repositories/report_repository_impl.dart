import 'package:dartz/dartz.dart';
import 'create_report_model.dart';
import 'report_remote_datasource.dart';
import 'report_repository.dart';
// Assume a core network_info file exists
// import 'package:your_app/core/network/network_info.dart';

// Placeholder for NetworkInfo
abstract class NetworkInfo {
  Future<bool> get isConnected;
}
class NetworkFailure extends Failure {}

/// Implementation of the [ReportRepository] contract.
/// It coordinates data from the remote data source.
class ReportRepositoryImpl implements ReportRepository {
  final ReportRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo; // To check internet connection

  ReportRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, void>> createReport(
      CreateReportModel createReportModel) async {
    if (await networkInfo.isConnected) {
      try {
        await remoteDataSource.createReport(createReportModel);
        // Successful API call (void response)
        return const Right(null);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(NetworkFailure());
    }
  }
}