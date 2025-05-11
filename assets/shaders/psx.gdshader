shader_type canvas_item;

// Required in Godot 4.2+ for screen sampling
uniform sampler2D screen_tex : hint_screen_texture, filter_linear_mipmap;

uniform float pixel_scale : hint_range(1.0, 10.0) = 4.0;
uniform bool grayscale = false;

void fragment() {
	// Pixelation logic
	vec2 resolution = vec2(textureSize(screen_tex, 0));
	vec2 uv = SCREEN_UV;
	vec2 block_size = pixel_scale / resolution;
	uv = floor(uv / block_size) * block_size;

	// Sample pixelated screen
	vec4 color = texture(screen_tex, uv);

	// Optional grayscale effect
	if (grayscale) {
		float gray = dot(color.rgb, vec3(0.299, 0.587, 0.114));
		color = vec4(vec3(gray), color.a);
	}

	COLOR = color;
}
