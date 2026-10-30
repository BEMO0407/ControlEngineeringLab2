# Vorlage Laborbericht (MCI)

LaTeX-Vorlage für Laborberichte mit der MCI-Klasse `mcidoc` (`state=Report`), abgestimmt auf die
MCI-Formalkriterien (M-Codes, siehe `CLAUDE.md`).

## Verwendung
1. Repository kopieren bzw. als Template verwenden.
2. In `main.tex` die Metadaten in `\SetMCI{...}` anpassen (Namen, Matrikelnummern, Betreuung,
   Kohorte, Lehrveranstaltung, Datum).
3. In `CLAUDE.md` die Projektangaben oben ausfüllen.
4. Text in `chapters/` schreiben, Bilder in `img/`, Messdaten als CSV in `data/`, Quellen in
   `references.bib`.
5. Kompilieren: `latexmk -pdf main.tex` (MiKTeX, biber; in VS Code mit LaTeX Workshop).

## Bereits umgesetzt
- Seitennummerierung römisch / arabisch / römisch, auch auf Kapitel-Startseiten (M010)
- Verzeichnisse am Ende, Formelzeichenverzeichnis (List of Symbols) mit `booktabs`
- siunitx mit Dezimalpunkt und `±` für Unsicherheiten (M030, M031)
- IEEE-Zitierstil mit biblatex (M080), englische Anführungszeichen
- Kompakterer Zeilenabstand in Tabellen, Umgebung `legendtable` für Gleichungslegenden (M042)
- Anhang mit römischer Seitenzählung (in `main.tex` einkommentieren)

## Kopiervorlagen
`Vorlagen.tex` (Vorschau: `Vorlagen.pdf`) enthält fertige Blöcke für Tabellen, Abbildungen,
pgfplots-Diagramme (schwarz-weiß-tauglich), Gleichungen mit Legende, Beispielrechnungen,
Zitate und das Formelzeichenverzeichnis. Beispielquellen aller Typen stehen in `Vorlagen.bib`.
