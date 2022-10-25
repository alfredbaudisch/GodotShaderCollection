shader_type spatial;
render_mode cull_disabled;

uniform sampler2D T_BaseColor : source_color;
uniform vec3 DissolveDirection = vec3(0.0, -1.0, 0.0);
uniform float DissolveAmount = 0.25;

const float in_min = -1.0;
const float in_max = 1.0;
const float out_min = 0.0;
const float out_max = 1.0;

void fragment()
{	
	// Object Space
	vec3 position = (inverse(MODEL_MATRIX) * INV_VIEW_MATRIX * vec4(VERTEX, 1.0)).xyz;
	
	// Calculate dissolve
	float dot_result = dot(position, DissolveDirection);

	// Remap
	float _input_range = in_max - in_min;
	float _output_range = out_max - out_min;
	float remapped = out_min + _output_range * ((dot_result - in_min) / _input_range);

	float alpha_cut = 0.0;
	
	if(abs(remapped - DissolveAmount) < 0.00001 || (remapped < DissolveAmount)) {
		alpha_cut = 1.0;
	}

	ALBEDO = texture(T_BaseColor, UV).xyz;
	ALPHA = alpha_cut;
	ALPHA_SCISSOR_THRESHOLD = 1.0;


}
