                        ;#include<stdio.h>
                        ;
                        ;int R1;
                        ;int R2;
                        ;int R3;
                        ;int R4;
                        ;int R5;
                        ;int* R6;
                        ;int R7;
                        ;int R8;
                        ;int R9;
                        ;int RA;
                        ;int RB;
                        ;
BUF DUP 0x10            ;int buffer[16] = {0};
                        ;
                        ;int main() 
                        ;{
    LDA R1  0x01        ;R1=1;
    ADD R2  R0  R0      ;R2=0;
    ADD R3  R0  R0      ;R3=0;
    ADD R4  R0  R0      ;R4=0;
    LDA R5  0x27        ;R5 = 0x27;
    LDA RA  0x08        ;RA = 8;
    SHL R5  R5  RA      ;R5 = R5 << RA;
    LDA RA  0x10        ;RA = 0x10;
    ADD R5  R5  RA      ;R5 += RA;
    LDA R6  BUF         ;R6=buffer;
    ADD R7  R0  R0      ;R7=0;
    ADD R8  R0  R0      ;R8=0;
    ADD R9  R0  R0      ;R9=0;
    ADD RA  R0  R0      ;RA=0;
    ADD RB  R0  R0      ;RB=0;
A20 LD  R2  0xFF        ;A20:R2 = getchar();
    LDA RA  0x03        ;RA = EOF;
    SUB RA  RA  R2      ;RA -= R2;
    BZ  RA  A21         ;if(RA==0) goto A21;
    ST  R2  0xFF        ;putchar(R2);
    LDA RA  0x2F        ;RA = 0x2f;
    SUB RA  RA  R2      ;RA -= R2;
    BP  RA  B50         ;if(RA>0) goto B50;
    LDA RA  0x3A        ;RA = 0x3a;
    SUB RA  R2  RA      ;RA = R2 - RA;
    BP  RA  B50         ;if(RA>0) goto B50;
    BP  R8  B40         ;if(R8>0) goto B40;
    ADD R3  R0  R0      ;R3 = 0;
    BZ  R0  B41         ;goto B41;
B40 LDA RA  0x09        ;B40:RA = 9;
    ADD RB  R3  R0      ;RB = R3;
C00 ADD R3  R3  RB      ;C00:R3 += RB;
    SUB RA  RA  R1      ;RA-=R1;
    BP  RA  C00         ;if(RA>0) goto C00;
B41 LDA RA  0x30        ;B41:RA = 0x30;
    SUB RA  R2  RA      ;RA = R2 - RA;
    ADD R3  R3  RA      ;R3 += RA;
    ADD R8  R1  R0      ;R8 = 1;
    BZ  R0  A11         ;goto A11;
B50 LDA RA  0x0A        ;B50:RA = 0x0a;
    SUB RA  RA  R2      ;RA -= R2;
    BZ  RA  B52         ;if(RA==0) goto B52;
    BZ  R0  B51         ;goto B51;
B52 STI R3  R6          ;B52:*R6 = R3;
    ADD R6  R6  R1      ;R6+=R1;
    ADD R8  R0  R0      ;R8 = 0;
    BZ  R0  A11         ;goto A11;
B51 LDA RA  0x2B        ;B51:RA = 0x2b;
    SUB RA  RA  R2      ;RA -= R2;
    BZ  RA  B53         ;if(RA==0) goto B53;
    BZ  R0  A11         ;goto A11;
B53 LDA RA  0x0A        ;B53:RA = 0x0a;
    ST  RA  0xFF        ;putchar(RA);
    SUB R6  R6  R1      ;R6-=R1;
    LDI RA  R6          ;RA = *R6;
    ADD R3  R3  RA      ;R3 += RA;
    ADD R4  R3  R0      ;R4 = R3;
A10 ADD RA  R5  R0      ;A10:RA = R5;
    SUB RA  RA  R4      ;RA -= R4;
    BP  RA  B20         ;if(RA>0) goto B20;
    LDA RA  0x27        ;RA = 0x27;
    LDA RB  0x08        ;RB = 8;
    SHL RA  RA  RB      ;RA = RA << RB;
    LDA RB  0x0F        ;RB = 0x0f;
    ADD RA  RA  RB      ;RA += RB;
    SUB RA  R4  RA      ;RA = R4 - RA;
    BP  RA  B00         ;if (RA>0) goto B00;
    LDA R7  0x09        ;R7 = 9;
    BZ  R0  A00         ;goto A00;
B00 LDA R7  0x03        ;B00:R7 = 6;
A00 ADD RB  R7  R0      ;A00:RB = R7;
    ADD RA  R0  R0      ;RA = 0;
B10 ADD RA  RA  R5      ;B10:RA += R5;
    SUB RB  RB  R1      ;RB-=R1;
    BP  RB  B10         ;if(RB>0) goto B10;
    SUB RA  RA  R4      ;RA -= R4;
    BP  RA  B11         ;if(RA>0) goto B11;
    LDA RA  0x30        ;RA = 0x30;
    ADD RA  RA  R7      ;RA += R7;
    ST  RA  0xFF        ;putchar(RA);
    ADD RA  R0  R0      ;RA = 0;
    ADD RB  R7  R0      ;RB = R7;
C01 ADD RA  RA  R5      ;C01:RA += R5;
    SUB RB  RB  R1      ;RB-=R1;
    BP  RB  C01         ;if(RB>0) goto C01;
    SUB R4  R4  RA      ;R4 -= RA;
    ADD R9  R1  R0      ;R9 = 1;
    BZ  R0  A01         ;goto A01;
B11 SUB R7  R7  R1      ;B11:R7-=R1;
    BZ  R0  A00         ;goto A00;
A01 BZ  R0  B21         ;A01:goto B21;
B20 BZ  R9  B21         ;B20:if(R9==0) goto B21;
    LDA RA  0x30        ;RA = 0x30;
    ST  RA  0xFF        ;putchar(RA);
B21 LDA RA  0x27        ;B21:RA = 0x27;
    LDA RB  0x08        ;RB = 8;
    SHL RA  RA  RB      ;RA = RA << RB;
    LDA RB  0x0F        ;RB = 0x0f;
    ADD RA  RA  RB      ;RA += RB;
    SUB RA  RA  R5      ;RA -= R5;
    BP  RA  B30         ;if(RA>0) goto B30;
    LDA RA  0x03        ;RA = 0x03;
    LDA RB  0x08        ;RB = 8;
    SHL RA  RA  RB      ;RA = RA << RB;
    LDA RB  0xE8        ;RB = 0xe8;
    ADD RA  RA  RB      ;RA += RB;
    ADD R5  RA  R0      ;R5 = RA;
    BZ  R0  B33         ;goto B33;
B30 LDA RA  0x03        ;B30:RA = 0x03;
    LDA RB  0x08        ;RB = 8;
    SHL RA  RA  RB      ;RA = RA << RB;
    LDA RB  0xE7        ;RB = 0xe7;
    ADD RA  RA  RB      ;RA += RB;
    SUB RA  RA  R5      ;RA -= R5;
    BP  RA  B31         ;if (RA>0) goto B31;
    LDA R5  0x64        ;R5 = 100;
    BZ  R0  B33         ;goto B33;
B31 LDA RA  0x63        ;B31:RA = 99;
    SUB RA  RA  R5      ;RA -= R5;
    BP  RA  B32         ;if (RA>0) goto B32;
    LDA R5  0x0A        ;R5 = 10;
    BZ  R0  B33         ;goto B33;
B32 LDA RA  0x30        ;B32:RA = 0x30;
    ADD RA  RA  R4      ;RA += R4;
    ST  RA  0xFF        ;putchar(RA);
    ADD R9  R0  R0      ;R9 = 0;
    LDA R5  0x27        ;R5 = 0x27;
    LDA RA  0x08        ;RA = 8;
    SHL R5  R5  RA      ;R5 = R5 << RA;
    LDA RA  0x10        ;RA = 0x10;
    ADD R5  R5  RA      ;R5 += RA;
    BZ  R0  A11         ;goto A11;
B33 BZ  R0  A10         ;B33:goto A10;
A11 BZ  R0  A20         ;A11:goto A20;
A21 LDA RA  0x0A        ;A21:RA = 0x0a;
    ST  RA  0xFF        ;putchar(RA);
    HLT                 ;return 0;
                        ;}