import 'package:flutter/cupertino.dart';
import 'package:jokes/config/wrappers/bloc_wrapper.dart';
import 'package:jokes/config/wrappers/data_wrapper.dart';
import 'package:jokes/config/wrappers/repository_wrapper.dart';
import 'package:jokes/features/app.dart';

void main() {
  runApp(
   const  DataWrapper(
      child: RepositoryWrapper(
        child: BlocWrapper(
          child:  App(),
        ),
      ),
    )
  );
}
