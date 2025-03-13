varying vec2 v_vTexcoord;
varying vec4 v_vColour;

//uniform sampler2D gm_BaseTexture;
uniform vec4 glowColor;

void main() {
    vec4 baseColor = texture2D(gm_BaseTexture, v_vTexcoord);
    
    if (baseColor.a > 0.0) {
        gl_FragColor = baseColor;
    } else {
        float outline = 0.0;
        outline += texture2D(gm_BaseTexture, v_vTexcoord + vec2(1.0, 0.0) / 128.0).a;
        outline += texture2D(gm_BaseTexture, v_vTexcoord + vec2(-1.0, 0.0) / 128.0).a;
        outline += texture2D(gm_BaseTexture, v_vTexcoord + vec2(0.0, 1.0) / 128.0).a;
        outline += texture2D(gm_BaseTexture, v_vTexcoord + vec2(0.0, -1.0) / 128.0).a;
        
        if (outline > 0.0) {
            gl_FragColor = glowColor;
        } else {
            discard;
        }
    }
}
