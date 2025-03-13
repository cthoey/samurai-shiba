varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main() {
    vec4 texColor = texture2D(gm_BaseTexture, v_vTexcoord);
    if (texColor.a > 0.0) {
        // Render the sprite as black but keep the original alpha
        gl_FragColor = vec4(0.0, 0.0, 0.0, texColor.a);
    } else {
        // If alpha is 0, discard the pixel
        discard;
    }
}
