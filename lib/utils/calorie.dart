class Calorie {
  static double calculateCaloriesBurned(double weight, int reps, int time) {
    // 假设每次深蹲消耗的热量（千卡）
    double caloriesPerRep = 0.05;
    // 假设每分钟额外消耗的热量（千卡）
    double additionalCaloriesPerMinute = 0.02;
    // 体重因子
    double weightFactor = 0.005;
    //计算与体重相关的每次深蹲热量消耗
    double caloriesPerRepWithWeight = caloriesPerRep + (weight * weightFactor);

    // 计算基础热量消耗
    double baseCalories = reps * caloriesPerRepWithWeight;
    // 计算时间调整的额外热量消耗
    double timeAdjustedCalories = time * additionalCaloriesPerMinute;

    // 总热量消耗
    double totalCalories = baseCalories + timeAdjustedCalories;

    return totalCalories;
  }
}
