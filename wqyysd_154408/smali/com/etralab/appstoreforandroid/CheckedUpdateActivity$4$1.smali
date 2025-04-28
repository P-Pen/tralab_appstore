.class Lcom/etralab/appstoreforandroid/CheckedUpdateActivity$4$1;
.super Ljava/lang/Object;
.source "CheckedUpdateActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/etralab/appstoreforandroid/CheckedUpdateActivity$4;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/etralab/appstoreforandroid/CheckedUpdateActivity$4;

.field final synthetic val$app_apk_size:Ljava/lang/String;

.field final synthetic val$app_apk_update_time:Ljava/lang/String;

.field final synthetic val$app_name:Ljava/lang/String;

.field final synthetic val$app_update_log:Ljava/lang/String;

.field final synthetic val$app_version:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/etralab/appstoreforandroid/CheckedUpdateActivity$4;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 173
    iput-object p1, p0, Lcom/etralab/appstoreforandroid/CheckedUpdateActivity$4$1;->this$1:Lcom/etralab/appstoreforandroid/CheckedUpdateActivity$4;

    iput-object p2, p0, Lcom/etralab/appstoreforandroid/CheckedUpdateActivity$4$1;->val$app_name:Ljava/lang/String;

    iput-object p3, p0, Lcom/etralab/appstoreforandroid/CheckedUpdateActivity$4$1;->val$app_version:Ljava/lang/String;

    iput-object p4, p0, Lcom/etralab/appstoreforandroid/CheckedUpdateActivity$4$1;->val$app_apk_size:Ljava/lang/String;

    iput-object p5, p0, Lcom/etralab/appstoreforandroid/CheckedUpdateActivity$4$1;->val$app_apk_update_time:Ljava/lang/String;

    iput-object p6, p0, Lcom/etralab/appstoreforandroid/CheckedUpdateActivity$4$1;->val$app_update_log:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    .line 176
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/CheckedUpdateActivity$4$1;->this$1:Lcom/etralab/appstoreforandroid/CheckedUpdateActivity$4;

    iget-object v0, v0, Lcom/etralab/appstoreforandroid/CheckedUpdateActivity$4;->this$0:Lcom/etralab/appstoreforandroid/CheckedUpdateActivity;

    const v1, 0x7f080243

    invoke-virtual {v0, v1}, Lcom/etralab/appstoreforandroid/CheckedUpdateActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 177
    iget-object v1, p0, Lcom/etralab/appstoreforandroid/CheckedUpdateActivity$4$1;->this$1:Lcom/etralab/appstoreforandroid/CheckedUpdateActivity$4;

    iget-object v1, v1, Lcom/etralab/appstoreforandroid/CheckedUpdateActivity$4;->this$0:Lcom/etralab/appstoreforandroid/CheckedUpdateActivity;

    const v2, 0x7f080244

    invoke-virtual {v1, v2}, Lcom/etralab/appstoreforandroid/CheckedUpdateActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    .line 178
    iget-object v2, p0, Lcom/etralab/appstoreforandroid/CheckedUpdateActivity$4$1;->this$1:Lcom/etralab/appstoreforandroid/CheckedUpdateActivity$4;

    iget-object v2, v2, Lcom/etralab/appstoreforandroid/CheckedUpdateActivity$4;->this$0:Lcom/etralab/appstoreforandroid/CheckedUpdateActivity;

    const v3, 0x7f080227

    invoke-virtual {v2, v3}, Lcom/etralab/appstoreforandroid/CheckedUpdateActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    .line 179
    iget-object v3, p0, Lcom/etralab/appstoreforandroid/CheckedUpdateActivity$4$1;->this$1:Lcom/etralab/appstoreforandroid/CheckedUpdateActivity$4;

    iget-object v3, v3, Lcom/etralab/appstoreforandroid/CheckedUpdateActivity$4;->this$0:Lcom/etralab/appstoreforandroid/CheckedUpdateActivity;

    const v4, 0x7f080230

    invoke-virtual {v3, v4}, Lcom/etralab/appstoreforandroid/CheckedUpdateActivity;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    .line 180
    iget-object v4, p0, Lcom/etralab/appstoreforandroid/CheckedUpdateActivity$4$1;->this$1:Lcom/etralab/appstoreforandroid/CheckedUpdateActivity$4;

    iget-object v4, v4, Lcom/etralab/appstoreforandroid/CheckedUpdateActivity$4;->this$0:Lcom/etralab/appstoreforandroid/CheckedUpdateActivity;

    const v5, 0x7f08022f

    invoke-virtual {v4, v5}, Lcom/etralab/appstoreforandroid/CheckedUpdateActivity;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    .line 182
    iget-object v5, p0, Lcom/etralab/appstoreforandroid/CheckedUpdateActivity$4$1;->val$app_name:Ljava/lang/String;

    invoke-virtual {v0, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 183
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/CheckedUpdateActivity$4$1;->val$app_version:Ljava/lang/String;

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 184
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/CheckedUpdateActivity$4$1;->val$app_apk_size:Ljava/lang/String;

    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 185
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/CheckedUpdateActivity$4$1;->val$app_apk_update_time:Ljava/lang/String;

    invoke-virtual {v3, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 186
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/CheckedUpdateActivity$4$1;->val$app_update_log:Ljava/lang/String;

    invoke-virtual {v4, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method
