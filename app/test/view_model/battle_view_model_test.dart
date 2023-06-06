import 'package:app/models/battle_info_model.dart';
import 'package:app/view_models/battle_view_model.dart';
import 'package:app/widgets/battle/battle.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('BattleView', () {
    late BattleViewModel viewModel;
    late BattleInfo battleInfo;

    setUpAll(() async {
      viewModel = BattleViewModel();

      // Given
      battleInfo = await viewModel.startBattle('pikachu');
    });

    test('Should get battle information', () {
      expect(viewModel.dialogue, isNotNull);
      expect(viewModel.gameOver, isNotNull);
      expect(viewModel.isLoading, isNotNull);
      expect(viewModel.opponentInfo, isNotNull);
      expect(viewModel.userInfo, isNotNull);
    });

    test('Should play a move', () async {
      await viewModel.playMove(battleInfo.p1.moves[0].name);

      expect(viewModel.dialogue, isNot(contains('has appeared!')));
    });

    test('Should have hp 0 when fleeing', () async {
      await viewModel.playMove('flee');

      expect(viewModel.userInfo.currentHp, 0);
    });
  });
}
