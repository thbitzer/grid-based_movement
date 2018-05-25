# Grid-based Movement in Game Maker Studio 2

Although Game Maker provides a lot of motion planning (mp_*) functions, they do not seem to match all situations. I found them inconvenient to be used with a grid based approach. This is why I started this little exercise.

The grid-based approach I needed was an object (player or enemy) which moves from a grid position to the next. The grid consists of squares (32 x 32 pixels). Only horizontal and vertical moves are allowed. The moving object is either in the process of moving to the next position (is_moving == true) or is standing still and waiting for a command to move (is_moving = false). This command can either be a keyboard input (arrow keys) or a computed input from the game. This computed input is considered to come from the motion planning module of this Game Make example project.

This project is not yet finished and is continuously improved.

| Version tag | Features | Status |
| --- | --- | ---|
| V0.1 | Smooth Movement | Complete |
| V0.2 | Collision Detection | Complete |
| V0.3 | Add enemy (move randomly) | Complete |
| V0.4 | Added direct enemy move | Complete |

## Smooth Movement

While traveling from one grid position to the next, the player object is not reacting on any input. This is intended, because we are in a grid-based game!

The speed of the player input is set to 4 pixels / frame, so it takes 8 frames to complete the move. During this time, a lot can happen and the player might panically push other keys to control the player object.

This is difficult in situations where more than one arrow key is pressed simultaneously. If just the pressed keys are queried, then the game decides which direction has priority due to the sequence the keys are evaluated in the program.

To make this a bit smoother, a queue was introduced to hold the exact sequence in which the arrow keys have been pressed. If a key was released, it is removed from its current position and the other (still pressed) keys will move up if required. This gives a pretty satisfying gaming experience for all keyboard artists.

The whole queue handling is implemented in 4 scripts (name keyb_buffer_*) which are called from the player object.

## Collision Detection

The player object stops when the target grid position is already occupied by a solid object. To make this work, the object representing the obstacle needs to be flagged as "solid" in the object properties.

To test this feature, a feature has been added to set additional walls onto free grid positions (left mouse button) and to remove those walls again (right mouse button). Walls at the edge of the screen must not be removed.

## Add enemy moving randomly

This is the most primitive way of computing the movement of an AI operated object. The object (a ghost) just moves according to random numbers. In 70% of the decisions, it just continues to move straight, in 12.5% of the decisions it turns left or right and in 5% of the decisions it turns by 180 degrees.

To try different move modes, some buttons have been added to switch between them.

## Add direct enemy move

Enemy can now switched into "direct" mode. It uses the shortest way to reach the target. This mode is fast, but only useful if there is no obstacle between the enemy and the player, as the enemy will not walk around them.
