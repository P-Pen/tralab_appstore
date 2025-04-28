.class Lcom/etralab/appstoreforandroid/HomeFragment$2;
.super Ljava/lang/Thread;
.source "HomeFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/etralab/appstoreforandroid/HomeFragment;->parseByJSONObject()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/etralab/appstoreforandroid/HomeFragment;


# direct methods
.method constructor <init>(Lcom/etralab/appstoreforandroid/HomeFragment;)V
    .locals 0

    .line 270
    iput-object p1, p0, Lcom/etralab/appstoreforandroid/HomeFragment$2;->this$0:Lcom/etralab/appstoreforandroid/HomeFragment;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 20

    move-object/from16 v1, p0

    .line 273
    invoke-super/range {p0 .. p0}, Ljava/lang/Thread;->run()V

    .line 275
    iget-object v0, v1, Lcom/etralab/appstoreforandroid/HomeFragment$2;->this$0:Lcom/etralab/appstoreforandroid/HomeFragment;

    invoke-static {v0}, Lcom/etralab/appstoreforandroid/HomeFragment;->access$300(Lcom/etralab/appstoreforandroid/HomeFragment;)Ljava/lang/String;

    move-result-object v0

    const-string v2, "http://img.etrasoft.cn"

    const-string v3, "id"

    const-string v5, "data"

    if-eqz v0, :cond_0

    .line 281
    :try_start_0
    new-instance v6, Lorg/json/JSONObject;

    invoke-direct {v6, v0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 287
    invoke-virtual {v6, v5}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v0

    const/4 v6, 0x0

    .line 289
    :goto_0
    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I

    move-result v7

    if-ge v6, v7, :cond_0

    .line 291
    invoke-virtual {v0, v6}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v7

    .line 292
    invoke-virtual {v7, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 293
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v9, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v10, "banner_img_url"

    invoke-virtual {v7, v10}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v9, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 296
    new-instance v9, Lcom/etralab/appstoreforandroid/BannerDataBean;

    invoke-direct {v9, v8, v7}, Lcom/etralab/appstoreforandroid/BannerDataBean;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 297
    iget-object v7, v1, Lcom/etralab/appstoreforandroid/HomeFragment$2;->this$0:Lcom/etralab/appstoreforandroid/HomeFragment;

    invoke-static {v7}, Lcom/etralab/appstoreforandroid/HomeFragment;->access$400(Lcom/etralab/appstoreforandroid/HomeFragment;)Ljava/util/List;

    move-result-object v7

    invoke-interface {v7, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    add-int/lit8 v6, v6, 0x1

    goto :goto_0

    :catch_0
    move-exception v0

    .line 301
    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V

    .line 305
    :cond_0
    iget-object v0, v1, Lcom/etralab/appstoreforandroid/HomeFragment$2;->this$0:Lcom/etralab/appstoreforandroid/HomeFragment;

    invoke-static {v0}, Lcom/etralab/appstoreforandroid/HomeFragment;->access$500(Lcom/etralab/appstoreforandroid/HomeFragment;)Ljava/lang/String;

    move-result-object v0

    const-string v6, "os_type"

    const-string v7, "like_num"

    const-string v8, "download_num"

    const-string v9, "logo_url"

    const-string v10, "name"

    if-eqz v0, :cond_1

    .line 308
    iget-object v11, v1, Lcom/etralab/appstoreforandroid/HomeFragment$2;->this$0:Lcom/etralab/appstoreforandroid/HomeFragment;

    invoke-static {v11}, Lcom/etralab/appstoreforandroid/HomeFragment;->access$600(Lcom/etralab/appstoreforandroid/HomeFragment;)V

    .line 314
    :try_start_1
    new-instance v11, Lorg/json/JSONObject;

    invoke-direct {v11, v0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 320
    invoke-virtual {v11, v5}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v0

    const/4 v11, 0x0

    .line 322
    :goto_1
    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I

    move-result v12

    if-ge v11, v12, :cond_1

    .line 324
    invoke-virtual {v0, v11}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v12

    .line 325
    invoke-virtual {v12, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    .line 326
    invoke-virtual {v12, v10}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v15

    .line 327
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v13, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v12, v9}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v13, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    .line 328
    invoke-virtual {v12, v8}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v17

    .line 329
    invoke-virtual {v12, v7}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v18

    .line 330
    invoke-virtual {v12, v6}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v19

    .line 333
    new-instance v4, Lcom/etralab/appstoreforandroid/App;

    move-object v13, v4

    invoke-direct/range {v13 .. v19}, Lcom/etralab/appstoreforandroid/App;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 334
    iget-object v12, v1, Lcom/etralab/appstoreforandroid/HomeFragment$2;->this$0:Lcom/etralab/appstoreforandroid/HomeFragment;

    invoke-static {v12}, Lcom/etralab/appstoreforandroid/HomeFragment;->access$000(Lcom/etralab/appstoreforandroid/HomeFragment;)Ljava/util/List;

    move-result-object v12

    invoke-interface {v12, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_1

    add-int/lit8 v11, v11, 0x1

    goto :goto_1

    :catch_1
    move-exception v0

    .line 338
    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V

    .line 342
    :cond_1
    iget-object v0, v1, Lcom/etralab/appstoreforandroid/HomeFragment$2;->this$0:Lcom/etralab/appstoreforandroid/HomeFragment;

    invoke-static {v0}, Lcom/etralab/appstoreforandroid/HomeFragment;->access$700(Lcom/etralab/appstoreforandroid/HomeFragment;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_2

    .line 348
    :try_start_2
    new-instance v4, Lorg/json/JSONObject;

    invoke-direct {v4, v0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 354
    invoke-virtual {v4, v5}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v0

    const/4 v4, 0x0

    .line 356
    :goto_2
    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I

    move-result v11

    if-ge v4, v11, :cond_2

    .line 358
    invoke-virtual {v0, v4}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v11

    .line 359
    invoke-virtual {v11, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    .line 360
    invoke-virtual {v11, v10}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    .line 361
    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v12, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v11, v9}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v12, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    .line 362
    invoke-virtual {v11, v8}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v16

    .line 363
    invoke-virtual {v11, v7}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v17

    .line 364
    invoke-virtual {v11, v6}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v18

    .line 367
    new-instance v11, Lcom/etralab/appstoreforandroid/App;

    move-object v12, v11

    invoke-direct/range {v12 .. v18}, Lcom/etralab/appstoreforandroid/App;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 368
    iget-object v12, v1, Lcom/etralab/appstoreforandroid/HomeFragment$2;->this$0:Lcom/etralab/appstoreforandroid/HomeFragment;

    invoke-static {v12}, Lcom/etralab/appstoreforandroid/HomeFragment;->access$100(Lcom/etralab/appstoreforandroid/HomeFragment;)Ljava/util/List;

    move-result-object v12

    invoke-interface {v12, v11}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_2
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_2} :catch_2

    add-int/lit8 v4, v4, 0x1

    goto :goto_2

    :catch_2
    move-exception v0

    .line 372
    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V

    .line 376
    :cond_2
    iget-object v0, v1, Lcom/etralab/appstoreforandroid/HomeFragment$2;->this$0:Lcom/etralab/appstoreforandroid/HomeFragment;

    invoke-static {v0}, Lcom/etralab/appstoreforandroid/HomeFragment;->access$800(Lcom/etralab/appstoreforandroid/HomeFragment;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_3

    .line 382
    :try_start_3
    new-instance v4, Lorg/json/JSONObject;

    invoke-direct {v4, v0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 388
    invoke-virtual {v4, v5}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v0

    const/4 v4, 0x0

    .line 390
    :goto_3
    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I

    move-result v5

    if-ge v4, v5, :cond_3

    .line 392
    invoke-virtual {v0, v4}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v5

    .line 393
    invoke-virtual {v5, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    .line 394
    invoke-virtual {v5, v10}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    .line 395
    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v11, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v9}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v11, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    .line 396
    invoke-virtual {v5, v8}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v15

    .line 397
    invoke-virtual {v5, v7}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v16

    .line 398
    invoke-virtual {v5, v6}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v17

    .line 401
    new-instance v5, Lcom/etralab/appstoreforandroid/App;

    move-object v11, v5

    invoke-direct/range {v11 .. v17}, Lcom/etralab/appstoreforandroid/App;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 402
    iget-object v11, v1, Lcom/etralab/appstoreforandroid/HomeFragment$2;->this$0:Lcom/etralab/appstoreforandroid/HomeFragment;

    invoke-static {v11}, Lcom/etralab/appstoreforandroid/HomeFragment;->access$200(Lcom/etralab/appstoreforandroid/HomeFragment;)Ljava/util/List;

    move-result-object v11

    invoke-interface {v11, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_3
    .catch Lorg/json/JSONException; {:try_start_3 .. :try_end_3} :catch_3

    add-int/lit8 v4, v4, 0x1

    goto :goto_3

    :catch_3
    move-exception v0

    .line 406
    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V

    .line 411
    :cond_3
    iget-object v0, v1, Lcom/etralab/appstoreforandroid/HomeFragment$2;->this$0:Lcom/etralab/appstoreforandroid/HomeFragment;

    invoke-static {v0}, Lcom/etralab/appstoreforandroid/HomeFragment;->access$900(Lcom/etralab/appstoreforandroid/HomeFragment;)V

    return-void
.end method
