import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture_bloc/core/utils/constants.dart';
import 'package:flutter_clean_architecture_bloc/core/utils/theme.dart';
import 'package:logging/logging.dart';
import 'core/utils/router.dart';
import 'injection_container.dart' as di; //Dependency injector

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di
      .init(); //Inject all the dependencies and wait for it is done (i.e. UI won't built until all the dependencies are injected)
  _setupLogging();
  runApp(CleanArchitectureWithBloc());
}

class CleanArchitectureWithBloc extends StatelessWidget {
  // This widget is the root of the application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'clean architecture with bloc',
      theme: CustomTheme.mainTheme,
      onGenerateRoute: Routerr.generateRoute,
      initialRoute: LOGIN_ROUTE,
    );
  }
}

void _setupLogging() {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((rec) {
    print('${rec.level.name}: ${rec.time}: ${rec.message}');
  });
}
