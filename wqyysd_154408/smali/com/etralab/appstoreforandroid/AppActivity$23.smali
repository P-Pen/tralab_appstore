.class Lcom/etralab/appstoreforandroid/AppActivity$23;
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

    .line 1140
    iput-object p1, p0, Lcom/etralab/appstoreforandroid/AppActivity$23;->this$0:Lcom/etralab/appstoreforandroid/AppActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2

    .line 1143
    iget-object p1, p0, Lcom/etralab/appstoreforandroid/AppActivity$23;->this$0:Lcom/etralab/appstoreforandroid/AppActivity;

    iget-object p1, p1, Lcom/etralab/appstoreforandroid/AppActivity;->app_pkg_name:Ljava/lang/String;

    if-eqz p1, :cond_0

    .line 1144
    iget-object p1, p0, Lcom/etralab/appstoreforandroid/AppActivity$23;->this$0:Lcom/etralab/appstoreforandroid/AppActivity;

    invoke-virtual {p1}, Lcom/etralab/appstoreforandroid/AppActivity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object p1

    iget-object v0, p0, Lcom/etralab/appstoreforandroid/AppActivity$23;->this$0:Lcom/etralab/appstoreforandroid/AppActivity;

    iget-object v0, v0, Lcom/etralab/appstoreforandroid/AppActivity;->app_pkg_name:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/content/pm/PackageManager;->getLaunchIntentForPackage(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p1

    .line 1146
    :try_start_0
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/AppActivity$23;->this$0:Lcom/etralab/appstoreforandroid/AppActivity;

    invoke-virtual {v0, p1}, Lcom/etralab/appstoreforandroid/AppActivity;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 1148
    :catch_0
    iget-object p1, p0, Lcom/etralab/appstoreforandroid/AppActivity$23;->this$0:Lcom/etralab/appstoreforandroid/AppActivity;

    const/4 v0, 0x0

    const-string v1, "\u5e94\u7528\u6253\u5f00\u5931\u8d25\uff0c\u8bf7\u624b\u52a8\u6253\u5f00\uff01"

    invoke-static {p1, v1, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    .line 1149
    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    :cond_0
    :goto_0
    return-void
.end method
