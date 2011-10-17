/*
 ----------------------------------------------------------
|
| Software Name :HEC-MW Ver 4.0beta
|
|   ../src/Film.h
|
|                     Written by T.Takeda,    2011/06/01
|                                Y.Sato       2011/06/01
|                                K.Goto,      2010/01/12
|                                K.Matsubara, 2010/06/01
|
|   Contact address : IIS, The University of Tokyo CISS
|
 ----------------------------------------------------------
*/
#ifndef _FILM_H_ad201417_2f36_4da7_8847_40ffded43b0c
#define	_FILM_H_ad201417_2f36_4da7_8847_40ffded43b0c
#include "CommonStd.h"
#include "TypeDef.h"
#include "Element.h"
namespace pmw{
class CFilm:public CElement{
public:
    CFilm();
    virtual ~CFilm();
private:
    double mHeatTrans;
    static uiint mnElemType;
    static uiint mnBaseType;
public:
    void setHeatTrans(const double& heat_trans);
    double& getHeatTrans();
};
}
#endif	/* _FILM_H */