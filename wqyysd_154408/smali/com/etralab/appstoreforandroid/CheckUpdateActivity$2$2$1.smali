.class Lcom/etralab/appstoreforandroid/CheckUpdateActivity$2$2$1;
.super Ljava/lang/Thread;
.source "CheckUpdateActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/etralab/appstoreforandroid/CheckUpdateActivity$2$2;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$2:Lcom/etralab/appstoreforandroid/CheckUpdateActivity$2$2;


# direct methods
.method constructor <init>(Lcom/etralab/appstoreforandroid/CheckUpdateActivity$2$2;)V
    .locals 0

    .line 142
    iput-object p1, p0, Lcom/etralab/appstoreforandroid/CheckUpdateActivity$2$2$1;->this$2:Lcom/etralab/appstoreforandroid/CheckUpdateActivity$2$2;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 145
    invoke-super {p0}, Ljava/lang/Thread;->run()V

    .line 147
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/CheckUpdateActivity$2$2$1;->this$2:Lcom/etralab/appstoreforandroid/CheckUpdateActivity$2$2;

    iget-object v0, v0, Lcom/etralab/appstoreforandroid/CheckUpdateActivity$2$2;->this$1:Lcom/etralab/appstoreforandroid/CheckUpdateActivity$2;

    iget-object v0, v0, Lcom/etralab/appstoreforandroid/CheckUpdateActivity$2;->this$0:Lcom/etralab/appstoreforandroid/CheckUpdateActivity;

    const v1, 0x7f080107

    invoke-virtual {v0, v1}, Lcom/etralab/appstoreforandroid/CheckUpdateActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    if-eqz v0, :cond_0

    .line 150
    invoke-virtual {v0}, Landroid/widget/ImageView;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    check-cast v0, Landroid/graphics/drawable/AnimationDrawable;

    invoke-virtual {v0}, Landroid/graphics/drawable/AnimationDrawable;->start()V

    :cond_0
    return-void
.end method
