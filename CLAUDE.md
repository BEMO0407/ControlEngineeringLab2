# Projekt: Laborbericht (MCI) – Control Engineering, Lab 2 "Temperature Control"

- Lehrveranstaltung: MECH-B-5-REG-REG2-ILV
- Autor:innen: Benedikt Motzet (12313575), Urs Müller, Mathias Außerlechner;
  Betreuung: Lukas Wild
- Kohorte: BA-MECH-24_4C
- Laboranleitung: `Control_Engineering_3_Laboratory_2026.pdf`
- Seitenvorgabe laut Laboranleitung: max. 15 Seiten; Anhang zählt meist nicht.
  Discussion and Interpretation ist meist der wichtigste Teil → dort Platz lassen.
- LaTeX mit der MCI-Klasse `mcidoc.cls` (state=Report). Die .cls NICHT verändern.
- Bericht ist auf Englisch. Mit mir bitte auf Deutsch kommunizieren:
  kurz, direkt, Schritt für Schritt, nicht zu viele Schritte auf einmal.
- Bauen: VS Code + LaTeX Workshop, MiKTeX, latexmk, biber. Git über Git Bash.
- Ergebnisse: nur eigene Messungen und Berechnungen der Gruppe verwenden; keine
  eigenen Berechnungen/Simulationen von Claude als Ergebnisse einbauen.

## Struktur
- `main.tex`: Metadaten (\SetMCI), Kapitel-Includes, Verzeichnisse, Formelzeichen-Tabelle
- `chapters/`: ein Kapitel pro Datei (introduction, procedure, results, discussion, appendix)
- `img/`: Bilder, `data/`: Messdaten als CSV für pgfplots-Diagramme
- `references.bib`: Quellen, Zitierstil IEEE (biblatex)
- `Vorlagen.tex` / `Vorlagen.pdf`: Kopiervorlagen (Tabellen, Abbildungen, Gleichungen,
  Zitate, Formelzeichen); `Vorlagen.bib`: Beispiel-Quellen aller Typen

## Festlegungen für diesen Bericht
- Sprache: Englisch (mit der Betreuung absprechen, M014). Keine Mischsprache,
  auch nicht in Diagrammen und Bildern.
- Dezimaltrennzeichen: Punkt (siunitx `locale = UK`). Zahlen und Einheiten immer mit
  `\num{}`, `\qty{}`, `\unit{}` setzen.
- Gleichungen: grundsätzlich alle nummerieren (M040). Ausnahme Regelungstechnik: nur im
  Text referenzierte Gleichungen nummerieren (`equation`), alle anderen ohne Nummer
  (`equation*`). Dieser Bericht ist Regelungstechnik → Ausnahme gilt.
- Verweise im Text einheitlich: "Figure~\ref{}", "Table~\ref{}", "Equation~\eqref{}".
- Seitennummerierung (römisch/arabisch/römisch) und Verzeichnisse am Ende sind in
  `main.tex` bereits umgesetzt, nicht ändern.
- Formelzeichenverzeichnis: Tabelle "List of Symbols" am Ende von `main.tex`.
  Jedes neue Formelzeichen dort eintragen.
- Kurztitel für Verzeichnisse: `\caption[Kurztitel]{Langer Beschriftungstext}`.
- Tabellen mit `booktabs` (keine vertikalen Linien), sofern geladen.

---

# MCI-Formalkriterien für schriftliche Abgaben (verbindlich)

Codes M0xx entsprechen den Mängelnummern der MCI-Korrektur.

## 1. Äußere Form (19.1)
- M009 Ein- oder doppelseitiger Druck erlaubt.
- M010 Seitennummerierung:
  - Seiten vor dem Hauptteil (Inhaltsverzeichnis, Abstract, Kurzfassung): römisch (I, II, III …)
  - Hauptteil: durchgehend arabisch (1, 2, 3 …)
  - Abbildungs-, Tabellen-, Abkürzungs- und Listingverzeichnis sowie Anhang: wieder römisch,
    fortlaufend nach den Seiten vor dem Hauptteil
- M011 Abstract, Inhaltsverzeichnis und Kurzfassung werden als „Titel“ behandelt und nicht ins
  Inhaltsverzeichnis aufgenommen.
- M012 Das gesamte Dokument muss ohne Farbdruck bzw. als Kopie verständlich sein. In Diagrammen
  Linienarten unterscheiden (Volllinie, Strichlinie, Strichpunkt, Strich-Zweipunkt …) und in
  Legende oder Bildunterschrift erklären. Ausnahmen (z. B. FEM-Ergebnisplots) mit der Betreuung
  abklären.

## 2. Schriftsatz & Orthographie (19.2)
- M014 Sprache in erster Linie Deutsch, Englisch nach Absprache. Keine Mischsprache – das gilt
  auch für Diagrammbeschriftungen und Text in Bildern.
- M015 Gehäufte schwere Rechtschreib- oder Grammatikfehler = Grund für eine negative Bewertung.
- M016 Immer Blocksatz. Flattersatz wird nicht akzeptiert.
- M017 Kein Wechsel von Schriftgröße oder Schriftart im Fließtext, vor allem keine Mischung von
  Serifen- und serifenloser Schrift.
- M018 Konsistenz: überall gleiche Aufzählungszeichen, gleiche Einrückungen, Leerzeilen und
  Abstände.
  - Empfehlung: Zeilendurchschuss ca. 20 %, genug Weißraum, keine Hurenkinder und
    Schusterjungen (einzelne Zeilen am Seitenanfang oder -ende).
- M019 Unpersönliches Passiv, Präsens („The experiment is carried out“, nicht „We did …“),
  sofern nicht anders vorgegeben.
- M020 Geschlechtergerechte Formulierung.
- M021 Formeln siehe Abschnitt 6.
- M022 Fettdruck nur sporadisch, keine Unterstreichungen.

## 3. Größen & Einheiten (19.3, SI / DIN 1338)
- M023 Größenwert = Zahlenwert × Einheit. SI-Basiseinheiten und kohärent abgeleitete Einheiten
  verwenden (z. B. 50 m).
- M024 Größenzeichen kursiv (lateinisch oder griechisch): Länge x, Zeit t.
- M025 Einheitenzeichen aufrecht, kleingeschrieben. Ausnahmen: von Eigennamen abgeleitete
  Einheiten (A, V, N …); Liter darf L oder l sein.
- M026 Multiplikation von Einheiten mit Leerzeichen oder zentriertem Punkt (·), Division mit
  negativem Exponenten oder /: 1 g m⁻³.
- M027 Einheitennamen aufrecht, wie Substantive behandelt. Im Englischen klein (außer am
  Satzanfang).
- M028 Vorsatzzeichen aufrecht, ohne Leerzeichen vor der Einheit (mm, kN), nie allein, keine
  zusammengesetzten Vorsätze. Groß geschrieben werden alle Vorsätze für Vielfache außer da, h, k;
  Vorsätze für Teile sind klein.
- M029 Immer ein Leerzeichen zwischen Zahl und Einheit. Einzige Ausnahme: Winkelgrad
  (12.37°, 12°22'12").
  - Richtig: 1 mm s⁻¹ – Falsch: 1mms⁻¹, 1m m s⁻¹
  - Empfehlung: schmales, nicht umbrechendes Leerzeichen (in LaTeX über siunitx automatisch).
  - Empfehlung: siunitx (`\qty{50}{\milli\metre}`, `\unit{}`).
- M030 Dezimaltrennzeichen Punkt oder Komma – einheitlich in der ganzen Arbeit
  (hier: Punkt, siehe Festlegungen).
- M031 Messunsicherheit mit ± (U+00B1): 100.0 ± 1.2 g. Nicht +/- oder Ähnliches.
  In LaTeX: `\qty{100.0(12)}{\gram}` oder `\qty{100.0 \pm 1.2}{\gram}`.
- M032 Mindestens einmal pro Rechenschritt die Rechnung mit allen Einheiten zeigen
  (siehe Abschnitt 10).

## 4. Größen in Tabellen & Diagrammen (19.4)
- M035 Einheiten werden wie mathematische Objekte behandelt: T = 293 K ⇔ T/K = 293.
- M036 Tabellenkopf bzw. Achse als Quotient Größe/Einheit → in den Zellen stehen nur Zahlen.
- M037 Bei zusammengesetzten Einheiten runde Klammern. Eckige Klammern sind falsch.

| Richtig | Falsch |
|---|---|
| U/V, U in V | U [V] |
| E/(V/m), E in V/m | U in [V] |
| Volumenstrom/(m³ s⁻¹) | Volumenstrom/m³ s⁻¹ (ohne Klammer) |
| Zeit/s, Zeit in s | Zeit [s] |

## 5. Signifikante Stellen (19.5)
- M038 Nur so viele Stellen angeben, wie die Messgenauigkeit hergibt – auch in
  Zwischenergebnissen und Tabellen. Beispiel: 1000 g ÷ 3 = 333.3 g, nicht 333.3333333 g.
  1000 g + 0.01 g bleibt 1000 g.

## 6. Gleichungen (19.6)
- M039 Gleichungen zentriert.
- M040 Alle Gleichungen nummeriert, rechtsbündig in runden Klammern: entweder (1), (2) … oder
  (1.1), (1.2) … – einheitlich. Im Text mit einheitlichem Zusatz verweisen („Equation“ oder
  „Eq.“). **Ausnahme Regelungstechnik: nur Gleichungen nummerieren, auf die im Text verwiesen
  wird** (nur für Regelungstechnik-Berichte).
- M041 Alle Formelzeichen erläutern (z. B. im Fließtext).
- M042 Zentrale Gleichungen (Grundlagen, keine bloßen Umformungen) bekommen eine Legende mit
  allen Größen und Einheiten.
- M043 Gleichungen mit Formeleditor oder LaTeX setzen. Kein 10^6, keine Bruchstriche aus
  Bindestrichen.
- M044 Keine Screenshots von Gleichungen.
- M045 Kursiv: Variablen (x) und frei definierte Funktionen (f(x)). Aufrecht: Zahlen, Funktionen
  mit fester Bedeutung (sin, lg, ln), π, chemische Formeln.
- M046 Skalare, Vektoren und Matrizen einheitlich unterscheidbar darstellen (z. B. b, **v**, **A**).
- M047 Auf Hoch- und Tiefstellung sowie Groß- und Kleinschreibung achten (CO₂, H₂O, pH, HCl –
  nicht Co2, H2O, PH, HCL).
- M048 Formelzeichen überall identisch verwenden, auch im Fließtext und inkl. Kursivschrift.
- M049 Formelzeichenverzeichnis am Ende der Arbeit: alle Zeichen mit Einheit, bei Konstanten mit
  Wert. Indizes nicht einzeln aufführen (nur T, nicht T_A, T_E), keine Operatoren (Δ, Σ) und
  keine mathematischen Konstanten (π, e).
- M050 Multiplikation: implizit (3x) oder zentrierter Punkt (3 · x). Kein kleines x. Asterisk (*)
  verboten. Einheitlich bleiben.
  - Empfehlung: Variablen kursiv, Konstanten aufrecht (Radius R vs. Gaskonstante R).

## 7. Tabellen (19.7)
- M051 Jede Tabelle hat Nummer + Überschrift ÜBER der Tabelle, mit einheitlichem Zusatz
  („Table“).
  - Empfehlung: Überschrift etwas kleiner als der Fließtext (in der Vorlage bereits so).
- M052 Aussagekräftige Beschriftung, die ohne Fließtext verständlich ist („Comparison of
  measured and simulated step responses“, nicht „Table 3“ oder „Experiment 7“).
- M053 Jede Tabelle wird im Text referenziert, sonst weglassen. Einheitlicher Zusatz.
- M054 Tabellenverzeichnis am Ende der Arbeit. Kurztitel max. eine Zeile, ohne Quellenangaben
  (LaTeX: `\caption[Kurztitel]{Langtitel [n]}`).
- M055 Immer Einheiten angeben.
- M056 Nur sinnvolle Genauigkeit (vgl. M038).
- M057 Einzelne Tabellen zentriert; mehrere nebeneinander mit ausgewogenem Abstand (z. B. je
  40 % der Breite). Tabellen nicht breiter als der Satzspiegel.
  - Empfehlungen: bei großen Tabellen jede zweite Zeile grau hinterlegen; nicht über mehrere
    Seiten (sonst Überschrift auf der Folgeseite wiederholen); sparsam mit Linien, möglichst
    keine vertikalen Linien (LaTeX: booktabs); überfüllte Tabellen aufteilen.

## 8. Abbildungen & Diagramme (19.8)
- M058 Jede Abbildung (auch selbst erstellte Diagramme) hat Nummer + Bildunterschrift UNTER der
  Abbildung, mit einheitlichem Zusatz („Figure“).
  - Empfehlung: Bildunterschrift etwas kleiner als der Fließtext (in der Vorlage bereits so).
- M059 Aussagekräftige Bildunterschrift („Step response of the closed loop“, nicht
  „Diagram 4“).
- M060 Jede Abbildung wird im Text referenziert, sonst weglassen.
- M061 Kein Diagrammtitel im Bild selbst (MATLAB-/Excel-Titel entfernen); die Bildunterschrift
  übernimmt diese Funktion.
- M062 Abbildungen zentriert.
- M063 Regressionskurven nur mit physikalisch begründetem Zusammenhang (kein beliebiges Polynom
  hoher Ordnung). Messpunkte immer zeigen, auch wenn eine Regression eingezeichnet ist.
- M064 Abbildungsverzeichnis: Kurztitel max. eine Zeile, ohne Quellenangaben.
- M065 Achsen immer mit Größe und Einheit beschriften (z. B. t/s, U/V).
- M066 Bei mehr als einer Datenreihe Legende.
- M067 Achsenbereich so wählen, dass das Diagramm gut ausgenutzt wird.
- M068 Bei fehlerbehafteten Größen Fehlerbalken.
  - Empfehlungen: Seitenverhältnis goldener Schnitt (1.618 : 1); einheitliche
    Abbildungsbreite (z. B. 60 % der Textbreite); einheitliche Schriftart und -größe in allen
    Abbildungen; Vektorgrafiken (PDF/SVG/EPS) statt Rastergrafiken.

## 9. Materialien & Versuchsskizze (19.9)
- M086 Bei Versuchen: Materialliste + beschriftete Versuchsskizze. Die Skizze erfüllt alle
  Abbildungskriterien, alle Elemente sind beschriftet, Größen erklärt, einheitliche Schrift und
  Pfeile, Vektorgrafik.
- M087 Chemikalien mit Konzentration angeben (Summenformel hilfreich). Trivialnamen nur zusammen
  mit systematischem Namen, außer bei breit akzeptierten Namen.
- M088 So genau, dass der Versuch nachgestellt werden kann: Gefäßgrößen, Reinheit,
  Gerätepräzision, Hersteller/Typ.
  - Empfehlung: Gliederung in Arbeitsutensilien / Reagenzien / Geräte (mit Anzahl, Größe, Typ,
    Präzision).

## 10. Rechenweg (19.11)
- M099 Für jeden Berechnungsschritt einmal ausführlich an einem Beispiel zeigen; analoge
  Rechnungen danach ohne Weg.
- M100 Die Beispielrechnung steht in Methoden, Ergebnisse, einem eigenen Kapitel oder im Anhang.
- M101 Beispielrechnung mit allen Einheiten durchrechnen, mit Bezug auf die verwendeten
  Messdaten (z. B. „Measurement #1 in Table x“).
  - Falsch: „The constant was calculated: K = 0.81.“

## 11. Quellenangaben (19.12)
- M069 Übernommene Gedanken, Inhalte, Argumentationen, Abbildungen und Tabellen immer zitieren,
  möglichst aus der Originalquelle (nicht Sekundärzitat).
- M070 Quellenangabe nah am zitierten Objekt (Satz, Bild, Tabelle).
- M071 Zitation mit arabischer Zahl in eckigen Klammern: „… is not my own idea [12].“ Andere
  Formen nur auf ausdrückliche Anweisung; die gewählte Form einheitlich durchziehen.
- M073 Wörtliche Zitate in technischen Arbeiten nur sehr selten, stattdessen sinngemäß
  wiedergeben.
- M074 Kurze wörtliche Zitate: im Fließtext, in Anführungszeichen, kursiv.
- M075 Lange wörtliche Zitate: eigener Absatz, links (bei Blocksatz auch rechts) eingerückt,
  geringerer Zeilenabstand. Zeichengetreu; Auslassungen […], eigene Ergänzungen [in eckigen
  Klammern], Besonderheiten [sic], direkte Rede im Zitat in einfachen Anführungszeichen.
- M077 Quellen als Endnoten, also Literaturverzeichnis am Ende der Arbeit.
- M078 Reihenfolge im Verzeichnis = Reihenfolge des ersten Auftretens im Text.
- M079 Pflichtangaben (soweit zutreffend): Urheber, Titel, Verlag (Buch), Journal, Jahr, Ort
  (Buch), Auflage bzw. Ausgabe, Seitenzahl (Journal), Institution (Abschlussarbeiten, Skripten,
  Firmenunterlagen), Link + Datum der Einsichtnahme (online), empfohlen: DOI. Bei Büchern keine
  genaue Seitenzahl nötig.
- M080 Zitierstil: IEEE (in LaTeX: biblatex mit `style=ieee`, in diesem Projekt eingerichtet).
- M081 Internetquellen nur in Ausnahmefällen, gedruckte Quellen bevorzugen. Wikipedia u. Ä.
  niemals als Quelle.

Beispiele:
- Buch, richtig: Streitwieser, A.; Heathcock, C.; Kosower, E.: Organische Chemie, 2. Auflage.
  VCH Verlagsgesellschaft mbH, Weinheim, 1994 – falsch: Streitwieser: Organische Chemie, VCH
- Journal, richtig: Tordjeman, Ph.; Robert, C.; Marin, G.; Gerard, P.: The effect of α,β
  crystalline structure … In: The European Physical Journal E 4 (2001), S. 459–465
- Skript, richtig: Wüthrich, K.: Skriptum zur Lehrveranstaltung Nuklear-Magnet-Resonanz.
  ETH Zürich, 2002

Plagiat (Ausschlussgrund aus dem Studium):
- M102 Vollplagiat – ganze Absätze ohne Hinweis übernommen
- M103 Verschleierung – Paraphrasieren, um die Übernahme zu verbergen
- M104 Strukturplagiat – Struktur, Aufzählungen oder Tabellen übernommen
- M105 Übersetzungsplagiat – übersetzt ohne Quellenangabe
- M106 Teilplagiat – einzelne Sätze oder Formulierungen übernommen
- M107 Selbstplagiat – eigene frühere Texte ohne Hinweis wiederverwendet
- M108 Zitate gleich beim Schreiben setzen. Wird ein ganzer Absatz sinngemäß übernommen, das
  explizit kennzeichnen („The following paragraph is based on [7]“), nicht nur am Absatzende
  zitieren. Alle Quellen nennen, auch Skripten und Laborberichte von Kommiliton:innen.
- M109 Bei mehreren Autor:innen müssen alle auf dem Deckblatt stehen; alle haften für die
  gesamte Arbeit.

---

## 12. Prüf-Checkliste (wenn ich um einen Formal-Check bitte)

Die Arbeit systematisch durchgehen und jeden Mangel mit M-Code und Fundstelle (Datei + Zeile)
melden:

- [ ] Aufbau gemäß Laboranleitung; keine Logos
- [ ] Seitennummerierung römisch/arabisch/römisch (M010); Abstract/IVZ nicht im IVZ (M011)
- [ ] Schwarz-Weiß-tauglich (M012)
- [ ] Blocksatz, eine Schrift, konsistente Formatierung (M016–M018)
- [ ] Passiv + Präsens, keine Ich-/Wir-Form (M019); keine Mischsprache (M014); keine
      Unterstreichungen (M022)
- [ ] Leerzeichen zwischen Zahl und Einheit (M029); Einheiten aufrecht, Größen kursiv (M024/M025)
- [ ] Einheitliches Dezimalzeichen, hier Punkt (M030); ± statt +/- (M031)
- [ ] Keine eckigen Klammern bei Einheiten in Tabellenköpfen und Achsen (M037)
- [ ] Sinnvolle signifikante Stellen (M038, M056)
- [ ] Gleichungen zentriert, nur referenzierte nummeriert (rechts, runde Klammern), Zeichen
      erklärt, Legende bei zentralen Gleichungen, kein * (M039–M050)
- [ ] Formelzeichenverzeichnis vorhanden und vollständig (M049)
- [ ] Tabellen: Überschrift oben, im Text referenziert, Einheiten, im Verzeichnis (M051–M057)
- [ ] Abbildungen: Unterschrift unten, im Text referenziert, kein Titel im Bild, Achsen mit
      Größe/Einheit, Legende, Fehlerbalken, Messpunkte sichtbar (M058–M068)
- [ ] Verzeichnis-Kurztitel einzeilig, ohne Quellen (M054/M064)
- [ ] Beispielrechnung mit Einheiten für jeden Rechenschritt (M099–M101)
- [ ] IEEE-Zitation, nummeriert nach Auftreten, [n] nah am Zitat, Pflichtfelder vollständig,
      Zugriffsdatum bei Online-Quellen, kein Wikipedia (M069–M081)
- [ ] Alle Autoren auf dem Deckblatt (M109)
