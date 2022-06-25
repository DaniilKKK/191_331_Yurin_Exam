#include "backend.h"
#include "cryptocontroller.h"
using namespace std;

backend::backend()
{
    sum3cards = 0;
}

//генерация 9-ти рандомных чисел
QString** backend::genRandom9Cards(){
    int card;//рандомное число (карточка)
    QString** encryptCards = new QString*[3];//двумерный массив, хранящий зашифрованные карточки
    //заполнение двумерного массива
    for (int i = 0; i<3;i++){
        for (int j = 0; j<3;j++){
            card = -100 + rand()%(100+100+1); //получаем случайное число в промежутке [-100;100]
            encryptCards[i][j] = CC.encryptCard(QVariant(card).toString());//шифруем число и записываем в двумерный массив
        }
    }
    return encryptCards;
}

//суммирование числа, на которое кликнули, с остальной суммой
void backend::summingCards(int digit){
    sum3cards += digit;
}

//получаем отображение числа, на которое кликнули и дальнейшая передача его в функцию суммирования
int backend::getCard(QString card){
    QString decryptCard = CC.decryptCard(card);
    return decryptCard.toInt();
}

//сброс игры (сброс суммы и генерация новых чисел)
void backend::resetGame(){
    sum3cards=0;
}


