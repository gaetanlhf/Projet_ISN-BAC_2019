# Mise en œuvre d'un bras manipulateur contrôlable à distance par internet 

## Introduction

Nous avons choisi comme projet pour le Baccalauréat en ISN la mise en œuvre d’un bras manipulateur contrôlable à distance par internet.  
Nous avons utilisé un kit de bras manipulateur robotique monté durant les années précédentes, notre but est de le rendre intelligent à l’aide de la carte Arduino intégrée dans celui-ci, de le connecter à internet pour déplacer des objets et assurer son contrôle à distance par internet à l’aide d’un retour d’image par caméra.  

Le cahier des charges de ce projet comprend les éléments suivants :
- la création d’une interface de contrôle développée avec Processing,
- un système de contrôle à distance par internet avec un retour d’image par webcam et
- la réalisation d’un site de présentation du travail réalisé.

***

## Présentation du projet

Le robot que nous utilisons pour ce projet est un bras robotisé de chez Lynxmotion utilisant une carte de contrôle BotBoarduino qui est en réalité une carte Arduino Duemilanove adaptée à la robotique.  
Pour programmer cette carte, nous utilisons l’environnement de développement Arduino.  
Ce code Arduino permet de contrôler les différents moteurs du robot via l’envoi de données sur le port série (ici, il s’agit d’un port USB).  

L’interface de commande du robot est développée sous l’environnement de développement Processing.  
Elle permet le contrôle des différents moteurs du bras via internet ainsi que l’obtention d’un retour d’images.  
Cette interface offre aussi une possibilité d’enregistrer des mouvements afin de les reproduire plus tard.  
Il est également possible de prendre une capture de l’image envoyée par la caméra.  

Nous utilisons également dans ce projet un ordinateur aussi large qu’une carte de crédit : il s’agit d’un Raspberry Pi 3 modèle B.  
Ce petit ordinateur utilise un système d’exploitation libre nommé Raspbian GNU/Linux (dérivé de Debian GNU/Linux) et nous sert de serveur web pour le site internet du projet mais aussi de serveur de caméra afin de gérer la caméra qui est attachée sur le bras du robot.  
Le Raspberry Pi nous sert aussi de passerelle entre l’interface codée sous Processing et la carte Arduino du robot à l’aide d’un script en Python.  

![Schéma](https://raw.githubusercontent.com/gaetanlhf/Projet_ISN-BAC_2019/main/Website/gallery/images/006.jpg?token=ATPXY7PVE4Q5ZWDBEQKB2EDA2IIXO)

***

## Quelques images :
![Robot](https://raw.githubusercontent.com/gaetanlhf/Projet_ISN-BAC_2019/main/Website/gallery/images/001.jpg?token=ATPXY7PPJKDXZRFOA4OLFOLA2IIZA)

![Interface](https://raw.githubusercontent.com/gaetanlhf/Projet_ISN-BAC_2019/main/Website/gallery/images/004.jpg?token=ATPXY7K423BTG2U5D6V7VTTA2II2E)

***

## Crédits
Réalisé par Jonathan BRUNEAU et Gaëtan LE HEURT-FINOT.

***

This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with this program. If not, see http://www.gnu.org/licenses/.
