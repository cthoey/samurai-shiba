varying vec2 v_vTexcoord;  // Passed in from the vertex shader
varying vec4 v_vColour;  // Passed in from the vertex shader

uniform vec4 targetColor;  // The color to set the sprite to

void main() {
    vec4 texColor = texture2D(gm_BaseTexture, v_vTexcoord);
    if (texColor.a > 0.0) {
        // Apply the target color, including its alpha
        gl_FragColor = vec4(targetColor.rgb, targetColor.a * texColor.a);
    } else {
        // Completely transparent pixels remain unchanged
        discard;
    }
}
