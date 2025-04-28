.class Lcom/etralab/appstoreforandroid/AppActivity$9;
.super Ljava/lang/Thread;
.source "AppActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/etralab/appstoreforandroid/AppActivity;->parseByJSONObject()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/etralab/appstoreforandroid/AppActivity;


# direct methods
.method constructor <init>(Lcom/etralab/appstoreforandroid/AppActivity;)V
    .locals 0

    .line 328
    iput-object p1, p0, Lcom/etralab/appstoreforandroid/AppActivity$9;->this$0:Lcom/etralab/appstoreforandroid/AppActivity;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 22

    move-object/from16 v11, p0

    const-string v0, "screenshot_7_url"

    const-string v1, "screenshot_6_url"

    const-string v2, "screenshot_5_url"

    const-string v3, "screenshot_4_url"

    const-string v4, "screenshot_3_url"

    const-string v5, "screenshot_2_url"

    const-string v6, "screenshot_1_url"

    const-string v7, "screenshot_0_url"

    const-string v8, "http://img.etrasoft.cn"

    const-string v9, "null"

    .line 331
    invoke-super/range {p0 .. p0}, Ljava/lang/Thread;->run()V

    .line 334
    iget-object v10, v11, Lcom/etralab/appstoreforandroid/AppActivity$9;->this$0:Lcom/etralab/appstoreforandroid/AppActivity;

    invoke-static {v10}, Lcom/etralab/appstoreforandroid/AppActivity;->access$600(Lcom/etralab/appstoreforandroid/AppActivity;)V

    .line 336
    iget-object v10, v11, Lcom/etralab/appstoreforandroid/AppActivity$9;->this$0:Lcom/etralab/appstoreforandroid/AppActivity;

    invoke-static {v10}, Lcom/etralab/appstoreforandroid/AppActivity;->access$700(Lcom/etralab/appstoreforandroid/AppActivity;)Ljava/lang/String;

    move-result-object v10

    if-eqz v10, :cond_c

    .line 342
    :try_start_0
    new-instance v12, Lorg/json/JSONObject;

    invoke-direct {v12, v10}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 344
    iget-object v10, v11, Lcom/etralab/appstoreforandroid/AppActivity$9;->this$0:Lcom/etralab/appstoreforandroid/AppActivity;

    const-string v13, "pkg_name"

    invoke-virtual {v12, v13}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    iput-object v13, v10, Lcom/etralab/appstoreforandroid/AppActivity;->app_pkg_name:Ljava/lang/String;

    const-string v10, "name"

    .line 345
    invoke-virtual {v12, v10}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    .line 346
    iget-object v13, v11, Lcom/etralab/appstoreforandroid/AppActivity$9;->this$0:Lcom/etralab/appstoreforandroid/AppActivity;

    const-string v14, "name_en"

    invoke-virtual {v12, v14}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    iput-object v14, v13, Lcom/etralab/appstoreforandroid/AppActivity;->app_name_en:Ljava/lang/String;

    .line 347
    iget-object v13, v11, Lcom/etralab/appstoreforandroid/AppActivity$9;->this$0:Lcom/etralab/appstoreforandroid/AppActivity;

    const-string v14, "developer"

    invoke-virtual {v12, v14}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    iput-object v14, v13, Lcom/etralab/appstoreforandroid/AppActivity;->app_developer:Ljava/lang/String;

    .line 348
    iget-object v13, v11, Lcom/etralab/appstoreforandroid/AppActivity$9;->this$0:Lcom/etralab/appstoreforandroid/AppActivity;

    const-string v14, "download_num"

    invoke-virtual {v12, v14}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    iput-object v14, v13, Lcom/etralab/appstoreforandroid/AppActivity;->app_download_number:Ljava/lang/String;

    .line 349
    iget-object v13, v11, Lcom/etralab/appstoreforandroid/AppActivity$9;->this$0:Lcom/etralab/appstoreforandroid/AppActivity;

    const-string v14, "like_num"

    invoke-virtual {v12, v14}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    iput-object v14, v13, Lcom/etralab/appstoreforandroid/AppActivity;->app_like_number:Ljava/lang/String;

    const-string v13, "os_type"

    .line 350
    invoke-virtual {v12, v13}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    const-string v14, "version"

    .line 351
    invoke-virtual {v12, v14}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    .line 352
    iget-object v15, v11, Lcom/etralab/appstoreforandroid/AppActivity$9;->this$0:Lcom/etralab/appstoreforandroid/AppActivity;

    move-object/from16 v16, v13

    const-string v13, "version_code"

    invoke-virtual {v12, v13}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    iput-object v13, v15, Lcom/etralab/appstoreforandroid/AppActivity;->app_version_code:Ljava/lang/String;

    const-string v13, "download_size"

    .line 353
    invoke-virtual {v12, v13}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    const-string v15, "update_time"

    .line 354
    invoke-virtual {v12, v15}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v15

    move-object/from16 v17, v15

    const-string v15, "update_log"

    .line 355
    invoke-virtual {v12, v15}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v15

    move-object/from16 v18, v15

    const-string v15, "introduction"

    .line 356
    invoke-virtual {v12, v15}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v15

    move-object/from16 v19, v15

    .line 357
    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v15, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-object/from16 v20, v13

    const-string v13, "logo_url"

    invoke-virtual {v12, v13}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v15, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    .line 359
    invoke-virtual {v12, v7}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v15, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v15

    if-nez v15, :cond_0

    .line 360
    iget-object v15, v11, Lcom/etralab/appstoreforandroid/AppActivity$9;->this$0:Lcom/etralab/appstoreforandroid/AppActivity;

    move-object/from16 v21, v13

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v13, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v12, v7}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v13, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    iput-object v7, v15, Lcom/etralab/appstoreforandroid/AppActivity;->app_screen_shot_0:Ljava/lang/String;

    .line 361
    iget-object v7, v11, Lcom/etralab/appstoreforandroid/AppActivity$9;->this$0:Lcom/etralab/appstoreforandroid/AppActivity;

    iget-object v7, v7, Lcom/etralab/appstoreforandroid/AppActivity;->appScreenshotUrlList:Ljava/util/List;

    iget-object v13, v11, Lcom/etralab/appstoreforandroid/AppActivity$9;->this$0:Lcom/etralab/appstoreforandroid/AppActivity;

    iget-object v13, v13, Lcom/etralab/appstoreforandroid/AppActivity;->app_screen_shot_0:Ljava/lang/String;

    invoke-interface {v7, v13}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_0
    move-object/from16 v21, v13

    .line 363
    iget-object v7, v11, Lcom/etralab/appstoreforandroid/AppActivity$9;->this$0:Lcom/etralab/appstoreforandroid/AppActivity;

    iput-object v9, v7, Lcom/etralab/appstoreforandroid/AppActivity;->app_screen_shot_0:Ljava/lang/String;

    .line 366
    :goto_0
    invoke-virtual {v12, v6}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v7, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_1

    .line 367
    iget-object v7, v11, Lcom/etralab/appstoreforandroid/AppActivity$9;->this$0:Lcom/etralab/appstoreforandroid/AppActivity;

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v13, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v12, v6}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v13, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    iput-object v6, v7, Lcom/etralab/appstoreforandroid/AppActivity;->app_screen_shot_1:Ljava/lang/String;

    .line 368
    iget-object v6, v11, Lcom/etralab/appstoreforandroid/AppActivity$9;->this$0:Lcom/etralab/appstoreforandroid/AppActivity;

    iget-object v6, v6, Lcom/etralab/appstoreforandroid/AppActivity;->appScreenshotUrlList:Ljava/util/List;

    iget-object v7, v11, Lcom/etralab/appstoreforandroid/AppActivity$9;->this$0:Lcom/etralab/appstoreforandroid/AppActivity;

    iget-object v7, v7, Lcom/etralab/appstoreforandroid/AppActivity;->app_screen_shot_1:Ljava/lang/String;

    invoke-interface {v6, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 370
    :cond_1
    iget-object v6, v11, Lcom/etralab/appstoreforandroid/AppActivity$9;->this$0:Lcom/etralab/appstoreforandroid/AppActivity;

    iput-object v9, v6, Lcom/etralab/appstoreforandroid/AppActivity;->app_screen_shot_1:Ljava/lang/String;

    .line 373
    :goto_1
    invoke-virtual {v12, v5}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_2

    .line 374
    iget-object v6, v11, Lcom/etralab/appstoreforandroid/AppActivity$9;->this$0:Lcom/etralab/appstoreforandroid/AppActivity;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v12, v5}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    iput-object v5, v6, Lcom/etralab/appstoreforandroid/AppActivity;->app_screen_shot_2:Ljava/lang/String;

    .line 375
    iget-object v5, v11, Lcom/etralab/appstoreforandroid/AppActivity$9;->this$0:Lcom/etralab/appstoreforandroid/AppActivity;

    iget-object v5, v5, Lcom/etralab/appstoreforandroid/AppActivity;->appScreenshotUrlList:Ljava/util/List;

    iget-object v6, v11, Lcom/etralab/appstoreforandroid/AppActivity$9;->this$0:Lcom/etralab/appstoreforandroid/AppActivity;

    iget-object v6, v6, Lcom/etralab/appstoreforandroid/AppActivity;->app_screen_shot_2:Ljava/lang/String;

    invoke-interface {v5, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_2

    .line 377
    :cond_2
    iget-object v5, v11, Lcom/etralab/appstoreforandroid/AppActivity$9;->this$0:Lcom/etralab/appstoreforandroid/AppActivity;

    iput-object v9, v5, Lcom/etralab/appstoreforandroid/AppActivity;->app_screen_shot_2:Ljava/lang/String;

    .line 380
    :goto_2
    invoke-virtual {v12, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_3

    .line 381
    iget-object v5, v11, Lcom/etralab/appstoreforandroid/AppActivity$9;->this$0:Lcom/etralab/appstoreforandroid/AppActivity;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v12, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    iput-object v4, v5, Lcom/etralab/appstoreforandroid/AppActivity;->app_screen_shot_3:Ljava/lang/String;

    .line 382
    iget-object v4, v11, Lcom/etralab/appstoreforandroid/AppActivity$9;->this$0:Lcom/etralab/appstoreforandroid/AppActivity;

    iget-object v4, v4, Lcom/etralab/appstoreforandroid/AppActivity;->appScreenshotUrlList:Ljava/util/List;

    iget-object v5, v11, Lcom/etralab/appstoreforandroid/AppActivity$9;->this$0:Lcom/etralab/appstoreforandroid/AppActivity;

    iget-object v5, v5, Lcom/etralab/appstoreforandroid/AppActivity;->app_screen_shot_3:Ljava/lang/String;

    invoke-interface {v4, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_3

    .line 384
    :cond_3
    iget-object v4, v11, Lcom/etralab/appstoreforandroid/AppActivity$9;->this$0:Lcom/etralab/appstoreforandroid/AppActivity;

    iput-object v9, v4, Lcom/etralab/appstoreforandroid/AppActivity;->app_screen_shot_3:Ljava/lang/String;

    .line 387
    :goto_3
    invoke-virtual {v12, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_4

    .line 388
    iget-object v4, v11, Lcom/etralab/appstoreforandroid/AppActivity$9;->this$0:Lcom/etralab/appstoreforandroid/AppActivity;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v12, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    iput-object v3, v4, Lcom/etralab/appstoreforandroid/AppActivity;->app_screen_shot_4:Ljava/lang/String;

    .line 389
    iget-object v3, v11, Lcom/etralab/appstoreforandroid/AppActivity$9;->this$0:Lcom/etralab/appstoreforandroid/AppActivity;

    iget-object v3, v3, Lcom/etralab/appstoreforandroid/AppActivity;->appScreenshotUrlList:Ljava/util/List;

    iget-object v4, v11, Lcom/etralab/appstoreforandroid/AppActivity$9;->this$0:Lcom/etralab/appstoreforandroid/AppActivity;

    iget-object v4, v4, Lcom/etralab/appstoreforandroid/AppActivity;->app_screen_shot_4:Ljava/lang/String;

    invoke-interface {v3, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_4

    .line 391
    :cond_4
    iget-object v3, v11, Lcom/etralab/appstoreforandroid/AppActivity$9;->this$0:Lcom/etralab/appstoreforandroid/AppActivity;

    iput-object v9, v3, Lcom/etralab/appstoreforandroid/AppActivity;->app_screen_shot_4:Ljava/lang/String;

    .line 394
    :goto_4
    invoke-virtual {v12, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_5

    .line 395
    iget-object v3, v11, Lcom/etralab/appstoreforandroid/AppActivity$9;->this$0:Lcom/etralab/appstoreforandroid/AppActivity;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v12, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    iput-object v2, v3, Lcom/etralab/appstoreforandroid/AppActivity;->app_screen_shot_5:Ljava/lang/String;

    .line 396
    iget-object v2, v11, Lcom/etralab/appstoreforandroid/AppActivity$9;->this$0:Lcom/etralab/appstoreforandroid/AppActivity;

    iget-object v2, v2, Lcom/etralab/appstoreforandroid/AppActivity;->appScreenshotUrlList:Ljava/util/List;

    iget-object v3, v11, Lcom/etralab/appstoreforandroid/AppActivity$9;->this$0:Lcom/etralab/appstoreforandroid/AppActivity;

    iget-object v3, v3, Lcom/etralab/appstoreforandroid/AppActivity;->app_screen_shot_5:Ljava/lang/String;

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_5

    .line 398
    :cond_5
    iget-object v2, v11, Lcom/etralab/appstoreforandroid/AppActivity$9;->this$0:Lcom/etralab/appstoreforandroid/AppActivity;

    iput-object v9, v2, Lcom/etralab/appstoreforandroid/AppActivity;->app_screen_shot_5:Ljava/lang/String;

    .line 401
    :goto_5
    invoke-virtual {v12, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_6

    .line 402
    iget-object v2, v11, Lcom/etralab/appstoreforandroid/AppActivity$9;->this$0:Lcom/etralab/appstoreforandroid/AppActivity;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v12, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v2, Lcom/etralab/appstoreforandroid/AppActivity;->app_screen_shot_6:Ljava/lang/String;

    .line 403
    iget-object v1, v11, Lcom/etralab/appstoreforandroid/AppActivity$9;->this$0:Lcom/etralab/appstoreforandroid/AppActivity;

    iget-object v1, v1, Lcom/etralab/appstoreforandroid/AppActivity;->appScreenshotUrlList:Ljava/util/List;

    iget-object v2, v11, Lcom/etralab/appstoreforandroid/AppActivity$9;->this$0:Lcom/etralab/appstoreforandroid/AppActivity;

    iget-object v2, v2, Lcom/etralab/appstoreforandroid/AppActivity;->app_screen_shot_6:Ljava/lang/String;

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_6

    .line 405
    :cond_6
    iget-object v1, v11, Lcom/etralab/appstoreforandroid/AppActivity$9;->this$0:Lcom/etralab/appstoreforandroid/AppActivity;

    iput-object v9, v1, Lcom/etralab/appstoreforandroid/AppActivity;->app_screen_shot_6:Ljava/lang/String;

    .line 408
    :goto_6
    invoke-virtual {v12, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_7

    .line 409
    iget-object v1, v11, Lcom/etralab/appstoreforandroid/AppActivity$9;->this$0:Lcom/etralab/appstoreforandroid/AppActivity;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v12, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, v1, Lcom/etralab/appstoreforandroid/AppActivity;->app_screen_shot_7:Ljava/lang/String;

    .line 410
    iget-object v0, v11, Lcom/etralab/appstoreforandroid/AppActivity$9;->this$0:Lcom/etralab/appstoreforandroid/AppActivity;

    iget-object v0, v0, Lcom/etralab/appstoreforandroid/AppActivity;->appScreenshotUrlList:Ljava/util/List;

    iget-object v1, v11, Lcom/etralab/appstoreforandroid/AppActivity$9;->this$0:Lcom/etralab/appstoreforandroid/AppActivity;

    iget-object v1, v1, Lcom/etralab/appstoreforandroid/AppActivity;->app_screen_shot_7:Ljava/lang/String;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_7

    .line 412
    :cond_7
    iget-object v0, v11, Lcom/etralab/appstoreforandroid/AppActivity$9;->this$0:Lcom/etralab/appstoreforandroid/AppActivity;

    iput-object v9, v0, Lcom/etralab/appstoreforandroid/AppActivity;->app_screen_shot_7:Ljava/lang/String;

    .line 418
    :goto_7
    iget-object v0, v11, Lcom/etralab/appstoreforandroid/AppActivity$9;->this$0:Lcom/etralab/appstoreforandroid/AppActivity;

    invoke-virtual {v0}, Lcom/etralab/appstoreforandroid/AppActivity;->setDownloadServerData()V

    .line 422
    iget-object v0, v11, Lcom/etralab/appstoreforandroid/AppActivity$9;->this$0:Lcom/etralab/appstoreforandroid/AppActivity;

    const-string v1, "AppDownloadData"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/etralab/appstoreforandroid/AppActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 424
    iget-object v1, v11, Lcom/etralab/appstoreforandroid/AppActivity$9;->this$0:Lcom/etralab/appstoreforandroid/AppActivity;

    iget-object v1, v1, Lcom/etralab/appstoreforandroid/AppActivity;->app_name_en:Ljava/lang/String;

    const-string v3, ""

    invoke-interface {v0, v1, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const/4 v1, -0x1

    .line 425
    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v3

    const/4 v4, 0x2

    const/4 v5, 0x1

    packed-switch v3, :pswitch_data_0

    goto :goto_8

    :pswitch_0
    const-string v2, "3"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_8

    move v2, v4

    goto :goto_9

    :pswitch_1
    const-string v2, "2"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_8

    move v2, v5

    goto :goto_9

    :pswitch_2
    const-string v3, "1"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    if-eqz v0, :cond_8

    goto :goto_9

    :cond_8
    :goto_8
    move v2, v1

    :goto_9
    const-string v0, "download_url"

    if-eqz v2, :cond_b

    if-eq v2, v5, :cond_a

    if-eq v2, v4, :cond_9

    .line 436
    :try_start_1
    iget-object v1, v11, Lcom/etralab/appstoreforandroid/AppActivity$9;->this$0:Lcom/etralab/appstoreforandroid/AppActivity;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "http://dl4.etrasoft.cn"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v12, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, v1, Lcom/etralab/appstoreforandroid/AppActivity;->app_download_url:Ljava/lang/String;

    goto :goto_a

    .line 433
    :cond_9
    iget-object v1, v11, Lcom/etralab/appstoreforandroid/AppActivity$9;->this$0:Lcom/etralab/appstoreforandroid/AppActivity;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "http://dl3.etrasoft.cn"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v12, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, v1, Lcom/etralab/appstoreforandroid/AppActivity;->app_download_url:Ljava/lang/String;

    goto :goto_a

    .line 430
    :cond_a
    iget-object v1, v11, Lcom/etralab/appstoreforandroid/AppActivity$9;->this$0:Lcom/etralab/appstoreforandroid/AppActivity;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "http://dl2.etrasoft.cn"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v12, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, v1, Lcom/etralab/appstoreforandroid/AppActivity;->app_download_url:Ljava/lang/String;

    goto :goto_a

    .line 427
    :cond_b
    iget-object v1, v11, Lcom/etralab/appstoreforandroid/AppActivity$9;->this$0:Lcom/etralab/appstoreforandroid/AppActivity;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "http://dl1.etrasoft.cn"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v12, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, v1, Lcom/etralab/appstoreforandroid/AppActivity;->app_download_url:Ljava/lang/String;

    .line 443
    :goto_a
    iget-object v0, v11, Lcom/etralab/appstoreforandroid/AppActivity$9;->this$0:Lcom/etralab/appstoreforandroid/AppActivity;

    new-instance v12, Lcom/etralab/appstoreforandroid/AppActivity$9$1;

    move-object v1, v12

    move-object/from16 v2, p0

    move-object v3, v10

    move-object v4, v14

    move-object/from16 v5, v20

    move-object/from16 v6, v17

    move-object/from16 v7, v19

    move-object/from16 v8, v18

    move-object/from16 v9, v16

    move-object/from16 v10, v21

    invoke-direct/range {v1 .. v10}, Lcom/etralab/appstoreforandroid/AppActivity$9$1;-><init>(Lcom/etralab/appstoreforandroid/AppActivity$9;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v12}, Lcom/etralab/appstoreforandroid/AppActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 588
    iget-object v0, v11, Lcom/etralab/appstoreforandroid/AppActivity$9;->this$0:Lcom/etralab/appstoreforandroid/AppActivity;

    invoke-static {v0}, Lcom/etralab/appstoreforandroid/AppActivity;->access$800(Lcom/etralab/appstoreforandroid/AppActivity;)V
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_b

    :catch_0
    move-exception v0

    .line 591
    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_b

    .line 595
    :cond_c
    iget-object v0, v11, Lcom/etralab/appstoreforandroid/AppActivity$9;->this$0:Lcom/etralab/appstoreforandroid/AppActivity;

    const v1, 0x7f0800e5

    invoke-virtual {v0, v1}, Lcom/etralab/appstoreforandroid/AppActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    move-object v3, v0

    check-cast v3, Landroid/widget/ImageView;

    .line 596
    iget-object v0, v11, Lcom/etralab/appstoreforandroid/AppActivity$9;->this$0:Lcom/etralab/appstoreforandroid/AppActivity;

    const v1, 0x7f080242

    invoke-virtual {v0, v1}, Lcom/etralab/appstoreforandroid/AppActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    move-object v4, v0

    check-cast v4, Landroid/widget/TextView;

    .line 598
    iget-object v0, v11, Lcom/etralab/appstoreforandroid/AppActivity$9;->this$0:Lcom/etralab/appstoreforandroid/AppActivity;

    const v1, 0x7f0800e4

    invoke-virtual {v0, v1}, Lcom/etralab/appstoreforandroid/AppActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    move-object v5, v0

    check-cast v5, Landroid/widget/ImageView;

    .line 599
    iget-object v0, v11, Lcom/etralab/appstoreforandroid/AppActivity$9;->this$0:Lcom/etralab/appstoreforandroid/AppActivity;

    const v1, 0x7f080069

    invoke-virtual {v0, v1}, Lcom/etralab/appstoreforandroid/AppActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    move-object v7, v0

    check-cast v7, Landroid/widget/Button;

    .line 600
    iget-object v0, v11, Lcom/etralab/appstoreforandroid/AppActivity$9;->this$0:Lcom/etralab/appstoreforandroid/AppActivity;

    const v1, 0x7f08026c

    invoke-virtual {v0, v1}, Lcom/etralab/appstoreforandroid/AppActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    move-object v6, v0

    check-cast v6, Landroid/widget/TextView;

    .line 602
    iget-object v0, v11, Lcom/etralab/appstoreforandroid/AppActivity$9;->this$0:Lcom/etralab/appstoreforandroid/AppActivity;

    new-instance v8, Lcom/etralab/appstoreforandroid/AppActivity$9$2;

    move-object v1, v8

    move-object/from16 v2, p0

    invoke-direct/range {v1 .. v7}, Lcom/etralab/appstoreforandroid/AppActivity$9$2;-><init>(Lcom/etralab/appstoreforandroid/AppActivity$9;Landroid/widget/ImageView;Landroid/widget/TextView;Landroid/widget/ImageView;Landroid/widget/TextView;Landroid/widget/Button;)V

    invoke-virtual {v0, v8}, Lcom/etralab/appstoreforandroid/AppActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    :goto_b
    return-void

    :pswitch_data_0
    .packed-switch 0x31
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
