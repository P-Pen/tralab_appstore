.class public Lcom/etralab/appstoreforandroid/MyImageView;
.super Landroidx/appcompat/widget/AppCompatImageView;
.source "MyImageView.java"


# static fields
.field public static final GET_DATA_SUCCESS:I = 0x1

.field public static final NETWORK_ERROR:I = 0x2

.field public static final SERVER_ERROR:I = 0x3


# instance fields
.field private handler:Landroid/os/Handler;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 45
    invoke-direct {p0, p1}, Landroidx/appcompat/widget/AppCompatImageView;-><init>(Landroid/content/Context;)V

    .line 22
    new-instance p1, Lcom/etralab/appstoreforandroid/MyImageView$1;

    invoke-direct {p1, p0}, Lcom/etralab/appstoreforandroid/MyImageView$1;-><init>(Lcom/etralab/appstoreforandroid/MyImageView;)V

    iput-object p1, p0, Lcom/etralab/appstoreforandroid/MyImageView;->handler:Landroid/os/Handler;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 49
    invoke-direct {p0, p1, p2}, Landroidx/appcompat/widget/AppCompatImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 22
    new-instance p1, Lcom/etralab/appstoreforandroid/MyImageView$1;

    invoke-direct {p1, p0}, Lcom/etralab/appstoreforandroid/MyImageView$1;-><init>(Lcom/etralab/appstoreforandroid/MyImageView;)V

    iput-object p1, p0, Lcom/etralab/appstoreforandroid/MyImageView;->handler:Landroid/os/Handler;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 41
    invoke-direct {p0, p1, p2, p3}, Landroidx/appcompat/widget/AppCompatImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 22
    new-instance p1, Lcom/etralab/appstoreforandroid/MyImageView$1;

    invoke-direct {p1, p0}, Lcom/etralab/appstoreforandroid/MyImageView$1;-><init>(Lcom/etralab/appstoreforandroid/MyImageView;)V

    iput-object p1, p0, Lcom/etralab/appstoreforandroid/MyImageView;->handler:Landroid/os/Handler;

    return-void
.end method

.method static synthetic access$000(Lcom/etralab/appstoreforandroid/MyImageView;)Landroid/os/Handler;
    .locals 0

    .line 17
    iget-object p0, p0, Lcom/etralab/appstoreforandroid/MyImageView;->handler:Landroid/os/Handler;

    return-object p0
.end method


# virtual methods
.method public setImageURL(Ljava/lang/String;)V
    .locals 1

    .line 55
    new-instance v0, Lcom/etralab/appstoreforandroid/MyImageView$2;

    invoke-direct {v0, p0, p1}, Lcom/etralab/appstoreforandroid/MyImageView$2;-><init>(Lcom/etralab/appstoreforandroid/MyImageView;Ljava/lang/String;)V

    .line 89
    invoke-virtual {v0}, Lcom/etralab/appstoreforandroid/MyImageView$2;->start()V

    return-void
.end method
