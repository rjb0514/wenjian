//
//  main.m
//  链表
//
//  Created by ru on 2018/3/26.
//  Copyright © 2018年 GMJK. All rights reserved.
//

#import <Foundation/Foundation.h>


#define ERROR 0
#define OK  1
typedef int Status;

typedef int ElemType;

typedef struct Note *LinkList;

typedef struct Node {
    
    ElemType data;  //数据域
    struct Node *Next;  //头指针
}Node;

//链表



//初始化一个空链表
Node * LinklistInit() {
    Node *L ;
    L = (Node *)malloc(sizeof(Node));       //申请头结点的空间
    
    if(L == NULL) { //判断是否有足够的内存空间
        printf("申请内存空间失败\n");
    }
    L->Next = NULL;                  //将next设置为NULL,初始长度为0的单链表
    return L;
    
}

//单链表的创建  尾插法
Node * LinklistCreat() {
    Node *L ;
    L = (Node *)malloc(sizeof(Node));       //申请头结点的空间
    L->Next = NULL;
    
    //始终指向终点的 结点
    Node *r = L;
    
    ElemType num = 0;
    while (num != 100) {
        printf("请输入数字");
        scanf("%d",&num);
        Node *p;
        p = (Node *)malloc(sizeof(Node *));
        p->data = num;
        r->Next = p;
        p->Next = NULL;
        r = p;
        
        
    }
    return L;
    
}


//单链表的查询结点的值
Status getElem(Node *L,int i , ElemType *e) {
    int j = 0;
    Node *p;
    p = L->Next;
    j = 1;
    
    while (p && j < i) {
        p = p->Next;
        ++j;
    }
    if (!p || j > i) {
        return ERROR;
    }
    *e = p->data;
    
    
    return OK;
}

//单链表的插入
Status insertElem(Node *L,int i,ElemType e) {
    int j = 0;
    Node *p;
    p = L->Next;
    j = 1;
    
    while (p && j < i) {
        p = p->Next;
        j++;
    }
    if (!p || j > i) {
        return ERROR;
    }
    //创建一个结点
    Node *t = (Node *)malloc(sizeof(Node *));
    t->data = e;
    
    t->Next = p;
    p->Next = t;
    return OK;

};


//删除所有的列表
Status ClearList (Node *L) {
    
    Node *P , *q;
    P = L->Next;
    while (P) {
        q = P->Next;
        free(P);
        P = q;
    }
    L->Next = NULL;

    
    return OK;
}




int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        
        Node *L = LinklistCreat();
        
        ElemType num = 0;
        //查询一个值
        Status sum = getElem(L, 2, &num);
        if (sum) {
            //查询的结果是多少
            NSLog(@"%d",num);
        }
        
        ElemType num2 = 80;
        //查询一个值
        Status sum2 = insertElem(L, 2, num2);
        if (sum2) {
            //查询的结果是多少
            NSLog(@"%d",num);
        }
    }
    return 0;
}
