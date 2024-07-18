

String discountAmount({required double discountPercent, required double totalPrice}){
  double discountAmount = totalPrice * (discountPercent / 100);
  double discountedPrice = totalPrice - discountAmount;
  return discountedPrice.floor().toString();
}