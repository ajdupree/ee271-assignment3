
#include "svdpi.h"

#ifdef __cplusplus
extern "C" {
#endif

#ifndef _VC_TYPES_
#define _VC_TYPES_
/* common definitions shared with DirectC.h */

typedef unsigned int U;
typedef unsigned char UB;
typedef unsigned char scalar;
typedef struct { U c; U d;} vec32;

#define scalar_0 0
#define scalar_1 1
#define scalar_z 2
#define scalar_x 3

extern long long int ConvUP2LLI(U* a);
extern void ConvLLI2UP(long long int a1, U* a2);
extern long long int GetLLIresult();
extern void StoreLLIresult(const unsigned int* data);
typedef struct VeriC_Descriptor *vc_handle;

#ifndef SV_3_COMPATIBILITY
#define SV_STRING const char*
#else
#define SV_STRING char*
#endif

#endif /* _VC_TYPES_ */


 extern int zbuff_init(int w, int h, int ss_w);

 extern int zbuff_rop(int x, int y, int ss_x, int ss_y, int d, int R, int G, int B);

 extern int write_ppm();

 extern int rastBBox_bbox_check(int v0_x, int v0_y, int v1_x, int v1_y, int v2_x, int v2_y, int v3_x, int v3_y, int q, int valid_Poly, 
int ll_x, int ll_y, int ur_x, int ur_y, int ss_w_lg2, int screen_w, int screen_h, int valid, int r_shift, int r_val
);

 extern int rastBBox_stest_check(int v0_x, int v0_y, int v1_x, int v1_y, int v2_x, int v2_y, int v3_x, int v3_y, int q, int s_x, 
int s_y, int hit);

 extern int rastBBox_check(int v0_x, int v0_y, int v1_x, int v1_y, int v2_x, int v2_y, int v3_x, int v3_y, int q, int hits, 
int ss_w_lg2, int screen_w, int screen_h, int r_shift, int r_val);

 extern int rastBBox_jhash_jit_fix_check(int s_x, int s_y, int ss_w_lg2, int jitter_x, int jitter_y, int s_j_x, int s_j_y);

#ifdef __cplusplus
}
#endif

