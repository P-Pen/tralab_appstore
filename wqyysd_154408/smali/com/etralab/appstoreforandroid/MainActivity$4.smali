.class Lcom/etralab/appstoreforandroid/MainActivity$4;
.super Ljava/lang/Object;
.source "MainActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/etralab/appstoreforandroid/MainActivity;->VersionCheck()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/etralab/appstoreforandroid/MainActivity;


# direct methods
.method constructor <init>(Lcom/etralab/appstoreforandroid/MainActivity;)V
    .locals 0

    .line 349
    iput-object p1, p0, Lcom/etralab/appstoreforandroid/MainActivity$4;->this$0:Lcom/etralab/appstoreforandroid/MainActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 352
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/MainActivity$4;->this$0:Lcom/etralab/appstoreforandroid/MainActivity;

    const-string v1, "\u552f\u8da3\u5e94\u7528\u5546\u5e97\u7248\u672c\u8fc7\u4f4e\uff0c\u8bf7\u5148\u66f4\u65b0\u81f3\u6700\u65b0\u7248\u672c"

    const/4 v2, 0x1

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    return-void
.end method
