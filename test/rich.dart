// void main(){
//   String src = "这是一段测试文字";
//   String part1 = src.substring(0,4);
//   String part2 = src.substring(4,6);
//   String part3 = src.substring(6,8);
//   print("[$part1,$part2,$part3]");
// }
void main(){
  String src = '这是一段测试代码，我要测试测试，看能不能测试通过。';
  String pattern = '一段';
  List<String> parts = src.split(pattern);
  print(parts);
}