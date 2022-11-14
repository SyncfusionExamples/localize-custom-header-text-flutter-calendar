# How to localize the custom headers text in the Flutter Calendar?

This example demonstrates how to localize the custom headers text in the Flutter Calendar

## Adding custom headers

Refer to this [KB](https://www.syncfusion.com/kb/10997/how-to-add-custom-header-and-view-header-in-the-flutter-calendar) for adding custom headers in the Flutter event calendar.

## Localize cutsom header text

Using DateFormat, you can localize the custom header and update the header with the specified locale using the [onViewChanged](https://help.syncfusion.com/flutter/calendar/callbacks#view-changed-callback) callback.

```
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
SchedulerBinding.instance!.addPostFrameCallback((
duration) {
setState(() {});
});
}
))

```
You can also refer our UG documentation to know more about [Localization](https://help.syncfusion.com/flutter/calendar/localization) support in the Flutter calendar.

## Requirements to run the demo
* [VS Code](https://code.visualstudio.com/download)
* [Flutter SDK v1.22+](https://flutter.dev/docs/development/tools/sdk/overview)
* [For more development tools](https://flutter.dev/docs/development/tools/devtools/overview)

## How to run this application
To run this application, you need to first clone or download the ‘create a flutter maps widget in 10 minutes’ repository and open it in your preferred IDE. Then, build and run your project to view the output.

## Further help
For more help, check the [Syncfusion Flutter documentation](https://help.syncfusion.com/flutter/introduction/overview),
 [Flutter documentation](https://flutter.dev/docs/get-started/install).