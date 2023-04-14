# advicer

A new Flutter project.
https://github.com/OpenSphereSoftware/FlutterMadeEasy_ZeroToMastery/tree/3.1_advicer_application_layer

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

## Application Layer - BLoC Provider
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
 
 
