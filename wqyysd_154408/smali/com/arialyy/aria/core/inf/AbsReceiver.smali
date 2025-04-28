.class public abstract Lcom/arialyy/aria/core/inf/AbsReceiver;
.super Ljava/lang/Object;
.source "AbsReceiver.java"

# interfaces
.implements Lcom/arialyy/aria/core/inf/IReceiver;


# instance fields
.field protected TAG:Ljava/lang/String;

.field private isFragment:Z

.field public isLocalOrAnonymousClass:Z

.field private needRmReceiver:Z

.field public obj:Ljava/lang/Object;

.field private targetName:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/Object;)V
    .locals 1

    .line 56
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 35
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/arialyy/aria/core/inf/AbsReceiver;->TAG:Ljava/lang/String;

    const/4 v0, 0x0

    .line 50
    iput-boolean v0, p0, Lcom/arialyy/aria/core/inf/AbsReceiver;->needRmReceiver:Z

    .line 52
    iput-boolean v0, p0, Lcom/arialyy/aria/core/inf/AbsReceiver;->isFragment:Z

    .line 54
    iput-boolean v0, p0, Lcom/arialyy/aria/core/inf/AbsReceiver;->isLocalOrAnonymousClass:Z

    .line 57
    iput-object p1, p0, Lcom/arialyy/aria/core/inf/AbsReceiver;->obj:Ljava/lang/Object;

    .line 58
    invoke-direct {p0}, Lcom/arialyy/aria/core/inf/AbsReceiver;->initParams()V

    return-void
.end method

.method private getDialog(Ljava/lang/Object;)Landroid/app/Dialog;
    .locals 4

    .line 113
    :try_start_0
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-string v1, "getDialog"

    const/4 v2, 0x0

    new-array v3, v2, [Ljava/lang/Class;

    invoke-virtual {v0, v1, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    new-array v1, v2, [Ljava/lang/Object;

    .line 114
    invoke-virtual {v0, p1, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/app/Dialog;
    :try_end_0
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    move-exception p1

    .line 120
    invoke-virtual {p1}, Ljava/lang/reflect/InvocationTargetException;->printStackTrace()V

    goto :goto_0

    :catch_1
    move-exception p1

    .line 118
    invoke-virtual {p1}, Ljava/lang/IllegalAccessException;->printStackTrace()V

    goto :goto_0

    :catch_2
    move-exception p1

    .line 116
    invoke-virtual {p1}, Ljava/lang/NoSuchMethodException;->printStackTrace()V

    :goto_0
    const/4 p1, 0x0

    return-object p1
.end method

.method public static getKey(Lcom/arialyy/aria/core/inf/IReceiver;)Ljava/lang/String;
    .locals 3

    const/4 v0, 0x3

    new-array v0, v0, [Ljava/lang/Object;

    .line 141
    invoke-interface {p0}, Lcom/arialyy/aria/core/inf/IReceiver;->getTargetName()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    aput-object v1, v0, v2

    invoke-interface {p0}, Lcom/arialyy/aria/core/inf/IReceiver;->getType()Lcom/arialyy/aria/core/inf/ReceiverType;

    move-result-object v1

    const/4 v2, 0x1

    aput-object v1, v0, v2

    .line 142
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    const/4 v1, 0x2

    aput-object p0, v0, v1

    const-string p0, "%s_%s_%s"

    .line 141
    invoke-static {p0, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private handleFragmentOrDialogParam(Ljava/lang/Class;Z)V
    .locals 3

    .line 79
    new-instance v0, Lcom/arialyy/aria/core/WidgetLiftManager;

    invoke-direct {v0}, Lcom/arialyy/aria/core/WidgetLiftManager;-><init>()V

    .line 80
    iget-object v1, p0, Lcom/arialyy/aria/core/inf/AbsReceiver;->obj:Ljava/lang/Object;

    instance-of v2, v1, Landroid/app/Dialog;

    if-eqz v2, :cond_0

    .line 81
    check-cast v1, Landroid/app/Dialog;

    invoke-virtual {v0, v1}, Lcom/arialyy/aria/core/WidgetLiftManager;->handleDialogLift(Landroid/app/Dialog;)Z

    move-result p1

    iput-boolean p1, p0, Lcom/arialyy/aria/core/inf/AbsReceiver;->needRmReceiver:Z

    return-void

    .line 84
    :cond_0
    instance-of v2, v1, Landroid/widget/PopupWindow;

    if-eqz v2, :cond_1

    .line 85
    check-cast v1, Landroid/widget/PopupWindow;

    invoke-virtual {v0, v1}, Lcom/arialyy/aria/core/WidgetLiftManager;->handlePopupWindowLift(Landroid/widget/PopupWindow;)Z

    move-result p1

    iput-boolean p1, p0, Lcom/arialyy/aria/core/inf/AbsReceiver;->needRmReceiver:Z

    return-void

    .line 89
    :cond_1
    invoke-static {p1}, Lcom/arialyy/aria/util/CommonUtil;->isFragment(Ljava/lang/Class;)Z

    move-result v1

    const/4 v2, 0x1

    if-eqz v1, :cond_2

    .line 90
    iput-boolean v2, p0, Lcom/arialyy/aria/core/inf/AbsReceiver;->isFragment:Z

    .line 93
    :cond_2
    invoke-static {p1}, Lcom/arialyy/aria/util/CommonUtil;->isDialogFragment(Ljava/lang/Class;)Z

    move-result p1

    if-eqz p1, :cond_4

    .line 94
    iput-boolean v2, p0, Lcom/arialyy/aria/core/inf/AbsReceiver;->isFragment:Z

    if-eqz p2, :cond_3

    .line 96
    iget-object p1, p0, Lcom/arialyy/aria/core/inf/AbsReceiver;->TAG:Ljava/lang/String;

    new-array p2, v2, [Ljava/lang/Object;

    const/4 v0, 0x0

    iget-object v1, p0, Lcom/arialyy/aria/core/inf/AbsReceiver;->obj:Ljava/lang/Object;

    .line 98
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    aput-object v1, p2, v0

    const-string v0, "%s \u662f\u533f\u540d\u5185\u90e8\u7c7b\uff0c\u65e0\u6cd5\u83b7\u53d6\u5230dialog\u5bf9\u8c61\uff0c\u4e3a\u4e86\u9632\u6b62\u5185\u5b58\u6cc4\u6f0f\uff0c\u8bf7\u5728dismiss\u65b9\u6cd5\u4e2d\u8c03\u7528Aria.download(this).unRegister();\u6765\u6ce8\u9500\u4e8b\u4ef6"

    .line 96
    invoke-static {v0, p2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    .line 102
    :cond_3
    iget-object p1, p0, Lcom/arialyy/aria/core/inf/AbsReceiver;->obj:Ljava/lang/Object;

    invoke-direct {p0, p1}, Lcom/arialyy/aria/core/inf/AbsReceiver;->getDialog(Ljava/lang/Object;)Landroid/app/Dialog;

    move-result-object p1

    invoke-virtual {v0, p1}, Lcom/arialyy/aria/core/WidgetLiftManager;->handleDialogFragmentLift(Landroid/app/Dialog;)Z

    move-result p1

    iput-boolean p1, p0, Lcom/arialyy/aria/core/inf/AbsReceiver;->needRmReceiver:Z

    :cond_4
    return-void
.end method

.method private initParams()V
    .locals 2

    .line 63
    :try_start_0
    iget-object v0, p0, Lcom/arialyy/aria/core/inf/AbsReceiver;->obj:Ljava/lang/Object;

    invoke-static {v0}, Lcom/arialyy/aria/util/CommonUtil;->getTargetName(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/arialyy/aria/core/inf/AbsReceiver;->targetName:Ljava/lang/String;

    .line 64
    iget-object v0, p0, Lcom/arialyy/aria/core/inf/AbsReceiver;->obj:Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    .line 65
    invoke-static {v0}, Lcom/arialyy/aria/util/CommonUtil;->isLocalOrAnonymousClass(Ljava/lang/Class;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v0, 0x1

    .line 66
    iput-boolean v0, p0, Lcom/arialyy/aria/core/inf/AbsReceiver;->isLocalOrAnonymousClass:Z

    .line 67
    iget-object v1, p0, Lcom/arialyy/aria/core/inf/AbsReceiver;->obj:Ljava/lang/Object;

    invoke-static {v1}, Lcom/arialyy/aria/util/CommonUtil;->getTargetName(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 68
    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    .line 69
    invoke-direct {p0, v1, v0}, Lcom/arialyy/aria/core/inf/AbsReceiver;->handleFragmentOrDialogParam(Ljava/lang/Class;Z)V

    return-void

    :cond_0
    const/4 v1, 0x0

    .line 72
    invoke-direct {p0, v0, v1}, Lcom/arialyy/aria/core/inf/AbsReceiver;->handleFragmentOrDialogParam(Ljava/lang/Class;Z)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    .line 74
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    :goto_0
    return-void
.end method

.method private removeObj()V
    .locals 1

    const/4 v0, 0x0

    .line 160
    iput-object v0, p0, Lcom/arialyy/aria/core/inf/AbsReceiver;->obj:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public destroy()V
    .locals 0

    .line 164
    invoke-virtual {p0}, Lcom/arialyy/aria/core/inf/AbsReceiver;->unRegisterListener()V

    .line 165
    invoke-direct {p0}, Lcom/arialyy/aria/core/inf/AbsReceiver;->removeObj()V

    return-void
.end method

.method public getKey()Ljava/lang/String;
    .locals 1

    .line 153
    invoke-static {p0}, Lcom/arialyy/aria/core/inf/AbsReceiver;->getKey(Lcom/arialyy/aria/core/inf/IReceiver;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getTargetName()Ljava/lang/String;
    .locals 1

    .line 146
    iget-object v0, p0, Lcom/arialyy/aria/core/inf/AbsReceiver;->targetName:Ljava/lang/String;

    return-object v0
.end method

.method public isFragment()Z
    .locals 1

    .line 130
    iget-boolean v0, p0, Lcom/arialyy/aria/core/inf/AbsReceiver;->isFragment:Z

    return v0
.end method

.method protected isNeedRmListener()Z
    .locals 1

    .line 126
    iget-boolean v0, p0, Lcom/arialyy/aria/core/inf/AbsReceiver;->needRmReceiver:Z

    return v0
.end method

.method protected abstract unRegisterListener()V
.end method
