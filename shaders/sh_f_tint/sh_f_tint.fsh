precision mediump float;

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

//uniform sampler2D gm_BaseTexture;
uniform vec4 tint_color; // The color to tint the sprite with
uniform float tint_intensity; // The intensity of the tint, from 0 to 1

void main() {
    vec4 spriteColor = texture2D(gm_BaseTexture, v_vTexcoord) * v_vColour; // Original sprite color
    
    // Check if the pixel is transparent (alpha is close to 0)
    if (spriteColor.a < 0.01) {
        discard; // Skip drawing this pixel
    } else {
        // Apply the tint color to non-transparent pixels based on the tint intensity
        // Ensure that the tint does not affect the alpha channel of the sprite
        vec4 tintedColor = mix(spriteColor, vec4(tint_color.rgb, spriteColor.a), tint_intensity);
        
        // Output the final color with tint applied
        gl_FragColor = tintedColor;
    }
}
