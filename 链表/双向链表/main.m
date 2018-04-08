//
//  main.m
//  双向链表
//
//  Created by ru on 2018/4/8.
//  Copyright © 2018年 GMJK. All rights reserved.
//

#import <Foundation/Foundation.h>

#define OK 1
#define ERROR 0

typedef char ElemType;

typedef int Status;

typedef struct DualNode{
    ElemType data;
    struct DualNode *prior;
    struct DualNode *next;
}DualNode, *DuLinkList;


//初始化双列表
Status InitList(DuLinkList *L) {
    DualNode *p, *q;
    *L = (DuLinkList)malloc(sizeof(DualNode));
    if (!(*L)) {
        return ERROR;
    }
    //头结点
    (*L)->next = (*L)->prior = NULL;
    p = *L;
    //26个字母
    for (NSInteger i = 0; i < 26; i++) {
        q = (DualNode *)malloc(sizeof(DualNode));
        if (!q) {
            return ERROR;
        }
        q->data = 'A' + i;
        q->next = p->next;
        q->prior = p;
        p->next = q;
        p = q;
        
    }
    p->next = (*L)->next;
    (*L)->next->prior = p;
    
    
    
    return OK;
}

//凯撒 算法
void Caesar(DuLinkList *L,int i) {
    if (i > 0) {
        do{
            (*L) = (*L)->next;
        }while (--i);
    }
    
    if (i < 0) {
        do{
            (*L) = (*L)->prior;
        }while (++i);
    }
}


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        
        DuLinkList L;
        int i;
        
        InitList(&L);
        printf("请输入一个整数");
        printf("\n");
        scanf("%d",&i);
        printf("\n");
        Caesar(&L, i);
        printf("1111");
        
        for (NSInteger i = 0; i < 26; i++) {
            L = L->next;
            printf("%c",L->data);
             printf("\n");
        }
        
        
    }
    return 0;
}
