.class public Lcom/etralab/appstoreforandroid/DeviceIdUtil;
.super Ljava/lang/Object;
.source "DeviceIdUtil.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static bytesToHex([B)Ljava/lang/String;
    .locals 5

    .line 162
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v1, 0x0

    .line 164
    :goto_0
    array-length v2, p0

    if-ge v1, v2, :cond_1

    .line 165
    aget-byte v2, p0, v1

    and-int/lit16 v2, v2, 0xff

    invoke-static {v2}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v2

    .line 166
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v3

    const/4 v4, 0x1

    if-ne v3, v4, :cond_0

    const-string v3, "0"

    .line 167
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 168
    :cond_0
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 170
    :cond_1
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    sget-object v0, Ljava/util/Locale;->CHINA:Ljava/util/Locale;

    invoke-virtual {p0, v0}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static getAndroidId(Landroid/content/Context;)Ljava/lang/String;
    .locals 1

    .line 92
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p0

    const-string v0, "android_id"

    invoke-static {p0, v0}, Landroid/provider/Settings$Secure;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    move-exception p0

    .line 95
    invoke-virtual {p0}, Ljava/lang/Exception;->printStackTrace()V

    const-string p0, ""

    return-object p0
.end method

.method public static getDeviceID()Ljava/lang/String;
    .locals 6

    .line 122
    :try_start_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "3883756"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v1, Landroid/os/Build;->BOARD:Ljava/lang/String;

    .line 123
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    rem-int/lit8 v1, v1, 0xa

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    sget-object v1, Landroid/os/Build;->BRAND:Ljava/lang/String;

    .line 124
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    rem-int/lit8 v1, v1, 0xa

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    sget-object v1, Landroid/os/Build;->DEVICE:Ljava/lang/String;

    .line 125
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    rem-int/lit8 v1, v1, 0xa

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    sget-object v1, Landroid/os/Build;->HARDWARE:Ljava/lang/String;

    .line 126
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    rem-int/lit8 v1, v1, 0xa

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    sget-object v1, Landroid/os/Build;->ID:Ljava/lang/String;

    .line 127
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    rem-int/lit8 v1, v1, 0xa

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    sget-object v1, Landroid/os/Build;->MODEL:Ljava/lang/String;

    .line 128
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    rem-int/lit8 v1, v1, 0xa

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    sget-object v1, Landroid/os/Build;->PRODUCT:Ljava/lang/String;

    .line 129
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    rem-int/lit8 v1, v1, 0xa

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    sget-object v1, Landroid/os/Build;->SERIAL:Ljava/lang/String;

    .line 130
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    rem-int/lit8 v1, v1, 0xa

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 131
    new-instance v1, Ljava/util/UUID;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    int-to-long v2, v0

    sget-object v0, Landroid/os/Build;->SERIAL:Ljava/lang/String;

    .line 132
    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    int-to-long v4, v0

    invoke-direct {v1, v2, v3, v4, v5}, Ljava/util/UUID;-><init>(JJ)V

    invoke-virtual {v1}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    :catch_0
    move-exception v0

    .line 134
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    const-string v0, ""

    return-object v0
.end method

.method public static getDeviceUUID(Landroid/content/Context;)Ljava/lang/String;
    .locals 6

    .line 21
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 24
    invoke-static {p0}, Lcom/etralab/appstoreforandroid/DeviceIdUtil;->getIMEI(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    .line 26
    invoke-static {p0}, Lcom/etralab/appstoreforandroid/DeviceIdUtil;->getAndroidId(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p0

    .line 28
    invoke-static {}, Lcom/etralab/appstoreforandroid/DeviceIdUtil;->getSERIAL()Ljava/lang/String;

    move-result-object v2

    .line 30
    invoke-static {}, Lcom/etralab/appstoreforandroid/DeviceIdUtil;->getDeviceID()Ljava/lang/String;

    move-result-object v3

    const-string v4, "-"

    const-string v5, ""

    invoke-virtual {v3, v4, v5}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v3

    const-string v4, "|"

    if-eqz v1, :cond_0

    .line 33
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v5

    if-lez v5, :cond_0

    .line 34
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 35
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_0
    if-eqz p0, :cond_1

    .line 38
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_1

    .line 39
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 40
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_1
    if-eqz v2, :cond_2

    .line 43
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result p0

    if-lez p0, :cond_2

    .line 44
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 45
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_2
    if-eqz v3, :cond_3

    .line 48
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result p0

    if-lez p0, :cond_3

    .line 49
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 53
    :cond_3
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result p0

    if-lez p0, :cond_4

    .line 55
    :try_start_0
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lcom/etralab/appstoreforandroid/DeviceIdUtil;->getHashByString(Ljava/lang/String;)[B

    move-result-object p0

    .line 56
    invoke-static {p0}, Lcom/etralab/appstoreforandroid/DeviceIdUtil;->bytesToHex([B)Ljava/lang/String;

    move-result-object p0

    if-eqz p0, :cond_4

    .line 57
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    if-lez v0, :cond_4

    return-object p0

    :catch_0
    move-exception p0

    .line 62
    invoke-virtual {p0}, Ljava/lang/Exception;->printStackTrace()V

    :cond_4
    const/4 p0, 0x0

    return-object p0
.end method

.method private static getHashByString(Ljava/lang/String;)[B
    .locals 2

    :try_start_0
    const-string v0, "SHA1"

    .line 147
    invoke-static {v0}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v0

    .line 148
    invoke-virtual {v0}, Ljava/security/MessageDigest;->reset()V

    .line 149
    sget-object v1, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-virtual {p0, v1}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/security/MessageDigest;->update([B)V

    .line 150
    invoke-virtual {v0}, Ljava/security/MessageDigest;->digest()[B

    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    const-string p0, ""

    .line 152
    invoke-virtual {p0}, Ljava/lang/String;->getBytes()[B

    move-result-object p0

    return-object p0
.end method

.method public static getIMEI(Landroid/content/Context;)Ljava/lang/String;
    .locals 0

    const-string p0, ""

    return-object p0
.end method

.method public static getSERIAL()Ljava/lang/String;
    .locals 1

    .line 107
    :try_start_0
    sget-object v0, Landroid/os/Build;->SERIAL:Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    :catch_0
    move-exception v0

    .line 109
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    const-string v0, ""

    return-object v0
.end method
