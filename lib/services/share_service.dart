import 'package:permission_handler/permission_handler.dart';
import 'package:share_plus/share_plus.dart';
import 'package:yeliz/models/reward.dart';

class ShareService {
  Future<void> onShare(List<RewardModel> rewards) async {
    var status = await Permission.storage.status;
    if (status.isDenied) {
      await Permission.storage.request();
    }

    Map counts = Map.fromIterable(rewards, key: (element) => element.title, value: ((element) => 0));

    for (var element in rewards) {
      if (counts.containsKey(element.title)) {
        counts[element.title]++;
      }
    }

    String str = "İşte kazandığım ödüller!\n";

    for (var element in counts.entries.toList()) {
      str = str + "• " + element.value.toString() + " adet " + element.key.toString() + "\n";
    }

    print(counts);
    print(rewards);
    await Share.share(str);
  }
}
