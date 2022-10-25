shader_type spatial;
render_mode cull_disabled;

uniform sampler2D texture;
uniform sampler2D blendTexture;

uniform float offset = 0.;
uniform bool up = true;
uniform vec4 borderColor: source_color = vec4(1., 1., 0., 1.);
uniform float borderHeight = 0.1;
uniform float emissionIntensity = 1.;

uniform vec2 blendUVScale = vec2(1.);
uniform vec2 textureUVScale = vec2(1.);

const float tao = 2. * 3.14;

varying vec3 world_pos;
varying smooth vec3 vertexOS;
void vertex()
{
	vertexOS = VERTEX;
}

void fragment() {
	vec3 position = vertexOS;
	
	vec4 text = texture(texture, UV);
	vec4 blend = texture(blendTexture, UV * blendUVScale);

	float direction = up ? 1. : -1.;
	float upperBorder = smoothstep(offset, offset, (position.y * direction) + 1.);
	float bottomBorder = smoothstep(offset, offset, (position.y * direction) - borderHeight + 1.);
	float borderPart = upperBorder - bottomBorder;

	vec4 color = mix(blend, borderColor, upperBorder);
	color = mix(color, text, bottomBorder);
	
	ALBEDO = color.rgb;

	if (!FRONT_FACING) {
		ALBEDO = borderColor.rgb;
		NORMAL = VIEW;
	}

	ALPHA = color.a;
	ALPHA_SCISSOR_THRESHOLD = 1.0;
	EMISSION = vec3(borderPart) * borderColor.rgb * emissionIntensity;
}
