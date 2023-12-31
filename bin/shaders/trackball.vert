#version 330

// vertex attributes
in vec3 position;
in vec3 normal;
in vec2 texcoord;

// matrices
uniform mat4 model_matrix;
uniform mat4 view_matrix;
uniform mat4 projection_matrix;

out vec3 norm;
out vec2 tc;

void main()
{
	vec4 wpos = model_matrix * vec4(position,1);
	vec4 epos = view_matrix * wpos;
	gl_Position = projection_matrix * epos;

	// pass eye-coordinate normal to fragment shader
	norm = normalize(mat3(view_matrix*model_matrix)*normal);
	tc = texcoord;
}
