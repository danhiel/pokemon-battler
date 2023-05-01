# prereq: do `brew install lcov` for mac
flutter test --coverage
genhtml coverage/lcov.info -o coverage/html