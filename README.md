[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-24ddc0f5d75046c5622901739e7c5dd533143b0c8e959d652212380cedb1ea36.svg)](https://classroom.github.com/a/syDSSnTt)
# APCS2 Final Project
## Group Info: Currently Cubing - Dua Baig
## Overview
  This is a 2D Rubiks Cube simulator. The cube is drawn like an unfolded box, with the center face being the upper face, and the face hanging off the edge being the bottom face. In this simulation, the user can press keys to turn the rows, columns, and faces of the cube. Pressing lowercase keys will turn the respective face clockwise (clockwise as if it were facing the viewer), and pressing uppercase keys will turn the respective face counterclockwise.

## Instructions
Mouse Click - resets cube
<br/> 
Space Bar - switches modes from the 2x2 cube to the 3x3 cube
<br/> 
'S' key - scrambles cube

Turns:
<br/> 
'r' and 'R' - turns right column
<br/> 
'l' and 'L' - turns left column
<br/> 
'u' and 'U' - turns top face (the center face) and the topmost row
<br/> 
'd' and 'D' - turns bottom face (the one all the way to the right) and the bottommost row
<br/> 
'f' and 'F' - turns front face and top face's bottom row
<br/> 
'B' and 'b' - turns back face and top face's top row
<br/> <br/> 
Capital letters turn their respective cube parts clockwise, while lowercase letters turn said parts counterclockwise.

## Demo Video
[https://drive.google.com/file/d/1277yT5rkchcsqx7p2EiSdmQoENbnOiUO/view?usp=sharing](https://drive.google.com/file/d/1yHHlehd04hvgaRBcdZvjY-gLAC4zrrgT/view?usp=sharing)

## Possible Bugs
I'm pretty sure the scrambles for both cubes work (Moreso for the 3x3 than the 2x2, as I actually mimicked the moves on a real 3x3). However, I can't reasonably test every combination of moves out there, so I don't know if there's some hyper-specific scenario that will break it and give the user an unsolvable cube. 
