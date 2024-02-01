# Funktion zur Berechnung der Wahrscheinlichkeit des Unglueckfalls
wichtel_unglueck <- function(n, k, iterationen = 1000) {
  # Überprüfung, ob n, k und iterationen numerische Werte sind
  if (!is.numeric(n) || !is.numeric(k) || !is.numeric(iterationen)) {
    stop("Wert muss nummerisch sein")
  }
  # Überprüfung, ob n größer als 0 ist
  if (n <= 0) {
    stop("n muss größer als 0 sein")
  }
  # Überprüfung, ob iterationen größer als 0 ist
  if (iterationen <= 0) {
    stop("iterationen muss größer als 0 sein")
  }
  # Die Variable zur Zählung der Ungluecksfälle wird initialisiert 
  ungluecksfall <- 0
  
  # Iteration über die Anzahl der Durchlaeufe
  for (i in 1:iterationen) {
    # Die Geschenke werden zufällig zu den Personen geordnet 
    geschenke <- sample(1:n)
    
    # Anzahl der Personen, die ihr eigenes Geschenk haben
    count <- sum(1:n == geschenke)
    
    # Überprüfung, ob genügend Personen ihr eigenes Geschenk erhalten haben, um als Ungluecksfall zu gelten
    if (count >= k) {
      # Falls ja, Ungluecksfall zaehlen
      ungluecksfall <- ungluecksfall + 1
    }
  }
  
  # Berechnung der Wahrscheinlichkeit mit der mindestens k unter n Personen ihr eigenes Geschenk zurückerhalten
  wahrscheinlichkeit <- ungluecksfall / iterationen
  # berechnete Wahrscheinlichkeit wird zurückgegeben
  return(wahrscheinlichkeit)
}

# Anzahl der Personen
n <- 10
# beispielhafte Mindestanzahl von Personen, die ihr eigenes Geschenk haben müssen
k <- 2 
# Aufruf der Funktion & Berechnung der Wahrscheinlichkeit
ergebnis <- wichtel_unglueck(n, k)