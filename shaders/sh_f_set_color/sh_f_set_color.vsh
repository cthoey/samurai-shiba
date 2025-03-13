attribute vec3 in_Position;  // Incoming vertex position
attribute vec2 in_TextureCoord;  // Incoming texture coordinate
attribute vec4 in_Colour;  // Incoming vertex color

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main() {
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * vec4(in_Position, 1.0);
    v_vTexcoord = in_TextureCoord;
    v_vColour = in_Colour;
}
