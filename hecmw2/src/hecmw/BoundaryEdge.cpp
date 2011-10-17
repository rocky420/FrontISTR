/*
 ----------------------------------------------------------
|
| Software Name :HEC-MW Ver 4.0beta
|
|   ../src/BoundaryEdge.cpp
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
#include "HEC_MPI.h"
#include <vector>
#include "BoundaryParts.h"
#include "BoundaryEdge.h"
#include "ElementProperty.h"
using namespace pmw;
CBoundaryEdge::CBoundaryEdge()
{
    mpEdgeBNode = NULL;
}
CBoundaryEdge::~CBoundaryEdge()
{
    ;
}
void CBoundaryEdge::setBEdgeShape(const uiint& elemType)
{
    mnShapeType = elemType;
    switch(mnShapeType){
        case(ElementType::Beam):case(ElementType::Line):
            mnOrder = ElementOrder::First;
            break;
        case(ElementType::Beam2):case(ElementType::Line2):
            mnOrder = ElementOrder::Second;
            break;
    }
}
uiint CBoundaryEdge::getNumOfVert()
{
    return 2;
}
void CBoundaryEdge::setEdgeBNode(CBoundaryNode* pBNode)
{
    mpEdgeBNode= pBNode;
}
PairBNode CBoundaryEdge::getPairBNode()
{
    PairBNode pairBNode;
    pairBNode.first = mvBNode[0];
    pairBNode.second= mvBNode[1];
    return pairBNode;
}
void CBoundaryEdge::setupNode()
{
    CNode *pEdgeNode;
    pEdgeNode= mpElement->getEdgeInterNode(mnElemEdgeID);
    mpEdgeBNode->setNode(pEdgeNode);
}
void CBoundaryEdge::refine(uiint& countID, const vuint& vDOF)
{
    mvProgBEdge.reserve(2);
    uiint ivert;
    for(ivert=0; ivert < 2; ivert++){
        CBoundaryEdge *pProgBEdge= new CBoundaryEdge;
        mvProgBEdge.push_back(pProgBEdge);
        pProgBEdge->resizeBNode(2);
        pProgBEdge->setID(countID);
        countID++;
        if(mnOrder==ElementOrder::First) pProgBEdge->setBEdgeShape(ElementType::Beam);
        if(mnOrder==ElementOrder::Second)pProgBEdge->setBEdgeShape(ElementType::Beam2);
        CNode *pNode= mvBNode[ivert]->getNode();
        uiint elemVert= mpElement->getLocalVertNum(pNode->getID());
        CElement *pProgElem= mpElement->getProgElem(elemVert);
        pProgBEdge->setElement(pProgElem);
        pProgBEdge->setElementID(pProgElem->getID());
        CNode *pEdgeNode= mpEdgeBNode->getNode();
        uiint elemEdge= pProgElem->getEdgeIndex(pNode, pEdgeNode);
        pProgBEdge->setElementEdgeID(elemEdge);
        pProgBEdge->setBNode(0, mvBNode[ivert]);
        pProgBEdge->setBNode(1, mpEdgeBNode);
        double coef= pProgBEdge->calcLength() / mLength;
        double progValue;
        uiint idof, dof;
        for(idof=0; idof < vDOF.size(); idof++){
            dof = vDOF[idof];
            progValue = mmValue[dof]*coef;
            pProgBEdge->setBndValue(dof,progValue);
        };
    };
}
double& CBoundaryEdge::calcLength()
{
    CNode *pNode0, *pNode1;
    pNode0= mvBNode[0]->getNode();
    pNode1= mvBNode[1]->getNode();
    double x, y, z;
    x = pNode0->getX() - pNode1->getX();
    y = pNode0->getY() - pNode1->getY();
    z = pNode0->getZ() - pNode1->getZ();
    mLength = sqrt(x*x + y*y + z*z);
    return mLength;
}
void CBoundaryEdge::replaceEdgeBNode()
{
    if(mnOrder==ElementOrder::Second){
        mvBNode.resize(3);
        mvBNode[2] = mpEdgeBNode;
    }
}
void CBoundaryEdge::distDirichletVal(const uiint& dof, const uiint& mgLevel, const uiint& nMaxMGLevel)
{
    double dAveVal(0.0), dVal;
    dVal = mvBNode[0]->getValue(dof, mgLevel);
    if(mgLevel!=nMaxMGLevel){
      mvBNode[0]->setValue(dof, mgLevel+1, dVal);
    }
    dAveVal += dVal;
    dVal = mvBNode[1]->getValue(dof, mgLevel);
    if(mgLevel!=nMaxMGLevel){
      mvBNode[1]->setValue(dof, mgLevel+1, dVal);
    }
    dAveVal += dVal;
    dAveVal *= 0.5;
    if(mnOrder==ElementOrder::Second){
        mpEdgeBNode->setValue(dof, mgLevel,   dAveVal);
        if(mgLevel!=nMaxMGLevel)
          mpEdgeBNode->setValue(dof, mgLevel+1, dAveVal);
    }else{
        if(mgLevel!=nMaxMGLevel)
          mpEdgeBNode->setValue(dof, mgLevel+1, dAveVal);
    }
}