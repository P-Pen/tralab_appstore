.class Lcom/etralab/appstoreforandroid/AppAdapterForActivity$1;
.super Ljava/lang/Object;
.source "AppAdapterForActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/etralab/appstoreforandroid/AppAdapterForActivity;->onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/etralab/appstoreforandroid/AppAdapterForActivity$ViewHolder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/etralab/appstoreforandroid/AppAdapterForActivity;

.field final synthetic val$holder:Lcom/etralab/appstoreforandroid/AppAdapterForActivity$ViewHolder;

.field final synthetic val$parent:Landroid/view/ViewGroup;


# direct methods
.method constructor <init>(Lcom/etralab/appstoreforandroid/AppAdapterForActivity;Landroid/view/ViewGroup;Lcom/etralab/appstoreforandroid/AppAdapterForActivity$ViewHolder;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 57
    iput-object p1, p0, Lcom/etralab/appstoreforandroid/AppAdapterForActivity$1;->this$0:Lcom/etralab/appstoreforandroid/AppAdapterForActivity;

    iput-object p2, p0, Lcom/etralab/appstoreforandroid/AppAdapterForActivity$1;->val$parent:Landroid/view/ViewGroup;

    iput-object p3, p0, Lcom/etralab/appstoreforandroid/AppAdapterForActivity$1;->val$holder:Lcom/etralab/appstoreforandroid/AppAdapterForActivity$ViewHolder;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 3

    .line 64
    iget-object p1, p0, Lcom/etralab/appstoreforandroid/AppAdapterForActivity$1;->val$parent:Landroid/view/ViewGroup;

    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object p1

    .line 65
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/etralab/appstoreforandroid/AppActivity;

    invoke-direct {v0, p1, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 66
    iget-object v1, p0, Lcom/etralab/appstoreforandroid/AppAdapterForActivity$1;->val$holder:Lcom/etralab/appstoreforandroid/AppAdapterForActivity$ViewHolder;

    iget-object v1, v1, Lcom/etralab/appstoreforandroid/AppAdapterForActivity$ViewHolder;->appId:Landroid/widget/TextView;

    invoke-virtual {v1}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v1

    const-string v2, "appId"

    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/CharSequence;)Landroid/content/Intent;

    .line 67
    invoke-virtual {p1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    return-void
.end method
