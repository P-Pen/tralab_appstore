.class Lcom/etralab/appstoreforandroid/MainActivity$3;
.super Ljava/lang/Thread;
.source "MainActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/etralab/appstoreforandroid/MainActivity;->parseVersionCheckJsonByJSONObject()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/etralab/appstoreforandroid/MainActivity;


# direct methods
.method constructor <init>(Lcom/etralab/appstoreforandroid/MainActivity;)V
    .locals 0

    .line 281
    iput-object p1, p0, Lcom/etralab/appstoreforandroid/MainActivity$3;->this$0:Lcom/etralab/appstoreforandroid/MainActivity;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .line 284
    invoke-super {p0}, Ljava/lang/Thread;->run()V

    .line 285
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/MainActivity$3;->this$0:Lcom/etralab/appstoreforandroid/MainActivity;

    invoke-static {v0}, Lcom/etralab/appstoreforandroid/MainActivity;->access$000(Lcom/etralab/appstoreforandroid/MainActivity;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_3

    .line 291
    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1, v0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 292
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/MainActivity$3;->this$0:Lcom/etralab/appstoreforandroid/MainActivity;

    const-string v2, "build_17"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v1

    iput v1, v0, Lcom/etralab/appstoreforandroid/MainActivity;->versionCheck:I

    .line 293
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/MainActivity$3;->this$0:Lcom/etralab/appstoreforandroid/MainActivity;

    iget v0, v0, Lcom/etralab/appstoreforandroid/MainActivity;->versionCheck:I

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-ne v0, v2, :cond_0

    move v0, v2

    goto :goto_0

    :cond_0
    move v0, v1

    :goto_0
    iget-object v3, p0, Lcom/etralab/appstoreforandroid/MainActivity$3;->this$0:Lcom/etralab/appstoreforandroid/MainActivity;

    iget v3, v3, Lcom/etralab/appstoreforandroid/MainActivity;->versionCheck:I

    if-nez v3, :cond_1

    move v1, v2

    :cond_1
    or-int/2addr v0, v1

    if-eqz v0, :cond_2

    .line 294
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/MainActivity$3;->this$0:Lcom/etralab/appstoreforandroid/MainActivity;

    iput-boolean v2, v0, Lcom/etralab/appstoreforandroid/MainActivity;->isVersionCheckJsonDownload:Z

    .line 296
    :cond_2
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/MainActivity$3;->this$0:Lcom/etralab/appstoreforandroid/MainActivity;

    invoke-static {v0}, Lcom/etralab/appstoreforandroid/MainActivity;->access$100(Lcom/etralab/appstoreforandroid/MainActivity;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception v0

    .line 298
    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V

    :cond_3
    :goto_1
    return-void
.end method
