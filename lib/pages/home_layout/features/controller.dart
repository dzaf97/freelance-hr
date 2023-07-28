import 'package:get/get.dart';
import 'package:myezhr/models/company/announcement.dart';
import 'package:myezhr/repositories/company_repo.dart';

class FeatureController extends GetxController {
  final CompanyRepo companyRepo = CompanyRepo();
  RxList<Announcement> announcements = <Announcement>[].obs;

  @override
  void onInit() async {
    announcements.value = await companyRepo.getCompanyAnnouncement() ?? [];
    announcements.value = announcements.reversed.toList();
    super.onInit();
  }
}
