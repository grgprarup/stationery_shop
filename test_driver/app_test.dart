import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';

import 'steps/login_step.dart';

Future<void> main() {
  final config = FlutterTestConfiguration()
    ..features = ['test_driver/features/login.feature']
    ..reporters = [
      ProgressReporter(),
      TestRunSummaryReporter(),
      JsonReporter(path: './report.json')
    ]
    ..stepDefinitions = [
      userLogsInWithUsernameAndPassword()
    ]
    ..customStepParameterDefinitions = []
    ..restartAppBetweenScenarios = true
    ..build = true
    ..keepAppRunningAfterTests = false
    ..targetAppPath = "test_driver/app.dart";
  return GherkinRunner().execute(config);
}
