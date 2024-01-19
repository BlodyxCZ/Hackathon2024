## Languages
- [Čeština](https://github.com/BlodyxCZ/Hackathon2024/blob/simulation/Simulation/README.md#dokumentace)
- [English](https://github.com/BlodyxCZ/Hackathon2024/blob/simulation/Simulation/README.md#documentation)

# Dokumentace
### Tabulka obsahu
- Obecné informace
- Návod k použití

## Obecné informace
Jedná se o prostou spustitelnou aplikaci vytvořenou v Godot Enginu pro simulaci dat projektu týmu Northern Wind v soutěži [Hackathon 2024](https://hackujstat.cz/).
Aplikace má vlastní GUI k rychlému testování různých dat, poslílaných na náš serverový endpoint.
## Návod k použití
![Screenshot2](https://github.com/BlodyxCZ/Hackathon2024/blob/simulation/Simulation/screenshots/screenshot2.png)<br />
Nalevo je seznam senzorů, které budou poslány při zmáčknutí POST. Jednotlivé senzory je možno odebrat kliknutím na tlačítko X. Seznam si dynamicky upravuje ID senzorů, nejde měnit ručně. Použitím tlačítka napravo lze instantně přidat na konec seznamu nový senzor se zadanou hodnotou.

![Screenshot3](https://github.com/BlodyxCZ/Hackathon2024/blob/simulation/Simulation/screenshots/screenshot3.png)<br />
Selectbox na pravé straně obrazovky vybírá přednastavené hodnoty jednotlivých měst (v rámci testování se při spuštění hodnoty generují náhodně). Při zadání jména nového města a stisknutím tlačítka Add City, budou všechny momentálně zobrazené senzory v seznamu senzorů přidány do nového presetu. Preset nelze jak měnit tak odebrat, automaticky se mažou po restartu aplikace.

![Screenshot4](https://github.com/BlodyxCZ/Hackathon2024/blob/simulation/Simulation/screenshots/screenshot4.png)<br />
Graf zobrazuje všechny POSTnuté hodnoty od spuštění pro všechny senzory s indexem 0. Hodnota x je nastavena Spinboxem HOURS, zbytek pro gram není relevantní, pouze se zapisuje do databáze při každém POSTu. Hodnota y je momentální hodnota senzoru s indexem 0. Pokud budete chtít přidat více bodů se stejnou hodnotou x, bude předchozí bod přepsán.


# Documentation
### Table of content
- General information
- How to use

## General information
A easy to use executable app made in Godot Engine to simulate data for Northern Wind's project in [Hackathon 2024](https://hackujstat.cz/) competition.
The app has its own GUI for fast testing of varying data sets, that are being sent to our server endpoint.
## How to use
![Screenshot2](https://github.com/BlodyxCZ/Hackathon2024/blob/simulation/Simulation/screenshots/screenshot2.png)<br />
On the left is a list of sensors that will be sent upon pressing POST. Individual sensors can be removed by clicking on the X button. The list dynamically adjusts the IDs of sensors and cannot be manually changed. By using the button on the right, a new sensor with a specified value can be instantly added to the end of the list.

![Screenshot3](https://github.com/BlodyxCZ/Hackathon2024/blob/simulation/Simulation/screenshots/screenshot3.png)<br />
A select box on the right side of the screen selects preset values for individual cities (for testing purposes, values are randomly generated at startup). When entering the name of a new city and pressing the Add City button, all currently displayed sensors in the sensor list will be added to a new preset. The preset cannot be modified or removed; it is automatically cleared upon restarting the application.

![Screenshot4](https://github.com/BlodyxCZ/Hackathon2024/blob/simulation/Simulation/screenshots/screenshot4.png)<br />
The graph displays all POSTed values since the launch of the app for all sensors with the index of 0. The x-value is set by the HOURS Spinbox; the rest is not relevant for the program but is recorded in the database with each POST. The y-value is the current value of sensor 0. If you want to add more points with the same x-value, the previous point will be overwritten.
