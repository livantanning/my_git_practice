void main() {
  
  Map<String, int> price = {
    "티셔츠": 10000,
    "바지" : 8000,
    "모자": 4000};
  
  double sum = 0;
  double discountrate = 0.1;
  
  List<String> carts = ["티셔츠", "바지", "모자", "티셔츠", "바지"];   for (var cart in carts){
  sum = sum + price[cart]!;
  }
  if(sum > 20000){
  print("장바구니에 ${sum.toInt()}원 어치를 담으셨네요 !");
  print("할인금액 : ${(sum * discountrate).toInt()}원");
  print("최종적으로 결제하실 금액은 ${(sum-(sum * discountrate)).toInt()}원 입니다 !");
}
}