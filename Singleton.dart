
import 'Builder.dart'
show 

CocktailBase,
CoctailTypeGlass,
CoctailTypeOfIce,
CoctailBasicIngredient,
CocktailGarnish;

class CocktailSingleton {
  static CocktailSingleton? _instance;

  String name = 'Coctail';
  CocktailBase typeGlass = const CocktailBase(CoctailTypeGlass.hurricane, CoctailTypeOfIce.piece);
  CoctailBasicIngredient basic = CoctailBasicIngredient.liker;
  int makingTime = 5;
  List<CocktailGarnish> garnish = <CocktailGarnish>[
    CocktailGarnish.flower,
    CocktailGarnish.lime,
  ];

  CocktailSingleton._();

  static CocktailSingleton getInstance() {
    return _instance ??= CocktailSingleton._();
  }

  @override
String toString() {
  var infoStr = 'Название коктейля : $name \n';
  infoStr += typeGlass.toString();
  infoStr += 'Basic ingredient ${basic.toString().split('.')[1]} \n';
  infoStr += 'гарнир : (';
  garnish.forEach((element) {
    
    infoStr += element.toString().split('.')[1] + ',';
   });
  infoStr += ')\n';
  infoStr += 'Время ожидания : $makingTime min';
  return infoStr;
 }
}

void main(){
  var coctail = CocktailSingleton.getInstance();
  print(coctail);


  print ('---' * 20);

  coctail.name = 'newCoctail';
  var newCoctail = CocktailSingleton.getInstance();
  print(identical(coctail, newCoctail));
  print('---' * 20);
  print(newCoctail);
}
