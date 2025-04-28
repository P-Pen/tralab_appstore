package kotlin.collections;

import kotlin.Metadata;
import kotlin.UByte;
import kotlin.UByteArray;
import kotlin.UIntArray;
import kotlin.ULongArray;
import kotlin.UShort;
import kotlin.UShortArray;
import kotlin.UnsignedKt;
import kotlin.jvm.internal.Intrinsics;
/* compiled from: UArraySorting.kt */
@Metadata(bv = {1, 0, 3}, d1 = {"\u00000\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u0002\n\u0002\b\u0012\u001a*\u0010\u0000\u001a\u00020\u00012\u0006\u0010\u0002\u001a\u00020\u00032\u0006\u0010\u0004\u001a\u00020\u00012\u0006\u0010\u0005\u001a\u00020\u0001H\u0003ø\u0001\u0000¢\u0006\u0004\b\u0006\u0010\u0007\u001a*\u0010\u0000\u001a\u00020\u00012\u0006\u0010\u0002\u001a\u00020\b2\u0006\u0010\u0004\u001a\u00020\u00012\u0006\u0010\u0005\u001a\u00020\u0001H\u0003ø\u0001\u0000¢\u0006\u0004\b\t\u0010\n\u001a*\u0010\u0000\u001a\u00020\u00012\u0006\u0010\u0002\u001a\u00020\u000b2\u0006\u0010\u0004\u001a\u00020\u00012\u0006\u0010\u0005\u001a\u00020\u0001H\u0003ø\u0001\u0000¢\u0006\u0004\b\f\u0010\r\u001a*\u0010\u0000\u001a\u00020\u00012\u0006\u0010\u0002\u001a\u00020\u000e2\u0006\u0010\u0004\u001a\u00020\u00012\u0006\u0010\u0005\u001a\u00020\u0001H\u0003ø\u0001\u0000¢\u0006\u0004\b\u000f\u0010\u0010\u001a*\u0010\u0011\u001a\u00020\u00122\u0006\u0010\u0002\u001a\u00020\u00032\u0006\u0010\u0004\u001a\u00020\u00012\u0006\u0010\u0005\u001a\u00020\u0001H\u0003ø\u0001\u0000¢\u0006\u0004\b\u0013\u0010\u0014\u001a*\u0010\u0011\u001a\u00020\u00122\u0006\u0010\u0002\u001a\u00020\b2\u0006\u0010\u0004\u001a\u00020\u00012\u0006\u0010\u0005\u001a\u00020\u0001H\u0003ø\u0001\u0000¢\u0006\u0004\b\u0015\u0010\u0016\u001a*\u0010\u0011\u001a\u00020\u00122\u0006\u0010\u0002\u001a\u00020\u000b2\u0006\u0010\u0004\u001a\u00020\u00012\u0006\u0010\u0005\u001a\u00020\u0001H\u0003ø\u0001\u0000¢\u0006\u0004\b\u0017\u0010\u0018\u001a*\u0010\u0011\u001a\u00020\u00122\u0006\u0010\u0002\u001a\u00020\u000e2\u0006\u0010\u0004\u001a\u00020\u00012\u0006\u0010\u0005\u001a\u00020\u0001H\u0003ø\u0001\u0000¢\u0006\u0004\b\u0019\u0010\u001a\u001a\u001a\u0010\u001b\u001a\u00020\u00122\u0006\u0010\u0002\u001a\u00020\u0003H\u0001ø\u0001\u0000¢\u0006\u0004\b\u001c\u0010\u001d\u001a\u001a\u0010\u001b\u001a\u00020\u00122\u0006\u0010\u0002\u001a\u00020\bH\u0001ø\u0001\u0000¢\u0006\u0004\b\u001e\u0010\u001f\u001a\u001a\u0010\u001b\u001a\u00020\u00122\u0006\u0010\u0002\u001a\u00020\u000bH\u0001ø\u0001\u0000¢\u0006\u0004\b \u0010!\u001a\u001a\u0010\u001b\u001a\u00020\u00122\u0006\u0010\u0002\u001a\u00020\u000eH\u0001ø\u0001\u0000¢\u0006\u0004\b\"\u0010#\u0082\u0002\u0004\n\u0002\b\u0019¨\u0006$"}, d2 = {"partition", "", "array", "Lkotlin/UByteArray;", "left", "right", "partition-4UcCI2c", "([BII)I", "Lkotlin/UIntArray;", "partition-oBK06Vg", "([III)I", "Lkotlin/ULongArray;", "partition--nroSd4", "([JII)I", "Lkotlin/UShortArray;", "partition-Aa5vz7o", "([SII)I", "quickSort", "", "quickSort-4UcCI2c", "([BII)V", "quickSort-oBK06Vg", "([III)V", "quickSort--nroSd4", "([JII)V", "quickSort-Aa5vz7o", "([SII)V", "sortArray", "sortArray-GBYM_sE", "([B)V", "sortArray--ajY-9A", "([I)V", "sortArray-QwZRm1k", "([J)V", "sortArray-rL5Bavg", "([S)V", "kotlin-stdlib"}, k = 2, mv = {1, 1, 16})
/* loaded from: classes.dex */
public final class UArraySortingKt {
    /* renamed from: partition-4UcCI2c  reason: not valid java name */
    private static final int m336partition4UcCI2c(byte[] bArr, int i, int i2) {
        int i3;
        byte m83getimpl = UByteArray.m83getimpl(bArr, (i + i2) / 2);
        while (i <= i2) {
            while (true) {
                int m83getimpl2 = UByteArray.m83getimpl(bArr, i) & UByte.MAX_VALUE;
                i3 = m83getimpl & UByte.MAX_VALUE;
                if (Intrinsics.compare(m83getimpl2, i3) >= 0) {
                    break;
                }
                i++;
            }
            while (Intrinsics.compare(UByteArray.m83getimpl(bArr, i2) & UByte.MAX_VALUE, i3) > 0) {
                i2--;
            }
            if (i <= i2) {
                byte m83getimpl3 = UByteArray.m83getimpl(bArr, i);
                UByteArray.m88setVurrAj0(bArr, i, UByteArray.m83getimpl(bArr, i2));
                UByteArray.m88setVurrAj0(bArr, i2, m83getimpl3);
                i++;
                i2--;
            }
        }
        return i;
    }

    /* renamed from: quickSort-4UcCI2c  reason: not valid java name */
    private static final void m340quickSort4UcCI2c(byte[] bArr, int i, int i2) {
        int m336partition4UcCI2c = m336partition4UcCI2c(bArr, i, i2);
        int i3 = m336partition4UcCI2c - 1;
        if (i < i3) {
            m340quickSort4UcCI2c(bArr, i, i3);
        }
        if (m336partition4UcCI2c < i2) {
            m340quickSort4UcCI2c(bArr, m336partition4UcCI2c, i2);
        }
    }

    /* renamed from: partition-Aa5vz7o  reason: not valid java name */
    private static final int m337partitionAa5vz7o(short[] sArr, int i, int i2) {
        int i3;
        short m316getimpl = UShortArray.m316getimpl(sArr, (i + i2) / 2);
        while (i <= i2) {
            while (true) {
                int m316getimpl2 = UShortArray.m316getimpl(sArr, i) & UShort.MAX_VALUE;
                i3 = m316getimpl & UShort.MAX_VALUE;
                if (Intrinsics.compare(m316getimpl2, i3) >= 0) {
                    break;
                }
                i++;
            }
            while (Intrinsics.compare(UShortArray.m316getimpl(sArr, i2) & UShort.MAX_VALUE, i3) > 0) {
                i2--;
            }
            if (i <= i2) {
                short m316getimpl3 = UShortArray.m316getimpl(sArr, i);
                UShortArray.m321set01HTLdE(sArr, i, UShortArray.m316getimpl(sArr, i2));
                UShortArray.m321set01HTLdE(sArr, i2, m316getimpl3);
                i++;
                i2--;
            }
        }
        return i;
    }

    /* renamed from: quickSort-Aa5vz7o  reason: not valid java name */
    private static final void m341quickSortAa5vz7o(short[] sArr, int i, int i2) {
        int m337partitionAa5vz7o = m337partitionAa5vz7o(sArr, i, i2);
        int i3 = m337partitionAa5vz7o - 1;
        if (i < i3) {
            m341quickSortAa5vz7o(sArr, i, i3);
        }
        if (m337partitionAa5vz7o < i2) {
            m341quickSortAa5vz7o(sArr, m337partitionAa5vz7o, i2);
        }
    }

    /* renamed from: partition-oBK06Vg  reason: not valid java name */
    private static final int m338partitionoBK06Vg(int[] iArr, int i, int i2) {
        int m152getimpl = UIntArray.m152getimpl(iArr, (i + i2) / 2);
        while (i <= i2) {
            while (UnsignedKt.uintCompare(UIntArray.m152getimpl(iArr, i), m152getimpl) < 0) {
                i++;
            }
            while (UnsignedKt.uintCompare(UIntArray.m152getimpl(iArr, i2), m152getimpl) > 0) {
                i2--;
            }
            if (i <= i2) {
                int m152getimpl2 = UIntArray.m152getimpl(iArr, i);
                UIntArray.m157setVXSXFK8(iArr, i, UIntArray.m152getimpl(iArr, i2));
                UIntArray.m157setVXSXFK8(iArr, i2, m152getimpl2);
                i++;
                i2--;
            }
        }
        return i;
    }

    /* renamed from: quickSort-oBK06Vg  reason: not valid java name */
    private static final void m342quickSortoBK06Vg(int[] iArr, int i, int i2) {
        int m338partitionoBK06Vg = m338partitionoBK06Vg(iArr, i, i2);
        int i3 = m338partitionoBK06Vg - 1;
        if (i < i3) {
            m342quickSortoBK06Vg(iArr, i, i3);
        }
        if (m338partitionoBK06Vg < i2) {
            m342quickSortoBK06Vg(iArr, m338partitionoBK06Vg, i2);
        }
    }

    /* renamed from: partition--nroSd4  reason: not valid java name */
    private static final int m335partitionnroSd4(long[] jArr, int i, int i2) {
        long m221getimpl = ULongArray.m221getimpl(jArr, (i + i2) / 2);
        while (i <= i2) {
            while (UnsignedKt.ulongCompare(ULongArray.m221getimpl(jArr, i), m221getimpl) < 0) {
                i++;
            }
            while (UnsignedKt.ulongCompare(ULongArray.m221getimpl(jArr, i2), m221getimpl) > 0) {
                i2--;
            }
            if (i <= i2) {
                long m221getimpl2 = ULongArray.m221getimpl(jArr, i);
                ULongArray.m226setk8EXiF4(jArr, i, ULongArray.m221getimpl(jArr, i2));
                ULongArray.m226setk8EXiF4(jArr, i2, m221getimpl2);
                i++;
                i2--;
            }
        }
        return i;
    }

    /* renamed from: quickSort--nroSd4  reason: not valid java name */
    private static final void m339quickSortnroSd4(long[] jArr, int i, int i2) {
        int m335partitionnroSd4 = m335partitionnroSd4(jArr, i, i2);
        int i3 = m335partitionnroSd4 - 1;
        if (i < i3) {
            m339quickSortnroSd4(jArr, i, i3);
        }
        if (m335partitionnroSd4 < i2) {
            m339quickSortnroSd4(jArr, m335partitionnroSd4, i2);
        }
    }

    /* renamed from: sortArray-GBYM_sE  reason: not valid java name */
    public static final void m344sortArrayGBYM_sE(byte[] array) {
        Intrinsics.checkParameterIsNotNull(array, "array");
        m340quickSort4UcCI2c(array, 0, UByteArray.m84getSizeimpl(array) - 1);
    }

    /* renamed from: sortArray-rL5Bavg  reason: not valid java name */
    public static final void m346sortArrayrL5Bavg(short[] array) {
        Intrinsics.checkParameterIsNotNull(array, "array");
        m341quickSortAa5vz7o(array, 0, UShortArray.m317getSizeimpl(array) - 1);
    }

    /* renamed from: sortArray--ajY-9A  reason: not valid java name */
    public static final void m343sortArrayajY9A(int[] array) {
        Intrinsics.checkParameterIsNotNull(array, "array");
        m342quickSortoBK06Vg(array, 0, UIntArray.m153getSizeimpl(array) - 1);
    }

    /* renamed from: sortArray-QwZRm1k  reason: not valid java name */
    public static final void m345sortArrayQwZRm1k(long[] array) {
        Intrinsics.checkParameterIsNotNull(array, "array");
        m339quickSortnroSd4(array, 0, ULongArray.m222getSizeimpl(array) - 1);
    }
}
