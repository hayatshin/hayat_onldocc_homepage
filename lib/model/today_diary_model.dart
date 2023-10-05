class TodayDiaryModel {
  final int index;
  final String title;
  final String description;
  TodayDiaryModel({
    required this.index,
    required this.title,
    required this.description,
  });
}

final todayDiaryList = [
  TodayDiaryModel(
      index: 0,
      title: "1. 신체 건강 관리",
      description: "하루 목표 걸음수를 설정하면\n달성하는 즉시 칭찬과 격려로\n성취감을 느끼며\n건강을 관리합니다."),
  TodayDiaryModel(
      index: 1,
      title: "2. 인지 능력 관리",
      description:
          "덧셈, 뺄셈의 간단한 산수 문제의\n정답을 맞추는 즉시\n칭찬과 격려로\n자신감을 얻으며\n인지 능력을 관리합니다."),
  TodayDiaryModel(
      index: 2,
      title: "3. 정신 건강 관리",
      description: "10개의 감정 이모티콘을 통해\n현재의 나의 감정이 어떠한지\n표현함으로써\n정신 건강을 관리합니다."),
  TodayDiaryModel(
      index: 3,
      title: "4. 사고 능력 관리",
      description:
          "일기, 추억, 시 등 하루 한번씩\n자유로운 글쓰기 활동으로\n생각을 정리하며\n사고 능력을 관리합니다."),
];
