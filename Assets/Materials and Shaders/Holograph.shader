// Upgrade NOTE: replaced '_Object2World' with 'unity_ObjectToWorld'
// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

// Shader created with Shader Forge v1.13 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.13;sub:START;pass:START;ps:flbk:Standard,lico:1,lgpr:1,nrmq:1,nrsp:0,limd:3,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,rprd:False,enco:False,rmgx:True,rpth:0,hqsc:True,hqlp:False,tesm:0,bsrc:3,bdst:7,culm:0,dpts:2,wrdp:False,dith:0,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.1280277,fgcg:0.1953466,fgcb:0.2352941,fgca:1,fgde:0.01,fgrn:0,fgrf:300,ofsf:0,ofsu:0,f2p0:False;n:type:ShaderForge.SFN_Final,id:1318,x:33182,y:32881,varname:node_1318,prsc:2|diff-7498-RGB,spec-5906-OUT,gloss-3383-OUT,emission-7498-RGB,alpha-4596-OUT;n:type:ShaderForge.SFN_Color,id:7498,x:32897,y:32797,ptovrint:False,ptlb:Base Color,ptin:_BaseColor,varname:node_7498,prsc:2,glob:False,c1:0.3285035,c2:0.5258977,c3:0.7205882,c4:1;n:type:ShaderForge.SFN_ValueProperty,id:5906,x:32897,y:32989,ptovrint:False,ptlb:Metallic,ptin:_Metallic,varname:node_5906,prsc:2,glob:False,v1:0;n:type:ShaderForge.SFN_ScreenPos,id:2463,x:32023,y:33587,varname:node_2463,prsc:2,sctp:1;n:type:ShaderForge.SFN_Tex2d,id:2240,x:32369,y:33587,ptovrint:False,ptlb:ScanlineTexture,ptin:_ScanlineTexture,varname:node_2240,prsc:2,tex:b184349ad2254724ea630d9d7e3ba0c4,ntxv:0,isnm:False|UVIN-2725-UVOUT;n:type:ShaderForge.SFN_Panner,id:2725,x:32198,y:33587,varname:node_2725,prsc:2,spu:0,spv:0.03|UVIN-2463-UVOUT;n:type:ShaderForge.SFN_Add,id:6783,x:32710,y:33590,varname:node_6783,prsc:2|A-1923-OUT,B-4940-OUT;n:type:ShaderForge.SFN_ValueProperty,id:4940,x:32535,y:33687,ptovrint:False,ptlb:Scanline Soft Opacity,ptin:_ScanlineSoftOpacity,varname:node_4940,prsc:2,glob:False,v1:0;n:type:ShaderForge.SFN_ValueProperty,id:5026,x:32369,y:33498,ptovrint:False,ptlb:Scanline Hard Opacity,ptin:_ScanlineHardOpacity,varname:node_5026,prsc:2,glob:False,v1:1;n:type:ShaderForge.SFN_Multiply,id:1923,x:32535,y:33528,varname:node_1923,prsc:2|A-5026-OUT,B-2240-R;n:type:ShaderForge.SFN_ValueProperty,id:3383,x:32897,y:33074,ptovrint:False,ptlb:Gloss,ptin:_Gloss,varname:node_3383,prsc:2,glob:False,v1:0;n:type:ShaderForge.SFN_Tex2d,id:9572,x:32327,y:32914,ptovrint:False,ptlb:Noise,ptin:_Noise,varname:node_9572,prsc:2,tex:88ef63f2079dde84cbd9fa55efb37f17,ntxv:0,isnm:False|UVIN-547-UVOUT;n:type:ShaderForge.SFN_Panner,id:547,x:32155,y:32914,varname:node_547,prsc:2,spu:100,spv:0|UVIN-9116-UVOUT;n:type:ShaderForge.SFN_Tex2d,id:6381,x:32327,y:33102,ptovrint:False,ptlb:Noise_copy,ptin:_Noise_copy,varname:_Noise_copy,prsc:2,tex:88ef63f2079dde84cbd9fa55efb37f17,ntxv:0,isnm:False|UVIN-2606-UVOUT;n:type:ShaderForge.SFN_Panner,id:2606,x:32155,y:33102,varname:node_2606,prsc:2,spu:0,spv:100|UVIN-5234-UVOUT;n:type:ShaderForge.SFN_Multiply,id:4874,x:32504,y:33021,varname:node_4874,prsc:2|A-9572-R,B-6381-R;n:type:ShaderForge.SFN_Add,id:6239,x:32639,y:33187,varname:node_6239,prsc:2|A-4874-OUT,B-7547-OUT;n:type:ShaderForge.SFN_ValueProperty,id:528,x:32248,y:33390,ptovrint:False,ptlb:Static Opacity,ptin:_StaticOpacity,varname:node_528,prsc:2,glob:False,v1:0.5;n:type:ShaderForge.SFN_Vector1,id:4565,x:32248,y:33300,varname:node_4565,prsc:2,v1:1;n:type:ShaderForge.SFN_Subtract,id:7547,x:32442,y:33300,varname:node_7547,prsc:2|A-4565-OUT,B-528-OUT;n:type:ShaderForge.SFN_Multiply,id:4596,x:32897,y:33292,varname:node_4596,prsc:2|A-55-OUT,B-6783-OUT;n:type:ShaderForge.SFN_Clamp01,id:55,x:32710,y:33334,varname:node_55,prsc:2|IN-6239-OUT;n:type:ShaderForge.SFN_ScreenPos,id:9116,x:31952,y:32914,varname:node_9116,prsc:2,sctp:1;n:type:ShaderForge.SFN_ScreenPos,id:5234,x:31952,y:33102,varname:node_5234,prsc:2,sctp:1;proporder:7498-5906-2240-4940-5026-3383-9572-6381-528;pass:END;sub:END;*/

Shader "Shader Forge/Holograph" {
    Properties {
        _BaseColor ("Base Color", Color) = (0.3285035,0.5258977,0.7205882,1)
        _Metallic ("Metallic", Float ) = 0
        _ScanlineTexture ("ScanlineTexture", 2D) = "white" {}
        _ScanlineSoftOpacity ("Scanline Soft Opacity", Float ) = 0
        _ScanlineHardOpacity ("Scanline Hard Opacity", Float ) = 1
        _Gloss ("Gloss", Float ) = 0
        _Noise ("Noise", 2D) = "white" {}
        _Noise_copy ("Noise_copy", 2D) = "white" {}
        _StaticOpacity ("Static Opacity", Float ) = 0.5
        [HideInInspector]_Cutoff ("Alpha cutoff", Range(0,1)) = 0.5
    }
    SubShader {
        Tags {
            "IgnoreProjector"="True"
            "Queue"="Transparent"
            "RenderType"="Transparent"
        }
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            Blend SrcAlpha OneMinusSrcAlpha
            ZWrite Off
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #include "UnityPBSLighting.cginc"
            #include "UnityStandardBRDF.cginc"
            #pragma multi_compile_fwdbase
            #pragma multi_compile_fog
            #pragma exclude_renderers gles3 metal d3d11_9x xbox360 xboxone ps3 ps4 psp2 
            #pragma target 3.0
            uniform float4 _TimeEditor;
            uniform float4 _BaseColor;
            uniform float _Metallic;
            uniform sampler2D _ScanlineTexture; uniform float4 _ScanlineTexture_ST;
            uniform float _ScanlineSoftOpacity;
            uniform float _ScanlineHardOpacity;
            uniform float _Gloss;
            uniform sampler2D _Noise; uniform float4 _Noise_ST;
            uniform sampler2D _Noise_copy; uniform float4 _Noise_copy_ST;
            uniform float _StaticOpacity;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float4 posWorld : TEXCOORD0;
                float3 normalDir : TEXCOORD1;
                float4 screenPos : TEXCOORD2;
                UNITY_FOG_COORDS(3)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                float3 lightColor = _LightColor0.rgb;
                o.pos = UnityObjectToClipPos(v.vertex);
                UNITY_TRANSFER_FOG(o,o.pos);
                o.screenPos = o.pos;
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                i.screenPos = float4( i.screenPos.xy / i.screenPos.w, 0, 0 );
                i.screenPos.y *= _ProjectionParams.x;
/////// Vectors:
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 normalDirection = i.normalDir;
                float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
                float3 lightColor = _LightColor0.rgb;
                float3 halfDirection = normalize(viewDirection+lightDirection);
////// Lighting:
                float attenuation = 1;
                float3 attenColor = attenuation * _LightColor0.xyz;
                float Pi = 3.141592654;
                float InvPi = 0.31830988618;
///////// Gloss:
                float gloss = _Gloss;
                float specPow = exp2( gloss * 10.0+1.0);
/////// GI Data:
                UnityLight light;
                #ifdef LIGHTMAP_OFF
                    light.color = lightColor;
                    light.dir = lightDirection;
                    light.ndotl = LambertTerm (normalDirection, light.dir);
                #else
                    light.color = half3(0.f, 0.f, 0.f);
                    light.ndotl = 0.0f;
                    light.dir = half3(0.f, 0.f, 0.f);
                #endif
                UnityGIInput d;
                d.light = light;
                d.worldPos = i.posWorld.xyz;
                d.worldViewDir = viewDirection;
                d.atten = attenuation;
                UnityGI gi = UnityGlobalIllumination (d, 1, gloss, normalDirection);
                lightDirection = gi.light.dir;
                lightColor = gi.light.color;
////// Specular:
                float NdotL = max(0, dot( normalDirection, lightDirection ));
                float LdotH = max(0.0,dot(lightDirection, halfDirection));
                float3 diffuseColor = _BaseColor.rgb; // Need this for specular when using metallic
                float specularMonochrome;
                float3 specularColor;
                diffuseColor = DiffuseAndSpecularFromMetallic( diffuseColor, _Metallic, specularColor, specularMonochrome );
                specularMonochrome = 1-specularMonochrome;
                float NdotV = max(0.0,dot( normalDirection, viewDirection ));
                float NdotH = max(0.0,dot( normalDirection, halfDirection ));
                float VdotH = max(0.0,dot( viewDirection, halfDirection ));
                float visTerm = SmithBeckmannVisibilityTerm( NdotL, NdotV, 1.0-gloss );
                float normTerm = max(0.0, NDFBlinnPhongNormalizedTerm(NdotH, RoughnessToSpecPower(1.0-gloss)));
                float specularPBL = max(0, (NdotL*visTerm*normTerm) * unity_LightGammaCorrectionConsts_PIDiv4 );
                float3 directSpecular = (floor(attenuation) * _LightColor0.xyz) * pow(max(0,dot(halfDirection,normalDirection)),specPow)*specularPBL*lightColor*FresnelTerm(specularColor, LdotH);
                float3 specular = directSpecular;
/////// Diffuse:
                NdotL = max(0.0,dot( normalDirection, lightDirection ));
                half fd90 = 0.5 + 2 * LdotH * LdotH * (1-gloss);
                float3 directDiffuse = ((1 +(fd90 - 1)*pow((1.00001-NdotL), 5)) * (1 + (fd90 - 1)*pow((1.00001-NdotV), 5)) * NdotL) * attenColor;
                float3 indirectDiffuse = float3(0,0,0);
                indirectDiffuse += UNITY_LIGHTMODEL_AMBIENT.rgb; // Ambient Light
                float3 diffuse = (directDiffuse + indirectDiffuse) * diffuseColor;
////// Emissive:
                float3 emissive = _BaseColor.rgb;
/// Final Color:
                float3 finalColor = diffuse + specular + emissive;
                float4 node_5881 = _Time + _TimeEditor;
                float2 node_547 = (float2(i.screenPos.x*(_ScreenParams.r/_ScreenParams.g), i.screenPos.y).rg+node_5881.g*float2(100,0));
                float4 _Noise_var = tex2D(_Noise,TRANSFORM_TEX(node_547, _Noise));
                float2 node_2606 = (float2(i.screenPos.x*(_ScreenParams.r/_ScreenParams.g), i.screenPos.y).rg+node_5881.g*float2(0,100));
                float4 _Noise_copy_var = tex2D(_Noise_copy,TRANSFORM_TEX(node_2606, _Noise_copy));
                float2 node_2725 = (float2(i.screenPos.x*(_ScreenParams.r/_ScreenParams.g), i.screenPos.y).rg+node_5881.g*float2(0,0.03));
                float4 _ScanlineTexture_var = tex2D(_ScanlineTexture,TRANSFORM_TEX(node_2725, _ScanlineTexture));
                fixed4 finalRGBA = fixed4(finalColor,(saturate(((_Noise_var.r*_Noise_copy_var.r)+(1.0-_StaticOpacity)))*((_ScanlineHardOpacity*_ScanlineTexture_var.r)+_ScanlineSoftOpacity)));
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
        Pass {
            Name "FORWARD_DELTA"
            Tags {
                "LightMode"="ForwardAdd"
            }
            Blend One One
            ZWrite Off
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDADD
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #include "UnityPBSLighting.cginc"
            #include "UnityStandardBRDF.cginc"
            #pragma multi_compile_fwdadd
            #pragma multi_compile_fog
            #pragma exclude_renderers gles3 metal d3d11_9x xbox360 xboxone ps3 ps4 psp2 
            #pragma target 3.0
            uniform float4 _TimeEditor;
            uniform float4 _BaseColor;
            uniform float _Metallic;
            uniform sampler2D _ScanlineTexture; uniform float4 _ScanlineTexture_ST;
            uniform float _ScanlineSoftOpacity;
            uniform float _ScanlineHardOpacity;
            uniform float _Gloss;
            uniform sampler2D _Noise; uniform float4 _Noise_ST;
            uniform sampler2D _Noise_copy; uniform float4 _Noise_copy_ST;
            uniform float _StaticOpacity;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float4 posWorld : TEXCOORD0;
                float3 normalDir : TEXCOORD1;
                float4 screenPos : TEXCOORD2;
                LIGHTING_COORDS(3,4)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                float3 lightColor = _LightColor0.rgb;
                o.pos = UnityObjectToClipPos(v.vertex);
                o.screenPos = o.pos;
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                i.screenPos = float4( i.screenPos.xy / i.screenPos.w, 0, 0 );
                i.screenPos.y *= _ProjectionParams.x;
/////// Vectors:
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 normalDirection = i.normalDir;
                float3 lightDirection = normalize(lerp(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz - i.posWorld.xyz,_WorldSpaceLightPos0.w));
                float3 lightColor = _LightColor0.rgb;
                float3 halfDirection = normalize(viewDirection+lightDirection);
////// Lighting:
                //float attenuation = LIGHT_ATTENUATION(i); // LIGHT_ATTENUATION has been deprecated!
				UNITY_LIGHT_ATTENUATION(attenuation, i, i.posWorld.xyz);
                float3 attenColor = attenuation * _LightColor0.xyz;
                float Pi = 3.141592654;
                float InvPi = 0.31830988618;
///////// Gloss:
                float gloss = _Gloss;
                float specPow = exp2( gloss * 10.0+1.0);
////// Specular:
                float NdotL = max(0, dot( normalDirection, lightDirection ));
                float LdotH = max(0.0,dot(lightDirection, halfDirection));
                float3 diffuseColor = _BaseColor.rgb; // Need this for specular when using metallic
                float specularMonochrome;
                float3 specularColor;
                diffuseColor = DiffuseAndSpecularFromMetallic( diffuseColor, _Metallic, specularColor, specularMonochrome );
                specularMonochrome = 1-specularMonochrome;
                float NdotV = max(0.0,dot( normalDirection, viewDirection ));
                float NdotH = max(0.0,dot( normalDirection, halfDirection ));
                float VdotH = max(0.0,dot( viewDirection, halfDirection ));
                float visTerm = SmithBeckmannVisibilityTerm( NdotL, NdotV, 1.0-gloss );
                float normTerm = max(0.0, NDFBlinnPhongNormalizedTerm(NdotH, RoughnessToSpecPower(1.0-gloss)));
                float specularPBL = max(0, (NdotL*visTerm*normTerm) * unity_LightGammaCorrectionConsts_PIDiv4 );
                float3 directSpecular = attenColor * pow(max(0,dot(halfDirection,normalDirection)),specPow)*specularPBL*lightColor*FresnelTerm(specularColor, LdotH);
                float3 specular = directSpecular;
/////// Diffuse:
                NdotL = max(0.0,dot( normalDirection, lightDirection ));
                half fd90 = 0.5 + 2 * LdotH * LdotH * (1-gloss);
                float3 directDiffuse = ((1 +(fd90 - 1)*pow((1.00001-NdotL), 5)) * (1 + (fd90 - 1)*pow((1.00001-NdotV), 5)) * NdotL) * attenColor;
                float3 diffuse = directDiffuse * diffuseColor;
/// Final Color:
                float3 finalColor = diffuse + specular;
                float4 node_566 = _Time + _TimeEditor;
                float2 node_547 = (float2(i.screenPos.x*(_ScreenParams.r/_ScreenParams.g), i.screenPos.y).rg+node_566.g*float2(100,0));
                float4 _Noise_var = tex2D(_Noise,TRANSFORM_TEX(node_547, _Noise));
                float2 node_2606 = (float2(i.screenPos.x*(_ScreenParams.r/_ScreenParams.g), i.screenPos.y).rg+node_566.g*float2(0,100));
                float4 _Noise_copy_var = tex2D(_Noise_copy,TRANSFORM_TEX(node_2606, _Noise_copy));
                float2 node_2725 = (float2(i.screenPos.x*(_ScreenParams.r/_ScreenParams.g), i.screenPos.y).rg+node_566.g*float2(0,0.03));
                float4 _ScanlineTexture_var = tex2D(_ScanlineTexture,TRANSFORM_TEX(node_2725, _ScanlineTexture));
                return fixed4(finalColor * (saturate(((_Noise_var.r*_Noise_copy_var.r)+(1.0-_StaticOpacity)))*((_ScanlineHardOpacity*_ScanlineTexture_var.r)+_ScanlineSoftOpacity)),0);
            }
            ENDCG
        }
    }
    FallBack "Standard"
    CustomEditor "ShaderForgeMaterialInspector"
}
