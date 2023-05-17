import 'package:graduation_project/core/utils/exports.dart';
import 'package:graduation_project/settings_notifications_module/presentation_layer/cotrollers/reports_state.dart';
import 'package:graduation_project/settings_notifications_module/presentation_layer/cotrollers/settings_notifications_cubit.dart';
import 'package:graduation_project/settings_notifications_module/presentation_layer/widgets/notification_widget.dart';

import '../../../authentication_module/presentaion_layer/widgets/cutom_circular.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<SettingsNotificationsCubit>(context);
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
    body:
            BlocBuilder<SettingsNotificationsCubit, SettingsNotificationsState>(
          builder: (context, state) {
            if (state is GetAllNotificationsLoadingState) {
              return const Center(child: CustomCircularProgress());
            }
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                itemBuilder: (context, index) => NotificationWidget(
                  notifications: cubit.notifications[index],
                ),
                itemCount: cubit.notifications.length,
              ),
            );
          },
        ),
      ),
    );
  }
}
