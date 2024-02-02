# Funktion zur Berechnung der Wahrscheinlichkeit des Unglückfalls
wichtel_unglueck <- function(n, iterationen) {
  # Die Variable zur Zählung der Unglücksfälle wird initialisiert 
  ungluecksfall <- 0
  
  # Iteration über die Anzahl der Durchläufe
  for (i in 1:iterationen) {
    # Die Geschenke werden zufällig zu den Personen geordnet 
    geschenke <- sample(1:n,)
    
    # Überprüfung, ob eine Person ihr eigenes Geschenk hat
    for (person in 1:n) {
      if (person == geschenke[person]) {
        # Falls ja, unglücklichen Fall zählen & Beendung der Schleife
        ungluecksfall <- ungluecksfall + 1
        break
      }
    }
  }
  
  # Wahrscheinlichkeit wird berechnet
  wahrscheinlichkeit <- ungluecksfall / iterationen
  # berechnete Wahrscheinlichkeit wird zurückgegeben
  return(wahrscheinlichkeit)
}
# Anzahl der Personen
n <- 10
# Anzahl der Iterationen
iterationen <- 100000
# Aufruf der Funktion & Speicherung des Ergebnisses
ergebnis <- wichtel_unglueck(n, iterationen)


