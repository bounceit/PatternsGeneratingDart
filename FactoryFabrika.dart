


enum cocktailChoise {longIslad, negroni, jtonic}

 abstract class Cocktail{
  final int ml;
  final String name;

  Cocktail({required this.name, required this.ml});
  
  double costCoctail();

  @override
  toString() {
    return ('Коктейль $name имеет объём в $ml ml ');
  }
}

class LongIslad extends Cocktail{
  final double size;

  LongIslad(String name, int ml, this.size,) : super(name: name, ml: ml);

  @override
  double costCoctail(){
    return ml * size.toDouble();
  }
}

class Jtonic extends Cocktail{
  final double howManyTonic = 2;

  Jtonic(String name, int ml,) : super(ml: ml, name: name);

  @override
  double costCoctail(){
return(ml *  howManyTonic).toDouble();
  }
}

class Negroni extends Cocktail{
  final double cost;

  Negroni(String name, int ml, this.cost) : super(ml: ml, name: name); 

  @override
  double costCoctail(){
    return cost.toDouble();
  }
}

class CocktailFactory{
  static Cocktail factory(cocktailChoise coctailType ) {
    switch (coctailType) {
      case cocktailChoise.longIslad:
       return LongIslad("Long Island", 320, 2);
      case cocktailChoise.jtonic:
       return Jtonic("Jin Tonic", 140);
      case cocktailChoise.negroni:
       return Negroni("Negroni", 90, 150);
      default:
       throw ArgumentError();
    }
  }
}

void main(){
  for(var value in cocktailChoise.values) { 
    var coctail = CocktailFactory.factory(value);
    print(coctail.toString() + "Со стоимостью = " + coctail.costCoctail().toString());
  }
}