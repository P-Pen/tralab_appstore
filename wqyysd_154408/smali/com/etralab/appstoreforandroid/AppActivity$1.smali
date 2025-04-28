.class Lcom/etralab/appstoreforandroid/AppActivity$1;
.super Ljava/lang/Thread;
.source "AppActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/etralab/appstoreforandroid/AppActivity;->onCreate(Landroid/os/Bundle;)V
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

    .line 97
    iput-object p1, p0, Lcom/etralab/appstoreforandroid/AppActivity$1;->this$0:Lcom/etralab/appstoreforandroid/AppActivity;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 100
    invoke-super {p0}, Ljava/lang/Thread;->run()V

    .line 102
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/AppActivity$1;->this$0:Lcom/etralab/appstoreforandroid/AppActivity;

    const v1, 0x7f0800e5

    invoke-virtual {v0, v1}, Lcom/etralab/appstoreforandroid/AppActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    if-eqz v0, :cond_0

    .line 105
    invoke-virtual {v0}, Landroid/widget/ImageView;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    check-cast v0, Landroid/graphics/drawable/AnimationDrawable;

    invoke-virtual {v0}, Landroid/graphics/drawable/AnimationDrawable;->start()V

    :cond_0
    return-void
.end method
