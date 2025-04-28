.class public Lcom/etralab/appstoreforandroid/NoticeActivity;
.super Landroid/app/Activity;
.source "NoticeActivity.java"


# instance fields
.field isDislikeNotice:Z

.field isLikeNotice:Z

.field notice_dislike_num:Ljava/lang/String;

.field notice_like_num:Ljava/lang/String;

.field notice_view_num:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 45
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    const/4 v0, 0x0

    .line 51
    iput-boolean v0, p0, Lcom/etralab/appstoreforandroid/NoticeActivity;->isLikeNotice:Z

    .line 52
    iput-boolean v0, p0, Lcom/etralab/appstoreforandroid/NoticeActivity;->isDislikeNotice:Z

    return-void
.end method

.method private ClickToBackLastActivity()V
    .locals 2

    const v0, 0x7f080127

    .line 931
    invoke-virtual {p0, v0}, Lcom/etralab/appstoreforandroid/NoticeActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    .line 932
    new-instance v1, Lcom/etralab/appstoreforandroid/NoticeActivity$10;

    invoke-direct {v1, p0}, Lcom/etralab/appstoreforandroid/NoticeActivity$10;-><init>(Lcom/etralab/appstoreforandroid/NoticeActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method private ReloadNotice()V
    .locals 9

    const v0, 0x7f0800e5

    .line 269
    invoke-virtual {p0, v0}, Lcom/etralab/appstoreforandroid/NoticeActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    const v1, 0x7f080242

    .line 270
    invoke-virtual {p0, v1}, Lcom/etralab/appstoreforandroid/NoticeActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    move-object v3, v1

    check-cast v3, Landroid/widget/TextView;

    const v1, 0x7f0800e4

    .line 272
    invoke-virtual {p0, v1}, Lcom/etralab/appstoreforandroid/NoticeActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    move-object v5, v1

    check-cast v5, Landroid/widget/ImageView;

    const v1, 0x7f08026c

    .line 273
    invoke-virtual {p0, v1}, Lcom/etralab/appstoreforandroid/NoticeActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    move-object v6, v1

    check-cast v6, Landroid/widget/TextView;

    const v1, 0x7f080069

    .line 274
    invoke-virtual {p0, v1}, Lcom/etralab/appstoreforandroid/NoticeActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    move-object v7, v1

    check-cast v7, Landroid/widget/Button;

    .line 276
    new-instance v8, Lcom/etralab/appstoreforandroid/NoticeActivity$8;

    move-object v1, v8

    move-object v2, p0

    move-object v4, v0

    invoke-direct/range {v1 .. v7}, Lcom/etralab/appstoreforandroid/NoticeActivity$8;-><init>(Lcom/etralab/appstoreforandroid/NoticeActivity;Landroid/widget/TextView;Landroid/widget/ImageView;Landroid/widget/ImageView;Landroid/widget/TextView;Landroid/widget/Button;)V

    invoke-virtual {p0, v8}, Lcom/etralab/appstoreforandroid/NoticeActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    if-eqz v0, :cond_0

    .line 290
    invoke-virtual {v0}, Landroid/widget/ImageView;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    check-cast v0, Landroid/graphics/drawable/AnimationDrawable;

    invoke-virtual {v0}, Landroid/graphics/drawable/AnimationDrawable;->start()V

    .line 293
    :cond_0
    invoke-virtual {p0}, Lcom/etralab/appstoreforandroid/NoticeActivity;->parseByJSONObject()V

    return-void
.end method

.method private ShowNotice()V
    .locals 4

    const v0, 0x7f08014b

    .line 239
    invoke-virtual {p0, v0}, Lcom/etralab/appstoreforandroid/NoticeActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    const v1, 0x7f0801f5

    .line 240
    invoke-virtual {p0, v1}, Lcom/etralab/appstoreforandroid/NoticeActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ScrollView;

    const v2, 0x7f0800e5

    .line 241
    invoke-virtual {p0, v2}, Lcom/etralab/appstoreforandroid/NoticeActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/ImageView;

    if-eqz v2, :cond_0

    .line 244
    invoke-virtual {v2}, Landroid/widget/ImageView;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v3

    check-cast v3, Landroid/graphics/drawable/AnimationDrawable;

    invoke-virtual {v3}, Landroid/graphics/drawable/AnimationDrawable;->isRunning()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 245
    invoke-virtual {v2}, Landroid/widget/ImageView;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v2

    check-cast v2, Landroid/graphics/drawable/AnimationDrawable;

    invoke-virtual {v2}, Landroid/graphics/drawable/AnimationDrawable;->stop()V

    .line 249
    :cond_0
    invoke-direct {p0}, Lcom/etralab/appstoreforandroid/NoticeActivity;->UpdateNoticeViewNum()V

    .line 251
    new-instance v2, Lcom/etralab/appstoreforandroid/NoticeActivity$7;

    invoke-direct {v2, p0, v0, v1}, Lcom/etralab/appstoreforandroid/NoticeActivity$7;-><init>(Lcom/etralab/appstoreforandroid/NoticeActivity;Landroid/widget/LinearLayout;Landroid/widget/ScrollView;)V

    invoke-virtual {p0, v2}, Lcom/etralab/appstoreforandroid/NoticeActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method private SubNoticeDislikeNum()V
    .locals 6

    .line 1053
    invoke-virtual {p0}, Lcom/etralab/appstoreforandroid/NoticeActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string v1, "noticeId"

    .line 1054
    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 1056
    new-instance v2, Lorg/apache/http/impl/client/DefaultHttpClient;

    invoke-direct {v2}, Lorg/apache/http/impl/client/DefaultHttpClient;-><init>()V

    .line 1057
    invoke-interface {v2}, Lorg/apache/http/client/HttpClient;->getParams()Lorg/apache/http/params/HttpParams;

    move-result-object v3

    const/16 v4, 0x1388

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    const-string v5, "http.connection.timeout"

    invoke-interface {v3, v5, v4}, Lorg/apache/http/params/HttpParams;->setParameter(Ljava/lang/String;Ljava/lang/Object;)Lorg/apache/http/params/HttpParams;

    .line 1058
    invoke-interface {v2}, Lorg/apache/http/client/HttpClient;->getParams()Lorg/apache/http/params/HttpParams;

    move-result-object v3

    const-string v5, "http.socket.timeout"

    invoke-interface {v3, v5, v4}, Lorg/apache/http/params/HttpParams;->setParameter(Ljava/lang/String;Ljava/lang/Object;)Lorg/apache/http/params/HttpParams;

    .line 1060
    new-instance v3, Lorg/apache/http/client/methods/HttpPost;

    const-string v4, "http://106.53.152.67/etralab_appstore_android/php/notice_activity/sub_notice_dislike_num.php"

    invoke-direct {v3, v4}, Lorg/apache/http/client/methods/HttpPost;-><init>(Ljava/lang/String;)V

    .line 1061
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 1062
    new-instance v5, Lorg/apache/http/message/BasicNameValuePair;

    invoke-direct {v5, v1, v0}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v4, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1065
    :try_start_0
    new-instance v0, Lorg/apache/http/client/entity/UrlEncodedFormEntity;

    const-string v1, "UTF-8"

    invoke-direct {v0, v4, v1}, Lorg/apache/http/client/entity/UrlEncodedFormEntity;-><init>(Ljava/util/List;Ljava/lang/String;)V

    invoke-virtual {v3, v0}, Lorg/apache/http/client/methods/HttpPost;->setEntity(Lorg/apache/http/HttpEntity;)V

    .line 1066
    invoke-interface {v2, v3}, Lorg/apache/http/client/HttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;)Lorg/apache/http/HttpResponse;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    .line 1069
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    :goto_0
    return-void
.end method

.method private SubNoticeLikeNum()V
    .locals 6

    .line 1009
    invoke-virtual {p0}, Lcom/etralab/appstoreforandroid/NoticeActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string v1, "noticeId"

    .line 1010
    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 1012
    new-instance v2, Lorg/apache/http/impl/client/DefaultHttpClient;

    invoke-direct {v2}, Lorg/apache/http/impl/client/DefaultHttpClient;-><init>()V

    .line 1013
    invoke-interface {v2}, Lorg/apache/http/client/HttpClient;->getParams()Lorg/apache/http/params/HttpParams;

    move-result-object v3

    const/16 v4, 0x1388

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    const-string v5, "http.connection.timeout"

    invoke-interface {v3, v5, v4}, Lorg/apache/http/params/HttpParams;->setParameter(Ljava/lang/String;Ljava/lang/Object;)Lorg/apache/http/params/HttpParams;

    .line 1014
    invoke-interface {v2}, Lorg/apache/http/client/HttpClient;->getParams()Lorg/apache/http/params/HttpParams;

    move-result-object v3

    const-string v5, "http.socket.timeout"

    invoke-interface {v3, v5, v4}, Lorg/apache/http/params/HttpParams;->setParameter(Ljava/lang/String;Ljava/lang/Object;)Lorg/apache/http/params/HttpParams;

    .line 1016
    new-instance v3, Lorg/apache/http/client/methods/HttpPost;

    const-string v4, "http://106.53.152.67/etralab_appstore_android/php/notice_activity/sub_notice_like_num.php"

    invoke-direct {v3, v4}, Lorg/apache/http/client/methods/HttpPost;-><init>(Ljava/lang/String;)V

    .line 1017
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 1018
    new-instance v5, Lorg/apache/http/message/BasicNameValuePair;

    invoke-direct {v5, v1, v0}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v4, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1021
    :try_start_0
    new-instance v0, Lorg/apache/http/client/entity/UrlEncodedFormEntity;

    const-string v1, "UTF-8"

    invoke-direct {v0, v4, v1}, Lorg/apache/http/client/entity/UrlEncodedFormEntity;-><init>(Ljava/util/List;Ljava/lang/String;)V

    invoke-virtual {v3, v0}, Lorg/apache/http/client/methods/HttpPost;->setEntity(Lorg/apache/http/HttpEntity;)V

    .line 1022
    invoke-interface {v2, v3}, Lorg/apache/http/client/HttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;)Lorg/apache/http/HttpResponse;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    .line 1025
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    :goto_0
    return-void
.end method

.method private UpdateNoticeActivityTotalPv()V
    .locals 2

    .line 944
    :try_start_0
    new-instance v0, Ljava/net/URL;

    const-string v1, "http://106.53.152.67/etralab_appstore_android/pv/notice_activity/pv.php"

    invoke-direct {v0, v1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 947
    invoke-virtual {v0}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v0

    check-cast v0, Ljava/net/HttpURLConnection;

    const-string v1, "GET"

    .line 951
    invoke-virtual {v0, v1}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    const/16 v1, 0x1770

    .line 953
    invoke-virtual {v0, v1}, Ljava/net/HttpURLConnection;->setConnectTimeout(I)V

    .line 956
    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getResponseCode()I
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    .line 959
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    :goto_0
    return-void
.end method

.method private UpdateNoticeDislikeNum()V
    .locals 6

    .line 1031
    invoke-virtual {p0}, Lcom/etralab/appstoreforandroid/NoticeActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string v1, "noticeId"

    .line 1032
    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 1034
    new-instance v2, Lorg/apache/http/impl/client/DefaultHttpClient;

    invoke-direct {v2}, Lorg/apache/http/impl/client/DefaultHttpClient;-><init>()V

    .line 1035
    invoke-interface {v2}, Lorg/apache/http/client/HttpClient;->getParams()Lorg/apache/http/params/HttpParams;

    move-result-object v3

    const/16 v4, 0x1388

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    const-string v5, "http.connection.timeout"

    invoke-interface {v3, v5, v4}, Lorg/apache/http/params/HttpParams;->setParameter(Ljava/lang/String;Ljava/lang/Object;)Lorg/apache/http/params/HttpParams;

    .line 1036
    invoke-interface {v2}, Lorg/apache/http/client/HttpClient;->getParams()Lorg/apache/http/params/HttpParams;

    move-result-object v3

    const-string v5, "http.socket.timeout"

    invoke-interface {v3, v5, v4}, Lorg/apache/http/params/HttpParams;->setParameter(Ljava/lang/String;Ljava/lang/Object;)Lorg/apache/http/params/HttpParams;

    .line 1038
    new-instance v3, Lorg/apache/http/client/methods/HttpPost;

    const-string v4, "http://106.53.152.67/etralab_appstore_android/php/notice_activity/update_notice_dislike_num.php"

    invoke-direct {v3, v4}, Lorg/apache/http/client/methods/HttpPost;-><init>(Ljava/lang/String;)V

    .line 1039
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 1040
    new-instance v5, Lorg/apache/http/message/BasicNameValuePair;

    invoke-direct {v5, v1, v0}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v4, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1043
    :try_start_0
    new-instance v0, Lorg/apache/http/client/entity/UrlEncodedFormEntity;

    const-string v1, "UTF-8"

    invoke-direct {v0, v4, v1}, Lorg/apache/http/client/entity/UrlEncodedFormEntity;-><init>(Ljava/util/List;Ljava/lang/String;)V

    invoke-virtual {v3, v0}, Lorg/apache/http/client/methods/HttpPost;->setEntity(Lorg/apache/http/HttpEntity;)V

    .line 1044
    invoke-interface {v2, v3}, Lorg/apache/http/client/HttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;)Lorg/apache/http/HttpResponse;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    .line 1047
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    :goto_0
    return-void
.end method

.method private UpdateNoticeLikeNum()V
    .locals 6

    .line 987
    invoke-virtual {p0}, Lcom/etralab/appstoreforandroid/NoticeActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string v1, "noticeId"

    .line 988
    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 990
    new-instance v2, Lorg/apache/http/impl/client/DefaultHttpClient;

    invoke-direct {v2}, Lorg/apache/http/impl/client/DefaultHttpClient;-><init>()V

    .line 991
    invoke-interface {v2}, Lorg/apache/http/client/HttpClient;->getParams()Lorg/apache/http/params/HttpParams;

    move-result-object v3

    const/16 v4, 0x1388

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    const-string v5, "http.connection.timeout"

    invoke-interface {v3, v5, v4}, Lorg/apache/http/params/HttpParams;->setParameter(Ljava/lang/String;Ljava/lang/Object;)Lorg/apache/http/params/HttpParams;

    .line 992
    invoke-interface {v2}, Lorg/apache/http/client/HttpClient;->getParams()Lorg/apache/http/params/HttpParams;

    move-result-object v3

    const-string v5, "http.socket.timeout"

    invoke-interface {v3, v5, v4}, Lorg/apache/http/params/HttpParams;->setParameter(Ljava/lang/String;Ljava/lang/Object;)Lorg/apache/http/params/HttpParams;

    .line 994
    new-instance v3, Lorg/apache/http/client/methods/HttpPost;

    const-string v4, "http://106.53.152.67/etralab_appstore_android/php/notice_activity/update_notice_like_num.php"

    invoke-direct {v3, v4}, Lorg/apache/http/client/methods/HttpPost;-><init>(Ljava/lang/String;)V

    .line 995
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 996
    new-instance v5, Lorg/apache/http/message/BasicNameValuePair;

    invoke-direct {v5, v1, v0}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v4, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 999
    :try_start_0
    new-instance v0, Lorg/apache/http/client/entity/UrlEncodedFormEntity;

    const-string v1, "UTF-8"

    invoke-direct {v0, v4, v1}, Lorg/apache/http/client/entity/UrlEncodedFormEntity;-><init>(Ljava/util/List;Ljava/lang/String;)V

    invoke-virtual {v3, v0}, Lorg/apache/http/client/methods/HttpPost;->setEntity(Lorg/apache/http/HttpEntity;)V

    .line 1000
    invoke-interface {v2, v3}, Lorg/apache/http/client/HttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;)Lorg/apache/http/HttpResponse;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    .line 1003
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    :goto_0
    return-void
.end method

.method private UpdateNoticeViewNum()V
    .locals 6

    .line 965
    invoke-virtual {p0}, Lcom/etralab/appstoreforandroid/NoticeActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string v1, "noticeId"

    .line 966
    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 968
    new-instance v2, Lorg/apache/http/impl/client/DefaultHttpClient;

    invoke-direct {v2}, Lorg/apache/http/impl/client/DefaultHttpClient;-><init>()V

    .line 969
    invoke-interface {v2}, Lorg/apache/http/client/HttpClient;->getParams()Lorg/apache/http/params/HttpParams;

    move-result-object v3

    const/16 v4, 0x1388

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    const-string v5, "http.connection.timeout"

    invoke-interface {v3, v5, v4}, Lorg/apache/http/params/HttpParams;->setParameter(Ljava/lang/String;Ljava/lang/Object;)Lorg/apache/http/params/HttpParams;

    .line 970
    invoke-interface {v2}, Lorg/apache/http/client/HttpClient;->getParams()Lorg/apache/http/params/HttpParams;

    move-result-object v3

    const-string v5, "http.socket.timeout"

    invoke-interface {v3, v5, v4}, Lorg/apache/http/params/HttpParams;->setParameter(Ljava/lang/String;Ljava/lang/Object;)Lorg/apache/http/params/HttpParams;

    .line 972
    new-instance v3, Lorg/apache/http/client/methods/HttpPost;

    const-string v4, "http://106.53.152.67/etralab_appstore_android/php/notice_activity/update_notice_view_num.php"

    invoke-direct {v3, v4}, Lorg/apache/http/client/methods/HttpPost;-><init>(Ljava/lang/String;)V

    .line 973
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 974
    new-instance v5, Lorg/apache/http/message/BasicNameValuePair;

    invoke-direct {v5, v1, v0}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v4, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 977
    :try_start_0
    new-instance v0, Lorg/apache/http/client/entity/UrlEncodedFormEntity;

    const-string v1, "UTF-8"

    invoke-direct {v0, v4, v1}, Lorg/apache/http/client/entity/UrlEncodedFormEntity;-><init>(Ljava/util/List;Ljava/lang/String;)V

    invoke-virtual {v3, v0}, Lorg/apache/http/client/methods/HttpPost;->setEntity(Lorg/apache/http/HttpEntity;)V

    .line 978
    invoke-interface {v2, v3}, Lorg/apache/http/client/HttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;)Lorg/apache/http/HttpResponse;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    .line 981
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    :goto_0
    return-void
.end method

.method static synthetic access$000(Lcom/etralab/appstoreforandroid/NoticeActivity;)V
    .locals 0

    .line 45
    invoke-direct {p0}, Lcom/etralab/appstoreforandroid/NoticeActivity;->ReloadNotice()V

    return-void
.end method

.method static synthetic access$100(Lcom/etralab/appstoreforandroid/NoticeActivity;)V
    .locals 0

    .line 45
    invoke-direct {p0}, Lcom/etralab/appstoreforandroid/NoticeActivity;->UpdateNoticeLikeNum()V

    return-void
.end method

.method static synthetic access$200(Lcom/etralab/appstoreforandroid/NoticeActivity;)V
    .locals 0

    .line 45
    invoke-direct {p0}, Lcom/etralab/appstoreforandroid/NoticeActivity;->SubNoticeLikeNum()V

    return-void
.end method

.method static synthetic access$300(Lcom/etralab/appstoreforandroid/NoticeActivity;)V
    .locals 0

    .line 45
    invoke-direct {p0}, Lcom/etralab/appstoreforandroid/NoticeActivity;->UpdateNoticeDislikeNum()V

    return-void
.end method

.method static synthetic access$400(Lcom/etralab/appstoreforandroid/NoticeActivity;)V
    .locals 0

    .line 45
    invoke-direct {p0}, Lcom/etralab/appstoreforandroid/NoticeActivity;->SubNoticeDislikeNum()V

    return-void
.end method

.method static synthetic access$500(Lcom/etralab/appstoreforandroid/NoticeActivity;)V
    .locals 0

    .line 45
    invoke-direct {p0}, Lcom/etralab/appstoreforandroid/NoticeActivity;->UpdateNoticeActivityTotalPv()V

    return-void
.end method

.method static synthetic access$600(Lcom/etralab/appstoreforandroid/NoticeActivity;)Ljava/lang/String;
    .locals 0

    .line 45
    invoke-direct {p0}, Lcom/etralab/appstoreforandroid/NoticeActivity;->getJson()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$700(Lcom/etralab/appstoreforandroid/NoticeActivity;)V
    .locals 0

    .line 45
    invoke-direct {p0}, Lcom/etralab/appstoreforandroid/NoticeActivity;->ShowNotice()V

    return-void
.end method

.method private getJson()Ljava/lang/String;
    .locals 6

    .line 873
    invoke-virtual {p0}, Lcom/etralab/appstoreforandroid/NoticeActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string v1, "noticeId"

    .line 874
    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 876
    new-instance v2, Lorg/apache/http/impl/client/DefaultHttpClient;

    invoke-direct {v2}, Lorg/apache/http/impl/client/DefaultHttpClient;-><init>()V

    .line 877
    invoke-interface {v2}, Lorg/apache/http/client/HttpClient;->getParams()Lorg/apache/http/params/HttpParams;

    move-result-object v3

    const/16 v4, 0x1388

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    const-string v5, "http.connection.timeout"

    invoke-interface {v3, v5, v4}, Lorg/apache/http/params/HttpParams;->setParameter(Ljava/lang/String;Ljava/lang/Object;)Lorg/apache/http/params/HttpParams;

    .line 878
    invoke-interface {v2}, Lorg/apache/http/client/HttpClient;->getParams()Lorg/apache/http/params/HttpParams;

    move-result-object v3

    const-string v5, "http.socket.timeout"

    invoke-interface {v3, v5, v4}, Lorg/apache/http/params/HttpParams;->setParameter(Ljava/lang/String;Ljava/lang/Object;)Lorg/apache/http/params/HttpParams;

    .line 880
    new-instance v3, Lorg/apache/http/client/methods/HttpPost;

    const-string v4, "http://106.53.152.67/etralab_appstore_android/php/notice_activity/get_notice_data.php"

    invoke-direct {v3, v4}, Lorg/apache/http/client/methods/HttpPost;-><init>(Ljava/lang/String;)V

    .line 881
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 882
    new-instance v5, Lorg/apache/http/message/BasicNameValuePair;

    invoke-direct {v5, v1, v0}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v4, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 885
    :try_start_0
    new-instance v0, Lorg/apache/http/client/entity/UrlEncodedFormEntity;

    const-string v1, "UTF-8"

    invoke-direct {v0, v4, v1}, Lorg/apache/http/client/entity/UrlEncodedFormEntity;-><init>(Ljava/util/List;Ljava/lang/String;)V

    invoke-virtual {v3, v0}, Lorg/apache/http/client/methods/HttpPost;->setEntity(Lorg/apache/http/HttpEntity;)V

    .line 886
    invoke-interface {v2, v3}, Lorg/apache/http/client/HttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;)Lorg/apache/http/HttpResponse;

    move-result-object v0

    .line 887
    invoke-interface {v0}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v1

    invoke-interface {v1}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v1

    const/16 v2, 0xc8

    if-ne v1, v2, :cond_1

    .line 889
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 891
    new-instance v2, Ljava/io/BufferedReader;

    new-instance v3, Ljava/io/InputStreamReader;

    .line 892
    invoke-interface {v0}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v0

    invoke-interface {v0}, Lorg/apache/http/HttpEntity;->getContent()Ljava/io/InputStream;

    move-result-object v0

    invoke-direct {v3, v0}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    invoke-direct {v2, v3}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 893
    :goto_0
    invoke-virtual {v2}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 895
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 898
    :cond_0
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    :catch_0
    move-exception v0

    .line 903
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    :cond_1
    const/4 v0, 0x0

    return-object v0
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 2

    .line 56
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    const/4 p1, 0x1

    .line 58
    invoke-virtual {p0, p1}, Lcom/etralab/appstoreforandroid/NoticeActivity;->requestWindowFeature(I)Z

    .line 60
    invoke-virtual {p0}, Lcom/etralab/appstoreforandroid/NoticeActivity;->setLayout()V

    .line 63
    invoke-direct {p0}, Lcom/etralab/appstoreforandroid/NoticeActivity;->ClickToBackLastActivity()V

    .line 66
    invoke-virtual {p0}, Lcom/etralab/appstoreforandroid/NoticeActivity;->parseByJSONObject()V

    .line 68
    new-instance p1, Lcom/etralab/appstoreforandroid/NoticeActivity$1;

    invoke-direct {p1, p0}, Lcom/etralab/appstoreforandroid/NoticeActivity$1;-><init>(Lcom/etralab/appstoreforandroid/NoticeActivity;)V

    .line 79
    invoke-virtual {p1}, Lcom/etralab/appstoreforandroid/NoticeActivity$1;->start()V

    const p1, 0x7f080069

    .line 82
    invoke-virtual {p0, p1}, Lcom/etralab/appstoreforandroid/NoticeActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/Button;

    .line 83
    new-instance v0, Lcom/etralab/appstoreforandroid/NoticeActivity$2;

    invoke-direct {v0, p0}, Lcom/etralab/appstoreforandroid/NoticeActivity$2;-><init>(Lcom/etralab/appstoreforandroid/NoticeActivity;)V

    invoke-virtual {p1, v0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const p1, 0x7f080149

    .line 92
    invoke-virtual {p0, p1}, Lcom/etralab/appstoreforandroid/NoticeActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/LinearLayout;

    .line 93
    new-instance v0, Lcom/etralab/appstoreforandroid/OnDoubleClickListener;

    new-instance v1, Lcom/etralab/appstoreforandroid/NoticeActivity$3;

    invoke-direct {v1, p0}, Lcom/etralab/appstoreforandroid/NoticeActivity$3;-><init>(Lcom/etralab/appstoreforandroid/NoticeActivity;)V

    invoke-direct {v0, v1}, Lcom/etralab/appstoreforandroid/OnDoubleClickListener;-><init>(Lcom/etralab/appstoreforandroid/OnDoubleClickListener$DoubleClickCallback;)V

    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    const p1, 0x7f08014a

    .line 133
    invoke-virtual {p0, p1}, Lcom/etralab/appstoreforandroid/NoticeActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/LinearLayout;

    .line 134
    new-instance v0, Lcom/etralab/appstoreforandroid/NoticeActivity$4;

    invoke-direct {v0, p0}, Lcom/etralab/appstoreforandroid/NoticeActivity$4;-><init>(Lcom/etralab/appstoreforandroid/NoticeActivity;)V

    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const p1, 0x7f080133

    .line 180
    invoke-virtual {p0, p1}, Lcom/etralab/appstoreforandroid/NoticeActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/LinearLayout;

    .line 181
    new-instance v0, Lcom/etralab/appstoreforandroid/NoticeActivity$5;

    invoke-direct {v0, p0}, Lcom/etralab/appstoreforandroid/NoticeActivity$5;-><init>(Lcom/etralab/appstoreforandroid/NoticeActivity;)V

    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const p1, 0x7f0801f5

    .line 226
    invoke-virtual {p0, p1}, Lcom/etralab/appstoreforandroid/NoticeActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/ScrollView;

    .line 227
    new-instance v0, Lcom/etralab/appstoreforandroid/NoticeActivity$6;

    invoke-direct {v0, p0, p1}, Lcom/etralab/appstoreforandroid/NoticeActivity$6;-><init>(Lcom/etralab/appstoreforandroid/NoticeActivity;Landroid/widget/ScrollView;)V

    invoke-virtual {p0, v0}, Lcom/etralab/appstoreforandroid/NoticeActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method public parseByJSONObject()V
    .locals 1

    .line 297
    new-instance v0, Lcom/etralab/appstoreforandroid/NoticeActivity$9;

    invoke-direct {v0, p0}, Lcom/etralab/appstoreforandroid/NoticeActivity$9;-><init>(Lcom/etralab/appstoreforandroid/NoticeActivity;)V

    .line 867
    invoke-virtual {v0}, Lcom/etralab/appstoreforandroid/NoticeActivity$9;->start()V

    return-void
.end method

.method setLayout()V
    .locals 4

    .line 910
    new-instance v0, Ljava/io/File;

    invoke-virtual {p0}, Lcom/etralab/appstoreforandroid/NoticeActivity;->getFilesDir()Ljava/io/File;

    move-result-object v1

    const-string v2, "CircleLayout.txt"

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 911
    new-instance v1, Ljava/io/File;

    invoke-virtual {p0}, Lcom/etralab/appstoreforandroid/NoticeActivity;->getFilesDir()Ljava/io/File;

    move-result-object v2

    const-string v3, "SquareLayout.txt"

    invoke-direct {v1, v2, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 912
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v2

    const v3, 0x7f0b0035

    if-eqz v2, :cond_0

    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 913
    invoke-virtual {p0, v3}, Lcom/etralab/appstoreforandroid/NoticeActivity;->setContentView(I)V

    .line 914
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/etralab/appstoreforandroid/ChooseLayoutActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 915
    invoke-virtual {p0, v0}, Lcom/etralab/appstoreforandroid/NoticeActivity;->startActivity(Landroid/content/Intent;)V

    .line 916
    invoke-virtual {p0}, Lcom/etralab/appstoreforandroid/NoticeActivity;->finish()V

    goto :goto_0

    .line 917
    :cond_0
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 918
    invoke-virtual {p0, v3}, Lcom/etralab/appstoreforandroid/NoticeActivity;->setContentView(I)V

    goto :goto_0

    .line 919
    :cond_1
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_2

    const v0, 0x7f0b0036

    .line 920
    invoke-virtual {p0, v0}, Lcom/etralab/appstoreforandroid/NoticeActivity;->setContentView(I)V

    goto :goto_0

    .line 922
    :cond_2
    invoke-virtual {p0, v3}, Lcom/etralab/appstoreforandroid/NoticeActivity;->setContentView(I)V

    .line 923
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/etralab/appstoreforandroid/ChooseLayoutActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 924
    invoke-virtual {p0, v0}, Lcom/etralab/appstoreforandroid/NoticeActivity;->startActivity(Landroid/content/Intent;)V

    .line 925
    invoke-virtual {p0}, Lcom/etralab/appstoreforandroid/NoticeActivity;->finish()V

    :goto_0
    return-void
.end method
