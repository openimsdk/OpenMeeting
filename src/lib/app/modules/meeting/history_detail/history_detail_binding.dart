import 'package:get/get.dart';

import '../../../data/services/repository/repository.dart';
import '../../../data/services/repository/repository_adapter.dart';
import 'history_detail_controller.dart';

class HistoryDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IMeetingRepository>(() => MeetingRepository());
    Get.lazyPut<HistoryDetailController>(
      () => HistoryDetailController(meetingInfo: Get.arguments['meetingInfo'], repository: Get.find()),
    );
  }
}
