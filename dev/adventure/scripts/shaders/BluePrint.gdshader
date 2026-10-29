shader_type spatial;

// --- パラメータ ---
uniform vec4 base_color : source_color = vec4(0.2, 0.2, 0.25, 1.0); // 本体の色
uniform vec4 rim_color : source_color = vec4(0.0, 0.8, 1.0, 1.0);   // リムライトの色
uniform float rim_power : hint_range(0.1, 10.0) = 3.0;              // 光の鋭さ
uniform float rim_intensity : hint_range(0.0, 10.0) = 2.0;          // 光の強さ

uniform float alpha_value : hint_range(0.01,1.0);

void fragment()
{
    // 1. ベースカラーの設定
    ALBEDO = base_color.rgb;
    ALPHA = alpha_value;

    // 2. リム強度（フレスネル）の計算
    // カメラの視線ベクトル(VIEW)と面の法線(NORMAL)の内積
    float NdotV = dot(NORMAL, VIEW);
    float rim = 1.0 - clamp(NdotV, 0.0, 1.0);

    // 3. 累乗で輪郭の幅・鋭さを制御
    float rim_out = pow(rim, rim_power);

    // 4. 発光（EMISSION）にリムライトを追加
    EMISSION = rim_color.rgb * rim_out * rim_intensity;
}
