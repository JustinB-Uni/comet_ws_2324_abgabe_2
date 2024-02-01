# Einlesen der Daten aus der cdata.csv-Datei
csv_daten <- read.table(
  file = "C:/Uni/WS_2023_2024/CoMet/CoMet_Abgabe_2/cdata.csv", # Pfad zur cdata.csv-Datei
  header = TRUE, # die Datei hat eine Kopfzeile
  sep = ",", # die Zellen sind durch Kommata getrennt
  dec="."
)
# Erstellen eines Datenrahmens aus den eingelesenen Daten
daten <- data.frame(csv_daten)

# Filtern der Daten für unsere Station
station_filtered <- subset(daten, station == "Maine Ave & 9th St SW")

# Schreiben der Daten unserer Station in eine neue CSV-Datei
write.csv(station_filtered, "C:/Uni/WS_2023_2024/CoMet/CoMet_Abgabe_2/station_filterd.csv", row.names = FALSE)

# Erneutes Einlesen der gefilterten Daten aus der erstellten CSV-Datei
csv_filtered_daten <- read.table(
  file = "C:/Uni/WS_2023_2024/CoMet/CoMet_Abgabe_2/station_filterd.csv", # Pfad zur .csv-Datei
  header = TRUE, # die Datei hat eine Kopfzeile
  sep = ",", # die Zellen sind durch Kommata getrennt
  dec="."
)

# Erstellen eines Datenrahmens aus den erneut eingelesenen gefilterten Daten
filtered_daten <- data.frame(csv_filtered_daten)

# Identifizieren der Zeilen mit mindestens einem NA-Wertn
rows_with_na <- which(apply(is.na(filtered_daten), 1, any))
print(rows_with_na)

#alle Zeilen mit NA-Werten entfernen
station_filtered_cleaned <- na.omit(station_filtered)
#testen
rows_with_na <- which(apply(is.na(station_filtered_cleaned), 1, any))
print(rows_with_na)

# Annahme: station_filtered_cleaned ist der Datenrahmen
spalte <- "wind_speed"
spalte <- "snow_depth"

# Durchschnittswert der ausgewaehlten Spalte berechnen
durchschnitt_wert <- round(mean(station_filtered_cleaned[[spalte]], na.rm = TRUE), 2)

# Ausgeben des berechneten Durchschnittswerts
print(durchschnitt_wert)

# Negative Werte in der ausgewaehlten Spalte ersetzen
station_filtered_cleaned[[spalte]] <- ifelse(station_filtered_cleaned[[spalte]] < 0, durchschnitt_wert, station_filtered_cleaned[[spalte]])

write.csv(station_filtered_cleaned, "C:/Uni/WS_2023_2024/CoMet/CoMet_Abgabe_2/station_filtered_cleaned_winddurchschnitt.csv", row.names = FALSE)

# Daten nach Monaten filtern (Juni, Juli & August)
station_summer_2022 <- subset(station_filtered_cleaned, format(as.Date(date, "%Y-%m-%d"), "%m") %in% c("06", "07", "08"))

# Ausgeben der gefilterten Daten für die Sommermonate
print(station_summer_2022)


