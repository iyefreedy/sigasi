import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:sigasi/routes/app_route.dart';

import 'package:sigasi/shared/widgets/posko_dropdown_button.dart';

@RoutePage()
class FilterKebutuhanScreen extends HookWidget {
  const FilterKebutuhanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final poskoState = useState<int?>(null);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Filter Kebutuhan'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          AutoRouter.of(context).push(FormKebutuhanRoute());
        },
        child: const Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          child: ListView(
            children: [
              PoskoDropdownButton(
                value: poskoState.value,
                onChanged: (value) {
                  poskoState.value = value;
                },
                validator: (value) {
                  if (value == null) {
                    return 'Silahkan pilih posko';
                  }

                  return null;
                },
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  AutoRouter.of(context)
                      .push(ListKebutuhanRoute(idPosko: poskoState.value));
                },
                child: const Text("Cari"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
