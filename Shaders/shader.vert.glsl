#version 450
in vec2 vertex_position;
in vec2 vertex_uv;
out vec2 uv;
uniform vec4 sg_data[15];
out mat4 sg_mat4;
void gen_mat0(){
float yaw = sg_data[12][3];float pitch = sg_data[13][0];float roll = sg_data[13][1];float sx = sin(-yaw);float cx = cos(-yaw);float sz = sin(-pitch);float cz = cos(-pitch);float sy = sin(-roll);float cy = cos(-roll);mat4 m = mat4(cx * cy, cx * sy * sz - sx * cz, cx * sy * cz + sx * sz, 0,sx * cy, sx * sy * sz + cx * cz, sx * sy * cz - cx * sz, 0,-sy, cy * sz, cy * cz, 0.0, 0.0, 0.0, 0.0, 1.0);float x = sg_data[13][2];float y = sg_data[13][3];float z = sg_data[14][0];mat4 t = mat4(1.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0,0.0, 0.0, 1.0, 0.0, x, -y, -z, 1.0);m = m * t;sg_mat4 = m;}
void main() {
gen_mat0();
gl_Position = vec4(vertex_position, 0.0, 1.0);
uv = vertex_uv;
}
