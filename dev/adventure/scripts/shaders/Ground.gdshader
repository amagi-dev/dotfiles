

shader_type spatial;

uniform sampler2D noise_texture : hint_default_black;
uniform sampler2D a_texture : hint_default_black;
uniform sampler2D b_texture : hint_default_black;

void fragment() {
    // 近く用の細かいUVと、遠く用の粗いUVを用意
    vec2 uv_near = UV * 80.0; // 近くでは細かく表示
    vec2 uv_far = UV * 2.0;   // 遠くでは荒さを抑える

    // カメラからの距離（頂点座標の長さなどから簡易的に算出）
    // ※ spatialシェーダーではVERTEXのZ深度などが目安になります
    float dist = length(VERTEX);

    // 距離に応じて近く用と遠く用のテクスチャを混ぜる割合を計算
    // 例: 距離が 10.0 〜 50.0 の間で滑らかに切り替える
    float blend_factor = smoothstep(10.0, 50.0, dist);

    // それぞれのUVでノイズやテクスチャをサンプリング
    float noise_near = texture(noise_texture, uv_near).r;
    vec4 col_a_near = texture(a_texture, uv_near);
    vec4 col_b_near = texture(b_texture, uv_near);

    vec4 col_a_far = texture(a_texture, uv_far);
    vec4 col_b_far = texture(b_texture, uv_far);

    // 近距離のブレンド
    vec3 color_near = mix(col_a_near.rgb, col_b_near.rgb, smoothstep(0.4, 0.6, noise_near));
    // 遠距離のブレンド（必要に応じて）
    vec3 color_far = mix(col_a_far.rgb, col_b_far.rgb, 0.5);

    // 距離によって近景と遠景をミックス
    ALBEDO = mix(color_near, color_far, blend_factor);
    SPECULAR = 0.0f;

}
