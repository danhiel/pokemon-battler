# prereq: do `brew install lcov` for mac. Run this script from the root folder.
flutter test --coverage
genhtml coverage/lcov.info -o coverage/html