.class Lcom/etralab/appstoreforandroid/NoticeActivity$7;
.super Ljava/lang/Object;
.source "NoticeActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/etralab/appstoreforandroid/NoticeActivity;->ShowNotice()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/etralab/appstoreforandroid/NoticeActivity;

.field final synthetic val$ll_loading_app_information:Landroid/widget/LinearLayout;

.field final synthetic val$sv_layout_body:Landroid/widget/ScrollView;


# direct methods
.method constructor <init>(Lcom/etralab/appstoreforandroid/NoticeActivity;Landroid/widget/LinearLayout;Landroid/widget/ScrollView;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 251
    iput-object p1, p0, Lcom/etralab/appstoreforandroid/NoticeActivity$7;->this$0:Lcom/etralab/appstoreforandroid/NoticeActivity;

    iput-object p2, p0, Lcom/etralab/appstoreforandroid/NoticeActivity$7;->val$ll_loading_app_information:Landroid/widget/LinearLayout;

    iput-object p3, p0, Lcom/etralab/appstoreforandroid/NoticeActivity$7;->val$sv_layout_body:Landroid/widget/ScrollView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 254
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/NoticeActivity$7;->val$ll_loading_app_information:Landroid/widget/LinearLayout;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 255
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/NoticeActivity$7;->val$sv_layout_body:Landroid/widget/ScrollView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/ScrollView;->setVisibility(I)V

    .line 257
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/NoticeActivity$7;->this$0:Lcom/etralab/appstoreforandroid/NoticeActivity;

    const v1, 0x7f080270

    invoke-virtual {v0, v1}, Lcom/etralab/appstoreforandroid/NoticeActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 258
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lcom/etralab/appstoreforandroid/NoticeActivity$7;->this$0:Lcom/etralab/appstoreforandroid/NoticeActivity;

    iget-object v2, v2, Lcom/etralab/appstoreforandroid/NoticeActivity;->notice_view_num:Ljava/lang/String;

    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    add-int/lit8 v2, v2, 0x1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, ""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/etralab/appstoreforandroid/NumUnitConversionUtil;->NumUnitConversion(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 261
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/NoticeActivity$7;->val$sv_layout_body:Landroid/widget/ScrollView;

    invoke-virtual {v0}, Landroid/widget/ScrollView;->requestFocus()Z

    return-void
.end method
