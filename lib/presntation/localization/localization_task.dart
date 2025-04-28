import 'package:flutter/material.dart';
import 'package:flutter_task/presntation/localization/localnotifyer.dart';
import 'package:provider/provider.dart';

import '../../utils/app_localizations.dart';

class LocalizationTask extends StatefulWidget {
  const LocalizationTask({super.key});

  @override
  State<LocalizationTask> createState() => _LocalizationTaskState();
}

class _LocalizationTaskState extends State<LocalizationTask> {
  @override
  Widget build(BuildContext context) {
    var selectedLocale = Localizations.localeOf(context).toString();
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            Consumer<LocaleModel>(
              builder:
                  (context, localeModel, child) => DropdownButton(
                value: selectedLocale,
                items: [
                  DropdownMenuItem(
                    value: "en",
                    child: Text("English"), //
                  ),
                  DropdownMenuItem(
                    value: "es",
                    child: Text("Sapnis"),
                  ),
                  DropdownMenuItem(
                    value: "ja",
                    child: Text("Japanees"),
                  ),
                ],
                onChanged: (String? value) {
                  if (value != null) {
                    localeModel.set(Locale(value));
                  }
                },
              ),
            ),
            Text(AppLocalizations.of(context)!.hello)
          ],
        ),
      ),
    );
  }
}
