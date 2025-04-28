.class Lcom/etralab/appstoreforandroid/CheckedUpdateActivity$4;
.super Ljava/lang/Thread;
.source "CheckedUpdateActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/etralab/appstoreforandroid/CheckedUpdateActivity;->parseByJSONObject()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/etralab/appstoreforandroid/CheckedUpdateActivity;


# direct methods
.method constructor <init>(Lcom/etralab/appstoreforandroid/CheckedUpdateActivity;)V
    .locals 0

    .line 145
    iput-object p1, p0, Lcom/etralab/appstoreforandroid/CheckedUpdateActivity$4;->this$0:Lcom/etralab/appstoreforandroid/CheckedUpdateActivity;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 9

    .line 148
    invoke-super {p0}, Ljava/lang/Thread;->run()V

    .line 151
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/CheckedUpdateActivity$4;->this$0:Lcom/etralab/appstoreforandroid/CheckedUpdateActivity;

    invoke-static {v0}, Lcom/etralab/appstoreforandroid/CheckedUpdateActivity;->access$200(Lcom/etralab/appstoreforandroid/CheckedUpdateActivity;)V

    .line 153
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/CheckedUpdateActivity$4;->this$0:Lcom/etralab/appstoreforandroid/CheckedUpdateActivity;

    invoke-static {v0}, Lcom/etralab/appstoreforandroid/CheckedUpdateActivity;->access$300(Lcom/etralab/appstoreforandroid/CheckedUpdateActivity;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 159
    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1, v0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 161
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/CheckedUpdateActivity$4;->this$0:Lcom/etralab/appstoreforandroid/CheckedUpdateActivity;

    const-string v2, "pkg_name"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v0, Lcom/etralab/appstoreforandroid/CheckedUpdateActivity;->app_pkg_name:Ljava/lang/String;

    const-string v0, "name"

    .line 162
    invoke-virtual {v1, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 163
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/CheckedUpdateActivity$4;->this$0:Lcom/etralab/appstoreforandroid/CheckedUpdateActivity;

    const-string v2, "name_en"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v0, Lcom/etralab/appstoreforandroid/CheckedUpdateActivity;->app_name_en:Ljava/lang/String;

    const-string v0, "version"

    .line 164
    invoke-virtual {v1, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    const-string v0, "download_size"

    .line 165
    invoke-virtual {v1, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    const-string v0, "update_time"

    .line 166
    invoke-virtual {v1, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    const-string v0, "update_log"

    .line 167
    invoke-virtual {v1, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 168
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/CheckedUpdateActivity$4;->this$0:Lcom/etralab/appstoreforandroid/CheckedUpdateActivity;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "http://dl1.etrasoft.cn"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "download_url"

    invoke-virtual {v1, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/etralab/appstoreforandroid/CheckedUpdateActivity;->app_download_url:Ljava/lang/String;

    .line 173
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/CheckedUpdateActivity$4;->this$0:Lcom/etralab/appstoreforandroid/CheckedUpdateActivity;

    new-instance v1, Lcom/etralab/appstoreforandroid/CheckedUpdateActivity$4$1;

    move-object v2, v1

    move-object v3, p0

    invoke-direct/range {v2 .. v8}, Lcom/etralab/appstoreforandroid/CheckedUpdateActivity$4$1;-><init>(Lcom/etralab/appstoreforandroid/CheckedUpdateActivity$4;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lcom/etralab/appstoreforandroid/CheckedUpdateActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 190
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/CheckedUpdateActivity$4;->this$0:Lcom/etralab/appstoreforandroid/CheckedUpdateActivity;

    invoke-static {v0}, Lcom/etralab/appstoreforandroid/CheckedUpdateActivity;->access$400(Lcom/etralab/appstoreforandroid/CheckedUpdateActivity;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    .line 192
    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_0

    .line 196
    :cond_0
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/CheckedUpdateActivity$4;->this$0:Lcom/etralab/appstoreforandroid/CheckedUpdateActivity;

    const v1, 0x7f0800e5

    invoke-virtual {v0, v1}, Lcom/etralab/appstoreforandroid/CheckedUpdateActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    move-object v3, v0

    check-cast v3, Landroid/widget/ImageView;

    .line 197
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/CheckedUpdateActivity$4;->this$0:Lcom/etralab/appstoreforandroid/CheckedUpdateActivity;

    const v1, 0x7f080242

    invoke-virtual {v0, v1}, Lcom/etralab/appstoreforandroid/CheckedUpdateActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    move-object v4, v0

    check-cast v4, Landroid/widget/TextView;

    .line 199
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/CheckedUpdateActivity$4;->this$0:Lcom/etralab/appstoreforandroid/CheckedUpdateActivity;

    const v1, 0x7f0800e4

    invoke-virtual {v0, v1}, Lcom/etralab/appstoreforandroid/CheckedUpdateActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    move-object v5, v0

    check-cast v5, Landroid/widget/ImageView;

    .line 200
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/CheckedUpdateActivity$4;->this$0:Lcom/etralab/appstoreforandroid/CheckedUpdateActivity;

    const v1, 0x7f080069

    invoke-virtual {v0, v1}, Lcom/etralab/appstoreforandroid/CheckedUpdateActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    move-object v7, v0

    check-cast v7, Landroid/widget/Button;

    .line 201
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/CheckedUpdateActivity$4;->this$0:Lcom/etralab/appstoreforandroid/CheckedUpdateActivity;

    const v1, 0x7f08026c

    invoke-virtual {v0, v1}, Lcom/etralab/appstoreforandroid/CheckedUpdateActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    move-object v6, v0

    check-cast v6, Landroid/widget/TextView;

    .line 203
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/CheckedUpdateActivity$4;->this$0:Lcom/etralab/appstoreforandroid/CheckedUpdateActivity;

    new-instance v8, Lcom/etralab/appstoreforandroid/CheckedUpdateActivity$4$2;

    move-object v1, v8

    move-object v2, p0

    invoke-direct/range {v1 .. v7}, Lcom/etralab/appstoreforandroid/CheckedUpdateActivity$4$2;-><init>(Lcom/etralab/appstoreforandroid/CheckedUpdateActivity$4;Landroid/widget/ImageView;Landroid/widget/TextView;Landroid/widget/ImageView;Landroid/widget/TextView;Landroid/widget/Button;)V

    invoke-virtual {v0, v8}, Lcom/etralab/appstoreforandroid/CheckedUpdateActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    :goto_0
    return-void
.end method
