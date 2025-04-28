.class Lcom/etralab/appstoreforandroid/SettingsActivity$10;
.super Ljava/lang/Object;
.source "SettingsActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/etralab/appstoreforandroid/SettingsActivity;->ClickToBackLastActivity()V
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

    .line 232
    iput-object p1, p0, Lcom/etralab/appstoreforandroid/SettingsActivity$10;->this$0:Lcom/etralab/appstoreforandroid/SettingsActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 0

    .line 235
    iget-object p1, p0, Lcom/etralab/appstoreforandroid/SettingsActivity$10;->this$0:Lcom/etralab/appstoreforandroid/SettingsActivity;

    invoke-virtual {p1}, Lcom/etralab/appstoreforandroid/SettingsActivity;->finish()V

    return-void
.end method
