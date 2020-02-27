
Shader "WhaleApp/Particles/Mobile Particles AB+ADD (AtlasPack RGBA)" {
    Properties {
        _Diffuse ("Diffuse R", 2D) = "white" {}
        
    }
    SubShader {
        Tags {
            "IgnoreProjector"="True"
            "Queue"="Transparent"
            "RenderType"="Transparent"
            "CanUseSpriteAtlas"="True"
        }
        Pass {
            
            Blend One OneMinusSrcAlpha
            ZWrite Off
            ColorMask RGB
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #pragma fragmentoption ARB_precision_hint_fastest
            #include "UnityCG.cginc"
            #pragma multi_compile_fwdbase
            #pragma target 2.0

            uniform sampler2D _Diffuse; uniform float4 _Diffuse_ST;

            struct VertexInput {
                fixed4 vertex : POSITION;
                fixed4 texcoord0 : TEXCOORD0;
                fixed4 texcoord1 : TEXCOORD1;
                fixed4 texcoord2 : TEXCOORD2;
                float4 vertexColor : COLOR;
            };
            struct VertexOutput {
                fixed4 pos : SV_POSITION;
                fixed4 uv0 : TEXCOORD0;
                fixed4 uv1 : TEXCOORD1;
                fixed4 uv2 : TEXCOORD2;
                float4 vertexColor : COLOR;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.uv1 = v.texcoord1;
                o.uv2 = v.texcoord2;
                o.vertexColor = v.vertexColor;
                o.pos = mul(UNITY_MATRIX_VP, v.vertex );
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
////// Lighting:
////// Emissive:
                fixed4 _Diffuse_var = tex2D(_Diffuse,TRANSFORM_TEX(i.uv1, _Diffuse));
                fixed _Diff_Dot = dot(fixed4(_Diffuse_var.r,_Diffuse_var.g,_Diffuse_var.b,_Diffuse_var.a),fixed4(i.uv0.r,i.uv0.g,i.uv0.b,i.uv0.a)); // Diff_Dot
                float3 emissive = (i.vertexColor.rgb*_Diff_Dot);
                float3 finalColor = emissive;
                return float4(finalColor,(dot((_Diff_Dot*1.0+0.0),clamp(float4(i.uv2.r,i.uv2.g,i.uv2.b,i.uv2.a),-5,5))*i.vertexColor.a));
			
            }
            ENDCG
        }
    }
  
}
