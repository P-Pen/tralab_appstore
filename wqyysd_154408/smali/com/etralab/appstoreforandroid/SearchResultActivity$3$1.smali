.class Lcom/etralab/appstoreforandroid/SearchResultActivity$3$1;
.super Ljava/lang/Object;
.source "SearchResultActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/etralab/appstoreforandroid/SearchResultActivity$3;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/etralab/appstoreforandroid/SearchResultActivity$3;


# direct methods
.method constructor <init>(Lcom/etralab/appstoreforandroid/SearchResultActivity$3;)V
    .locals 0

    .line 191
    iput-object p1, p0, Lcom/etralab/appstoreforandroid/SearchResultActivity$3$1;->this$1:Lcom/etralab/appstoreforandroid/SearchResultActivity$3;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 194
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/SearchResultActivity$3$1;->this$1:Lcom/etralab/appstoreforandroid/SearchResultActivity$3;

    iget-object v0, v0, Lcom/etralab/appstoreforandroid/SearchResultActivity$3;->this$0:Lcom/etralab/appstoreforandroid/SearchResultActivity;

    const v1, 0x7f08014c

    invoke-virtual {v0, v1}, Lcom/etralab/appstoreforandroid/SearchResultActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    .line 195
    iget-object v1, p0, Lcom/etralab/appstoreforandroid/SearchResultActivity$3$1;->this$1:Lcom/etralab/appstoreforandroid/SearchResultActivity$3;

    iget-object v1, v1, Lcom/etralab/appstoreforandroid/SearchResultActivity$3;->this$0:Lcom/etralab/appstoreforandroid/SearchResultActivity;

    const v2, 0x7f080151

    invoke-virtual {v1, v2}, Lcom/etralab/appstoreforandroid/SearchResultActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/LinearLayout;

    const/16 v2, 0x8

    .line 197
    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->setVisibility(I)V

    const/4 v0, 0x0

    .line 198
    invoke-virtual {v1, v0}, Landroid/widget/LinearLayout;->setVisibility(I)V

    return-void
.end method
