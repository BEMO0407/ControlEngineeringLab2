# Laborbericht Control Engineering – Lab 2 „Temperature Control“

Laborbericht (MCI, MECH-B-5-REG-REG2-ILV) mit der MCI-Klasse `mcidoc` (`state=Report`).
Formalkriterien und Festlegungen stehen in `CLAUDE.md`.

## Aktuelles PDF ansehen
Der kompilierte Bericht liegt als [`main.pdf`](main.pdf) im Hauptordner.
- **Ohne Installation:** auf GitHub in der Dateiliste auf `main.pdf` klicken.
- **Lokal:** nach `git pull` (siehe unten) liegt `main.pdf` im Repo-Ordner.

## Anleitung: am Bericht mitarbeiten

### 1. Einmalig einrichten
1. **Programme installieren**
   - [Git für Windows](https://git-scm.com/download/win) (bringt Git Bash mit)
   - [MiKTeX](https://miktex.org/download): bei der Installation „Missing packages: install
     automatically“ (fehlende Pakete automatisch installieren) wählen
   - [Strawberry Perl](https://strawberryperl.com/): wird von `latexmk` benötigt
   - [VS Code](https://code.visualstudio.com/) mit der Erweiterung **LaTeX Workshop**
2. **GitHub-Zugang:** Einen GitHub-Account anlegen und von Benedikt (`BEMO0407`) als
   Collaborator zum Repository hinzufügen lassen. Die Einladung per E-Mail annehmen.
3. **Name für Commits festlegen** (Git Bash öffnen):
   ```bash
   git config --global user.name "Vorname Nachname"
   git config --global user.email "deine@mail.at"
   ```
4. **Repository herunterladen:** In Git Bash in den gewünschten Ordner wechseln und
   ```bash
   git clone https://github.com/BEMO0407/ControlEngineeringLab2.git
   ```
   Beim ersten Mal öffnet sich ein Browser-Fenster zur GitHub-Anmeldung.
5. Den Ordner `ControlEngineeringLab2` in VS Code öffnen (*File → Open Folder*).

### 2. Jedes Mal vor dem Arbeiten: neuesten Stand holen
```bash
git pull
```
Damit hast du alle Änderungen der anderen, auch das aktuelle `main.pdf`.

### 3. Bearbeiten
| Was | Wohin |
|---|---|
| Metadaten (Namen, Datum, Betreuung …) | `main.tex`, Block `\SetMCI{...}` |
| Text | `chapters/` (ein Kapitel pro Datei) |
| Bilder | `img/` |
| Messdaten für Diagramme (CSV) | `data/` |
| Quellen | `references.bib` |
| Neue Formelzeichen | Tabelle „List of Symbols“ am Ende von `main.tex` |
| MATLAB-Skripte, Simulink-Modelle, `.mat`-Messdaten | Hauptordner |

Fertige Blöcke für Tabellen, Abbildungen, Gleichungen usw. stehen in `Vorlagen.tex`
(Vorschau: `Vorlagen.pdf`).

### 4. Kompilieren
- **VS Code:** `main.tex` öffnen und speichern (LaTeX Workshop baut automatisch) oder
  `Strg+Alt+B`. Die Vorschau öffnet sich mit `Strg+Alt+V`.
- **Terminal:** `latexmk -pdf main.tex`

Beim ersten Kompilieren lädt MiKTeX fehlende Pakete nach, das dauert einige Minuten.

### 5. Hochladen
Nach dem Kompilieren (damit `main.pdf` aktuell ist):
```bash
git add -A
git commit -m "Kurz beschreiben, was geändert wurde"
git push
```

### Wenn etwas schiefgeht
- **`git push` wird abgelehnt** („rejected“, „fetch first“): Jemand anderes hat inzwischen
  gepusht. `git pull` ausführen, danach erneut `git push`.
- **Konflikt in `main.pdf`:** Einfach neu kompilieren, dann
  `git add main.pdf`, `git commit` und `git push`.
- **Konflikt in einer `.tex`-Datei:** VS Code markiert die Stelle. Die richtige Version
  auswählen, speichern, dann `git add`, `git commit` und `git push`.
- **`.slx`- und `.mat`-Dateien** lassen sich nicht zusammenführen. Vorher absprechen, wer
  welches Modell bearbeitet.
- **Unsicher?** Lieber vorher in der Gruppe fragen als `--force` verwenden.

## Bereits in der Vorlage umgesetzt
- Seitennummerierung römisch / arabisch / römisch, auch auf Kapitel-Startseiten (M010)
- Verzeichnisse am Ende, Formelzeichenverzeichnis (List of Symbols) mit `booktabs`
- siunitx mit Dezimalpunkt und `±` für Unsicherheiten (M030, M031)
- IEEE-Zitierstil mit biblatex (M080), englische Anführungszeichen
- Kompakterer Zeilenabstand in Tabellen, Umgebung `legendtable` für Gleichungslegenden (M042)
- Anhang mit römischer Seitenzählung (in `main.tex` einkommentieren)
