//
//  main.m
//  查询中间链表的值
//
//  Created by ru on 2018/3/27.
//  Copyright © 2018年 GMJK. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef int ElmType;

typedef struct Node {
    
    ElmType data;
    struct Node *Next;  //头指针
    
}Node;


//创建20个链表
ElmType creatNodeList(Node **List) {
    Node *L;    //头指针
    L = (Node *)malloc(sizeof(Node));
    L->Next = NULL;
    
    int num = 1;
    Node *r = L;
    
    while (num < 42) {
        Node *p;
         p = (Node *)malloc(sizeof(Node));
        
        p->Next = NULL;
        p->data = num;
        r->Next = p;
        num ++ ;
        r = p;
        
    }
    
    *List = L;
    
    
    return 1;
    
}

//创建循环列表
ElmType creatCirNodeList(Node **List) {
    Node *L;    //头指针
    L = (Node *)malloc(sizeof(Node));
    L->Next = NULL;
    
    int num = 1;
    Node *r = L;
    
    while (num < 42) {
        Node *p;
        p = (Node *)malloc(sizeof(Node));
        
        p->Next = NULL;
        p->data = num;
        r->Next = p;
        num ++ ;
        r = p;
        
    }
    
    r->Next = L;
    *List = L;
    
    
    return 1;
    
}


//查询中间的值
Node* queryMiddleValue(Node *List) {
    //创建2个变量
    Node *p;
    Node *q;
    p = List->Next;
//    if (!List->Next->Next) {
//        return nil;
//    }
    q = List->Next;
    
    while (q && p && q) {
        q = q->Next->Next;
        if (q) {
            p = p->Next;
        }
    }
    return p;
    
}

//规则是 3  6 9 一次自杀
void test(Node *List) {
    //遍历
    Node *p = List->Next;
    Node *last = List;
    int delta = 0;
    int total = 41;
    while (p->Next && total > 2) {
        delta ++;
        if (delta % 3 == 0 ) {
            NSLog(@"%d",p->data);
            last->Next = p->Next;
            p = p->Next;
            total --;
//            delta = 0;
        }else {
            last = p;
            p = p->Next;
        }
    }
    NSLog(@"111");
    
}







int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        
        Node *List ;
//        creatNodeList(&List);

//        Node *temp = queryMiddleValue(List);
         creatCirNodeList(&List);
        
        test(List);
        
        int num = 9;
        int sum[9] = {20,30,10,30,20,20,10,5,8};
        for (NSInteger i = 0; i < 9 - 1; i++) {
            
            for (NSInteger j = 0; j < 9 - i -1;j++) {
                int temp = 0;
                if (sum[j] < sum[j + 1]) {
                    temp = sum[j];
                    sum[j] = sum[j+1];
                    sum[j+1] = temp;
                }
            }
            
        }
        
        
        
        NSLog(@"1111");
        
        
    }
    return 0;
}
