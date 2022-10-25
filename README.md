# Godot Object Space Dissolve Shader

Godot Shader that dissolves the object with respect to Object Space. Even if the object is transformed in world/global space (moved around and rotated), the dissolve position and offset are preserved.

## Godot 4

Thanks [@nekotogd](https://github.com/nekotogd) for [porting](https://github.com/alfredbaudisch/GodotObjectSpaceDissolveShader/pull/2) the Object Space calculation from Godot 3 to Godot 4.

https://user-images.githubusercontent.com/248383/197831366-0d5dbc47-f62c-48ca-b320-8466025880e5.mp4

## Godot 4 - Dissolve with Direction
Dissolve in Object Space with respect to a given `Vector3` direction.

https://user-images.githubusercontent.com/248383/197839283-2acb2255-03fe-46de-9219-f3cec6098c8e.mp4


## Godot 3

Base World Space dissolve code by [@ceceppa](https://github.com/ceceppa). [Ported to Object Space](https://github.com/ceceppa/godot-shaders/pull/1) by myself.

https://user-images.githubusercontent.com/248383/197817669-04a1cfea-c57f-4958-8ca1-c6cb0daa23fa.mp4
