
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
    bool isCleaning = false;
    robot_nettoyeur(String name, String model, String year) : super( name, "nettoyeur", model, year);

    void Clean() {
    isCleaning = true;
    print('$name est en cours de nettoyage.');
  }

  // Méthode pour arrêter le nettoyage
  void StopCleaning() {
    isCleaning = false;
    print('$name a arrêté le nettoyage.');
  }
 }