.class public Lcom/etralab/appstoreforandroid/AdbCrypto;
.super Ljava/lang/Object;
.source "AdbCrypto.java"


# static fields
.field public static final KEY_LENGTH_BITS:I = 0x800

.field public static final KEY_LENGTH_BYTES:I = 0x100

.field public static final KEY_LENGTH_WORDS:I = 0x40

.field public static SIGNATURE_PADDING:[B

.field public static final SIGNATURE_PADDING_AS_INT:[I


# instance fields
.field private base64:Lcom/etralab/appstoreforandroid/AdbBase64;

.field private keyPair:Ljava/security/KeyPair;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    const/16 v0, 0xec

    new-array v0, v0, [I

    .line 46
    fill-array-data v0, :array_0

    sput-object v0, Lcom/etralab/appstoreforandroid/AdbCrypto;->SIGNATURE_PADDING_AS_INT:[I

    .line 73
    array-length v0, v0

    new-array v0, v0, [B

    sput-object v0, Lcom/etralab/appstoreforandroid/AdbCrypto;->SIGNATURE_PADDING:[B

    const/4 v0, 0x0

    .line 75
    :goto_0
    sget-object v1, Lcom/etralab/appstoreforandroid/AdbCrypto;->SIGNATURE_PADDING:[B

    array-length v2, v1

    if-ge v0, v2, :cond_0

    .line 76
    sget-object v2, Lcom/etralab/appstoreforandroid/AdbCrypto;->SIGNATURE_PADDING_AS_INT:[I

    aget v2, v2, v0

    int-to-byte v2, v2

    aput-byte v2, v1, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return-void

    nop

    :array_0
    .array-data 4
        0x0
        0x1
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0xff
        0x0
        0x30
        0x21
        0x30
        0x9
        0x6
        0x5
        0x2b
        0xe
        0x3
        0x2
        0x1a
        0x5
        0x0
        0x4
        0x14
    .end array-data
.end method

.method public constructor <init>()V
    .locals 0

    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static convertRsaPublicKeyToAdbFormat(Ljava/security/interfaces/RSAPublicKey;)[B
    .locals 11

    .line 101
    sget-object v0, Ljava/math/BigInteger;->ZERO:Ljava/math/BigInteger;

    const/16 v1, 0x20

    invoke-virtual {v0, v1}, Ljava/math/BigInteger;->setBit(I)Ljava/math/BigInteger;

    move-result-object v0

    .line 102
    invoke-interface {p0}, Ljava/security/interfaces/RSAPublicKey;->getModulus()Ljava/math/BigInteger;

    move-result-object v1

    .line 103
    sget-object v2, Ljava/math/BigInteger;->ZERO:Ljava/math/BigInteger;

    const/16 v3, 0x800

    invoke-virtual {v2, v3}, Ljava/math/BigInteger;->setBit(I)Ljava/math/BigInteger;

    move-result-object v2

    const-wide/16 v3, 0x2

    .line 104
    invoke-static {v3, v4}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    move-result-object v3

    invoke-virtual {v2, v3, v1}, Ljava/math/BigInteger;->modPow(Ljava/math/BigInteger;Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v2

    .line 105
    invoke-virtual {v1, v0}, Ljava/math/BigInteger;->remainder(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v3

    .line 106
    invoke-virtual {v3, v0}, Ljava/math/BigInteger;->modInverse(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v3

    const/16 v4, 0x40

    new-array v5, v4, [I

    new-array v6, v4, [I

    const/4 v7, 0x0

    move v8, v7

    :goto_0
    if-ge v8, v4, :cond_0

    .line 113
    invoke-virtual {v2, v0}, Ljava/math/BigInteger;->divideAndRemainder(Ljava/math/BigInteger;)[Ljava/math/BigInteger;

    move-result-object v2

    .line 114
    aget-object v9, v2, v7

    const/4 v10, 0x1

    .line 115
    aget-object v2, v2, v10

    .line 116
    invoke-virtual {v2}, Ljava/math/BigInteger;->intValue()I

    move-result v2

    aput v2, v6, v8

    .line 118
    invoke-virtual {v1, v0}, Ljava/math/BigInteger;->divideAndRemainder(Ljava/math/BigInteger;)[Ljava/math/BigInteger;

    move-result-object v1

    .line 119
    aget-object v2, v1, v7

    .line 120
    aget-object v1, v1, v10

    .line 121
    invoke-virtual {v1}, Ljava/math/BigInteger;->intValue()I

    move-result v1

    aput v1, v5, v8

    add-int/lit8 v8, v8, 0x1

    move-object v1, v2

    move-object v2, v9

    goto :goto_0

    :cond_0
    const/16 v0, 0x20c

    .line 126
    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    sget-object v1, Ljava/nio/ByteOrder;->LITTLE_ENDIAN:Ljava/nio/ByteOrder;

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 129
    invoke-virtual {v0, v4}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 130
    invoke-virtual {v3}, Ljava/math/BigInteger;->negate()Ljava/math/BigInteger;

    move-result-object v1

    invoke-virtual {v1}, Ljava/math/BigInteger;->intValue()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    move v1, v7

    :goto_1
    if-ge v1, v4, :cond_1

    .line 131
    aget v2, v5, v1

    .line 132
    invoke-virtual {v0, v2}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    :cond_1
    :goto_2
    if-ge v7, v4, :cond_2

    .line 133
    aget v1, v6, v7

    .line 134
    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    add-int/lit8 v7, v7, 0x1

    goto :goto_2

    .line 136
    :cond_2
    invoke-interface {p0}, Ljava/security/interfaces/RSAPublicKey;->getPublicExponent()Ljava/math/BigInteger;

    move-result-object p0

    invoke-virtual {p0}, Ljava/math/BigInteger;->intValue()I

    move-result p0

    invoke-virtual {v0, p0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 137
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object p0

    return-object p0
.end method

.method public static generateAdbKeyPair(Lcom/etralab/appstoreforandroid/AdbBase64;)Lcom/etralab/appstoreforandroid/AdbCrypto;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/NoSuchAlgorithmException;
        }
    .end annotation

    .line 187
    new-instance v0, Lcom/etralab/appstoreforandroid/AdbCrypto;

    invoke-direct {v0}, Lcom/etralab/appstoreforandroid/AdbCrypto;-><init>()V

    const-string v1, "RSA"

    .line 189
    invoke-static {v1}, Ljava/security/KeyPairGenerator;->getInstance(Ljava/lang/String;)Ljava/security/KeyPairGenerator;

    move-result-object v1

    const/16 v2, 0x800

    .line 190
    invoke-virtual {v1, v2}, Ljava/security/KeyPairGenerator;->initialize(I)V

    .line 192
    invoke-virtual {v1}, Ljava/security/KeyPairGenerator;->genKeyPair()Ljava/security/KeyPair;

    move-result-object v1

    iput-object v1, v0, Lcom/etralab/appstoreforandroid/AdbCrypto;->keyPair:Ljava/security/KeyPair;

    .line 193
    iput-object p0, v0, Lcom/etralab/appstoreforandroid/AdbCrypto;->base64:Lcom/etralab/appstoreforandroid/AdbBase64;

    return-object v0
.end method

.method public static loadAdbKeyPair(Lcom/etralab/appstoreforandroid/AdbBase64;Ljava/io/File;Ljava/io/File;)Lcom/etralab/appstoreforandroid/AdbCrypto;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/security/NoSuchAlgorithmException;,
            Ljava/security/spec/InvalidKeySpecException;
        }
    .end annotation

    .line 152
    new-instance v0, Lcom/etralab/appstoreforandroid/AdbCrypto;

    invoke-direct {v0}, Lcom/etralab/appstoreforandroid/AdbCrypto;-><init>()V

    .line 154
    invoke-virtual {p1}, Ljava/io/File;->length()J

    move-result-wide v1

    long-to-int v1, v1

    .line 155
    invoke-virtual {p2}, Ljava/io/File;->length()J

    move-result-wide v2

    long-to-int v2, v2

    .line 156
    new-array v1, v1, [B

    .line 157
    new-array v2, v2, [B

    .line 159
    new-instance v3, Ljava/io/FileInputStream;

    invoke-direct {v3, p1}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 160
    new-instance p1, Ljava/io/FileInputStream;

    invoke-direct {p1, p2}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 162
    invoke-virtual {v3, v1}, Ljava/io/FileInputStream;->read([B)I

    .line 163
    invoke-virtual {p1, v2}, Ljava/io/FileInputStream;->read([B)I

    .line 165
    invoke-virtual {v3}, Ljava/io/FileInputStream;->close()V

    .line 166
    invoke-virtual {p1}, Ljava/io/FileInputStream;->close()V

    const-string p1, "RSA"

    .line 168
    invoke-static {p1}, Ljava/security/KeyFactory;->getInstance(Ljava/lang/String;)Ljava/security/KeyFactory;

    move-result-object p1

    .line 169
    new-instance p2, Ljava/security/spec/PKCS8EncodedKeySpec;

    invoke-direct {p2, v1}, Ljava/security/spec/PKCS8EncodedKeySpec;-><init>([B)V

    .line 170
    new-instance v1, Ljava/security/spec/X509EncodedKeySpec;

    invoke-direct {v1, v2}, Ljava/security/spec/X509EncodedKeySpec;-><init>([B)V

    .line 172
    new-instance v2, Ljava/security/KeyPair;

    invoke-virtual {p1, v1}, Ljava/security/KeyFactory;->generatePublic(Ljava/security/spec/KeySpec;)Ljava/security/PublicKey;

    move-result-object v1

    .line 173
    invoke-virtual {p1, p2}, Ljava/security/KeyFactory;->generatePrivate(Ljava/security/spec/KeySpec;)Ljava/security/PrivateKey;

    move-result-object p1

    invoke-direct {v2, v1, p1}, Ljava/security/KeyPair;-><init>(Ljava/security/PublicKey;Ljava/security/PrivateKey;)V

    iput-object v2, v0, Lcom/etralab/appstoreforandroid/AdbCrypto;->keyPair:Ljava/security/KeyPair;

    .line 174
    iput-object p0, v0, Lcom/etralab/appstoreforandroid/AdbCrypto;->base64:Lcom/etralab/appstoreforandroid/AdbBase64;

    return-object v0
.end method


# virtual methods
.method public getAdbPublicKeyPayload()[B
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 222
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/AdbCrypto;->keyPair:Ljava/security/KeyPair;

    invoke-virtual {v0}, Ljava/security/KeyPair;->getPublic()Ljava/security/PublicKey;

    move-result-object v0

    check-cast v0, Ljava/security/interfaces/RSAPublicKey;

    invoke-static {v0}, Lcom/etralab/appstoreforandroid/AdbCrypto;->convertRsaPublicKeyToAdbFormat(Ljava/security/interfaces/RSAPublicKey;)[B

    move-result-object v0

    .line 223
    new-instance v1, Ljava/lang/StringBuilder;

    const/16 v2, 0x2d0

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 226
    iget-object v2, p0, Lcom/etralab/appstoreforandroid/AdbCrypto;->base64:Lcom/etralab/appstoreforandroid/AdbBase64;

    invoke-interface {v2, v0}, Lcom/etralab/appstoreforandroid/AdbBase64;->encodeToString([B)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, " unknown@unknown"

    .line 227
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/4 v0, 0x0

    .line 228
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 230
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "UTF-8"

    invoke-virtual {v0, v1}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v0

    return-object v0
.end method

.method public saveAdbKeyPair(Ljava/io/File;Ljava/io/File;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 241
    new-instance v0, Ljava/io/FileOutputStream;

    invoke-direct {v0, p1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 242
    new-instance p1, Ljava/io/FileOutputStream;

    invoke-direct {p1, p2}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 244
    iget-object p2, p0, Lcom/etralab/appstoreforandroid/AdbCrypto;->keyPair:Ljava/security/KeyPair;

    invoke-virtual {p2}, Ljava/security/KeyPair;->getPrivate()Ljava/security/PrivateKey;

    move-result-object p2

    invoke-interface {p2}, Ljava/security/PrivateKey;->getEncoded()[B

    move-result-object p2

    invoke-virtual {v0, p2}, Ljava/io/FileOutputStream;->write([B)V

    .line 245
    iget-object p2, p0, Lcom/etralab/appstoreforandroid/AdbCrypto;->keyPair:Ljava/security/KeyPair;

    invoke-virtual {p2}, Ljava/security/KeyPair;->getPublic()Ljava/security/PublicKey;

    move-result-object p2

    invoke-interface {p2}, Ljava/security/PublicKey;->getEncoded()[B

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/io/FileOutputStream;->write([B)V

    .line 247
    invoke-virtual {v0}, Ljava/io/FileOutputStream;->close()V

    .line 248
    invoke-virtual {p1}, Ljava/io/FileOutputStream;->close()V

    return-void
.end method

.method public signAdbTokenPayload([B)[B
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;
        }
    .end annotation

    const-string v0, "RSA/ECB/NoPadding"

    .line 206
    invoke-static {v0}, Ljavax/crypto/Cipher;->getInstance(Ljava/lang/String;)Ljavax/crypto/Cipher;

    move-result-object v0

    .line 208
    iget-object v1, p0, Lcom/etralab/appstoreforandroid/AdbCrypto;->keyPair:Ljava/security/KeyPair;

    invoke-virtual {v1}, Ljava/security/KeyPair;->getPrivate()Ljava/security/PrivateKey;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {v0, v2, v1}, Ljavax/crypto/Cipher;->init(ILjava/security/Key;)V

    .line 210
    sget-object v1, Lcom/etralab/appstoreforandroid/AdbCrypto;->SIGNATURE_PADDING:[B

    invoke-virtual {v0, v1}, Ljavax/crypto/Cipher;->update([B)[B

    .line 212
    invoke-virtual {v0, p1}, Ljavax/crypto/Cipher;->doFinal([B)[B

    move-result-object p1

    return-object p1
.end method
