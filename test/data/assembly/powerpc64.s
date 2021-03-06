# These tests are fetched from Capstone's test_ppc.c

# context: endian: big
# !skip asm
# PPC-64
  1000:   43 20 0c 07  bdnzla+  0xc04
  1004:   41 56 7f 17  bdztla   4*cr5+eq, 0x7f14
# Inconsistent output between capstone3 and later versions, skip
  ; 1008:   80 20 00 00  lwz      r1, 0(0)
  ; 100c:   80 3f 00 00  lwz      r1, 0(r31)
  1008:   10 43 23 0e  vpkpx    v2, v3, v4
  100c:   d0 44 00 80  stfs     f2, 0x80(r4)
  1010:   4c 43 22 02  crand    2, 3, 4
  1014:   2d 03 00 80  cmpwi    cr2, r3, 0x80
  1018:   7c 43 20 14  addc     r2, r3, r4
  101c:   7c 43 20 93  mulhd.   r2, r3, r4
  1020:   4f 20 00 21  bdnzlrl+
  1024:   4c c8 00 21  bgelrl-  cr2
  1028:   40 82 00 14  bne      0x103c

# context: endian: big
# !skip disasm
# PPC-64
  1000:   43 20 0c 07  bdnzla+  0xc04
  1004:   41 56 7f 17  bdztla   4*cr5+eq, 0x7f14
  1008:   80 20 00 00  lwz      1, 0(0)
  1010:   80 3f 00 00  lwz      1, 0(31)
  1014:   10 43 23 0e  vpkpx    2, 3, 4
  1018:   d0 44 00 80  stfs     2, 0x80(4)
  101c:   4c 43 22 02  crand    2, 3, 4
  1020:   2d 03 00 80  cmpwi    cr2, 3, 0x80
  1024:   7c 43 20 14  addc     2, 3, 4
  1028:   7c 43 20 93  mulhd.   2, 3, 4
  102c:   4f 20 00 21  bdnzlrl+
  1030:   4c c8 00 21  bgelrl-  cr2
  1034:   40 82 00 14  bne      0x1044
