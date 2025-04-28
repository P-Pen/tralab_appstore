.class Lcom/etralab/appstoreforandroid/NoticeActivity$9;
.super Ljava/lang/Thread;
.source "NoticeActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/etralab/appstoreforandroid/NoticeActivity;->parseByJSONObject()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/etralab/appstoreforandroid/NoticeActivity;


# direct methods
.method constructor <init>(Lcom/etralab/appstoreforandroid/NoticeActivity;)V
    .locals 0

    .line 297
    iput-object p1, p0, Lcom/etralab/appstoreforandroid/NoticeActivity$9;->this$0:Lcom/etralab/appstoreforandroid/NoticeActivity;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 72

    move-object/from16 v15, p0

    .line 300
    invoke-super/range {p0 .. p0}, Ljava/lang/Thread;->run()V

    .line 303
    iget-object v0, v15, Lcom/etralab/appstoreforandroid/NoticeActivity$9;->this$0:Lcom/etralab/appstoreforandroid/NoticeActivity;

    invoke-static {v0}, Lcom/etralab/appstoreforandroid/NoticeActivity;->access$500(Lcom/etralab/appstoreforandroid/NoticeActivity;)V

    .line 305
    iget-object v0, v15, Lcom/etralab/appstoreforandroid/NoticeActivity$9;->this$0:Lcom/etralab/appstoreforandroid/NoticeActivity;

    invoke-static {v0}, Lcom/etralab/appstoreforandroid/NoticeActivity;->access$600(Lcom/etralab/appstoreforandroid/NoticeActivity;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 311
    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1, v0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string v0, "id"

    .line 313
    invoke-virtual {v1, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    const-string v0, "title"

    .line 315
    invoke-virtual {v1, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string v0, "author"

    .line 316
    invoke-virtual {v1, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const-string v0, "publication_time"

    .line 317
    invoke-virtual {v1, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    const-string v0, "modification_time"

    .line 318
    invoke-virtual {v1, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 320
    iget-object v0, v15, Lcom/etralab/appstoreforandroid/NoticeActivity$9;->this$0:Lcom/etralab/appstoreforandroid/NoticeActivity;

    const-string v2, "view_num"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v0, Lcom/etralab/appstoreforandroid/NoticeActivity;->notice_view_num:Ljava/lang/String;

    .line 321
    iget-object v0, v15, Lcom/etralab/appstoreforandroid/NoticeActivity$9;->this$0:Lcom/etralab/appstoreforandroid/NoticeActivity;

    const-string v2, "like_num"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v0, Lcom/etralab/appstoreforandroid/NoticeActivity;->notice_like_num:Ljava/lang/String;

    .line 322
    iget-object v0, v15, Lcom/etralab/appstoreforandroid/NoticeActivity$9;->this$0:Lcom/etralab/appstoreforandroid/NoticeActivity;

    const-string v2, "dislike_num"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v0, Lcom/etralab/appstoreforandroid/NoticeActivity;->notice_dislike_num:Ljava/lang/String;

    const-string v0, "img_0_url"

    .line 324
    invoke-virtual {v1, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v38

    const-string v0, "text_0"

    .line 325
    invoke-virtual {v1, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    const-string v0, "img_1_url"

    .line 326
    invoke-virtual {v1, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v39

    const-string v0, "text_1"

    .line 327
    invoke-virtual {v1, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    const-string v0, "img_2_url"

    .line 328
    invoke-virtual {v1, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v40

    const-string v0, "text_2"

    .line 329
    invoke-virtual {v1, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    const-string v0, "img_3_url"

    .line 330
    invoke-virtual {v1, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v41

    const-string v0, "text_3"

    .line 331
    invoke-virtual {v1, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    const-string v0, "img_4_url"

    .line 332
    invoke-virtual {v1, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v42

    const-string v0, "text_4"

    .line 333
    invoke-virtual {v1, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    const-string v0, "img_5_url"

    .line 334
    invoke-virtual {v1, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v43

    const-string v0, "text_5"

    .line 335
    invoke-virtual {v1, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    const-string v0, "img_6_url"

    .line 336
    invoke-virtual {v1, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v44

    const-string v0, "text_6"

    .line 337
    invoke-virtual {v1, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    const-string v0, "img_7_url"

    .line 338
    invoke-virtual {v1, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v45

    const-string v0, "text_7"

    .line 339
    invoke-virtual {v1, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    const-string v0, "img_8_url"

    .line 340
    invoke-virtual {v1, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v46

    const-string v0, "text_8"

    .line 341
    invoke-virtual {v1, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    const-string v0, "img_9_url"

    .line 342
    invoke-virtual {v1, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v47

    const-string v0, "text_9"

    .line 343
    invoke-virtual {v1, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v2, "img_10_url"

    .line 344
    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v48

    const-string v2, "text_10"

    .line 345
    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v16

    const-string v2, "img_11_url"

    .line 346
    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v49

    const-string v2, "text_11"

    .line 347
    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v17

    const-string v2, "img_12_url"

    .line 348
    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v50

    const-string v2, "text_12"

    .line 349
    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v18

    const-string v2, "img_13_url"

    .line 350
    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v51

    const-string v2, "text_13"

    .line 351
    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v19

    const-string v2, "img_14_url"

    .line 352
    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v52

    const-string v2, "text_14"

    .line 353
    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v20

    const-string v2, "img_15_url"

    .line 354
    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v53

    const-string v2, "text_15"

    .line 355
    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v21

    const-string v2, "img_16_url"

    .line 356
    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v54

    const-string v2, "text_16"

    .line 357
    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v22

    const-string v2, "img_17_url"

    .line 358
    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v55

    const-string v2, "text_17"

    .line 359
    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v23

    const-string v2, "img_18_url"

    .line 360
    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v56

    const-string v2, "text_18"

    .line 361
    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v24

    const-string v2, "img_19_url"

    .line 362
    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v57

    const-string v2, "text_19"

    .line 363
    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v25

    const-string v2, "img_20_url"

    .line 364
    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v58

    const-string v2, "text_20"

    .line 365
    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v26

    const-string v2, "img_21_url"

    .line 366
    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v59

    const-string v2, "text_21"

    .line 367
    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v27

    const-string v2, "img_22_url"

    .line 368
    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v60

    const-string v2, "text_22"

    .line 369
    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v28

    const-string v2, "img_23_url"

    .line 370
    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v61

    const-string v2, "text_23"

    .line 371
    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v29

    const-string v2, "img_24_url"

    .line 372
    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v62

    const-string v2, "text_24"

    .line 373
    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v30

    const-string v2, "img_25_url"

    .line 374
    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v63

    const-string v2, "text_25"

    .line 375
    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v31

    const-string v2, "img_26_url"

    .line 376
    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v64

    const-string v2, "text_26"

    .line 377
    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v32

    const-string v2, "img_27_url"

    .line 378
    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v65

    const-string v2, "text_27"

    .line 379
    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v33

    const-string v2, "img_28_url"

    .line 380
    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v66

    const-string v2, "text_28"

    .line 381
    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v34

    const-string v2, "img_29_url"

    .line 382
    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v67

    const-string v2, "text_29"

    .line 383
    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v35

    const-string v2, "img_30_url"

    .line 384
    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v68

    const-string v2, "text_30"

    .line 385
    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v36

    const-string v2, "img_31_url"

    .line 386
    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v69

    const-string v2, "text_31"

    .line 387
    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v37

    .line 392
    iget-object v2, v15, Lcom/etralab/appstoreforandroid/NoticeActivity$9;->this$0:Lcom/etralab/appstoreforandroid/NoticeActivity;

    new-instance v1, Lcom/etralab/appstoreforandroid/NoticeActivity$9$1;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_2

    move-object/from16 v70, v1

    move-object/from16 v1, v70

    move-object/from16 v71, v2

    move-object/from16 v2, p0

    move-object v15, v0

    :try_start_1
    invoke-direct/range {v1 .. v69}, Lcom/etralab/appstoreforandroid/NoticeActivity$9$1;-><init>(Lcom/etralab/appstoreforandroid/NoticeActivity$9;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    move-object/from16 v0, v71

    invoke-virtual {v0, v1}, Lcom/etralab/appstoreforandroid/NoticeActivity;->runOnUiThread(Ljava/lang/Runnable;)V
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_1

    move-object/from16 v8, p0

    .line 840
    :try_start_2
    iget-object v0, v8, Lcom/etralab/appstoreforandroid/NoticeActivity$9;->this$0:Lcom/etralab/appstoreforandroid/NoticeActivity;

    invoke-static {v0}, Lcom/etralab/appstoreforandroid/NoticeActivity;->access$700(Lcom/etralab/appstoreforandroid/NoticeActivity;)V
    :try_end_2
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_2} :catch_0

    goto :goto_1

    :catch_0
    move-exception v0

    goto :goto_0

    :catch_1
    move-exception v0

    move-object/from16 v8, p0

    goto :goto_0

    :catch_2
    move-exception v0

    move-object v8, v15

    .line 843
    :goto_0
    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_1

    :cond_0
    move-object v8, v15

    .line 847
    iget-object v0, v8, Lcom/etralab/appstoreforandroid/NoticeActivity$9;->this$0:Lcom/etralab/appstoreforandroid/NoticeActivity;

    const v1, 0x7f0800e5

    invoke-virtual {v0, v1}, Lcom/etralab/appstoreforandroid/NoticeActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    move-object v3, v0

    check-cast v3, Landroid/widget/ImageView;

    .line 848
    iget-object v0, v8, Lcom/etralab/appstoreforandroid/NoticeActivity$9;->this$0:Lcom/etralab/appstoreforandroid/NoticeActivity;

    const v1, 0x7f080242

    invoke-virtual {v0, v1}, Lcom/etralab/appstoreforandroid/NoticeActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    move-object v4, v0

    check-cast v4, Landroid/widget/TextView;

    .line 850
    iget-object v0, v8, Lcom/etralab/appstoreforandroid/NoticeActivity$9;->this$0:Lcom/etralab/appstoreforandroid/NoticeActivity;

    const v1, 0x7f0800e4

    invoke-virtual {v0, v1}, Lcom/etralab/appstoreforandroid/NoticeActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    move-object v5, v0

    check-cast v5, Landroid/widget/ImageView;

    .line 851
    iget-object v0, v8, Lcom/etralab/appstoreforandroid/NoticeActivity$9;->this$0:Lcom/etralab/appstoreforandroid/NoticeActivity;

    const v1, 0x7f080069

    invoke-virtual {v0, v1}, Lcom/etralab/appstoreforandroid/NoticeActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    move-object v7, v0

    check-cast v7, Landroid/widget/Button;

    .line 852
    iget-object v0, v8, Lcom/etralab/appstoreforandroid/NoticeActivity$9;->this$0:Lcom/etralab/appstoreforandroid/NoticeActivity;

    const v1, 0x7f08026c

    invoke-virtual {v0, v1}, Lcom/etralab/appstoreforandroid/NoticeActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    move-object v6, v0

    check-cast v6, Landroid/widget/TextView;

    .line 854
    iget-object v0, v8, Lcom/etralab/appstoreforandroid/NoticeActivity$9;->this$0:Lcom/etralab/appstoreforandroid/NoticeActivity;

    new-instance v9, Lcom/etralab/appstoreforandroid/NoticeActivity$9$2;

    move-object v1, v9

    move-object/from16 v2, p0

    invoke-direct/range {v1 .. v7}, Lcom/etralab/appstoreforandroid/NoticeActivity$9$2;-><init>(Lcom/etralab/appstoreforandroid/NoticeActivity$9;Landroid/widget/ImageView;Landroid/widget/TextView;Landroid/widget/ImageView;Landroid/widget/TextView;Landroid/widget/Button;)V

    invoke-virtual {v0, v9}, Lcom/etralab/appstoreforandroid/NoticeActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    :goto_1
    return-void
.end method
