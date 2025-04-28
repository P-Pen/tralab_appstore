.class Lcom/etralab/appstoreforandroid/DeveloperAppActivity$4;
.super Ljava/lang/Thread;
.source "DeveloperAppActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/etralab/appstoreforandroid/DeveloperAppActivity;->parseByJSONObject()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/etralab/appstoreforandroid/DeveloperAppActivity;


# direct methods
.method constructor <init>(Lcom/etralab/appstoreforandroid/DeveloperAppActivity;)V
    .locals 0

    .line 164
    iput-object p1, p0, Lcom/etralab/appstoreforandroid/DeveloperAppActivity$4;->this$0:Lcom/etralab/appstoreforandroid/DeveloperAppActivity;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 11

    .line 167
    invoke-super {p0}, Ljava/lang/Thread;->run()V

    .line 169
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/DeveloperAppActivity$4;->this$0:Lcom/etralab/appstoreforandroid/DeveloperAppActivity;

    invoke-static {v0}, Lcom/etralab/appstoreforandroid/DeveloperAppActivity;->access$200(Lcom/etralab/appstoreforandroid/DeveloperAppActivity;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 175
    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1, v0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string v0, "data"

    .line 177
    invoke-virtual {v1, v0}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v0

    const/4 v1, 0x0

    .line 179
    :goto_0
    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I

    move-result v2

    if-ge v1, v2, :cond_0

    .line 181
    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v2

    const-string v3, "id"

    .line 182
    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    const-string v3, "name"

    .line 183
    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 184
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "http://img.etrasoft.cn"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, "logo_url"

    invoke-virtual {v2, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    const-string v3, "download_num"

    .line 185
    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    const-string v3, "like_num"

    .line 186
    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    const-string v3, "os_type"

    .line 187
    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    .line 190
    new-instance v2, Lcom/etralab/appstoreforandroid/App;

    move-object v4, v2

    invoke-direct/range {v4 .. v10}, Lcom/etralab/appstoreforandroid/App;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 191
    iget-object v3, p0, Lcom/etralab/appstoreforandroid/DeveloperAppActivity$4;->this$0:Lcom/etralab/appstoreforandroid/DeveloperAppActivity;

    invoke-static {v3}, Lcom/etralab/appstoreforandroid/DeveloperAppActivity;->access$100(Lcom/etralab/appstoreforandroid/DeveloperAppActivity;)Ljava/util/List;

    move-result-object v3

    invoke-interface {v3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :catch_0
    move-exception v0

    .line 195
    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V

    .line 200
    :cond_0
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/DeveloperAppActivity$4;->this$0:Lcom/etralab/appstoreforandroid/DeveloperAppActivity;

    invoke-static {v0}, Lcom/etralab/appstoreforandroid/DeveloperAppActivity;->access$300(Lcom/etralab/appstoreforandroid/DeveloperAppActivity;)V

    return-void
.end method
