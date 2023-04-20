# advicer
https://github.com/OpenSphereSoftware/FlutterMadeEasy_ZeroToMastery/tree/3.1_advicer_application_layer

<img width="300" alt="スクリーンショット 2023-04-14 10 43 54" src="https://user-images.githubusercontent.com/47273077/233223780-c47fe91f-39e9-455a-a5a2-7b7b97b57e45.gif">

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## [Application Layer - UI](https://github.com/YamamotoDesu/advicer/commit/77d253af4f551cdce94d6b938658c34a71c13ee5)

<img width="300" alt="スクリーンショット 2023-04-14 10 43 54" src="https://user-images.githubusercontent.com/47273077/231919904-75d2d525-20ee-4835-8080-f3eb1c40e31f.png">

main.dart
```dart
import 'package:advicer/2_application/pages/advice/advice_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '2_application/core/services/theme_service.dart';
import 'theme.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => ThemeService(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeService>(builder: (context, themeService, child) {
      return MaterialApp(
        themeMode: themeService.isDarkModeOn ? ThemeMode.dark : ThemeMode.light,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        debugShowCheckedModeBanner: false,
        home: const AdvicerPage(),
      );
    });
  }
}

```

advice_page.dart
```dart
class AdvicerPage extends StatelessWidget {
  const AdvicerPage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Advicer",
          style: themeData.textTheme.headline1,
        ),
        centerTitle: true,
        actions: [
          Switch(
            value: Provider.of<ThemeService>(context).isDarkModeOn,
            onChanged: (_) {
              Provider.of<ThemeService>(context, listen: false).toggleTheme();
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          children: const [
            Expanded(
              child: Center(
                child: ErrorMessage(message: 'oops something gone wrong!'),
                // child: AdviceField(
                //   advice: 'example advice - your day will be good',
                // ),
                // child: CircularProgressIndicator(
                //   color: themeData.colorScheme.secondary,
                // ),
                /*Text(
                  "Your Advice is waiting for you",
                  style: themeData.textTheme.headline1,
                ),*/
              ),
            ),
            SizedBox(
              height: 200,
              child: Center(
                child: CustomButton(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
```

advice_page.dart
```dart
lass AdvicerPage extends StatelessWidget {
  const AdvicerPage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Advicer",
          style: themeData.textTheme.headline1,
        ),
        centerTitle: true,
        actions: [
          Switch(
            value: Provider.of<ThemeService>(context).isDarkModeOn,
            onChanged: (_) {
              Provider.of<ThemeService>(context, listen: false).toggleTheme();
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          children: const [
            Expanded(
              child: Center(
                child: ErrorMessage(message: 'oops something gone wrong!'),
                // child: AdviceField(
                //   advice: 'example advice - your day will be good',
                // ),
                // child: CircularProgressIndicator(
                //   color: themeData.colorScheme.secondary,
                // ),
                /*Text(
                  "Your Advice is waiting for you",
                  style: themeData.textTheme.headline1,
                ),*/
              ),
            ),
            SizedBox(
              height: 200,
              child: Center(
                child: CustomButton(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
```

```dart
class AdviceField extends StatelessWidget {
  final String advice;
  const AdviceField({super.key, required this.advice});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Material(
      elevation: 20,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: themeData.colorScheme.onPrimary,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Text(
            '''" $advice "''',
            style: themeData.textTheme.bodyText1,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
```

lib/2_application/pages/advice/widgets/custom_button.dart
```dart
class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return InkResponse(
      onTap: () {
        print('button pressed - will be implemented later');
      },
      child: Material(
        elevation: 20,
        borderRadius: BorderRadius.circular(15),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: themeData.colorScheme.secondary),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            child: Text(
              'Get advice',
              style: themeData.textTheme.headline1,
            ),
          ),
        ),
      ),
    );
  }
}
```

lib/2_application/pages/advice/widgets/error_message.dart
```dart
class ErrorMessage extends StatelessWidget {
  final String message;
  const ErrorMessage({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          Icons.error,
          size: 40,
          color: Colors.redAccent,
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          message,
          style: themeData.textTheme.headline1,
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}
```

## [Application Layer - BLoC State Management](https://github.com/YamamotoDesu/advicer/commit/a9e2f4c9ab0cc2a0e1ab3540d39f7044d0c6086f)

lib/2_application/pages/advice/bloc/advicer_bloc.dart
```dart
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'advicer_event.dart';
part 'advicer_state.dart';

class AdvicerBloc extends Bloc<AdvicerEvent, AdvicerState> {
  AdvicerBloc() : super(AdvicerInitial()) {
    on<AdvicerEvent>((event, emit) async {
      emit(AdvicerStateLoading());

      debugPrint('fake get advice triggered');
      await Future.delayed(
        const Duration(
          seconds: 3,
        ),
        () {},
      );
      debugPrint('got advice');
      emit(
        AdvicerStateLoaded(advice: 'fake advice to test block'),
      );
      // emit(
      //   AdvicerStateError(message: 'error message'),
      // );
    });
  }
}
```

lib/2_application/pages/advice/bloc/advicer_event.dart
```dart
part of 'advicer_bloc.dart';

@immutable
abstract class AdvicerEvent {}

class AdvideRequestedEvent extends AdvicerEvent {}
```

lib/2_application/pages/advice/bloc/advicer_state.dart
```dart
part of 'advicer_bloc.dart';

@immutable
abstract class AdvicerState {}

class AdvicerInitial extends AdvicerState {}

class AdvicerStateLoading extends AdvicerState {}

class AdvicerStateLoaded extends AdvicerState {
  final String advice;
  AdvicerStateLoaded({
    required this.advice,
  });
}

class AdvicerStateError extends AdvicerState {
  final String message;
  AdvicerStateError({required this.message});
}

```

## [Application Layer - BLoC Provider](https://github.com/YamamotoDesu/advicer/commit/a9e2f4c9ab0cc2a0e1ab3540d39f7044d0c6086f)
<img width="300" alt="スクリーンショット 2023-04-14 10 43 54" src="https://user-images.githubusercontent.com/47273077/231935935-537e3a88-0c85-469b-baf3-08b2348d88f1.gif">

lib/main.dart
```dart
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeService>(builder: (context, themeService, child) {
      return MaterialApp(
        themeMode: themeService.isDarkModeOn ? ThemeMode.dark : ThemeMode.light,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        debugShowCheckedModeBanner: false,
        home: const AdvicerPageWrapperProvider(),
      );
 ```
  
 lib/2_application/pages/advice/advice_page.dart
 ```dart
import 'package:advicer/2_application/core/services/theme_service.dart';
import 'package:advicer/2_application/pages/advice/bloc/advicer_bloc.dart';
import 'package:advicer/2_application/pages/advice/widgets/custom_button.dart';
import 'package:advicer/2_application/pages/advice/widgets/error_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'widgets/advice_field.dart';

class AdvicerPageWrapperProvider extends StatelessWidget {
  const AdvicerPageWrapperProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AdvicerBloc(),
      child: const AdvicerPage(),
    );
  }
}

class AdvicerPage extends StatelessWidget {
  const AdvicerPage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Advicer",
          style: themeData.textTheme.headline1,
        ),
        centerTitle: true,
        actions: [
          Switch(
            value: Provider.of<ThemeService>(context).isDarkModeOn,
            onChanged: (_) {
              Provider.of<ThemeService>(context, listen: false).toggleTheme();
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: BlocBuilder<AdvicerBloc, AdvicerState>(
                  builder: (context, state) {
                    if (state is AdvicerInitial) {
                      return Text(
                        "Your Advice is waiting for you",
                        style: themeData.textTheme.headline1,
                      );
                    } else if (state is AdvicerStateLoading) {
                      return CircularProgressIndicator(
                        color: themeData.colorScheme.secondary,
                      );
                    } else if (state is AdvicerStateLoaded) {
                      return AdviceField(
                        advice: state.advice,
                      );
                    } else if (state is AdvicerStateError) {
                      return ErrorMessage(
                        message: state.message,
                      );
                    }
                    return const SizedBox();
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 200,
              child: Center(
                child: CustomButton(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
```

lib/2_application/pages/advice/widgets/custom_button.dart
```dart
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return InkResponse(
      onTap: () => BlocProvider.of<AdvicerBloc>(context).add(
        AdvideRequestedEvent(),
      ),
 ```
 
 ## Application Layer - Cubit
 lib/2_application/pages/advice/cubit/advicer_cubit.dart
 ```dart
 import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

part 'advicer_state.dart';

class AdvicerCubit extends Cubit<AdvicerQubitState> {
  AdvicerCubit() : super(AdvicerInitial());

  void adviceRequested() async {
    emit(AdvicerStateLoading());

    debugPrint('fake get advice triggered');
    await Future.delayed(
      const Duration(
        seconds: 3,
      ),
      () {},
    );
    debugPrint('got advice');
    emit(
      const AdvicerStateLoaded(
        advice: 'fake advice to test block',
      ),
    );
  }
}
```

lib/2_application/pages/advice/cubit/advicer_state.dart
```dart
part of 'advicer_cubit.dart';

abstract class AdvicerQubitState extends Equatable {
  const AdvicerQubitState();

  @override
  List<Object?> get props => [];
}

class AdvicerInitial extends AdvicerQubitState {}

class AdvicerStateLoading extends AdvicerQubitState {}

class AdvicerStateLoaded extends AdvicerQubitState {
  final String advice;
  const AdvicerStateLoaded({
    required this.advice,
  });

  @override
  List<Object?> get props => [advice];
}

class AdvicerStateError extends AdvicerQubitState {
  final String message;
  const AdvicerStateError({required this.message});

  @override
  List<Object?> get props => [message];
}
```
 
lib/2_application/pages/advice/advice_page.dart
```dart
@override
  Widget build(BuildContext context) {
    return BlocProvider(
      // create: (context) => AdvicerBloc(),
      create: (context) => AdvicerCubit(),
      child: const AdvicerPage(),
    );
  }
  
```

lib/2_application/pages/advice/widgets/custom_button.dart
```dart
class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return InkResponse(
     // onTap: () => BlocProvider.of<AdvicerBloc>(context).add(
     //   AdvideRequestedEvent(),
     //  ),
      onTap: () => BlocProvider.of<AdvicerCubit>(context).adviceRequested(),
      
```

### Domain Layer - Failures & Dartz

 
lib/1_domain/entities/advice_entity.dart
```dart
import 'package:equatable/equatable.dart';

class AdviceEntity extends Equatable {
  final String advice;
  final int id;

  const AdviceEntity({
    required this.advice,
    required this.id,
  });

  @override
  List<Object?> get props => [advice, id];
}
```

 
lib/1_domain/failures/failures.dart
```dart
abstract class Failure {}

class ServerFailure extends Failure {}

class CacheFailure extends Failure {}

class GeneralFailure extends Failure {}
```

lib/1_domain/repositories/advice_repo.dart
```dart
import 'package:advicer/1_domain/failures/failures.dart';
import 'package:dartz/dartz.dart';

abstract class AdviceRepo {
  Future<Either<Failure, AdviceEntity>> getAdviceFromDatasource();
}
```

lib/1_domain/usecases/advice_usecases.dart
```dart

@@ -0,0 +1,20 @@
import 'package:advicer/1_domain/entities/advice_entity.dart';
import 'package:advicer/1_domain/failures/failures.dart';
import 'package:dartz/dartz.dart';

class AdviceUseCases {
  Future<Either<Failure, AdviceEntity>> getAdvice() async {
    await Future.delayed(
      const Duration(
        seconds: 3,
      ),
      () {},
    );
    return right(
      const AdviceEntity(
        advice: 'advice to test',
        id: 1,
      ),
    );
  }
}
```

 
lib/2_application/pages/advice/cubit/advicer_cubit.dart
```dart
const generalFailureMessage = 'Oops, Unknown Error, please try again!';
const serverFailureMessage = 'Oops, API Error, please try again!';
const cacheFailureMessage = 'Oops, Cache Error, please try again!';

class AdvicerCubit extends Cubit<AdvicerQubitState> {
  AdvicerCubit() : super(AdvicerInitial());
  final AdviceUseCases adviceUseCases = AdviceUseCases();

  void adviceRequested() async {
    emit(AdvicerStateLoading());

    final failureOrAdvice = await adviceUseCases.getAdvice();
    failureOrAdvice.fold(
      (failure) => emit(AdvicerStateError(message: _mapFailureToMesssage(failure))),
      (advice) => emit(AdvicerStateLoaded(advice: advice.advice)),
    );
  }

  String _mapFailureToMesssage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return serverFailureMessage;
      case CacheFailure:
        return cacheFailureMessage;
      default:
        return generalFailureMessage;
    }
  }
}
```

##  Data Layer - Models & Datasources

<img width="300" alt="スクリーンショット 2023-04-20 7 40 45" src="https://user-images.githubusercontent.com/47273077/233215122-13a7b6e0-0c8e-4971-8c4c-392b698727ce.png">

lib/0_data/datasources/advice_remote_datasource.dart
```dart
import 'dart:convert';

import 'package:advicer/0_data/models/advice_model.dart';
import 'package:http/http.dart' as http;

abstract class AdviceRemoteDatasource {
  Future<AdviceModel> getRandomAdviceFromApi();
}

class AdviceRemoteDatasourceImpl implements AdviceRemoteDatasource {
  final client = http.Client();
  @override
  Future<AdviceModel> getRandomAdviceFromApi() async {
    final response = await client.get(
      Uri.parse(
        'https://api.flutter-community.com/api/v1/advice',
      ),
      headers: {
        'Content-Type': 'application/json',
      },
    );
    final responseBody = json.decode(response.body);
    return AdviceModel.fromJson(responseBody);
  }
}
```

 
lib/0_data/models/advice_model.dart
```dart
import 'package:advicer/1_domain/entities/advice_entity.dart';
import 'package:equatable/equatable.dart';

class AdviceModel extends AdviceEntity with EquatableMixin {
  AdviceModel({
    required String advice,
    required int id,
  }) : super(
          advice: advice,
          id: id,
        );

  factory AdviceModel.fromJson(Map<String, dynamic> json) {
    return AdviceModel(
      advice: json['advice'],
      id: json['advice_id'],
    );
  }
}
```

lib/0_data/repositories/advice_repo_impl.dart
```dart

import 'package:advicer/0_data/datasources/advice_remote_datasource.dart';
import 'package:advicer/1_domain/failures/failures.dart';
import 'package:advicer/1_domain/entities/advice_entity.dart';
import 'package:advicer/1_domain/repositories/advice_repo.dart';
import 'package:dartz/dartz.dart';

class AdviceRepoImpl implements AdviceRepo {
  final AdviceRemoteDatasource adviceRemoteDatasource = AdviceRemoteDatasourceImpl();
  @override
  Future<Either<Failure, AdviceEntity>> getAdviceFromDatasource() async {
    final result = await adviceRemoteDatasource.getRandomAdviceFromApi();
    return right(result);
  }
}
```

lib/1_domain/usecases/advice_usecases.dart
```dart
import 'package:advicer/0_data/repositories/advice_repo_impl.dart';
import 'package:advicer/1_domain/entities/advice_entity.dart';
import 'package:advicer/1_domain/failures/failures.dart';
import 'package:dartz/dartz.dart';

class AdviceUseCases {
  final adviceRepo = AdviceRepoImpl();
  Future<Either<Failure, AdviceEntity>> getAdvice() async {
    return adviceRepo.getAdviceFromDatasource();
  }
}
```

## Data Layer - Exceptions & Failures
lib/0_data/exceptions/exceptions.dart
```dart
class ServerException implements Exception {}

class CacheException implements Exception {}
```

lib/0_data/models/advice_model.dart
```dart
import 'package:advicer/1_domain/entities/advice_entity.dart';
import 'package:equatable/equatable.dart';

class AdviceModel extends AdviceEntity with EquatableMixin {
  AdviceModel({
    required String advice,
    required int id,
  }) : super(
          advice: advice,
          id: id,
        );

  factory AdviceModel.fromJson(Map<String, dynamic> json) {
    return AdviceModel(
      advice: json['advice'],
      id: json['advice_id'],
    );
  }
}
```

lib/0_data/repositories/advice_repo_impl.dart
```dart
class AdviceRepoImpl implements AdviceRepo {
  final AdviceRemoteDatasource adviceRemoteDatasource =
      AdviceRemoteDatasourceImpl();
  @override
  Future<Either<Failure, AdviceEntity>> getAdviceFromDatasource() async {
    try {
      final result = await adviceRemoteDatasource.getRandomAdviceFromApi();
      return right(result);
    } on ServerException catch (_) {
      return left(ServerFailure());
    } on CacheException catch (_) {
      return left(CacheFailure());
    } catch (e) {
      return left(GeneralFailure());
    }
  }
}
```

lib/0_data/datasources/advice_remote_datasource.dart
```dart
abstract class AdviceRemoteDatasource {
  Future<AdviceModel> getRandomAdviceFromApi();
}

class AdviceRemoteDatasourceImpl implements AdviceRemoteDatasource {
  final client = http.Client();
  @override
  Future<AdviceModel> getRandomAdviceFromApi() async {
    final response = await client.get(
      Uri.parse(
        'https://api.flutter-community.com/api/v1/advice',
      ),
      headers: {
        'Content-Type': 'application/json',
      },
    );
    if (response.statusCode != 200) {
      throw ServerException();
    } else {
      final responseBody = json.decode(response.body);
      return AdviceModel.fromJson(responseBody);
    }
  }
```
  
## Clean Architecture - Dependency Injection

lib/injection.dart
```dart
import 'package:advicer/0_data/datasources/advice_remote_datasource.dart';
import 'package:advicer/0_data/repositories/advice_repo_impl.dart';
import 'package:advicer/1_domain/repositories/advice_repo.dart';
import 'package:advicer/1_domain/usecases/advice_usecases.dart';
import 'package:advicer/2_application/pages/advice/cubit/advicer_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

final sl // sl == Service Locator
    = GetIt
        .instance; // GetIt is a service locator that lets you retrieve objects using a type or a name.

Future<void> init() async {
  // ! application Layer
  sl.registerFactory(
    () => AdvicerCubit(
      adviceUseCases: sl(),
    ),
  );

  // ! domain Layer
  sl.registerFactory(
    () => AdviceUseCases(
      adviceRepo: sl(),
    ),
  );
  ;
  // ! data Layer
  sl.registerFactory<AdviceRepo>(
    () => AdviceRepoImpl(
      adviceRemoteDatasource: sl(),
    ),
  );
  sl.registerFactory<AdviceRemoteDatasource>(
    () => AdviceRemoteDatasourceImpl(
      client: sl(),
    ),
  );

   // ! externs
  sl.registerFactory(() => http.Client());
}
```

lib/main.dart
```dart
import 'injection.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(ChangeNotifierProvider(
    create: (context) => ThemeService(),
    child: const MyApp(),
  ));
}
```

lib/2_application/pages/advice/advice_page.dart
```dart
class AdvicerPageWrapperProvider extends StatelessWidget {
  const AdvicerPageWrapperProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<AdvicerCubit>(),
      child: const AdvicerPage(),
    );
  }
}
```

lib/2_application/pages/advice/cubit/advicer_cubit.dart
```dart

class AdvicerCubit extends Cubit<AdvicerQubitState> {
  final AdviceUseCases adviceUseCases;
  AdvicerCubit({
    required this.adviceUseCases,
  }) : super(AdvicerInitial());
```

lib/0_data/datasources/advice_remote_datasource.dart
```dart
class AdviceRemoteDatasourceImpl implements AdviceRemoteDatasource {
  final http.Client client;

  AdviceRemoteDatasourceImpl({
    required this.client,
  });
```

lib/0_data/repositories/advice_repo_impl.dart
```dart
class AdviceRepoImpl implements AdviceRepo {
  AdviceRepoImpl({
    required this.adviceRemoteDatasource,
  });
  final AdviceRemoteDatasource adviceRemoteDatasource;
```


lib/1_domain/usecases/advice_usecases.dart
```dart
class AdviceUseCases {
  AdviceUseCases({
    required this.adviceRepo,
  });
  final AdviceRepo adviceRepo;
```

