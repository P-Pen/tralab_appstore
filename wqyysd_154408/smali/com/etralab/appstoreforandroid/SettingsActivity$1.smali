.class Lcom/etralab/appstoreforandroid/SettingsActivity$1;
.super Ljava/lang/Object;
.source "SettingsActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/etralab/appstoreforandroid/SettingsActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/etralab/appstoreforandroid/SettingsActivity;


# direct methods
.method constructor <init>(Lcom/etralab/appstoreforandroid/SettingsActivity;)V
    .locals 0

    .line 43
    iput-object p1, p0, Lcom/etralab/appstoreforandroid/SettingsActivity$1;->this$0:Lcom/etralab/appstoreforandroid/SettingsActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2

    .line 49
    iget-object p1, p0, Lcom/etralab/appstoreforandroid/SettingsActivity$1;->this$0:Lcom/etralab/appstoreforandroid/SettingsActivity;

    const-string v0, "\u8be5\u529f\u80fd\u6682\u672a\u5f00\u653e\uff0c\u656c\u8bf7\u671f\u5f85\uff01"

    const/4 v1, 0x0

    invoke-static {p1, v0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    .line 50
    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    return-void
.end method
