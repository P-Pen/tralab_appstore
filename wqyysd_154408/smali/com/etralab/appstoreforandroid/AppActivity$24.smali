.class Lcom/etralab/appstoreforandroid/AppActivity$24;
.super Ljava/lang/Object;
.source "AppActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/etralab/appstoreforandroid/AppActivity;->OpenUninstallAppOnClick()V
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

    .line 1155
    iput-object p1, p0, Lcom/etralab/appstoreforandroid/AppActivity$24;->this$0:Lcom/etralab/appstoreforandroid/AppActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2

    .line 1158
    iget-object p1, p0, Lcom/etralab/appstoreforandroid/AppActivity$24;->this$0:Lcom/etralab/appstoreforandroid/AppActivity;

    iget-object p1, p1, Lcom/etralab/appstoreforandroid/AppActivity;->app_pkg_name:Ljava/lang/String;

    if-eqz p1, :cond_0

    .line 1159
    new-instance p1, Landroid/content/Intent;

    invoke-direct {p1}, Landroid/content/Intent;-><init>()V

    const-string v0, "android.settings.APPLICATION_DETAILS_SETTINGS"

    .line 1160
    invoke-virtual {p1, v0}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 1161
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "package:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/etralab/appstoreforandroid/AppActivity$24;->this$0:Lcom/etralab/appstoreforandroid/AppActivity;

    iget-object v1, v1, Lcom/etralab/appstoreforandroid/AppActivity;->app_pkg_name:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 1163
    :try_start_0
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/AppActivity$24;->this$0:Lcom/etralab/appstoreforandroid/AppActivity;

    invoke-virtual {v0, p1}, Lcom/etralab/appstoreforandroid/AppActivity;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 1165
    :catch_0
    iget-object p1, p0, Lcom/etralab/appstoreforandroid/AppActivity$24;->this$0:Lcom/etralab/appstoreforandroid/AppActivity;

    const/4 v0, 0x0

    const-string v1, "\u5e94\u7528\u5378\u8f7d\u5931\u8d25\uff0c\u8bf7\u624b\u52a8\u524d\u5f80\u7cfb\u7edf\u8bbe\u7f6e\u4e2d\u5378\u8f7d\uff01"

    invoke-static {p1, v1, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    .line 1166
    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    :cond_0
    :goto_0
    return-void
.end method
