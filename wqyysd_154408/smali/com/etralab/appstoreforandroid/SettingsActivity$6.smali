.class Lcom/etralab/appstoreforandroid/SettingsActivity$6;
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

    .line 97
    iput-object p1, p0, Lcom/etralab/appstoreforandroid/SettingsActivity$6;->this$0:Lcom/etralab/appstoreforandroid/SettingsActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2

    .line 100
    new-instance p1, Landroid/content/Intent;

    iget-object v0, p0, Lcom/etralab/appstoreforandroid/SettingsActivity$6;->this$0:Lcom/etralab/appstoreforandroid/SettingsActivity;

    const-class v1, Lcom/etralab/appstoreforandroid/SupportUsActivity;

    invoke-direct {p1, v0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 101
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/SettingsActivity$6;->this$0:Lcom/etralab/appstoreforandroid/SettingsActivity;

    invoke-virtual {v0, p1}, Lcom/etralab/appstoreforandroid/SettingsActivity;->startActivity(Landroid/content/Intent;)V

    return-void
.end method
