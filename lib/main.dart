import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

void main() => runApp(CustomHeaders());

class CustomHeaders extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'),
        Locale('zh'),
        Locale('he'),
        Locale('ru'),
        Locale('fr', 'BE'),
        Locale('fr', 'CA'),
        Locale('ja'),
        Locale('de'),
        Locale('hi'),
        Locale('ar'),
        Locale('he'),
      ],
      locale: const Locale('fr','CA'),
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    );
  }
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ScheduleExample();
}

class ScheduleExample extends State<MyApp> {
  final CalendarController _controller=CalendarController();
  String? _headerText='';
  String? date;
  double? _width=0.0, cellWidth=0.0;
  String _string='';

  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width;
    cellWidth = _width! / 8;
    return  Scaffold(
        body: Padding(padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),child:
        Column(
            children: <Widget>[
              Container(
                color: const Color(0xFF381460),
                width: _width,
                height: 40,
                child: Text(_string,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 25, color: Colors.white)),
              ),
              Expanded(
                  child: SfCalendar(
                      headerHeight: 0,
                      controller: _controller,
                      view: CalendarView.month,
                      onViewChanged: (ViewChangedDetails viewChangedDetails) {
                        _headerText = DateFormat('MMMM yyyy', 'fr')
                            .format(viewChangedDetails
                            .visibleDates[viewChangedDetails.visibleDates
                            .length ~/ 2])
                            .toString();
                        _string = _headerText![0].toUpperCase() +
                            _headerText!.substring(1);
                        SchedulerBinding.instance.addPostFrameCallback((
                            duration) {
                          setState(() {});
                        });
                      }
                  ))
            ]
        ),
        ));
  }
}