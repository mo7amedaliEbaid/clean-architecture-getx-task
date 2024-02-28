import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../network/exceptions.dart';
import '../network/failures.dart';


import 'hive_helper.dart';

class FailureHelper {
  static FailureHelper? _instance;

  FailureHelper._();

  static FailureHelper get instance {
   // instance ??= FailureHelper.();
    return _instance!;
  }

  Future<Either<Failure, T>> call<T>(
      {Future<T> Function()? method,
      //  NetworkInfo? networkInfo,
        Future<T> Function()? methodLocal}) async {
    assert((method != null || methodLocal != null),
    "There is an error you don't call method or methodLocal");

  //  if (networkInfo == null || await networkInfo.isConnected) {
      try {
        if (method != null) {
          return Right(await method());
        } else {
          if (methodLocal != null) {
            return call(method: methodLocal);
          } else {
            return const Left(ConnectionFailure());
          }
        }
      } on ServerException catch (error) {
        return Left(ServerFailure(message: error.message));
      } on UnAuthorizedException {
        return const Left(UnAuthorizedFailure());
      } on DatabaseException {
        return const Left(DatabaseFailure());
      } on SocketException {
        return const Left(ConnectionFailure());
      } catch (error) {
        print(error);
        return Left(ExceptionFailure(message: error.toString()));
      }
   // }
    /*else {
      if (methodLocal != null) {
        return call(method: methodLocal);
      } else {
        return const Left(ConnectionFailure());
      }
    }*/
  }

  void handleFailures(Failure failure, BuildContext context) async {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.error,
      animType: AnimType.rightSlide,
      headerAnimationLoop: false,
     // title: AppLocalizations.of(context)?.sorry,
      desc: failure.message,
      btnOkColor: Colors.red,
    ).show();

    switch (failure.runtimeType) {
      case ExceptionFailure:
        print('ExceptionFailure');
        break;
      case ConnectionFailure:
        print('ConnectionFailure');
        break;
      case UnAuthorizedFailure:
        //HiveHelper().logout(context);
        break;
      case UnVerifiedFailure:
        print('UnVerifiedFailure');
        break;
      case DatabaseFailure:
        print('DatabaseFailure');
        break;
      default:
        print(failure.message);
        break;
    }
  }
}