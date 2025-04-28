.class Lcom/etralab/appstoreforandroid/NoticeActivity$3$1;
.super Ljava/lang/Object;
.source "NoticeActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/etralab/appstoreforandroid/NoticeActivity$3;->onDoubleClick()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/etralab/appstoreforandroid/NoticeActivity$3;


# direct methods
.method constructor <init>(Lcom/etralab/appstoreforandroid/NoticeActivity$3;)V
    .locals 0

    .line 97
    iput-object p1, p0, Lcom/etralab/appstoreforandroid/NoticeActivity$3$1;->this$1:Lcom/etralab/appstoreforandroid/NoticeActivity$3;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .line 101
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/NoticeActivity$3$1;->this$1:Lcom/etralab/appstoreforandroid/NoticeActivity$3;

    iget-object v0, v0, Lcom/etralab/appstoreforandroid/NoticeActivity$3;->this$0:Lcom/etralab/appstoreforandroid/NoticeActivity;

    const v1, 0x7f0800d6

    invoke-virtual {v0, v1}, Lcom/etralab/appstoreforandroid/NoticeActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    const/4 v1, 0x0

    .line 102
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 104
    iget-object v1, p0, Lcom/etralab/appstoreforandroid/NoticeActivity$3$1;->this$1:Lcom/etralab/appstoreforandroid/NoticeActivity$3;

    iget-object v1, v1, Lcom/etralab/appstoreforandroid/NoticeActivity$3;->this$0:Lcom/etralab/appstoreforandroid/NoticeActivity;

    invoke-virtual {v1}, Lcom/etralab/appstoreforandroid/NoticeActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f0700d4

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    check-cast v1, Landroid/graphics/drawable/AnimationDrawable;

    .line 105
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 106
    invoke-virtual {v1}, Landroid/graphics/drawable/AnimationDrawable;->isRunning()Z

    move-result v0

    if-nez v0, :cond_0

    .line 107
    invoke-virtual {v1}, Landroid/graphics/drawable/AnimationDrawable;->start()V

    .line 109
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/NoticeActivity$3$1;->this$1:Lcom/etralab/appstoreforandroid/NoticeActivity$3;

    iget-object v0, v0, Lcom/etralab/appstoreforandroid/NoticeActivity$3;->this$0:Lcom/etralab/appstoreforandroid/NoticeActivity;

    iget-boolean v0, v0, Lcom/etralab/appstoreforandroid/NoticeActivity;->isLikeNotice:Z

    if-nez v0, :cond_0

    .line 110
    new-instance v0, Lcom/etralab/appstoreforandroid/NoticeActivity$3$1$1;

    invoke-direct {v0, p0}, Lcom/etralab/appstoreforandroid/NoticeActivity$3$1$1;-><init>(Lcom/etralab/appstoreforandroid/NoticeActivity$3$1;)V

    .line 117
    invoke-virtual {v0}, Lcom/etralab/appstoreforandroid/NoticeActivity$3$1$1;->start()V

    .line 119
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/NoticeActivity$3$1;->this$1:Lcom/etralab/appstoreforandroid/NoticeActivity$3;

    iget-object v0, v0, Lcom/etralab/appstoreforandroid/NoticeActivity$3;->this$0:Lcom/etralab/appstoreforandroid/NoticeActivity;

    const v1, 0x7f080240

    invoke-virtual {v0, v1}, Lcom/etralab/appstoreforandroid/NoticeActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 120
    iget-object v1, p0, Lcom/etralab/appstoreforandroid/NoticeActivity$3$1;->this$1:Lcom/etralab/appstoreforandroid/NoticeActivity$3;

    iget-object v1, v1, Lcom/etralab/appstoreforandroid/NoticeActivity$3;->this$0:Lcom/etralab/appstoreforandroid/NoticeActivity;

    const v2, 0x7f0800e3

    invoke-virtual {v1, v2}, Lcom/etralab/appstoreforandroid/NoticeActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    const v2, 0x7f07012e

    .line 122
    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 123
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lcom/etralab/appstoreforandroid/NoticeActivity$3$1;->this$1:Lcom/etralab/appstoreforandroid/NoticeActivity$3;

    iget-object v2, v2, Lcom/etralab/appstoreforandroid/NoticeActivity$3;->this$0:Lcom/etralab/appstoreforandroid/NoticeActivity;

    iget-object v2, v2, Lcom/etralab/appstoreforandroid/NoticeActivity;->notice_like_num:Ljava/lang/String;

    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    const/4 v3, 0x1

    add-int/2addr v2, v3

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, ""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/etralab/appstoreforandroid/NumUnitConversionUtil;->NumUnitConversion(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 125
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/NoticeActivity$3$1;->this$1:Lcom/etralab/appstoreforandroid/NoticeActivity$3;

    iget-object v0, v0, Lcom/etralab/appstoreforandroid/NoticeActivity$3;->this$0:Lcom/etralab/appstoreforandroid/NoticeActivity;

    iput-boolean v3, v0, Lcom/etralab/appstoreforandroid/NoticeActivity;->isLikeNotice:Z

    :cond_0
    return-void
.end method
