#include <stdio.h>

void ManageWM2(int temp1, int temp2, int tmpT, int OrbitCmd_Tgon, int Time_T,
int Atti_absqBT, int Changeable_qUL, int DeltaT, int Flg_ZT11, int Flg_BZ5,
int TkCount_TjsumZ, int TkCount_TjsumY, int TkCount_TjsumX)
{
	int tmp;
	int WMInitFlg;
        int TkCount_NUMStarDirThu;
        int FailureFlag;
	TkCount_NUMStarDirThu = 0;
	FailureFlag = 0;

    	if((OrbitCmd_Tgon > 0) && (Time_T >= OrbitCmd_Tgon) && (Time_T <= (OrbitCmd_Tgon + 16)))
    	{
       		WMInitFlg = 1;
    	}

	if(Atti_absqBT >= Changeable_qUL)
	{
		TkCount_NUMStarDirThu = TkCount_NUMStarDirThu + 1;
	}
	else
	{
		TkCount_NUMStarDirThu = 0;
	}

	tmp = TkCount_NUMStarDirThu + DeltaT;

	if(tmp >= tmpT)
	{
		if(Flg_ZT11  == 1)
		{
			FailureFlag = 1;
		}
	}
	else if((Flg_BZ5 == 0) || (Flg_BZ5 == 3) || (Flg_BZ5 == 5) || (Flg_BZ5 == 10) || (Flg_BZ5 == 15))
	{
		if((TkCount_TjsumY > temp1) || (TkCount_TjsumZ > temp1) || (TkCount_TjsumX > temp2))
		{
			if(Flg_ZT11 == 1)
			{
				FailureFlag = 1;
			}
		}
	}
	if(FailureFlag == 1)
    	{
        	WMInitFlg = 1;
    	}
        printf("%d, %d, %d, %d\n", tmp, WMInitFlg, TkCount_NUMStarDirThu, FailureFlag);
 
}

int main(int argc, char *argv[])
{
#define KMS(a) klee_make_symbolic(&a, sizeof(a), #a)
    int temp1;
    KMS(temp1);
    int temp2;
    KMS(temp2);
    int tmpT;
    KMS(tmpT);
    int OrbitCmd_Tgon;
    KMS(OrbitCmd_Tgon);
    int Time_T;
    KMS(Time_T);
    int Atti_absqBT;
    KMS(Atti_absqBT);
    int Changeable_qUL;
    KMS(Changeable_qUL);
    int DeltaT;
    KMS(DeltaT);
    int Flg_ZT11;
    KMS(Flg_ZT11);
    int Flg_BZ5;
    KMS(Flg_BZ5);
    int TkCount_TjsumZ;
    KMS(TkCount_TjsumZ);
    int TkCount_TjsumY;
    KMS(TkCount_TjsumY);
    int TkCount_TjsumX;
    KMS(TkCount_TjsumX);

    ManageWM2(temp1, temp2, tmpT, OrbitCmd_Tgon, Time_T, Atti_absqBT,
             Changeable_qUL, DeltaT, Flg_ZT11, Flg_BZ5, TkCount_TjsumZ,
             TkCount_TjsumY, TkCount_TjsumX);
}
