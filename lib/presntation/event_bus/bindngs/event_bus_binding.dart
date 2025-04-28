import 'package:flutter_task/presntation/event_bus/controller/event_bus_controller.dart';
import 'package:get/get.dart';

class EventBusBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EventBusController(),);
  }

}