package com.etralab.appstoreforandroid;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.math.BigInteger;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.security.GeneralSecurityException;
import java.security.KeyFactory;
import java.security.KeyPair;
import java.security.KeyPairGenerator;
import java.security.NoSuchAlgorithmException;
import java.security.interfaces.RSAPublicKey;
import java.security.spec.InvalidKeySpecException;
import java.security.spec.PKCS8EncodedKeySpec;
import java.security.spec.X509EncodedKeySpec;
import javax.crypto.Cipher;
/* loaded from: classes.dex */
public class AdbCrypto {
    public static final int KEY_LENGTH_BITS = 2048;
    public static final int KEY_LENGTH_BYTES = 256;
    public static final int KEY_LENGTH_WORDS = 64;
    public static byte[] SIGNATURE_PADDING;
    public static final int[] SIGNATURE_PADDING_AS_INT;
    private AdbBase64 base64;
    private KeyPair keyPair;

    static {
        int[] iArr = {0, 1, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 0, 48, 33, 48, 9, 6, 5, 43, 14, 3, 2, 26, 5, 0, 4, 20};
        SIGNATURE_PADDING_AS_INT = iArr;
        SIGNATURE_PADDING = new byte[iArr.length];
        int i = 0;
        while (true) {
            byte[] bArr = SIGNATURE_PADDING;
            if (i >= bArr.length) {
                return;
            }
            bArr[i] = (byte) SIGNATURE_PADDING_AS_INT[i];
            i++;
        }
    }

    private static byte[] convertRsaPublicKeyToAdbFormat(RSAPublicKey rSAPublicKey) {
        BigInteger bit = BigInteger.ZERO.setBit(32);
        BigInteger modulus = rSAPublicKey.getModulus();
        BigInteger modPow = BigInteger.ZERO.setBit(2048).modPow(BigInteger.valueOf(2L), modulus);
        BigInteger modInverse = modulus.remainder(bit).modInverse(bit);
        int[] iArr = new int[64];
        int[] iArr2 = new int[64];
        int i = 0;
        while (i < 64) {
            BigInteger[] divideAndRemainder = modPow.divideAndRemainder(bit);
            BigInteger bigInteger = divideAndRemainder[0];
            iArr2[i] = divideAndRemainder[1].intValue();
            BigInteger[] divideAndRemainder2 = modulus.divideAndRemainder(bit);
            BigInteger bigInteger2 = divideAndRemainder2[0];
            iArr[i] = divideAndRemainder2[1].intValue();
            i++;
            modulus = bigInteger2;
            modPow = bigInteger;
        }
        ByteBuffer order = ByteBuffer.allocate(524).order(ByteOrder.LITTLE_ENDIAN);
        order.putInt(64);
        order.putInt(modInverse.negate().intValue());
        for (int i2 = 0; i2 < 64; i2++) {
            order.putInt(iArr[i2]);
        }
        for (int i3 = 0; i3 < 64; i3++) {
            order.putInt(iArr2[i3]);
        }
        order.putInt(rSAPublicKey.getPublicExponent().intValue());
        return order.array();
    }

    public static AdbCrypto loadAdbKeyPair(AdbBase64 adbBase64, File file, File file2) throws IOException, NoSuchAlgorithmException, InvalidKeySpecException {
        AdbCrypto adbCrypto = new AdbCrypto();
        byte[] bArr = new byte[(int) file.length()];
        byte[] bArr2 = new byte[(int) file2.length()];
        FileInputStream fileInputStream = new FileInputStream(file);
        FileInputStream fileInputStream2 = new FileInputStream(file2);
        fileInputStream.read(bArr);
        fileInputStream2.read(bArr2);
        fileInputStream.close();
        fileInputStream2.close();
        KeyFactory keyFactory = KeyFactory.getInstance("RSA");
        adbCrypto.keyPair = new KeyPair(keyFactory.generatePublic(new X509EncodedKeySpec(bArr2)), keyFactory.generatePrivate(new PKCS8EncodedKeySpec(bArr)));
        adbCrypto.base64 = adbBase64;
        return adbCrypto;
    }

    public static AdbCrypto generateAdbKeyPair(AdbBase64 adbBase64) throws NoSuchAlgorithmException {
        AdbCrypto adbCrypto = new AdbCrypto();
        KeyPairGenerator keyPairGenerator = KeyPairGenerator.getInstance("RSA");
        keyPairGenerator.initialize(2048);
        adbCrypto.keyPair = keyPairGenerator.genKeyPair();
        adbCrypto.base64 = adbBase64;
        return adbCrypto;
    }

    public byte[] signAdbTokenPayload(byte[] bArr) throws GeneralSecurityException {
        Cipher cipher = Cipher.getInstance("RSA/ECB/NoPadding");
        cipher.init(1, this.keyPair.getPrivate());
        cipher.update(SIGNATURE_PADDING);
        return cipher.doFinal(bArr);
    }

    public byte[] getAdbPublicKeyPayload() throws IOException {
        byte[] convertRsaPublicKeyToAdbFormat = convertRsaPublicKeyToAdbFormat((RSAPublicKey) this.keyPair.getPublic());
        StringBuilder sb = new StringBuilder(720);
        sb.append(this.base64.encodeToString(convertRsaPublicKeyToAdbFormat));
        sb.append(" unknown@unknown");
        sb.append((char) 0);
        return sb.toString().getBytes("UTF-8");
    }

    public void saveAdbKeyPair(File file, File file2) throws IOException {
        FileOutputStream fileOutputStream = new FileOutputStream(file);
        FileOutputStream fileOutputStream2 = new FileOutputStream(file2);
        fileOutputStream.write(this.keyPair.getPrivate().getEncoded());
        fileOutputStream2.write(this.keyPair.getPublic().getEncoded());
        fileOutputStream.close();
        fileOutputStream2.close();
    }
}
