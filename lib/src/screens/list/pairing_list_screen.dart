import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/components/table/app_table_checkbox.dart';
import 'package:flutter_application_1/src/screens/list/pairing_list_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PairingListScreen extends ConsumerStatefulWidget {
  const PairingListScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<PairingListScreen> createState() => _PairingListState();
}

class _PairingListState extends ConsumerState<PairingListScreen> {
  final _provider = PairingListNotifier.provider;

  @override
  void initState() {
    ref.read(_provider.notifier).init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var readNotifier = ref.read(_provider.notifier);

    void onClickTab(bool disabled) {
      // state = state.copyWith(isDisable: !disabled);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkbox Table Example'),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: CheckboxTable(
                handleChange: () {
                  readNotifier.onClickTab(false);
                },
              ),
            ),
          ),
          _widgetBottomContent(),
        ],
      ),
    );
  }

  Widget _widgetBottomContent() {
    var readNotifier = ref.read(_provider.notifier);
    var watchState = ref.watch(_provider);
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: watchState.isDisable
              ? null // Disable the button when isDisable is true
              : () {
                  // Handle button press when isDisable is false
                  print('button enabled');
                },
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.black,
            backgroundColor: watchState.isDisable ? Colors.grey : Colors.blue,
          ),
          child: const Text('Button'),
        )
      ],
    );
  }
}
