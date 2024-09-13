
class robot
 {
    String name;
    String type;
    String model;
    String year;
  
    robot(this.name, this.type, this.model, this.year);
 }

mixin robot_marcher
 {
    void marcher()
    {
      print("Je suis un robot et je marche");
    }
 }

class robot_nettoyeur extends robot with robot_marcher
 {
    robot_nettoyeur(String name, String model, String year) : super( name, "nettoyeur", model, year);
 }