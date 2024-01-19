## Languages
- [Čeština](https://github.com/BlodyxCZ/Hackathon2024/blob/simulation/Simulation/README.md#dokumentace)
- [English](https://github.com/BlodyxCZ/Hackathon2024/blob/simulation/Simulation/README.md#documentation)

# Dokumentace
### Tabulka obsahu
- Obecné informace
- Návod k použití

## Obecné informace
Jedná se o prostou spustitelnou aplikaci vytvořenou v enginu Godot pro simulaci dat projektu týmu Northern Wind v soutěži [Hackathon 2024](https://hackujstat.cz/).
Aplikace má vlastní GUI k rychlému testování různých dat, poslílaných na daný endpoint.
## Návod k použití
![Screenshot2](https://github.com/BlodyxCZ/Hackathon2024/blob/simulation/Simulation/screenshots/screenshot2.png)<br />
Nalevo je seznam senzorů, které budou poslány při zmáčknutí POST. Jednotlivé senzory je možno odebrat kliknutím na tlačítko X. Seznam si dynamicky upravuje ID senzorů, nejde měnit ručně. Použitím tlačítka napravo lze instantně přidat na konec seznamu nový senzor se zadanou hodnotou.

![Screenshot3](https://github.com/BlodyxCZ/Hackathon2024/blob/simulation/Simulation/screenshots/screenshot3.png)<br />
Selectbox na pravé straně obrazovky vybírá přednastavené hodnoty jednotlivých měst (v rámci testování se při spuštění hodnoty generují náhodně). Při zadání jména nového města a stisknutím tlačítka Add City, budou všechny momentálně zobrazené senzory v seznamu senzorů přidány do nového presetu. Preset nelze jak měnit tak odebrat, automaticky se mažou po restartu aplikace.

![Screenshot4](https://github.com/BlodyxCZ/Hackathon2024/blob/simulation/Simulation/screenshots/screenshot4.png)<br />
Graf zobrazuje všechny POSTnuté hodnoty od spuštění pro všechny senzory s indexem 0. Hodnota x je nastavena Spinboxem HODINY, zbytek pro gram není relevantní, pouze se zapisuje do databáze při každém POSTu. Hodnota y je momentální hodnota senzoru s indexem 0. Pokud budete chtít přidat více bodů se stejnou hodnotou x, bude předchozí bod přepsán.


# Documentation
### Table of content
- General information
- How to use

## General information

## How to use
