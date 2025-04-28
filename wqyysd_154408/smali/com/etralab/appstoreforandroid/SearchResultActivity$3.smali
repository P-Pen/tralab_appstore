.class Lcom/etralab/appstoreforandroid/SearchResultActivity$3;
.super Ljava/lang/Thread;
.source "SearchResultActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/etralab/appstoreforandroid/SearchResultActivity;->parseByJSONObject()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/etralab/appstoreforandroid/SearchResultActivity;


# direct methods
.method constructor <init>(Lcom/etralab/appstoreforandroid/SearchResultActivity;)V
    .locals 0

    .line 151
    iput-object p1, p0, Lcom/etralab/appstoreforandroid/SearchResultActivity$3;->this$0:Lcom/etralab/appstoreforandroid/SearchResultActivity;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 11

    .line 154
    invoke-super {p0}, Ljava/lang/Thread;->run()V

    .line 155
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/SearchResultActivity$3;->this$0:Lcom/etralab/appstoreforandroid/SearchResultActivity;

    invoke-static {v0}, Lcom/etralab/appstoreforandroid/SearchResultActivity;->access$100(Lcom/etralab/appstoreforandroid/SearchResultActivity;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_2

    .line 159
    iget-object v1, p0, Lcom/etralab/appstoreforandroid/SearchResultActivity$3;->this$0:Lcom/etralab/appstoreforandroid/SearchResultActivity;

    invoke-static {v1}, Lcom/etralab/appstoreforandroid/SearchResultActivity;->access$200(Lcom/etralab/appstoreforandroid/SearchResultActivity;)V

    const-string v1, "no_result"

    .line 161
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 166
    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1, v0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string v0, "data"

    .line 168
    invoke-virtual {v1, v0}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v0

    const/4 v1, 0x0

    .line 170
    :goto_0
    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I

    move-result v2

    if-ge v1, v2, :cond_0

    .line 172
    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v2

    const-string v3, "id"

    .line 173
    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    const-string v3, "name"

    .line 174
    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 175
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

    .line 176
    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    const-string v3, "like_num"

    .line 177
    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    const-string v3, "os_type"

    .line 178
    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    .line 181
    new-instance v2, Lcom/etralab/appstoreforandroid/App;

    move-object v4, v2

    invoke-direct/range {v4 .. v10}, Lcom/etralab/appstoreforandroid/App;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 182
    iget-object v3, p0, Lcom/etralab/appstoreforandroid/SearchResultActivity$3;->this$0:Lcom/etralab/appstoreforandroid/SearchResultActivity;

    invoke-static {v3}, Lcom/etralab/appstoreforandroid/SearchResultActivity;->access$000(Lcom/etralab/appstoreforandroid/SearchResultActivity;)Ljava/util/List;

    move-result-object v3

    invoke-interface {v3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :catch_0
    move-exception v0

    .line 186
    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V

    .line 189
    :cond_0
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/SearchResultActivity$3;->this$0:Lcom/etralab/appstoreforandroid/SearchResultActivity;

    invoke-static {v0}, Lcom/etralab/appstoreforandroid/SearchResultActivity;->access$300(Lcom/etralab/appstoreforandroid/SearchResultActivity;)V

    goto :goto_1

    .line 191
    :cond_1
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/SearchResultActivity$3;->this$0:Lcom/etralab/appstoreforandroid/SearchResultActivity;

    new-instance v1, Lcom/etralab/appstoreforandroid/SearchResultActivity$3$1;

    invoke-direct {v1, p0}, Lcom/etralab/appstoreforandroid/SearchResultActivity$3$1;-><init>(Lcom/etralab/appstoreforandroid/SearchResultActivity$3;)V

    invoke-virtual {v0, v1}, Lcom/etralab/appstoreforandroid/SearchResultActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    :cond_2
    :goto_1
    return-void
.end method
