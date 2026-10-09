module convert;

import color.encoding;

public float3 ycbcrToRgb(float3 sample, YCbCrEncoding encoding)
{
    float y = (sample.x - encoding.lumaOffset) * encoding.lumaScale;
    float cb = (sample.y - encoding.chromaOffset) * encoding.chromaScale;
    float cr = (sample.z - encoding.chromaOffset) * encoding.chromaScale;

    float kr = encoding.lumaWeights.x;
    float kg = encoding.lumaWeights.y;
    float kb = encoding.lumaWeights.z;
    float r = y + 2.0 * (1.0 - kr) * cr;
    float b = y + 2.0 * (1.0 - kb) * cb;
    float g = (y - kr * r - kb * b) / kg;
    return float3(r, g, b);
}

public int converterRevision()
{
    return 110;
}
