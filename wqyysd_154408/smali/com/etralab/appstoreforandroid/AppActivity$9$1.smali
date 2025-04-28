.class Lcom/etralab/appstoreforandroid/AppActivity$9$1;
.super Ljava/lang/Object;
.source "AppActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/etralab/appstoreforandroid/AppActivity$9;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/etralab/appstoreforandroid/AppActivity$9;

.field final synthetic val$app_apk_size:Ljava/lang/String;

.field final synthetic val$app_apk_update_time:Ljava/lang/String;

.field final synthetic val$app_introduce:Ljava/lang/String;

.field final synthetic val$app_logo:Ljava/lang/String;

.field final synthetic val$app_name:Ljava/lang/String;

.field final synthetic val$app_os_type:Ljava/lang/String;

.field final synthetic val$app_update_log:Ljava/lang/String;

.field final synthetic val$app_version:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/etralab/appstoreforandroid/AppActivity$9;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 443
    iput-object p1, p0, Lcom/etralab/appstoreforandroid/AppActivity$9$1;->this$1:Lcom/etralab/appstoreforandroid/AppActivity$9;

    iput-object p2, p0, Lcom/etralab/appstoreforandroid/AppActivity$9$1;->val$app_name:Ljava/lang/String;

    iput-object p3, p0, Lcom/etralab/appstoreforandroid/AppActivity$9$1;->val$app_version:Ljava/lang/String;

    iput-object p4, p0, Lcom/etralab/appstoreforandroid/AppActivity$9$1;->val$app_apk_size:Ljava/lang/String;

    iput-object p5, p0, Lcom/etralab/appstoreforandroid/AppActivity$9$1;->val$app_apk_update_time:Ljava/lang/String;

    iput-object p6, p0, Lcom/etralab/appstoreforandroid/AppActivity$9$1;->val$app_introduce:Ljava/lang/String;

    iput-object p7, p0, Lcom/etralab/appstoreforandroid/AppActivity$9$1;->val$app_update_log:Ljava/lang/String;

    iput-object p8, p0, Lcom/etralab/appstoreforandroid/AppActivity$9$1;->val$app_os_type:Ljava/lang/String;

    iput-object p9, p0, Lcom/etralab/appstoreforandroid/AppActivity$9$1;->val$app_logo:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 13

    .line 446
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/AppActivity$9$1;->this$1:Lcom/etralab/appstoreforandroid/AppActivity$9;

    iget-object v0, v0, Lcom/etralab/appstoreforandroid/AppActivity$9;->this$0:Lcom/etralab/appstoreforandroid/AppActivity;

    const v1, 0x7f080224

    invoke-virtual {v0, v1}, Lcom/etralab/appstoreforandroid/AppActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 447
    iget-object v1, p0, Lcom/etralab/appstoreforandroid/AppActivity$9$1;->this$1:Lcom/etralab/appstoreforandroid/AppActivity$9;

    iget-object v1, v1, Lcom/etralab/appstoreforandroid/AppActivity$9;->this$0:Lcom/etralab/appstoreforandroid/AppActivity;

    const v2, 0x7f080223

    invoke-virtual {v1, v2}, Lcom/etralab/appstoreforandroid/AppActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    .line 448
    iget-object v2, p0, Lcom/etralab/appstoreforandroid/AppActivity$9$1;->this$1:Lcom/etralab/appstoreforandroid/AppActivity$9;

    iget-object v2, v2, Lcom/etralab/appstoreforandroid/AppActivity$9;->this$0:Lcom/etralab/appstoreforandroid/AppActivity;

    const v3, 0x7f080226

    invoke-virtual {v2, v3}, Lcom/etralab/appstoreforandroid/AppActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    .line 449
    iget-object v3, p0, Lcom/etralab/appstoreforandroid/AppActivity$9$1;->this$1:Lcom/etralab/appstoreforandroid/AppActivity$9;

    iget-object v3, v3, Lcom/etralab/appstoreforandroid/AppActivity$9;->this$0:Lcom/etralab/appstoreforandroid/AppActivity;

    const v4, 0x7f080225

    invoke-virtual {v3, v4}, Lcom/etralab/appstoreforandroid/AppActivity;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    .line 450
    iget-object v4, p0, Lcom/etralab/appstoreforandroid/AppActivity$9$1;->this$1:Lcom/etralab/appstoreforandroid/AppActivity$9;

    iget-object v4, v4, Lcom/etralab/appstoreforandroid/AppActivity$9;->this$0:Lcom/etralab/appstoreforandroid/AppActivity;

    const v5, 0x7f08023b

    invoke-virtual {v4, v5}, Lcom/etralab/appstoreforandroid/AppActivity;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    .line 451
    iget-object v5, p0, Lcom/etralab/appstoreforandroid/AppActivity$9$1;->this$1:Lcom/etralab/appstoreforandroid/AppActivity$9;

    iget-object v5, v5, Lcom/etralab/appstoreforandroid/AppActivity$9;->this$0:Lcom/etralab/appstoreforandroid/AppActivity;

    const v6, 0x7f080231

    invoke-virtual {v5, v6}, Lcom/etralab/appstoreforandroid/AppActivity;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/TextView;

    .line 452
    iget-object v6, p0, Lcom/etralab/appstoreforandroid/AppActivity$9$1;->this$1:Lcom/etralab/appstoreforandroid/AppActivity$9;

    iget-object v6, v6, Lcom/etralab/appstoreforandroid/AppActivity$9;->this$0:Lcom/etralab/appstoreforandroid/AppActivity;

    const v7, 0x7f080227

    invoke-virtual {v6, v7}, Lcom/etralab/appstoreforandroid/AppActivity;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/TextView;

    .line 453
    iget-object v7, p0, Lcom/etralab/appstoreforandroid/AppActivity$9$1;->this$1:Lcom/etralab/appstoreforandroid/AppActivity$9;

    iget-object v7, v7, Lcom/etralab/appstoreforandroid/AppActivity$9;->this$0:Lcom/etralab/appstoreforandroid/AppActivity;

    const v8, 0x7f080230

    invoke-virtual {v7, v8}, Lcom/etralab/appstoreforandroid/AppActivity;->findViewById(I)Landroid/view/View;

    move-result-object v7

    check-cast v7, Landroid/widget/TextView;

    .line 454
    iget-object v8, p0, Lcom/etralab/appstoreforandroid/AppActivity$9$1;->this$1:Lcom/etralab/appstoreforandroid/AppActivity$9;

    iget-object v8, v8, Lcom/etralab/appstoreforandroid/AppActivity$9;->this$0:Lcom/etralab/appstoreforandroid/AppActivity;

    const v9, 0x7f08022c

    invoke-virtual {v8, v9}, Lcom/etralab/appstoreforandroid/AppActivity;->findViewById(I)Landroid/view/View;

    move-result-object v8

    check-cast v8, Landroid/widget/TextView;

    .line 455
    iget-object v9, p0, Lcom/etralab/appstoreforandroid/AppActivity$9$1;->this$1:Lcom/etralab/appstoreforandroid/AppActivity$9;

    iget-object v9, v9, Lcom/etralab/appstoreforandroid/AppActivity$9;->this$0:Lcom/etralab/appstoreforandroid/AppActivity;

    const v10, 0x7f08022f

    invoke-virtual {v9, v10}, Lcom/etralab/appstoreforandroid/AppActivity;->findViewById(I)Landroid/view/View;

    move-result-object v9

    check-cast v9, Landroid/widget/TextView;

    .line 457
    iget-object v10, p0, Lcom/etralab/appstoreforandroid/AppActivity$9$1;->val$app_name:Ljava/lang/String;

    invoke-virtual {v0, v10}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 458
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/AppActivity$9$1;->this$1:Lcom/etralab/appstoreforandroid/AppActivity$9;

    iget-object v0, v0, Lcom/etralab/appstoreforandroid/AppActivity$9;->this$0:Lcom/etralab/appstoreforandroid/AppActivity;

    iget-object v0, v0, Lcom/etralab/appstoreforandroid/AppActivity;->app_developer:Ljava/lang/String;

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 459
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/AppActivity$9$1;->this$1:Lcom/etralab/appstoreforandroid/AppActivity$9;

    iget-object v0, v0, Lcom/etralab/appstoreforandroid/AppActivity$9;->this$0:Lcom/etralab/appstoreforandroid/AppActivity;

    iget-object v0, v0, Lcom/etralab/appstoreforandroid/AppActivity;->app_like_number:Ljava/lang/String;

    invoke-static {v0}, Lcom/etralab/appstoreforandroid/NumUnitConversionUtil;->NumUnitConversion(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 460
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/AppActivity$9$1;->this$1:Lcom/etralab/appstoreforandroid/AppActivity$9;

    iget-object v0, v0, Lcom/etralab/appstoreforandroid/AppActivity$9;->this$0:Lcom/etralab/appstoreforandroid/AppActivity;

    iget-object v0, v0, Lcom/etralab/appstoreforandroid/AppActivity;->app_download_number:Ljava/lang/String;

    invoke-static {v0}, Lcom/etralab/appstoreforandroid/NumUnitConversionUtil;->NumUnitConversion(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 461
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/AppActivity$9$1;->val$app_version:Ljava/lang/String;

    invoke-virtual {v5, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 462
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/AppActivity$9$1;->val$app_apk_size:Ljava/lang/String;

    invoke-virtual {v6, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 463
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/AppActivity$9$1;->val$app_apk_update_time:Ljava/lang/String;

    invoke-virtual {v7, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 464
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/AppActivity$9$1;->val$app_introduce:Ljava/lang/String;

    invoke-virtual {v8, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 465
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/AppActivity$9$1;->val$app_update_log:Ljava/lang/String;

    invoke-virtual {v9, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 467
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/AppActivity$9$1;->this$1:Lcom/etralab/appstoreforandroid/AppActivity$9;

    iget-object v0, v0, Lcom/etralab/appstoreforandroid/AppActivity$9;->this$0:Lcom/etralab/appstoreforandroid/AppActivity;

    const v1, 0x7f0800db

    invoke-virtual {v0, v1}, Lcom/etralab/appstoreforandroid/AppActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    .line 469
    iget-object v1, p0, Lcom/etralab/appstoreforandroid/AppActivity$9$1;->val$app_os_type:Ljava/lang/String;

    const-string v2, "0"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    const v1, 0x7f07017d

    .line 470
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    const-string v0, "Wear OS"

    .line 471
    invoke-virtual {v4, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 472
    :cond_0
    iget-object v1, p0, Lcom/etralab/appstoreforandroid/AppActivity$9$1;->val$app_os_type:Ljava/lang/String;

    const-string v2, "1"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    const v1, 0x7f0700f1

    .line 473
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    const-string v0, "\u5b89\u5353\u624b\u8868"

    .line 474
    invoke-virtual {v4, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 475
    :cond_1
    iget-object v1, p0, Lcom/etralab/appstoreforandroid/AppActivity$9$1;->val$app_os_type:Ljava/lang/String;

    const-string v2, "2"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    const v1, 0x7f0700f0

    .line 476
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    const-string v0, "\u5b89\u5353\u624b\u673a"

    .line 477
    invoke-virtual {v4, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 481
    :cond_2
    :goto_0
    new-instance v0, Lcom/bumptech/glide/request/RequestOptions;

    invoke-direct {v0}, Lcom/bumptech/glide/request/RequestOptions;-><init>()V

    const v1, 0x7f0700f2

    .line 482
    invoke-virtual {v0, v1}, Lcom/bumptech/glide/request/RequestOptions;->placeholder(I)Lcom/bumptech/glide/request/RequestOptions;

    move-result-object v0

    .line 483
    invoke-virtual {v0, v1}, Lcom/bumptech/glide/request/RequestOptions;->fallback(I)Lcom/bumptech/glide/request/RequestOptions;

    move-result-object v0

    .line 484
    invoke-virtual {v0, v1}, Lcom/bumptech/glide/request/RequestOptions;->error(I)Lcom/bumptech/glide/request/RequestOptions;

    move-result-object v0

    const/high16 v1, -0x80000000

    .line 485
    invoke-virtual {v0, v1, v1}, Lcom/bumptech/glide/request/RequestOptions;->override(II)Lcom/bumptech/glide/request/RequestOptions;

    move-result-object v0

    sget-object v2, Lcom/bumptech/glide/load/DecodeFormat;->PREFER_RGB_565:Lcom/bumptech/glide/load/DecodeFormat;

    .line 486
    invoke-virtual {v0, v2}, Lcom/bumptech/glide/request/RequestOptions;->format(Lcom/bumptech/glide/load/DecodeFormat;)Lcom/bumptech/glide/request/RequestOptions;

    move-result-object v0

    .line 489
    iget-object v2, p0, Lcom/etralab/appstoreforandroid/AppActivity$9$1;->this$1:Lcom/etralab/appstoreforandroid/AppActivity$9;

    iget-object v2, v2, Lcom/etralab/appstoreforandroid/AppActivity$9;->this$0:Lcom/etralab/appstoreforandroid/AppActivity;

    const v3, 0x7f0800d2

    invoke-virtual {v2, v3}, Lcom/etralab/appstoreforandroid/AppActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/etralab/appstoreforandroid/MyImageView;

    .line 492
    invoke-static {v2}, Lcom/bumptech/glide/Glide;->with(Landroid/view/View;)Lcom/bumptech/glide/RequestManager;

    move-result-object v3

    iget-object v4, p0, Lcom/etralab/appstoreforandroid/AppActivity$9$1;->val$app_logo:Ljava/lang/String;

    invoke-virtual {v3, v4}, Lcom/bumptech/glide/RequestManager;->load(Ljava/lang/String;)Lcom/bumptech/glide/RequestBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Lcom/bumptech/glide/RequestBuilder;->apply(Lcom/bumptech/glide/request/RequestOptions;)Lcom/bumptech/glide/RequestBuilder;

    move-result-object v0

    invoke-virtual {v0, v2}, Lcom/bumptech/glide/RequestBuilder;->into(Landroid/widget/ImageView;)Lcom/bumptech/glide/request/target/ViewTarget;

    .line 496
    new-instance v0, Lcom/bumptech/glide/request/RequestOptions;

    invoke-direct {v0}, Lcom/bumptech/glide/request/RequestOptions;-><init>()V

    const v2, 0x7f0700f3

    .line 497
    invoke-virtual {v0, v2}, Lcom/bumptech/glide/request/RequestOptions;->placeholder(I)Lcom/bumptech/glide/request/RequestOptions;

    move-result-object v0

    .line 498
    invoke-virtual {v0, v2}, Lcom/bumptech/glide/request/RequestOptions;->fallback(I)Lcom/bumptech/glide/request/RequestOptions;

    move-result-object v0

    .line 499
    invoke-virtual {v0, v2}, Lcom/bumptech/glide/request/RequestOptions;->error(I)Lcom/bumptech/glide/request/RequestOptions;

    move-result-object v0

    .line 500
    invoke-virtual {v0, v1, v1}, Lcom/bumptech/glide/request/RequestOptions;->override(II)Lcom/bumptech/glide/request/RequestOptions;

    move-result-object v0

    sget-object v1, Lcom/bumptech/glide/load/DecodeFormat;->PREFER_RGB_565:Lcom/bumptech/glide/load/DecodeFormat;

    .line 501
    invoke-virtual {v0, v1}, Lcom/bumptech/glide/request/RequestOptions;->format(Lcom/bumptech/glide/load/DecodeFormat;)Lcom/bumptech/glide/request/RequestOptions;

    move-result-object v0

    .line 503
    iget-object v1, p0, Lcom/etralab/appstoreforandroid/AppActivity$9$1;->this$1:Lcom/etralab/appstoreforandroid/AppActivity$9;

    iget-object v1, v1, Lcom/etralab/appstoreforandroid/AppActivity$9;->this$0:Lcom/etralab/appstoreforandroid/AppActivity;

    const v2, 0x7f080108

    invoke-virtual {v1, v2}, Lcom/etralab/appstoreforandroid/AppActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/etralab/appstoreforandroid/MyImageView;

    .line 504
    iget-object v2, p0, Lcom/etralab/appstoreforandroid/AppActivity$9$1;->this$1:Lcom/etralab/appstoreforandroid/AppActivity$9;

    iget-object v2, v2, Lcom/etralab/appstoreforandroid/AppActivity$9;->this$0:Lcom/etralab/appstoreforandroid/AppActivity;

    const v3, 0x7f080109

    invoke-virtual {v2, v3}, Lcom/etralab/appstoreforandroid/AppActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/etralab/appstoreforandroid/MyImageView;

    .line 505
    iget-object v3, p0, Lcom/etralab/appstoreforandroid/AppActivity$9$1;->this$1:Lcom/etralab/appstoreforandroid/AppActivity$9;

    iget-object v3, v3, Lcom/etralab/appstoreforandroid/AppActivity$9;->this$0:Lcom/etralab/appstoreforandroid/AppActivity;

    const v4, 0x7f08010a

    invoke-virtual {v3, v4}, Lcom/etralab/appstoreforandroid/AppActivity;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Lcom/etralab/appstoreforandroid/MyImageView;

    .line 506
    iget-object v4, p0, Lcom/etralab/appstoreforandroid/AppActivity$9$1;->this$1:Lcom/etralab/appstoreforandroid/AppActivity$9;

    iget-object v4, v4, Lcom/etralab/appstoreforandroid/AppActivity$9;->this$0:Lcom/etralab/appstoreforandroid/AppActivity;

    const v5, 0x7f08010b

    invoke-virtual {v4, v5}, Lcom/etralab/appstoreforandroid/AppActivity;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Lcom/etralab/appstoreforandroid/MyImageView;

    .line 507
    iget-object v5, p0, Lcom/etralab/appstoreforandroid/AppActivity$9$1;->this$1:Lcom/etralab/appstoreforandroid/AppActivity$9;

    iget-object v5, v5, Lcom/etralab/appstoreforandroid/AppActivity$9;->this$0:Lcom/etralab/appstoreforandroid/AppActivity;

    const v6, 0x7f08010c

    invoke-virtual {v5, v6}, Lcom/etralab/appstoreforandroid/AppActivity;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Lcom/etralab/appstoreforandroid/MyImageView;

    .line 508
    iget-object v6, p0, Lcom/etralab/appstoreforandroid/AppActivity$9$1;->this$1:Lcom/etralab/appstoreforandroid/AppActivity$9;

    iget-object v6, v6, Lcom/etralab/appstoreforandroid/AppActivity$9;->this$0:Lcom/etralab/appstoreforandroid/AppActivity;

    const v7, 0x7f08010d

    invoke-virtual {v6, v7}, Lcom/etralab/appstoreforandroid/AppActivity;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Lcom/etralab/appstoreforandroid/MyImageView;

    .line 509
    iget-object v7, p0, Lcom/etralab/appstoreforandroid/AppActivity$9$1;->this$1:Lcom/etralab/appstoreforandroid/AppActivity$9;

    iget-object v7, v7, Lcom/etralab/appstoreforandroid/AppActivity$9;->this$0:Lcom/etralab/appstoreforandroid/AppActivity;

    const v8, 0x7f08010e

    invoke-virtual {v7, v8}, Lcom/etralab/appstoreforandroid/AppActivity;->findViewById(I)Landroid/view/View;

    move-result-object v7

    check-cast v7, Lcom/etralab/appstoreforandroid/MyImageView;

    .line 510
    iget-object v8, p0, Lcom/etralab/appstoreforandroid/AppActivity$9$1;->this$1:Lcom/etralab/appstoreforandroid/AppActivity$9;

    iget-object v8, v8, Lcom/etralab/appstoreforandroid/AppActivity$9;->this$0:Lcom/etralab/appstoreforandroid/AppActivity;

    const v9, 0x7f08010f

    invoke-virtual {v8, v9}, Lcom/etralab/appstoreforandroid/AppActivity;->findViewById(I)Landroid/view/View;

    move-result-object v8

    check-cast v8, Lcom/etralab/appstoreforandroid/MyImageView;

    .line 514
    iget-object v9, p0, Lcom/etralab/appstoreforandroid/AppActivity$9$1;->this$1:Lcom/etralab/appstoreforandroid/AppActivity$9;

    iget-object v9, v9, Lcom/etralab/appstoreforandroid/AppActivity$9;->this$0:Lcom/etralab/appstoreforandroid/AppActivity;

    iget-object v9, v9, Lcom/etralab/appstoreforandroid/AppActivity;->app_screen_shot_0:Ljava/lang/String;

    const-string v10, "null"

    invoke-virtual {v9, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    const/16 v11, 0x8

    if-nez v9, :cond_3

    .line 515
    invoke-static {v1}, Lcom/bumptech/glide/Glide;->with(Landroid/view/View;)Lcom/bumptech/glide/RequestManager;

    move-result-object v9

    iget-object v12, p0, Lcom/etralab/appstoreforandroid/AppActivity$9$1;->this$1:Lcom/etralab/appstoreforandroid/AppActivity$9;

    iget-object v12, v12, Lcom/etralab/appstoreforandroid/AppActivity$9;->this$0:Lcom/etralab/appstoreforandroid/AppActivity;

    iget-object v12, v12, Lcom/etralab/appstoreforandroid/AppActivity;->app_screen_shot_0:Ljava/lang/String;

    .line 516
    invoke-virtual {v9, v12}, Lcom/bumptech/glide/RequestManager;->load(Ljava/lang/String;)Lcom/bumptech/glide/RequestBuilder;

    move-result-object v9

    .line 517
    invoke-virtual {v9, v0}, Lcom/bumptech/glide/RequestBuilder;->apply(Lcom/bumptech/glide/request/RequestOptions;)Lcom/bumptech/glide/RequestBuilder;

    move-result-object v9

    .line 518
    invoke-virtual {v9, v1}, Lcom/bumptech/glide/RequestBuilder;->into(Landroid/widget/ImageView;)Lcom/bumptech/glide/request/target/ViewTarget;

    goto :goto_1

    .line 520
    :cond_3
    invoke-virtual {v1, v11}, Lcom/etralab/appstoreforandroid/MyImageView;->setVisibility(I)V

    .line 523
    :goto_1
    iget-object v1, p0, Lcom/etralab/appstoreforandroid/AppActivity$9$1;->this$1:Lcom/etralab/appstoreforandroid/AppActivity$9;

    iget-object v1, v1, Lcom/etralab/appstoreforandroid/AppActivity$9;->this$0:Lcom/etralab/appstoreforandroid/AppActivity;

    iget-object v1, v1, Lcom/etralab/appstoreforandroid/AppActivity;->app_screen_shot_1:Ljava/lang/String;

    invoke-virtual {v1, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_4

    .line 524
    invoke-static {v2}, Lcom/bumptech/glide/Glide;->with(Landroid/view/View;)Lcom/bumptech/glide/RequestManager;

    move-result-object v1

    iget-object v9, p0, Lcom/etralab/appstoreforandroid/AppActivity$9$1;->this$1:Lcom/etralab/appstoreforandroid/AppActivity$9;

    iget-object v9, v9, Lcom/etralab/appstoreforandroid/AppActivity$9;->this$0:Lcom/etralab/appstoreforandroid/AppActivity;

    iget-object v9, v9, Lcom/etralab/appstoreforandroid/AppActivity;->app_screen_shot_1:Ljava/lang/String;

    .line 525
    invoke-virtual {v1, v9}, Lcom/bumptech/glide/RequestManager;->load(Ljava/lang/String;)Lcom/bumptech/glide/RequestBuilder;

    move-result-object v1

    .line 526
    invoke-virtual {v1, v0}, Lcom/bumptech/glide/RequestBuilder;->apply(Lcom/bumptech/glide/request/RequestOptions;)Lcom/bumptech/glide/RequestBuilder;

    move-result-object v1

    .line 527
    invoke-virtual {v1, v2}, Lcom/bumptech/glide/RequestBuilder;->into(Landroid/widget/ImageView;)Lcom/bumptech/glide/request/target/ViewTarget;

    goto :goto_2

    .line 529
    :cond_4
    invoke-virtual {v2, v11}, Lcom/etralab/appstoreforandroid/MyImageView;->setVisibility(I)V

    .line 532
    :goto_2
    iget-object v1, p0, Lcom/etralab/appstoreforandroid/AppActivity$9$1;->this$1:Lcom/etralab/appstoreforandroid/AppActivity$9;

    iget-object v1, v1, Lcom/etralab/appstoreforandroid/AppActivity$9;->this$0:Lcom/etralab/appstoreforandroid/AppActivity;

    iget-object v1, v1, Lcom/etralab/appstoreforandroid/AppActivity;->app_screen_shot_2:Ljava/lang/String;

    invoke-virtual {v1, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_5

    .line 533
    invoke-static {v3}, Lcom/bumptech/glide/Glide;->with(Landroid/view/View;)Lcom/bumptech/glide/RequestManager;

    move-result-object v1

    iget-object v2, p0, Lcom/etralab/appstoreforandroid/AppActivity$9$1;->this$1:Lcom/etralab/appstoreforandroid/AppActivity$9;

    iget-object v2, v2, Lcom/etralab/appstoreforandroid/AppActivity$9;->this$0:Lcom/etralab/appstoreforandroid/AppActivity;

    iget-object v2, v2, Lcom/etralab/appstoreforandroid/AppActivity;->app_screen_shot_2:Ljava/lang/String;

    .line 534
    invoke-virtual {v1, v2}, Lcom/bumptech/glide/RequestManager;->load(Ljava/lang/String;)Lcom/bumptech/glide/RequestBuilder;

    move-result-object v1

    .line 535
    invoke-virtual {v1, v0}, Lcom/bumptech/glide/RequestBuilder;->apply(Lcom/bumptech/glide/request/RequestOptions;)Lcom/bumptech/glide/RequestBuilder;

    move-result-object v1

    .line 536
    invoke-virtual {v1, v3}, Lcom/bumptech/glide/RequestBuilder;->into(Landroid/widget/ImageView;)Lcom/bumptech/glide/request/target/ViewTarget;

    goto :goto_3

    .line 538
    :cond_5
    invoke-virtual {v3, v11}, Lcom/etralab/appstoreforandroid/MyImageView;->setVisibility(I)V

    .line 541
    :goto_3
    iget-object v1, p0, Lcom/etralab/appstoreforandroid/AppActivity$9$1;->this$1:Lcom/etralab/appstoreforandroid/AppActivity$9;

    iget-object v1, v1, Lcom/etralab/appstoreforandroid/AppActivity$9;->this$0:Lcom/etralab/appstoreforandroid/AppActivity;

    iget-object v1, v1, Lcom/etralab/appstoreforandroid/AppActivity;->app_screen_shot_3:Ljava/lang/String;

    invoke-virtual {v1, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_6

    .line 542
    invoke-static {v4}, Lcom/bumptech/glide/Glide;->with(Landroid/view/View;)Lcom/bumptech/glide/RequestManager;

    move-result-object v1

    iget-object v2, p0, Lcom/etralab/appstoreforandroid/AppActivity$9$1;->this$1:Lcom/etralab/appstoreforandroid/AppActivity$9;

    iget-object v2, v2, Lcom/etralab/appstoreforandroid/AppActivity$9;->this$0:Lcom/etralab/appstoreforandroid/AppActivity;

    iget-object v2, v2, Lcom/etralab/appstoreforandroid/AppActivity;->app_screen_shot_3:Ljava/lang/String;

    .line 543
    invoke-virtual {v1, v2}, Lcom/bumptech/glide/RequestManager;->load(Ljava/lang/String;)Lcom/bumptech/glide/RequestBuilder;

    move-result-object v1

    .line 544
    invoke-virtual {v1, v0}, Lcom/bumptech/glide/RequestBuilder;->apply(Lcom/bumptech/glide/request/RequestOptions;)Lcom/bumptech/glide/RequestBuilder;

    move-result-object v1

    .line 545
    invoke-virtual {v1, v4}, Lcom/bumptech/glide/RequestBuilder;->into(Landroid/widget/ImageView;)Lcom/bumptech/glide/request/target/ViewTarget;

    goto :goto_4

    .line 547
    :cond_6
    invoke-virtual {v4, v11}, Lcom/etralab/appstoreforandroid/MyImageView;->setVisibility(I)V

    .line 550
    :goto_4
    iget-object v1, p0, Lcom/etralab/appstoreforandroid/AppActivity$9$1;->this$1:Lcom/etralab/appstoreforandroid/AppActivity$9;

    iget-object v1, v1, Lcom/etralab/appstoreforandroid/AppActivity$9;->this$0:Lcom/etralab/appstoreforandroid/AppActivity;

    iget-object v1, v1, Lcom/etralab/appstoreforandroid/AppActivity;->app_screen_shot_4:Ljava/lang/String;

    invoke-virtual {v1, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_7

    .line 551
    invoke-static {v5}, Lcom/bumptech/glide/Glide;->with(Landroid/view/View;)Lcom/bumptech/glide/RequestManager;

    move-result-object v1

    iget-object v2, p0, Lcom/etralab/appstoreforandroid/AppActivity$9$1;->this$1:Lcom/etralab/appstoreforandroid/AppActivity$9;

    iget-object v2, v2, Lcom/etralab/appstoreforandroid/AppActivity$9;->this$0:Lcom/etralab/appstoreforandroid/AppActivity;

    iget-object v2, v2, Lcom/etralab/appstoreforandroid/AppActivity;->app_screen_shot_4:Ljava/lang/String;

    .line 552
    invoke-virtual {v1, v2}, Lcom/bumptech/glide/RequestManager;->load(Ljava/lang/String;)Lcom/bumptech/glide/RequestBuilder;

    move-result-object v1

    .line 553
    invoke-virtual {v1, v0}, Lcom/bumptech/glide/RequestBuilder;->apply(Lcom/bumptech/glide/request/RequestOptions;)Lcom/bumptech/glide/RequestBuilder;

    move-result-object v1

    .line 554
    invoke-virtual {v1, v5}, Lcom/bumptech/glide/RequestBuilder;->into(Landroid/widget/ImageView;)Lcom/bumptech/glide/request/target/ViewTarget;

    goto :goto_5

    .line 556
    :cond_7
    invoke-virtual {v5, v11}, Lcom/etralab/appstoreforandroid/MyImageView;->setVisibility(I)V

    .line 559
    :goto_5
    iget-object v1, p0, Lcom/etralab/appstoreforandroid/AppActivity$9$1;->this$1:Lcom/etralab/appstoreforandroid/AppActivity$9;

    iget-object v1, v1, Lcom/etralab/appstoreforandroid/AppActivity$9;->this$0:Lcom/etralab/appstoreforandroid/AppActivity;

    iget-object v1, v1, Lcom/etralab/appstoreforandroid/AppActivity;->app_screen_shot_5:Ljava/lang/String;

    invoke-virtual {v1, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_8

    .line 560
    invoke-static {v6}, Lcom/bumptech/glide/Glide;->with(Landroid/view/View;)Lcom/bumptech/glide/RequestManager;

    move-result-object v1

    iget-object v2, p0, Lcom/etralab/appstoreforandroid/AppActivity$9$1;->this$1:Lcom/etralab/appstoreforandroid/AppActivity$9;

    iget-object v2, v2, Lcom/etralab/appstoreforandroid/AppActivity$9;->this$0:Lcom/etralab/appstoreforandroid/AppActivity;

    iget-object v2, v2, Lcom/etralab/appstoreforandroid/AppActivity;->app_screen_shot_5:Ljava/lang/String;

    .line 561
    invoke-virtual {v1, v2}, Lcom/bumptech/glide/RequestManager;->load(Ljava/lang/String;)Lcom/bumptech/glide/RequestBuilder;

    move-result-object v1

    .line 562
    invoke-virtual {v1, v0}, Lcom/bumptech/glide/RequestBuilder;->apply(Lcom/bumptech/glide/request/RequestOptions;)Lcom/bumptech/glide/RequestBuilder;

    move-result-object v1

    .line 563
    invoke-virtual {v1, v6}, Lcom/bumptech/glide/RequestBuilder;->into(Landroid/widget/ImageView;)Lcom/bumptech/glide/request/target/ViewTarget;

    goto :goto_6

    .line 565
    :cond_8
    invoke-virtual {v6, v11}, Lcom/etralab/appstoreforandroid/MyImageView;->setVisibility(I)V

    .line 568
    :goto_6
    iget-object v1, p0, Lcom/etralab/appstoreforandroid/AppActivity$9$1;->this$1:Lcom/etralab/appstoreforandroid/AppActivity$9;

    iget-object v1, v1, Lcom/etralab/appstoreforandroid/AppActivity$9;->this$0:Lcom/etralab/appstoreforandroid/AppActivity;

    iget-object v1, v1, Lcom/etralab/appstoreforandroid/AppActivity;->app_screen_shot_6:Ljava/lang/String;

    invoke-virtual {v1, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_9

    .line 569
    invoke-static {v7}, Lcom/bumptech/glide/Glide;->with(Landroid/view/View;)Lcom/bumptech/glide/RequestManager;

    move-result-object v1

    iget-object v2, p0, Lcom/etralab/appstoreforandroid/AppActivity$9$1;->this$1:Lcom/etralab/appstoreforandroid/AppActivity$9;

    iget-object v2, v2, Lcom/etralab/appstoreforandroid/AppActivity$9;->this$0:Lcom/etralab/appstoreforandroid/AppActivity;

    iget-object v2, v2, Lcom/etralab/appstoreforandroid/AppActivity;->app_screen_shot_6:Ljava/lang/String;

    .line 570
    invoke-virtual {v1, v2}, Lcom/bumptech/glide/RequestManager;->load(Ljava/lang/String;)Lcom/bumptech/glide/RequestBuilder;

    move-result-object v1

    .line 571
    invoke-virtual {v1, v0}, Lcom/bumptech/glide/RequestBuilder;->apply(Lcom/bumptech/glide/request/RequestOptions;)Lcom/bumptech/glide/RequestBuilder;

    move-result-object v1

    .line 572
    invoke-virtual {v1, v7}, Lcom/bumptech/glide/RequestBuilder;->into(Landroid/widget/ImageView;)Lcom/bumptech/glide/request/target/ViewTarget;

    goto :goto_7

    .line 574
    :cond_9
    invoke-virtual {v7, v11}, Lcom/etralab/appstoreforandroid/MyImageView;->setVisibility(I)V

    .line 577
    :goto_7
    iget-object v1, p0, Lcom/etralab/appstoreforandroid/AppActivity$9$1;->this$1:Lcom/etralab/appstoreforandroid/AppActivity$9;

    iget-object v1, v1, Lcom/etralab/appstoreforandroid/AppActivity$9;->this$0:Lcom/etralab/appstoreforandroid/AppActivity;

    iget-object v1, v1, Lcom/etralab/appstoreforandroid/AppActivity;->app_screen_shot_7:Ljava/lang/String;

    invoke-virtual {v1, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_a

    .line 578
    invoke-static {v8}, Lcom/bumptech/glide/Glide;->with(Landroid/view/View;)Lcom/bumptech/glide/RequestManager;

    move-result-object v1

    iget-object v2, p0, Lcom/etralab/appstoreforandroid/AppActivity$9$1;->this$1:Lcom/etralab/appstoreforandroid/AppActivity$9;

    iget-object v2, v2, Lcom/etralab/appstoreforandroid/AppActivity$9;->this$0:Lcom/etralab/appstoreforandroid/AppActivity;

    iget-object v2, v2, Lcom/etralab/appstoreforandroid/AppActivity;->app_screen_shot_7:Ljava/lang/String;

    .line 579
    invoke-virtual {v1, v2}, Lcom/bumptech/glide/RequestManager;->load(Ljava/lang/String;)Lcom/bumptech/glide/RequestBuilder;

    move-result-object v1

    .line 580
    invoke-virtual {v1, v0}, Lcom/bumptech/glide/RequestBuilder;->apply(Lcom/bumptech/glide/request/RequestOptions;)Lcom/bumptech/glide/RequestBuilder;

    move-result-object v0

    .line 581
    invoke-virtual {v0, v8}, Lcom/bumptech/glide/RequestBuilder;->into(Landroid/widget/ImageView;)Lcom/bumptech/glide/request/target/ViewTarget;

    goto :goto_8

    .line 583
    :cond_a
    invoke-virtual {v8, v11}, Lcom/etralab/appstoreforandroid/MyImageView;->setVisibility(I)V

    :goto_8
    return-void
.end method
