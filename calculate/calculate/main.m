//
//  main.m
//  calculate
//
//  Created by ru on 2018/3/21.
//  Copyright © 2018年 GMJK. All rights reserved.
//

#import <Foundation/Foundation.h>


#define MAXSIZE 20

#define OK 1
#define ERROR 0
#define TRUE    1
#define FALSE  0

typedef int ElemType;
typedef struct{
    ElemType data[MAXSIZE];
    int length;
    
}SqList;

typedef int Status;


//查询列表的值

/**
 查询角标的值

 @param L 列表
 @param i 第几元素  元素是从0开始数的
 @param e 查询的的值
 @return 查询的结果状态
 */
Status GetElem(SqList L,int i,ElemType *e) {
    
    if (L.length == 0 || i < 1 || i > L.length) {
        return ERROR;
    }
    *e = L.data[i - 1];
    
    return OK;
}

//插入一个值
Status insertElem(SqList *L,int i,ElemType e) {
    
    if (L->length == MAXSIZE) {
        //已经满员了
        return ERROR;
    }
    
    if (i < 1 || i > L->length + 1) {
        //i 不在范围内
        return ERROR;
    }
    
//    if (i <= L.length) {  //若插入的位置不在表尾
//
//    }
    for (NSInteger j = L->length; j > 0; j--) {
        
        ElemType temp = L->data[j - 1];
        
        
        if (j == i) {
            L->data[j] = e;
            break;
        }else {
            L->data[j] = temp;
        }
        
    }
    L->length += 1;
    
    
    return OK;
}


//删除角标的值
Status deleteElem(SqList *L, int j) {
    
    if (j >= L->length + 1 || j < 1) {
        //不在范围内
        return ERROR;
    }
    
    for (NSInteger i = 0; i < L->length ; i++) {
        
        if (i == L->length - 1) {
            L->data[i] = 0;
            L->length -= 1;
            
            break;
        }
        if (i >=  j - 1) {
            L->data[i] = L->data[i + 1];
        }
        
    }
    
    return OK;
    
}



int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        SqList List = {{20,10,50},3};
        
//        int num = 3;
        
        
        //插入一个数字
//        Status sum = insertElem(&List, 1, num);
        //删除一个数字
        Status sum = deleteElem(&List, 2);
        
        if (sum) {
            NSLog(@"111");
        }
        
     
        
        
        
        
        
    }
    return 0;
}
