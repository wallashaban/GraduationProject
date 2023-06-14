import 'package:graduation_project/core/utils/exports.dart';
import 'package:graduation_project/settings_notifications_module/presentation_layer/cotrollers/settings_notifications_state.dart';
import 'package:graduation_project/settings_notifications_module/presentation_layer/widgets/notification_widget.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../../authentication_module/presentaion_layer/widgets/cutom_circular.dart';
import '../../../medication_reminder_module/presentation_layer/Screens/no_internet_screen.dart';
import '../widgets/no_notification_widget.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<SettingsNotificationsCubit>(context);
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: StreamBuilder<Object>(
            stream: InternetConnectionChecker().onStatusChange,
            builder: (context, snapshot) {
              if (cubit.notifications == null &&
                  snapshot.data == InternetConnectionStatus.disconnected) {
                return const NoInternetScreen();
              } else {
                return BlocBuilder<SettingsNotificationsCubit,
                    SettingsNotificationsState>(
                  builder: (context, state) {
                    if (cubit.notifications == null) {
                      cubit.getAllNotifications();
                    }
                    if (cubit.notifications == null) {
                      return const CustomCircularProgress();
                    } else if (cubit.notifications!.isEmpty) {
                      return const NoNotificationWidget();
                    } else {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListView.builder(
                          itemBuilder: (context, index) => NotificationWidget(
                            notifications: cubit.notifications![index],
                          ),
                          itemCount: cubit.notifications!.length,
                        ),
                      );
                    }
                  },
                );
              }
            }),
      ),
    );
  }
}
