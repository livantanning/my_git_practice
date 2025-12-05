import 'dart:math';

final Random random = Random();

// 1단계: 로또 번호 발급
List<int> generateLottoNumbers() {
  Set<int> numbers = {}; // 중복 방지 Set 사용

  while (numbers.length < 6) {
    int n = random.nextInt(45) + 1; // 1~45 사이 숫자
    numbers.add(n);                 // Set : 중복이면 무시됨
  }

  List<int> lotto = numbers.toList();
  lotto.sort(); // 숫자 정렬
  return lotto;
}

// 2단계: 당첨 번호와 비교하여 등수 판정
String checkLottoRank(List<int> myLotto, List<int> winningNumbers) {
  // 교집합 개수 구하기
  int matchCount =
      myLotto.where((number) => winningNumbers.contains(number)).length;

  // 개수에 따른 등수 판정
  if (matchCount >= 5) { 
    return '1등'; //5개 이상 일치
  } else if (matchCount == 4) {
    return '2등'; //4개 이상 일치
  } else if (matchCount == 3) {
    return '3등'; //3개 이상 일치
  } else {
    return '당첨 실패!'; // 그 외 실패 처리
  }
}

// 3단계: 로또 초기화
List<int> resetLotto() {
  return []; // 빈 칸으로 초기화
}

void main() {
  print('도전 문제');
  // 1단계: 로또 번호 발급
  List<int> myLotto = generateLottoNumbers();
  print('발급한 로또 번호 : $myLotto');

  // 2단계: 당첨 여부 확인
  List<int> winningNumbers = [9, 19, 29, 35, 37, 38];
  String result = checkLottoRank(myLotto, winningNumbers);
    
  if (result == '당첨 실패!') {
    print('당첨 여부 : 당첨 실패!');
  } else {
    print('당첨 여부 : $result');
  }

  // 3단계: 로또 초기화
  myLotto = resetLotto();
  print('현재 발급한 로또 번호: $myLotto');
}