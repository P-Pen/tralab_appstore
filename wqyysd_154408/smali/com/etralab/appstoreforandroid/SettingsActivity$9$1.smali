.class Lcom/etralab/appstoreforandroid/SettingsActivity$9$1;
.super Ljava/lang/Object;
.source "SettingsActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/etralab/appstoreforandroid/SettingsActivity$9;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/etralab/appstoreforandroid/SettingsActivity$9;


# direct methods
.method constructor <init>(Lcom/etralab/appstoreforandroid/SettingsActivity$9;)V
    .locals 0

    .line 173
    iput-object p1, p0, Lcom/etralab/appstoreforandroid/SettingsActivity$9$1;->this$1:Lcom/etralab/appstoreforandroid/SettingsActivity$9;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 176
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/SettingsActivity$9$1;->this$1:Lcom/etralab/appstoreforandroid/SettingsActivity$9;

    iget-object v0, v0, Lcom/etralab/appstoreforandroid/SettingsActivity$9;->this$0:Lcom/etralab/appstoreforandroid/SettingsActivity;

    const v1, 0x7f080113

    invoke-virtual {v0, v1}, Lcom/etralab/appstoreforandroid/SettingsActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    const/4 v1, 0x0

    .line 177
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    return-void
.end method
