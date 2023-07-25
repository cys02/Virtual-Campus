Shader "Custom/npr&pbr"
{
    // Properties
    // {
    //     _MainTex("MainTex",2D)="white"{}
    //     //_rampTex("rampTex",2D)="white"{}
    //     _MainColor("Main Color",Color)=(1,1,1)
    //     _ShadowColor("Shadow Color",Color)=(0.7,0.7,0.8)
    //     _ShadowRange("Shadow Range",Range(0,1))=0.5
    //     _ShadowSmooth("Shadow Smooth",Range(0,1))=0.2

    //     [Space(10)]  
    //     _OutLineColor("Color",Color)=(0.5,0.5,0.5,1)
    //     _OutLineWidth("Width",Range(0.01,2))=0.24

    //     // [Space(10)]
    //     // [Toggle]_ENABLE_RIM("ENABLE RIM",int)=0
    //     // _RimColor("RimColor",Color)=(1,1,1)
    //     // _RimWidth("RimWidth",Range(0,1))=0.5
    //     // _RimSmoothness("RimSmoothness",Range(0,1))=0.5
    //     // _RimIntensity("RimIntensity",range(0.0,5.0))=1.0

    //     [Space(10)]
    //     _NormalTex("NormalTex",2D)="white"{}
    //     _NormalScale ("Normal Scale", float) = 1.0f

    //     [Space(10)]
    //     _Smoothness("Smoothness",Range(0,1))=0.5
    //     _Mentallic("Mentallic",range(0,1))=0

    // }
    // SubShader
    // {
    //     Tags { "RenderType"="Opaque" }

    //     Pass
    //     {
    //         Tags{"LightMode"="ForwardBase"}

    //         Cull Back

    //         CGPROGRAM
    //         #pragma vertex vert
    //         #pragma fragment frag
    //         #pragma shader_feature _NormalTexOn

    //         #include"UnityCG.cginc"
    //         #include"Lighting.cginc"
    //         #include"AutoLight.cginc"

    //         sampler2D  _MainTex;
    //         sampler2D _NormalTex;
    //         sampler2D _rampTex;
    //         float4 _MainTex_ST;
    //         float4 _rampTex_ST;
    //         float4 _NormalTex_ST;
    //         half3 _MainColor;
    //         half3 _ShadowColor;
    //         half _ShadowRange;
    //         half _ShadowSmooth;
    //         half _NormalScale;
    //         // half3 _RimColor;
    //         // half _RimWidth;
    //         // half _RimIntensity;
    //         // bool  _ENABLE_RIM;
    //         // half _RimSmoothness;
    //         float _Smoothness;
    //         float _Mentallic;
            

    //         struct a2v
    //         {
    //             float4 vertex:POSITION;
    //             float3 normal:NORMAL;
    //             float2 uv :TEXCOORD0;
    //         };

    //         struct v2f
    //         {
    //             float4 pos:SV_POSITION;
    //             float2 uv:TEXCOORD0;
    //             float3 worldNormal:TEXCOORD1;
    //             float3 worldPos:TEXCOORD2;
    //             float4 TtoW0 : TEXCOORD3;
    //             float4 TtoW1 : TEXCOORD4;
    //             float4 TtoW2 : TEXCOORD5;
    //         };
    //         float DistributionGGX(float NdotH, float roughness)
    //         {
    //             float a      = roughness*roughness;
    //             float a2     = a*a;
    //             float NdotH2 = NdotH*NdotH;

    //             float nom   = a2;
    //             float denom = (NdotH2 * (a2 - 1.0) + 1.0);
    //             denom = 3.1415 * denom * denom;

    //             return nom / denom;
    //         }
    //         float GeometrySchlickGGX(float NdotV, float roughness)
    //         {
    //             float r = (roughness + 1.0);
    //             float k = (r*r) / 8.0;

    //             float nom   = NdotV;
    //             float denom = NdotV * (1.0 - k) + k;

    //             return nom / denom;
    //         }
    //         float GeometrySmith(float NdotV, float3 NdotL,float roughness)
    //         {
    //             float ggx2  = GeometrySchlickGGX(NdotV, roughness);
    //             float ggx1  = GeometrySchlickGGX(NdotL, roughness);
    //             return ggx1 * ggx2;
    //         }
    //         float3 FresnelSchlick(float cosTheta, half4 albedo,half Mentallic)
    //         {
    //             float3 F0=(0.04,0.04,0.04);
    //             F0=Mentallic*albedo+(1-Mentallic*F0);
    //             return F0 + (1.0 - F0) * pow(1.0 - cosTheta, 5.0);
    //         }  

    //         float3 CookTorranceBRDF(float NdotH,float NdotL,float NdotV,float VdotH,float roughness,float4 specularColor)
    //         { 
    //             float D = DistributionGGX(NdotH, roughness);
    //             float G = GeometrySmith(NdotV,NdotL,roughness);
    //             float3 F = FresnelSchlick(NdotV, specularColor,_Mentallic);
    //             float3 res = (D * G * F) / (4.0 * max(NdotL,0.0) * max(NdotV,0.0) + 0.001);
    //             return res;
    //         }
    //         v2f vert(a2v v)
    //         {
    //             v2f o;
    //             UNITY_INITIALIZE_OUTPUT(v2f,o);
    //             o.uv=TRANSFORM_TEX(v.uv,_MainTex);
    //             #if _NormalTexOn
    //             o.TtoW0 = float4(worldTangent.x,worldBinormal.x,worldNoraml.x,worldPos.x);
    //             o.TtoW1 = float4(worldTangent.y,worldBinormal.y,worldNoraml.y,worldPos.y);
    //             o.TtoW2 = float4(worldTangent.z,worldBinormal.z,worldNoraml.z,worldPos.z);
    //             float3 normal=UnpackNormal(tex2D(_NormalTex,i.uv));
    //             normal.xy*=_NormalScale;
    //             normal.z=sqrt(1 - saturate(dot(normal.xy,normal.xy)));
    //             o.worldNormal = normalize(float3(dot(i.TtoW0.xyz,normal),dot(i.TtoW1.xyz,normal),dot(i.TtoW2.xyz,normal)));
    //             #else
    //             o.worldNormal=UnityObjectToWorldNormal(v.normal);
    //             #endif
    //             o.worldPos=mul(unity_ObjectToWorld,v.vertex).xyz;
    //             o.pos=UnityObjectToClipPos(v.vertex);
    //             return o;
    //         }
    //         float4 frag(v2f i):SV_TARGET
    //         {
    //             float3 col =1;
    //             half4 mainTex =tex2D(_MainTex,i.uv);
    //             half3 viewDir=normalize(_WorldSpaceCameraPos.xyz-i.worldPos.xyz);
    //             half3 worldNormal=normalize(i.worldNormal);
    //             half3 lightDir=normalize(_WorldSpaceLightPos0.xyz);
    //             half3 halfDir = normalize(viewDir+lightDir);
    //             //diffuse
    //             half halfLambert=dot(worldNormal,lightDir)*0.5+0.5;
    //            // half ramp =tex2D(_rampTex,float2(0.5,halfLambert)).r;
    //             //half3 diffuse =lerp(_ShadowColor,_MainColor,ramp);
    //              half ramp =smoothstep(0,_ShadowSmooth,halfLambert-_ShadowRange);
    //              half3 diffuse =lerp(_ShadowColor,_MainColor,ramp);
    //             diffuse*=mainTex;
    //             //rim
    //             // half3 Rim  = half3(0,0,0);
    //             // if(_ENABLE_RIM)
    //             // {half rim =1.0-saturate(dot(viewDir,worldNormal)); 
    //             // rim=smoothstep(1-_RimWidth,1,rim);
    //             // rim=smoothstep(0,_RimSmoothness,rim);
    //             // Rim=rim* _RimColor*_RimIntensity;
    //             // }
    //             //pbr
    //             float roughness=1-_Smoothness;
    //             float NdotL = saturate(dot(worldNormal,lightDir));
    //             float NdotV = saturate(dot(worldNormal,viewDir));
    //             float VdotH = saturate(dot(viewDir,halfDir));
    //             float NdotH = saturate(dot(worldNormal,halfDir));
    //             float LdotH = saturate(dot(lightDir,halfDir));
    //             float3 specular = CookTorranceBRDF(NdotH,NdotL,NdotV,VdotH,roughness,mainTex);
    //             col=((1.0-_Mentallic)*diffuse+_Mentallic*specular*NdotL)*_LightColor0;
    //             return float4(col,1.0);
    //         }
    //         ENDCG
    //     }
    //     Pass
    //     {
    //         Tags{"LightMode"="ForwardBase"}

    //         Cull Front

    //         CGPROGRAM
    //         #pragma vertex vert
    //         #pragma fragment frag
    //         #include"UnityCG.cginc"

    //         half _OutLineWidth;
    //         half4 _OutLineColor;

    //         struct a2v
    //         {
    //             float4 vertex:POSITION;
    //             float3 normal:NORMAL;
    //             float2 uv:TEXCOORD0;
    //             float4 vertColor:COLOR;
    //             float4 tangent:TANGENT;
    //         };

    //         struct v2f
    //         {
    //             float4 pos:SV_POSITION;
    //         };
    //         v2f vert (a2v v)
    //         {
    //             v2f o;
    //             UNITY_INITIALIZE_OUTPUT(v2f,o);
    //             float4 pos =UnityObjectToClipPos(v.vertex);
    //             float3 viewNormal =mul((float3x3)UNITY_MATRIX_IT_MV,v.tangent.xyz);
    //             float3 ndcNormal = normalize(TransformViewToProjection(viewNormal.xyz))*pos.w;//将法线变换到NDC空间
    //             float4 nearUpperRight = mul(unity_CameraInvProjection,float4(1,1,UNITY_NEAR_CLIP_VALUE,_ProjectionParams.y));
    //             float aspect =abs(nearUpperRight.y/nearUpperRight.x);//求得屏幕宽高比
    //             ndcNormal.x*=aspect;
    //             pos.xy+=0.01*_OutLineWidth*ndcNormal.xy;
    //             o.pos=pos;
    //             return o;
    //         }
    //         half4 frag(v2f i):SV_TARGET
    //         {
    //             return _OutLineColor;
    //         }
    //         ENDCG
    //     }
    // }
    // FallBack "Diffuse"
}
