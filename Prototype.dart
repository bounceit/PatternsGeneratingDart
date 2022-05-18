
import 'Builder.dart'
show 

CocktailBase,
CoctailTypeGlass,
CoctailTypeOfIce,
CoctailBasicIngredient,
CocktailGarnish;

abstract class IPrototype {
  Cocktail clone();
}

class Cocktail implements IPrototype {
 String name;
  CocktailBase typeGlass;
  CoctailBasicIngredient base ;
  int makingTime;
  List<CocktailGarnish> garnish;

  Cocktail({
    this.name = 'Mohito',
    this.typeGlass = const CocktailBase(CoctailTypeGlass.hurricane, CoctailTypeOfIce.crush) ,
    this.makingTime = 8,
    this.base = CoctailBasicIngredient.wiskey,
    required  this.garnish });

    factory Cocktail._fromCoctail(Cocktail coctail) {
      return Cocktail(
        name: coctail.name,
        typeGlass: CocktailBase(coctail.typeGlass.typeGlass, coctail.typeGlass.typeOfIce),
        makingTime: coctail.makingTime,
        base: coctail.base,
        garnish: [...coctail.garnish]);
    }
@override
String toString() {
  var infoStr = 'Название коктейля : $name \n';
  infoStr += typeGlass.toString();
  infoStr += 'Basic ingredient ${base.toString().split('.')[1]} \n';
  infoStr += 'гарнир : (';
  garnish.forEach((element) {
    
    infoStr += element.toString().split('.')[1] + ',';
   });
  infoStr += ')\n';
  infoStr += 'Время ожидания : $makingTime min';
  return infoStr;
  
 }

 @override
 Cocktail clone() {
   return Cocktail._fromCoctail(this);
 }
  
}

void main(){
  var coctail = Cocktail(name: 'Aperol', garnish:<CocktailGarnish>[
    CocktailGarnish.mint,
    CocktailGarnish.lime
  ]);
  print(coctail);
  print('---' * 20);
  var newCoctail = coctail.clone();
  newCoctail.garnish.add(CocktailGarnish.salt);
  print(newCoctail);
  print('----' * 4);
  print(coctail);
}