[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-24ddc0f5d75046c5622901739e7c5dd533143b0c8e959d652212380cedb1ea36.svg)](https://classroom.github.com/a/syDSSnTt)
# APCS2 Final Project
THIS DOCUMENT IS REQUIRED
## Group Info

Andrew Dickerson, Benjamin Lim\
//Your GROUP Name

## Overview

This game is a top-down action-based shooter that revolves around the premise of fighting various enemies in a grid of dungeons.\
Three levers are dispersed throughout the dungeon. Toggling all three levers will spawn the boss. Beating the boss wins the player the game. Dying to an enemy loses the game.\
Enemies have random movement in the four cardinal directions, alongside a chance to stand still for a moment, or to directly chase the player.\

There are multiple types of tiles the player will encounter that can make a room more tricky to navigate.
 - Wall: Basic tiles that surround the border of the screen as dirt/grass textures and in the middle of the room as brick wall texturees; prevent the player from moving through; cannot be shot through; cannot be broken
 - Cracked: Similiar to wall tiles but can can be identified by a worn-down brick wall texture; can be broken with one shot (These are the only breakable tiles)
 - Water: Blue tiles that cannot be walked through but can be shot through
 - Lever: Previously mentioned
 - Door: Sends the player to the next room in the direction the door is facing. (If the door is up, the player will move to the next room up on the map)
 - Floor: Sandy-looking tiles that compose the otherwise empty space; can be walked through; can be shot through


## Instructions

No external libraries are required to run this project.

Keybinds (General Play):
 - WASD for moving up, left, down, and right respectively.
 - E to toggle a lever.
 - Left Click to shoot towards the mouse cursor.
 - Space to dodge in the current held movement key (Quickly move forward in said direction; player is immune to all damage while dodging)

Keybinds (Testing Purposes):
 - 8: Kill the player (shows loss screen)
 - 9: Summons and immediantly kills boss (shows win screen)
 - 0: Restart (new game)
