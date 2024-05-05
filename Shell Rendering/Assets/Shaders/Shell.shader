Shader "Custom/Shell"
{
    Properties
    {
        
    }
    SubShader
    {
        Tags { "RenderType"="Opaque" }
        Cull Off

        Pass
        {
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            
            #include "UnityCG.cginc"

            struct VertexData
            {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float2 uv : TEXCOORD0;
            };

            struct v2f
            {
                float4 position : SV_POSITION;
                float2 uv : TEXCOORD0;
                float2 normal : TEXCOORD1;
                float2 worldPos : TEXCOORD2;
            };
            

            v2f vert (VertexData v)
            {
                v2f i;
                i.position = UnityObjectToClipPos(v.vertex);
                i.normal = normalize(UnityObjectToWorldNormal(v.normal));
                i.worldPos = mul(unity_ObjectToWorld, v.vertex);
                i.uv = v.uv;
                return i;
            }

            float4 frag (v2f i) : SV_Target
            {
                float4 col = float4(1, 1, 1, 1);
                return col;
            }
            ENDCG
        }
    }
}
