.class public Lcom/arialyy/aria/util/CommonUtil;
.super Ljava/lang/Object;
.source "CommonUtil.java"


# static fields
.field public static final SERVER_CHARSET:Ljava/lang/String; = "ISO-8859-1"

.field private static final TAG:Ljava/lang/String; = "CommonUtil"

.field private static lastClickTime:J

.field private static mDialogFragmentClassName:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static mFragmentClassName:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 70
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lcom/arialyy/aria/util/CommonUtil;->mFragmentClassName:Ljava/util/List;

    .line 71
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lcom/arialyy/aria/util/CommonUtil;->mDialogFragmentClassName:Ljava/util/List;

    .line 74
    sget-object v0, Lcom/arialyy/aria/util/CommonUtil;->mFragmentClassName:Ljava/util/List;

    const-string v1, "androidx.fragment.app.Fragment"

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 75
    sget-object v0, Lcom/arialyy/aria/util/CommonUtil;->mFragmentClassName:Ljava/util/List;

    const-string v2, "androidx.fragment.app.DialogFragment"

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 76
    sget-object v0, Lcom/arialyy/aria/util/CommonUtil;->mFragmentClassName:Ljava/util/List;

    const-string v3, "android.app.Fragment"

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 77
    sget-object v0, Lcom/arialyy/aria/util/CommonUtil;->mFragmentClassName:Ljava/util/List;

    const-string v3, "android.app.DialogFragment"

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 78
    sget-object v0, Lcom/arialyy/aria/util/CommonUtil;->mFragmentClassName:Ljava/util/List;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 79
    sget-object v0, Lcom/arialyy/aria/util/CommonUtil;->mFragmentClassName:Ljava/util/List;

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 81
    sget-object v0, Lcom/arialyy/aria/util/CommonUtil;->mDialogFragmentClassName:Ljava/util/List;

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 82
    sget-object v0, Lcom/arialyy/aria/util/CommonUtil;->mDialogFragmentClassName:Ljava/util/List;

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 83
    sget-object v0, Lcom/arialyy/aria/util/CommonUtil;->mDialogFragmentClassName:Ljava/util/List;

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 63
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static bytesToHexString([B)Ljava/lang/String;
    .locals 8

    .line 845
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "0x"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    if-eqz p0, :cond_2

    .line 846
    array-length v1, p0

    if-gtz v1, :cond_0

    goto :goto_1

    :cond_0
    const/4 v1, 0x2

    new-array v1, v1, [C

    .line 850
    array-length v2, p0

    const/4 v3, 0x0

    move v4, v3

    :goto_0
    if-ge v4, v2, :cond_1

    aget-byte v5, p0, v4

    ushr-int/lit8 v6, v5, 0x4

    and-int/lit8 v6, v6, 0xf

    const/16 v7, 0x10

    .line 851
    invoke-static {v6, v7}, Ljava/lang/Character;->forDigit(II)C

    move-result v6

    aput-char v6, v1, v3

    and-int/lit8 v5, v5, 0xf

    .line 852
    invoke-static {v5, v7}, Ljava/lang/Character;->forDigit(II)C

    move-result v5

    const/4 v6, 0x1

    aput-char v5, v1, v6

    .line 853
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append([C)Ljava/lang/StringBuilder;

    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 855
    :cond_1
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_2
    :goto_1
    const/4 p0, 0x0

    return-object p0
.end method

.method public static checkMD5(Ljava/lang/String;Ljava/io/File;)Z
    .locals 3

    .line 598
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    const/4 v1, 0x0

    const-string v2, "CommonUtil"

    if-nez v0, :cond_2

    if-nez p1, :cond_0

    goto :goto_0

    .line 603
    :cond_0
    invoke-static {p1}, Lcom/arialyy/aria/util/CommonUtil;->getFileMD5(Ljava/io/File;)Ljava/lang/String;

    move-result-object p1

    if-nez p1, :cond_1

    const-string p0, "calculatedDigest null"

    .line 605
    invoke-static {v2, p0}, Lcom/arialyy/aria/util/ALog;->e(Ljava/lang/String;Ljava/lang/String;)I

    return v1

    .line 608
    :cond_1
    invoke-virtual {p1, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result p0

    return p0

    :cond_2
    :goto_0
    const-string p0, "MD5 string empty or updateFile null"

    .line 599
    invoke-static {v2, p0}, Lcom/arialyy/aria/util/ALog;->e(Ljava/lang/String;Ljava/lang/String;)I

    return v1
.end method

.method public static checkMD5(Ljava/lang/String;Ljava/io/InputStream;)Z
    .locals 3

    .line 615
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    const/4 v1, 0x0

    const-string v2, "CommonUtil"

    if-nez v0, :cond_2

    if-nez p1, :cond_0

    goto :goto_0

    .line 620
    :cond_0
    invoke-static {p1}, Lcom/arialyy/aria/util/CommonUtil;->getFileMD5(Ljava/io/InputStream;)Ljava/lang/String;

    move-result-object p1

    if-nez p1, :cond_1

    const-string p0, "calculatedDigest null"

    .line 622
    invoke-static {v2, p0}, Lcom/arialyy/aria/util/ALog;->e(Ljava/lang/String;Ljava/lang/String;)I

    return v1

    .line 625
    :cond_1
    invoke-virtual {p1, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result p0

    return p0

    :cond_2
    :goto_0
    const-string p0, "MD5 string empty or updateFile null"

    .line 616
    invoke-static {v2, p0}, Lcom/arialyy/aria/util/ALog;->e(Ljava/lang/String;Ljava/lang/String;)I

    return v1
.end method

.method public static varargs checkSqlExpression([Ljava/lang/String;)Z
    .locals 5

    .line 179
    array-length v0, p0

    const-string v1, "CommonUtil"

    const/4 v2, 0x0

    if-nez v0, :cond_0

    const-string p0, "sql\u8bed\u53e5\u8868\u8fbe\u5f0f\u4e0d\u80fd\u4e3anull"

    .line 180
    invoke-static {v1, p0}, Lcom/arialyy/aria/util/ALog;->e(Ljava/lang/String;Ljava/lang/String;)I

    return v2

    .line 187
    :cond_0
    aget-object v0, p0, v2

    const-string v3, "\\?"

    .line 192
    invoke-static {v3}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v3

    .line 193
    invoke-virtual {v3, v0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    move v3, v2

    .line 195
    :goto_0
    invoke-virtual {v0}, Ljava/util/regex/Matcher;->find()Z

    move-result v4

    if-eqz v4, :cond_1

    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 198
    :cond_1
    array-length v0, p0

    const/4 v4, 0x1

    sub-int/2addr v0, v4

    if-ge v3, v0, :cond_2

    new-array v0, v4, [Ljava/lang/Object;

    .line 199
    invoke-static {p0}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    aput-object p0, v0, v2

    const-string p0, "\u6761\u4ef6\u8bed\u53e5\u7684?\u4e2a\u6570\u4e0d\u80fd\u5c0f\u4e8e\u53c2\u6570\u4e2a\u6570\uff0c\u53c2\u6570\u4fe1\u606f\uff1a%s"

    invoke-static {p0, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    invoke-static {v1, p0}, Lcom/arialyy/aria/util/ALog;->e(Ljava/lang/String;Ljava/lang/String;)I

    return v2

    .line 202
    :cond_2
    array-length v0, p0

    sub-int/2addr v0, v4

    if-le v3, v0, :cond_3

    new-array v0, v4, [Ljava/lang/Object;

    .line 203
    invoke-static {p0}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    aput-object p0, v0, v2

    const-string p0, "\u6761\u4ef6\u8bed\u53e5\u7684?\u4e2a\u6570\u4e0d\u80fd\u5927\u4e8e\u53c2\u6570\u4e2a\u6570\uff0c \u53c2\u6570\u4fe1\u606f\uff1a%s"

    invoke-static {p0, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    invoke-static {v1, p0}, Lcom/arialyy/aria/util/ALog;->e(Ljava/lang/String;Ljava/lang/String;)I

    return v2

    :cond_3
    return v4
.end method

.method public static convertFtpChar(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/UnsupportedEncodingException;
        }
    .end annotation

    .line 234
    new-instance v0, Ljava/lang/String;

    invoke-virtual {p1, p0}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object p0

    const-string p1, "ISO-8859-1"

    invoke-direct {v0, p0, p1}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    return-object v0
.end method

.method public static convertSFtpChar(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/UnsupportedEncodingException;
        }
    .end annotation

    .line 246
    new-instance v0, Ljava/lang/String;

    invoke-virtual {p1}, Ljava/lang/String;->getBytes()[B

    move-result-object p1

    invoke-direct {v0, p1, p0}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    return-object v0
.end method

.method public static convertUrl(Ljava/lang/String;)Ljava/lang/String;
    .locals 3

    .line 453
    invoke-static {p0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p0

    .line 454
    invoke-virtual {p0}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object p0

    .line 455
    invoke-static {p0}, Lcom/arialyy/aria/util/CommonUtil;->hasDoubleCharacter(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    const-string v0, " "

    const-string v1, "%20"

    .line 457
    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    const-string v0, "[^\\x00-\\xff]|[\\s\\p{Zs}]"

    .line 460
    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    .line 461
    invoke-virtual {v0, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    .line 462
    new-instance v1, Ljava/util/HashSet;

    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    .line 463
    :goto_0
    invoke-virtual {v0}, Ljava/util/regex/Matcher;->find()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 464
    invoke-virtual {v0}, Ljava/util/regex/Matcher;->group()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 467
    :cond_0
    :try_start_0
    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    const-string v2, "UTF-8"

    .line 468
    invoke-static {v1, v2}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v1, v2}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception v0

    .line 471
    invoke-virtual {v0}, Ljava/io/UnsupportedEncodingException;->printStackTrace()V

    :cond_1
    return-object p0
.end method

.method public static createIntent(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;
    .locals 1

    .line 682
    new-instance v0, Landroid/net/Uri$Builder;

    invoke-direct {v0}, Landroid/net/Uri$Builder;-><init>()V

    .line 683
    invoke-virtual {v0, p0}, Landroid/net/Uri$Builder;->scheme(Ljava/lang/String;)Landroid/net/Uri$Builder;

    .line 684
    invoke-virtual {v0}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object p0

    .line 685
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0, p1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 686
    invoke-virtual {v0, p0}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    return-object v0
.end method

.method public static decryptBASE64(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 501
    new-instance v0, Ljava/lang/String;

    invoke-virtual {p0}, Ljava/lang/String;->getBytes()[B

    move-result-object p0

    const/4 v1, 0x0

    invoke-static {p0, v1}, Landroid/util/Base64;->decode([BI)[B

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/lang/String;-><init>([B)V

    return-object v0
.end method

.method public static encryptBASE64(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 511
    invoke-virtual {p0}, Ljava/lang/String;->getBytes()[B

    move-result-object p0

    const/4 v0, 0x0

    invoke-static {p0, v0}, Landroid/util/Base64;->encodeToString([BI)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static formatFileSize(D)Ljava/lang/String;
    .locals 9

    const-wide/16 v0, 0x0

    cmpg-double v0, p0, v0

    if-gez v0, :cond_0

    const-string p0, "0kb"

    return-object p0

    :cond_0
    const-wide/high16 v0, 0x4090000000000000L    # 1024.0

    div-double v2, p0, v0

    const-wide/high16 v4, 0x3ff0000000000000L    # 1.0

    cmpg-double v6, v2, v4

    if-gez v6, :cond_1

    .line 891
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p0, p1}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    const-string p0, "b"

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_1
    div-double p0, v2, v0

    cmpg-double v6, p0, v4

    const/4 v7, 0x4

    const/4 v8, 0x2

    if-gez v6, :cond_2

    .line 896
    new-instance p0, Ljava/math/BigDecimal;

    invoke-static {v2, v3}, Ljava/lang/Double;->toString(D)Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/math/BigDecimal;-><init>(Ljava/lang/String;)V

    .line 897
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0, v8, v7}, Ljava/math/BigDecimal;->setScale(II)Ljava/math/BigDecimal;

    move-result-object p0

    invoke-virtual {p0}, Ljava/math/BigDecimal;->toPlainString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, "kb"

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_2
    div-double v2, p0, v0

    cmpg-double v6, v2, v4

    if-gez v6, :cond_3

    .line 902
    new-instance v0, Ljava/math/BigDecimal;

    invoke-static {p0, p1}, Ljava/lang/Double;->toString(D)Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/math/BigDecimal;-><init>(Ljava/lang/String;)V

    .line 903
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v8, v7}, Ljava/math/BigDecimal;->setScale(II)Ljava/math/BigDecimal;

    move-result-object p1

    invoke-virtual {p1}, Ljava/math/BigDecimal;->toPlainString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "mb"

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_3
    div-double p0, v2, v0

    cmpg-double v0, p0, v4

    if-gez v0, :cond_4

    .line 908
    new-instance p0, Ljava/math/BigDecimal;

    invoke-static {v2, v3}, Ljava/lang/Double;->toString(D)Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/math/BigDecimal;-><init>(Ljava/lang/String;)V

    .line 909
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0, v8, v7}, Ljava/math/BigDecimal;->setScale(II)Ljava/math/BigDecimal;

    move-result-object p0

    invoke-virtual {p0}, Ljava/math/BigDecimal;->toPlainString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, "gb"

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 911
    :cond_4
    new-instance v0, Ljava/math/BigDecimal;

    invoke-direct {v0, p0, p1}, Ljava/math/BigDecimal;-><init>(D)V

    .line 912
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v8, v7}, Ljava/math/BigDecimal;->setScale(II)Ljava/math/BigDecimal;

    move-result-object p1

    invoke-virtual {p1}, Ljava/math/BigDecimal;->toPlainString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "tb"

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static formatTime(I)Ljava/lang/String;
    .locals 8

    if-gtz p0, :cond_0

    const-string p0, "00:00"

    goto/16 :goto_0

    :cond_0
    const/4 v0, 0x0

    const/4 v1, 0x1

    const/16 v2, 0x3c

    if-ge p0, v2, :cond_1

    .line 929
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v3

    new-array v1, v1, [Ljava/lang/Object;

    rem-int/2addr p0, v2

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    aput-object p0, v1, v0

    const-string p0, "00:%02d"

    invoke-static {v3, p0, v1}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    goto/16 :goto_0

    :cond_1
    const/4 v3, 0x2

    const/16 v4, 0xe10

    if-ge p0, v4, :cond_2

    .line 931
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v4

    new-array v3, v3, [Ljava/lang/Object;

    div-int/lit8 v5, p0, 0x3c

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v0

    rem-int/2addr p0, v2

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    aput-object p0, v3, v1

    const-string p0, "%02d:%02d"

    invoke-static {v4, p0, v3}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    goto :goto_0

    :cond_2
    const/4 v5, 0x3

    const v6, 0x15180

    if-ge p0, v6, :cond_3

    .line 934
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v4

    new-array v5, v5, [Ljava/lang/Object;

    div-int/lit16 v6, p0, 0xe10

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v5, v0

    rem-int/lit16 v0, p0, 0xe10

    div-int/2addr v0, v2

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    aput-object v0, v5, v1

    rem-int/2addr p0, v2

    .line 935
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    aput-object p0, v5, v3

    const-string p0, "%02d:%02d:%02d"

    .line 934
    invoke-static {v4, p0, v5}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    goto :goto_0

    :cond_3
    const v2, 0x93a80

    if-ge p0, v2, :cond_4

    .line 938
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v2

    new-array v5, v5, [Ljava/lang/Object;

    div-int v7, p0, v6

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v5, v0

    rem-int v0, p0, v6

    div-int/2addr v0, v4

    .line 939
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    aput-object v0, v5, v1

    rem-int/2addr p0, v4

    .line 940
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    aput-object p0, v5, v3

    const-string p0, "%dd %02d:%02d"

    .line 938
    invoke-static {v2, p0, v5}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    goto :goto_0

    :cond_4
    const-string p0, "\u221e"

    :goto_0
    return-object p0
.end method

.method public static getAllFields(Ljava/lang/Class;)Ljava/util/List;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class;",
            ")",
            "Ljava/util/List<",
            "Ljava/lang/reflect/Field;",
            ">;"
        }
    .end annotation

    .line 721
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 722
    invoke-virtual {p0}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object v1

    if-eqz v1, :cond_1

    .line 724
    invoke-virtual {v1}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 726
    invoke-virtual {v2}, Ljava/lang/Class;->getDeclaredFields()[Ljava/lang/reflect/Field;

    move-result-object v2

    invoke-static {v0, v2}, Ljava/util/Collections;->addAll(Ljava/util/Collection;[Ljava/lang/Object;)Z

    .line 728
    :cond_0
    invoke-virtual {v1}, Ljava/lang/Class;->getDeclaredFields()[Ljava/lang/reflect/Field;

    move-result-object v1

    invoke-static {v0, v1}, Ljava/util/Collections;->addAll(Ljava/util/Collection;[Ljava/lang/Object;)Z

    .line 730
    :cond_1
    invoke-virtual {p0}, Ljava/lang/Class;->getDeclaredFields()[Ljava/lang/reflect/Field;

    move-result-object p0

    invoke-static {v0, p0}, Ljava/util/Collections;->addAll(Ljava/util/Collection;[Ljava/lang/Object;)Z

    .line 731
    new-instance p0, Ljava/util/ArrayList;

    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 732
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_2
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_4

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/reflect/Field;

    .line 733
    invoke-virtual {v2}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v3

    const-string v4, "shadow$_klass_"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_3

    invoke-virtual {v2}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v3

    const-string v4, "shadow$_monitor_"

    .line 734
    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 735
    :cond_3
    invoke-interface {p0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 738
    :cond_4
    invoke-interface {p0}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_5

    .line 739
    invoke-interface {v0, p0}, Ljava/util/List;->removeAll(Ljava/util/Collection;)Z

    :cond_5
    return-object v0
.end method

.method public static getAppPath(Landroid/content/Context;)Ljava/lang/String;
    .locals 2

    .line 337
    invoke-static {}, Landroid/os/Environment;->getExternalStorageState()Ljava/lang/String;

    move-result-object v0

    const-string v1, "mounted"

    .line 336
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return-object v1

    .line 342
    :cond_0
    invoke-virtual {p0, v1}, Landroid/content/Context;->getExternalFilesDir(Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 345
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "/"

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    goto :goto_0

    .line 347
    :cond_1
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v1

    invoke-virtual {v1}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "/Android/data/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 349
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, "/files/"

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    :goto_0
    return-object p0
.end method

.method public static getClassName(Ljava/lang/Class;)Ljava/lang/String;
    .locals 1

    .line 876
    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object p0

    const-string v0, "\\."

    invoke-virtual {p0, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p0

    .line 877
    array-length v0, p0

    add-int/lit8 v0, v0, -0x1

    aget-object p0, p0, v0

    return-object p0
.end method

.method public static getClassName(Ljava/lang/Object;)Ljava/lang/String;
    .locals 1

    .line 865
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object p0

    const-string v0, "\\."

    invoke-virtual {p0, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p0

    .line 866
    array-length v0, p0

    add-int/lit8 v0, v0, -0x1

    aget-object p0, p0, v0

    return-object p0
.end method

.method public static getCoresNum()I
    .locals 4

    const-string v0, "CommonUtil"

    .line 579
    :try_start_0
    new-instance v1, Ljava/io/File;

    const-string v2, "/sys/devices/system/cpu/"

    invoke-direct {v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 581
    new-instance v2, Lcom/arialyy/aria/util/CommonUtil$1CpuFilter;

    invoke-direct {v2}, Lcom/arialyy/aria/util/CommonUtil$1CpuFilter;-><init>()V

    invoke-virtual {v1, v2}, Ljava/io/File;->listFiles(Ljava/io/FileFilter;)[Ljava/io/File;

    move-result-object v1

    .line 582
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "CPU Count: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    array-length v3, v1

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Lcom/arialyy/aria/util/ALog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 584
    array-length v0, v1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return v0

    :catch_0
    move-exception v1

    const-string v2, "CPU Count: Failed."

    .line 587
    invoke-static {v0, v2}, Lcom/arialyy/aria/util/ALog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 588
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    const/4 v0, 0x1

    return v0
.end method

.method public static getField(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;
    .locals 1

    .line 765
    :try_start_0
    invoke-virtual {p0, p1}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object p0
    :try_end_0
    .catch Ljava/lang/NoSuchFieldException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 768
    :catch_0
    :try_start_1
    invoke-virtual {p0, p1}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object p0
    :try_end_1
    .catch Ljava/lang/NoSuchFieldException; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_0

    .line 770
    :catch_1
    invoke-virtual {p0}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object v0

    if-nez v0, :cond_0

    const/4 p0, 0x0

    return-object p0

    .line 773
    :cond_0
    invoke-virtual {p0}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object p0

    invoke-static {p0, p1}, Lcom/arialyy/aria/util/CommonUtil;->getField(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object p0

    :goto_0
    if-eqz p0, :cond_1

    const/4 p1, 0x1

    .line 778
    invoke-virtual {p0, p1}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    :cond_1
    return-object p0
.end method

.method public static getFields(Ljava/lang/Class;)[Ljava/lang/reflect/Field;
    .locals 2

    .line 749
    invoke-virtual {p0}, Ljava/lang/Class;->getDeclaredFields()[Ljava/lang/reflect/Field;

    move-result-object v0

    .line 750
    array-length v1, v0

    if-nez v1, :cond_0

    .line 751
    invoke-virtual {p0}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object p0

    if-eqz p0, :cond_0

    .line 753
    invoke-static {p0}, Lcom/arialyy/aria/util/CommonUtil;->getFields(Ljava/lang/Class;)[Ljava/lang/reflect/Field;

    move-result-object v0

    :cond_0
    return-object v0
.end method

.method public static getFileConfigPath(ZLjava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 954
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Lcom/arialyy/aria/core/AriaConfig;->getInstance()Lcom/arialyy/aria/core/AriaConfig;

    move-result-object v1

    invoke-virtual {v1}, Lcom/arialyy/aria/core/AriaConfig;->getAPP()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v1

    invoke-virtual {v1}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    if-eqz p0, :cond_0

    const-string p0, "/Aria/temp/download/"

    goto :goto_0

    :cond_0
    const-string p0, "/Aria/temp/upload/"

    :goto_0
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, ".properties"

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static getFileMD5(Ljava/io/File;)Ljava/lang/String;
    .locals 1

    .line 634
    :try_start_0
    new-instance v0, Ljava/io/FileInputStream;

    invoke-direct {v0, p0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 640
    invoke-static {v0}, Lcom/arialyy/aria/util/CommonUtil;->getFileMD5(Ljava/io/InputStream;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :catch_0
    move-exception p0

    .line 636
    invoke-virtual {p0}, Ljava/io/FileNotFoundException;->printStackTrace()V

    const/4 p0, 0x0

    return-object p0
.end method

.method public static getFileMD5(Ljava/io/InputStream;)Ljava/lang/String;
    .locals 4

    :try_start_0
    const-string v0, "MD5"

    .line 649
    invoke-static {v0}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v0
    :try_end_0
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_0} :catch_3

    const/16 v1, 0x2000

    new-array v1, v1, [B

    .line 658
    :goto_0
    :try_start_1
    invoke-virtual {p0, v1}, Ljava/io/InputStream;->read([B)I

    move-result v2

    const/4 v3, 0x0

    if-lez v2, :cond_0

    .line 659
    invoke-virtual {v0, v1, v3, v2}, Ljava/security/MessageDigest;->update([BII)V

    goto :goto_0

    .line 661
    :cond_0
    invoke-virtual {v0}, Ljava/security/MessageDigest;->digest()[B

    move-result-object v0

    .line 662
    new-instance v1, Ljava/math/BigInteger;

    const/4 v2, 0x1

    invoke-direct {v1, v2, v0}, Ljava/math/BigInteger;-><init>(I[B)V

    const/16 v0, 0x10

    .line 663
    invoke-virtual {v1, v0}, Ljava/math/BigInteger;->toString(I)Ljava/lang/String;

    move-result-object v0

    const-string v1, "%32s"

    new-array v2, v2, [Ljava/lang/Object;

    aput-object v0, v2, v3

    .line 665
    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    const/16 v1, 0x20

    const/16 v2, 0x30

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v0
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 671
    :try_start_2
    invoke-virtual {p0}, Ljava/io/InputStream;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    goto :goto_1

    :catch_0
    move-exception p0

    .line 673
    invoke-virtual {p0}, Ljava/io/IOException;->printStackTrace()V

    :goto_1
    return-object v0

    :catchall_0
    move-exception v0

    goto :goto_2

    :catch_1
    move-exception v0

    .line 668
    :try_start_3
    new-instance v1, Ljava/lang/RuntimeException;

    const-string v2, "Unable to process file for MD5"

    invoke-direct {v1, v2, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 671
    :goto_2
    :try_start_4
    invoke-virtual {p0}, Ljava/io/InputStream;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_2

    goto :goto_3

    :catch_2
    move-exception p0

    .line 673
    invoke-virtual {p0}, Ljava/io/IOException;->printStackTrace()V

    .line 675
    :goto_3
    throw v0

    :catch_3
    move-exception p0

    .line 651
    invoke-virtual {p0}, Ljava/security/NoSuchAlgorithmException;->printStackTrace()V

    const/4 p0, 0x0

    return-object p0
.end method

.method public static getFragmentActivity(Ljava/lang/Object;)Landroid/app/Activity;
    .locals 4

    .line 93
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-string v1, "getActivity"

    const/4 v2, 0x0

    new-array v3, v2, [Ljava/lang/Class;

    invoke-virtual {v0, v1, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    new-array v1, v2, [Ljava/lang/Object;

    .line 94
    invoke-virtual {v0, p0, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/app/Activity;
    :try_end_0
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    move-exception p0

    .line 100
    invoke-virtual {p0}, Ljava/lang/reflect/InvocationTargetException;->printStackTrace()V

    goto :goto_0

    :catch_1
    move-exception p0

    .line 98
    invoke-virtual {p0}, Ljava/lang/IllegalAccessException;->printStackTrace()V

    goto :goto_0

    :catch_2
    move-exception p0

    .line 96
    invoke-virtual {p0}, Ljava/lang/NoSuchMethodException;->printStackTrace()V

    :goto_0
    const/4 p0, 0x0

    return-object p0
.end method

.method public static getFtpUrlInfo(Ljava/lang/String;)Lcom/arialyy/aria/core/FtpUrlEntity;
    .locals 9

    .line 421
    invoke-static {p0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    .line 423
    invoke-virtual {v0}, Landroid/net/Uri;->getUserInfo()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x5

    new-array v3, v3, [Ljava/lang/Object;

    .line 425
    invoke-virtual {v0}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x0

    aput-object v4, v3, v5

    const/4 v4, 0x1

    aput-object v1, v3, v4

    .line 426
    invoke-virtual {v0}, Landroid/net/Uri;->getHost()Ljava/lang/String;

    move-result-object v6

    const/4 v7, 0x2

    aput-object v6, v3, v7

    invoke-virtual {v0}, Landroid/net/Uri;->getPort()I

    move-result v6

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    const/4 v8, 0x3

    aput-object v6, v3, v8

    const/4 v6, 0x4

    aput-object v2, v3, v6

    const-string v6, "scheme = %s, user = %s, host = %s, port = %s, path = %s"

    .line 425
    invoke-static {v6, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    const-string v6, "CommonUtil"

    .line 424
    invoke-static {v6, v3}, Lcom/arialyy/aria/util/ALog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 428
    new-instance v3, Lcom/arialyy/aria/core/FtpUrlEntity;

    invoke-direct {v3}, Lcom/arialyy/aria/core/FtpUrlEntity;-><init>()V

    .line 429
    iput-object p0, v3, Lcom/arialyy/aria/core/FtpUrlEntity;->url:Ljava/lang/String;

    .line 430
    invoke-virtual {v0}, Landroid/net/Uri;->getHost()Ljava/lang/String;

    move-result-object p0

    iput-object p0, v3, Lcom/arialyy/aria/core/FtpUrlEntity;->hostName:Ljava/lang/String;

    .line 431
    invoke-virtual {v0}, Landroid/net/Uri;->getPort()I

    move-result p0

    const/4 v6, -0x1

    if-ne p0, v6, :cond_0

    const-string p0, "21"

    goto :goto_0

    :cond_0
    invoke-virtual {v0}, Landroid/net/Uri;->getPort()I

    move-result p0

    invoke-static {p0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object p0

    :goto_0
    iput-object p0, v3, Lcom/arialyy/aria/core/FtpUrlEntity;->port:Ljava/lang/String;

    .line 432
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p0

    if-nez p0, :cond_2

    const-string p0, ":"

    .line 433
    invoke-virtual {v1, p0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p0

    .line 434
    array-length v6, p0

    if-ne v6, v7, :cond_1

    .line 435
    aget-object v1, p0, v5

    iput-object v1, v3, Lcom/arialyy/aria/core/FtpUrlEntity;->user:Ljava/lang/String;

    .line 436
    aget-object p0, p0, v4

    iput-object p0, v3, Lcom/arialyy/aria/core/FtpUrlEntity;->password:Ljava/lang/String;

    goto :goto_1

    .line 438
    :cond_1
    iput-object v1, v3, Lcom/arialyy/aria/core/FtpUrlEntity;->user:Ljava/lang/String;

    .line 441
    :cond_2
    :goto_1
    invoke-virtual {v0}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object p0

    iput-object p0, v3, Lcom/arialyy/aria/core/FtpUrlEntity;->scheme:Ljava/lang/String;

    .line 442
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p0

    if-eqz p0, :cond_3

    const-string v2, "/"

    :cond_3
    iput-object v2, v3, Lcom/arialyy/aria/core/FtpUrlEntity;->remotePath:Ljava/lang/String;

    return-object v3
.end method

.method public static getListParamType(Ljava/lang/reflect/Field;)Ljava/lang/Class;
    .locals 3

    .line 395
    invoke-virtual {p0}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v0

    .line 396
    const-class v1, Ljava/util/List;

    invoke-virtual {v0, v1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v0

    const-string v1, "CommonUtil"

    const/4 v2, 0x0

    if-nez v0, :cond_0

    const-string p0, "\u5b57\u6bb5\u7c7b\u578b\u4e0d\u662fList"

    .line 397
    invoke-static {v1, p0}, Lcom/arialyy/aria/util/ALog;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-object v2

    .line 401
    :cond_0
    invoke-virtual {p0}, Ljava/lang/reflect/Field;->getGenericType()Ljava/lang/reflect/Type;

    move-result-object p0

    if-nez p0, :cond_1

    const-string p0, "\u8be5\u5b57\u6bb5\u6ca1\u6709\u6cdb\u578b\u53c2\u6570"

    .line 404
    invoke-static {v1, p0}, Lcom/arialyy/aria/util/ALog;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-object v2

    .line 408
    :cond_1
    instance-of v0, p0, Ljava/lang/reflect/ParameterizedType;

    if-eqz v0, :cond_2

    .line 409
    check-cast p0, Ljava/lang/reflect/ParameterizedType;

    .line 410
    invoke-interface {p0}, Ljava/lang/reflect/ParameterizedType;->getActualTypeArguments()[Ljava/lang/reflect/Type;

    move-result-object p0

    const/4 v0, 0x0

    aget-object p0, p0, v0

    check-cast p0, Ljava/lang/Class;

    return-object p0

    :cond_2
    return-object v2
.end method

.method public static getMapParamType(Ljava/lang/reflect/Field;)[Ljava/lang/Class;
    .locals 3

    .line 363
    invoke-virtual {p0}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v0

    .line 364
    const-class v1, Ljava/util/Map;

    invoke-virtual {v0, v1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v0

    const-string v1, "CommonUtil"

    const/4 v2, 0x0

    if-nez v0, :cond_0

    const-string p0, "\u5b57\u6bb5\u7c7b\u578b\u4e0d\u662fMap"

    .line 365
    invoke-static {v1, p0}, Lcom/arialyy/aria/util/ALog;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-object v2

    .line 369
    :cond_0
    invoke-virtual {p0}, Ljava/lang/reflect/Field;->getGenericType()Ljava/lang/reflect/Type;

    move-result-object p0

    if-nez p0, :cond_1

    const-string p0, "\u8be5\u5b57\u6bb5\u6ca1\u6709\u6cdb\u578b\u53c2\u6570"

    .line 372
    invoke-static {v1, p0}, Lcom/arialyy/aria/util/ALog;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-object v2

    .line 376
    :cond_1
    instance-of v0, p0, Ljava/lang/reflect/ParameterizedType;

    if-eqz v0, :cond_2

    .line 377
    check-cast p0, Ljava/lang/reflect/ParameterizedType;

    .line 378
    invoke-interface {p0}, Ljava/lang/reflect/ParameterizedType;->getActualTypeArguments()[Ljava/lang/reflect/Type;

    move-result-object p0

    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/Class;

    const/4 v1, 0x0

    .line 380
    aget-object v2, p0, v1

    check-cast v2, Ljava/lang/Class;

    aput-object v2, v0, v1

    const/4 v1, 0x1

    .line 381
    aget-object p0, p0, v1

    check-cast p0, Ljava/lang/Class;

    aput-object p0, v0, v1

    return-object v0

    :cond_2
    return-object v2
.end method

.method public static getMd5Code(Ljava/util/List;)Ljava/lang/String;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    const-string v0, ""

    if-eqz p0, :cond_2

    .line 532
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v1

    const/4 v2, 0x1

    if-ge v1, v2, :cond_0

    goto :goto_1

    .line 534
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 535
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 536
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    :cond_1
    :try_start_0
    const-string p0, "MD5"

    .line 539
    invoke-static {p0}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object p0

    .line 540
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->getBytes()[B

    move-result-object v1

    invoke-virtual {p0, v1}, Ljava/security/MessageDigest;->update([B)V

    .line 541
    new-instance v1, Ljava/math/BigInteger;

    invoke-virtual {p0}, Ljava/security/MessageDigest;->digest()[B

    move-result-object p0

    invoke-direct {v1, v2, p0}, Ljava/math/BigInteger;-><init>(I[B)V

    const/16 p0, 0x10

    invoke-virtual {v1, p0}, Ljava/math/BigInteger;->toString(I)Ljava/lang/String;

    move-result-object v0
    :try_end_0
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception p0

    .line 543
    invoke-virtual {p0}, Ljava/security/NoSuchAlgorithmException;->getMessage()Ljava/lang/String;

    move-result-object p0

    const-string v1, "CommonUtil"

    invoke-static {v1, p0}, Lcom/arialyy/aria/util/ALog;->e(Ljava/lang/String;Ljava/lang/String;)I

    :cond_2
    :goto_1
    return-object v0
.end method

.method public static varargs getMethod(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class;",
            "Ljava/lang/String;",
            "[",
            "Ljava/lang/Class<",
            "*>;)",
            "Ljava/lang/reflect/Method;"
        }
    .end annotation

    .line 789
    :try_start_0
    invoke-virtual {p0, p1, p2}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object p0
    :try_end_0
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 792
    :catch_0
    :try_start_1
    invoke-virtual {p0, p1, p2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object p0
    :try_end_1
    .catch Ljava/lang/NoSuchMethodException; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_0

    .line 794
    :catch_1
    invoke-virtual {p0}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object v0

    if-nez v0, :cond_0

    const/4 p0, 0x0

    return-object p0

    .line 797
    :cond_0
    invoke-virtual {p0}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object p0

    invoke-static {p0, p1, p2}, Lcom/arialyy/aria/util/CommonUtil;->getMethod(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object p0

    :goto_0
    if-eqz p0, :cond_1

    const/4 p1, 0x1

    .line 803
    invoke-virtual {p0, p1}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    :cond_1
    return-object p0
.end method

.method public static getPkgClassName(Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 282
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 284
    :try_start_0
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 285
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v1

    if-nez v1, :cond_0

    const-string p1, "CommonUtil"

    const-string v1, "\u8def\u5f84\u3010%s\u3011\u4e0b\u7684Dex\u6587\u4ef6\u4e0d\u5b58\u5728"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p0, v2, v3

    .line 286
    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p1, p0}, Lcom/arialyy/aria/util/ALog;->w(Ljava/lang/String;Ljava/lang/String;)I

    return-object v0

    .line 290
    :cond_0
    new-instance v1, Ldalvik/system/DexFile;

    invoke-direct {v1, p0}, Ldalvik/system/DexFile;-><init>(Ljava/lang/String;)V

    .line 291
    invoke-virtual {v1}, Ldalvik/system/DexFile;->entries()Ljava/util/Enumeration;

    move-result-object p0

    .line 292
    :cond_1
    :goto_0
    invoke-interface {p0}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v2

    if-eqz v2, :cond_3

    .line 293
    invoke-interface {p0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 294
    invoke-virtual {v2, p1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_2

    goto :goto_0

    .line 297
    :cond_2
    invoke-virtual {v2, p1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 298
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 301
    :cond_3
    invoke-virtual {v1}, Ldalvik/system/DexFile;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception p0

    .line 303
    invoke-virtual {p0}, Ljava/io/IOException;->printStackTrace()V

    :goto_1
    return-object v0
.end method

.method public static getPkgClassNames(Landroid/content/Context;Ljava/lang/String;)Ljava/util/List;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 256
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 257
    invoke-virtual {p0}, Landroid/content/Context;->getPackageCodePath()Ljava/lang/String;

    move-result-object p0

    .line 258
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v1

    .line 259
    invoke-virtual {v1}, Ljava/io/File;->list()[Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_0

    .line 261
    invoke-static {p0, p1}, Lcom/arialyy/aria/util/CommonUtil;->getPkgClassName(Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;

    move-result-object p0

    invoke-interface {v0, p0}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    goto :goto_2

    .line 263
    :cond_0
    invoke-virtual {v1}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object p0

    .line 264
    invoke-virtual {v1}, Ljava/io/File;->list()[Ljava/lang/String;

    move-result-object v1

    array-length v2, v1

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v2, :cond_2

    aget-object v4, v1, v3

    .line 265
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v6, "/"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    const-string v5, ".apk"

    .line 266
    invoke-virtual {v4, v5}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_1

    goto :goto_1

    .line 269
    :cond_1
    invoke-static {v4, p1}, Lcom/arialyy/aria/util/CommonUtil;->getPkgClassName(Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;

    move-result-object v4

    invoke-interface {v0, v4}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    :goto_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_2
    :goto_2
    return-object v0
.end method

.method public static getStrMd5(Ljava/lang/String;)Ljava/lang/String;
    .locals 3

    .line 554
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    const-string v1, ""

    if-eqz v0, :cond_0

    return-object v1

    :cond_0
    :try_start_0
    const-string v0, "MD5"

    .line 556
    invoke-static {v0}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v0

    .line 557
    invoke-virtual {p0}, Ljava/lang/String;->getBytes()[B

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/security/MessageDigest;->update([B)V

    .line 558
    new-instance p0, Ljava/math/BigInteger;

    const/4 v2, 0x1

    invoke-virtual {v0}, Ljava/security/MessageDigest;->digest()[B

    move-result-object v0

    invoke-direct {p0, v2, v0}, Ljava/math/BigInteger;-><init>(I[B)V

    const/16 v0, 0x10

    invoke-virtual {p0, v0}, Ljava/math/BigInteger;->toString(I)Ljava/lang/String;

    move-result-object p0
    :try_end_0
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    move-exception p0

    .line 560
    invoke-virtual {p0}, Ljava/security/NoSuchAlgorithmException;->printStackTrace()V

    return-object v1
.end method

.method public static getString(Ljava/lang/String;Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    const/4 v0, 0x0

    .line 713
    invoke-virtual {p1, p0, v0}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p0

    const-string p1, ""

    .line 714
    invoke-interface {p0, p2, p1}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static getTargetName(Ljava/lang/Object;)Ljava/lang/String;
    .locals 3

    .line 152
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-static {v0}, Lcom/arialyy/aria/util/CommonUtil;->isLocalOrAnonymousClass(Ljava/lang/Class;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/Object;

    .line 153
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    aput-object v1, v0, v2

    const-string v1, "%s \u662f\u533f\u540d\u5185\u90e8\u7c7b\u6216\u5c40\u90e8\u7c7b\uff0c\u5c06\u4f7f\u7528\u5176\u4e3b\u7c7b\u7684\u5bf9\u8c61"

    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "CommonUtil"

    invoke-static {v1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 154
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object p0

    const-string v0, "$"

    .line 155
    invoke-virtual {p0, v0}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v0

    .line 156
    invoke-virtual {p0, v2, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    goto :goto_0

    .line 158
    :cond_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object p0

    :goto_0
    return-object p0
.end method

.method public static getThreadName(Ljava/lang/String;I)Ljava/lang/String;
    .locals 0

    .line 170
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lcom/arialyy/aria/util/CommonUtil;->getStrMd5(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static getWindowReplaceUrl(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 314
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    const-string p0, "CommonUtil"

    const-string v0, "\u62e6\u622a\u6570\u636e\u4e3anull"

    .line 315
    invoke-static {p0, v0}, Lcom/arialyy/aria/util/ALog;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-object v1

    :cond_0
    const-string v0, "replace\\(\".*\"\\)"

    .line 319
    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    .line 320
    invoke-virtual {v0, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object p0

    .line 321
    invoke-virtual {p0}, Ljava/util/regex/Matcher;->find()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 322
    invoke-virtual {p0}, Ljava/util/regex/Matcher;->group()Ljava/lang/String;

    move-result-object p0

    const/16 v0, 0x9

    .line 323
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    add-int/lit8 v1, v1, -0x2

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_1
    return-object v1
.end method

.method public static hasDoubleCharacter(Ljava/lang/String;)Z
    .locals 5

    .line 484
    invoke-virtual {p0}, Ljava/lang/String;->toCharArray()[C

    move-result-object p0

    .line 485
    array-length v0, p0

    const/4 v1, 0x0

    move v2, v1

    :goto_0
    if-ge v2, v0, :cond_3

    aget-char v3, p0, v2

    const/16 v4, 0x391

    if-lt v3, v4, :cond_0

    const v4, 0xffe5

    if-le v3, v4, :cond_2

    :cond_0
    const/16 v4, 0xd

    if-eq v3, v4, :cond_2

    const/16 v4, 0xa

    if-eq v3, v4, :cond_2

    const/16 v4, 0x20

    if-ne v3, v4, :cond_1

    goto :goto_1

    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_2
    :goto_1
    const/4 p0, 0x1

    return p0

    :cond_3
    return v1
.end method

.method public static isDialogFragment(Ljava/lang/Class;)Z
    .locals 2

    .line 130
    invoke-virtual {p0}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object p0

    if-nez p0, :cond_0

    const/4 p0, 0x0

    return p0

    .line 134
    :cond_0
    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    .line 135
    sget-object v1, Lcom/arialyy/aria/util/CommonUtil;->mDialogFragmentClassName:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 p0, 0x1

    return p0

    .line 138
    :cond_1
    invoke-static {p0}, Lcom/arialyy/aria/util/CommonUtil;->isDialogFragment(Ljava/lang/Class;)Z

    move-result p0

    return p0
.end method

.method public static isFastDoubleClick()Z
    .locals 6

    .line 215
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    .line 216
    sget-wide v2, Lcom/arialyy/aria/util/CommonUtil;->lastClickTime:J

    sub-long v2, v0, v2

    const-wide/16 v4, 0x0

    cmp-long v4, v4, v2

    if-gez v4, :cond_0

    const-wide/16 v4, 0x1f4

    cmp-long v2, v2, v4

    if-gez v2, :cond_0

    const-string v0, "CommonUtil"

    const-string v1, "\u64cd\u4f5c\u592a\u9891\u7e41\u4e86\uff0c\u7f13\u4e00\u4e0b\u5427\uff5e"

    .line 218
    invoke-static {v0, v1}, Lcom/arialyy/aria/util/ALog;->i(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v0, 0x1

    return v0

    .line 221
    :cond_0
    sput-wide v0, Lcom/arialyy/aria/util/CommonUtil;->lastClickTime:J

    const/4 v0, 0x0

    return v0
.end method

.method public static isFragment(Ljava/lang/Class;)Z
    .locals 2

    .line 111
    invoke-virtual {p0}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object p0

    if-nez p0, :cond_0

    const/4 p0, 0x0

    return p0

    .line 115
    :cond_0
    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    .line 116
    sget-object v1, Lcom/arialyy/aria/util/CommonUtil;->mFragmentClassName:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 p0, 0x1

    return p0

    .line 119
    :cond_1
    invoke-static {p0}, Lcom/arialyy/aria/util/CommonUtil;->isFragment(Ljava/lang/Class;)Z

    move-result p0

    return p0
.end method

.method public static isLocalOrAnonymousClass(Ljava/lang/Class;)Z
    .locals 1

    .line 147
    invoke-virtual {p0}, Ljava/lang/Class;->isLocalClass()Z

    move-result v0

    if-nez v0, :cond_1

    invoke-virtual {p0}, Ljava/lang/Class;->isAnonymousClass()Z

    move-result p0

    if-eqz p0, :cond_0

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 p0, 0x1

    :goto_1
    return p0
.end method

.method public static keyToHashCode(Ljava/lang/String;)I
    .locals 4

    const/4 v0, 0x0

    move v1, v0

    .line 814
    :goto_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    if-ge v0, v2, :cond_2

    .line 815
    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v2

    const/16 v3, 0x2d

    if-ne v2, v3, :cond_0

    const/16 v2, 0x1c

    :cond_0
    const/16 v3, 0x27

    if-ne v2, v3, :cond_1

    const/16 v2, 0x1d

    :cond_1
    mul-int/lit8 v1, v1, 0x21

    and-int/lit8 v2, v2, 0x1f

    add-int/2addr v1, v2

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_2
    return v1
.end method

.method public static keyToHashKey(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    :try_start_0
    const-string v0, "MD5"

    .line 832
    invoke-static {v0}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v0

    .line 833
    invoke-virtual {p0}, Ljava/lang/String;->getBytes()[B

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/security/MessageDigest;->update([B)V

    .line 834
    invoke-virtual {v0}, Ljava/security/MessageDigest;->digest()[B

    move-result-object v0

    invoke-static {v0}, Lcom/arialyy/aria/util/CommonUtil;->bytesToHexString([B)Ljava/lang/String;

    move-result-object p0
    :try_end_0
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 836
    :catch_0
    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    move-result p0

    invoke-static {p0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object p0

    :goto_0
    return-object p0
.end method

.method public static putString(Ljava/lang/String;Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Boolean;
    .locals 1

    const/4 v0, 0x0

    .line 699
    invoke-virtual {p1, p0, v0}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p0

    .line 700
    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    .line 701
    invoke-interface {p0, p2, p3}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 702
    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    move-result p0

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static strCharSetConvert(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 519
    :try_start_0
    new-instance v0, Ljava/lang/String;

    invoke-virtual {p0}, Ljava/lang/String;->getBytes()[B

    move-result-object p0

    invoke-direct {v0, p0, p1}, Ljava/lang/String;-><init>([BLjava/lang/String;)V
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    :catch_0
    move-exception p0

    .line 521
    invoke-virtual {p0}, Ljava/io/UnsupportedEncodingException;->printStackTrace()V

    const/4 p0, 0x0

    return-object p0
.end method
