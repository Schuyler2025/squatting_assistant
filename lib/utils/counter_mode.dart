import 'package:scidart/numdart.dart';

class SquatAccurateCounter {
  List<double> accelZ;
  List<double> gyroYaw;
  double accelThreshold;
  double angleThreshold;
  int minTimeGap;

  SquatAccurateCounter({
    required this.accelZ,
    required this.gyroYaw,
    this.accelThreshold = 0.1,
    this.angleThreshold = 5,
    this.minTimeGap = 7,
  });

  int countSquats() {



    int squatCount = 0;
    String state = "stand";
    int lastSquatTime = -minTimeGap;

    for (int i = 1; i < accelZ.length; i++) {
      double accelDiff = accelZ[i] - accelZ[i - 1];


      if (state == "stand" &&
          accelDiff < -accelThreshold &&
          gyroYaw[i].abs() > angleThreshold) {
        state = "squatting"; // 开始下蹲

      } else if (state == "squatting" &&
          accelDiff < -accelThreshold &&
          gyroYaw[i].abs() > angleThreshold) {
        state = "lowest"; // 达到最低点


      } else if (state == "lowest" &&
          accelDiff > accelThreshold &&
          gyroYaw[i].abs() < angleThreshold) {
        state = "standing_up"; // 开始起立


      } else if (state == "standing_up" && accelDiff > accelThreshold) {
        int currentTime = i;
        if (currentTime - lastSquatTime > minTimeGap) {
          squatCount += 1; // 完成一个深蹲动作
          lastSquatTime = currentTime;


        }
        state = "stand";
      }
    }
    

    return squatCount;
  }
}

List findPeaks(Array a, {double? threshold}) {
  var N = a.length - 2;
  var ix = Array.empty();
  var ax = Array.empty();

  if (threshold != null) {
    for (var i = 1; i <= N; i++) {
      if (a[i - 1] <= a[i] && a[i] >= a[i + 1] && a[i] >= threshold) {
        ix.add(i.toDouble());
        ax.add(a[i]);
      }
    }
  } else {
    for (var i = 1; i <= N; i++) {
      if (a[i - 1] <= a[i] && a[i] >= a[i + 1]) {
        ix.add(i.toDouble());
        ax.add(a[i]);
      }
    }
  }
  return ix;
}

class SquatCounter {
  Array zAccData;
  double heightThreshold;
  int timeThreshold;

  SquatCounter(
      {required this.zAccData,
      this.heightThreshold = 0.2,
      this.timeThreshold = 7});

  int countSquats() {
    // 寻找谷值和峰值的实现（可能需要根据具体的算法进行实现）
    final peaks = findPeaks(zAccData, threshold: heightThreshold);

    for (int i = 0; i < zAccData.length; i++) {
      zAccData[i] *= -1;
    }
    final valleys = findPeaks(zAccData, threshold: heightThreshold);

    int squatCount = 0;
    int i = 0, j = 0;

    while (i < valleys.length && j < peaks.length) {
      // 确保谷值在峰值之前
      if (valleys[i] < peaks[j]) {
        // 检查时间间隔是否合理
        if (peaks[j] - valleys[i] > timeThreshold) {
          squatCount += 1;
          i += 1;
        }
        j += 1;
      } else {
        j += 1;
      }
    }
    return squatCount;
  }
}
