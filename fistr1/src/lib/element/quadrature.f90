!-------------------------------------------------------------------------------
! Copyright (c) 2016 The University of Tokyo
! This software is released under the MIT License, see LICENSE.txt
!-------------------------------------------------------------------------------
!> This module contains Gauss point information
!!
!>     gauss1d1: line, 1-point integration
!>     gauss1d2: line, 2-point integeration
!>     gauss2d1: quad, 1-point integration (1 integration point)
!>     gauss2d2: quad, 2-point integration (4 integration points)
!>     gauss2d3: quad, 3-point integration (9 integration points)
!>     gauss2d4: tri, 1 integration point
!>     gauss2d5: tri, 3 integration points
!>     gauss2d6: tri, 4 integeration points
!>     gauss3d1: hex, 1-point integration (1 integration point)
!>     gauss3d2: hex, 2-point integration (8 integration points)
!>     gauss3d3: hex, 3-point integration (27 integration points)
!>     gauss3d4: tet, 1 integration point
!>     gauss3d5: tet, 4 integration points
!>     gauss3d6: tet, 15 integration points
!>     gauss3d7: wedge, 2 integration points
!>     gauss3d8: wedge, 9 integration points
!>     gauss3d9: wedge, 18 integration points
!>     gauss3d10: wedge, 6 integration points
!>     gauss3d11: wedge, 18 integration points
!>     gauss3d12: tet, 5 integration points
!>     weight2d1,... contains the weights
module Quadrature

  integer, parameter, private :: kreal = kind(0.0d0)

  real(kind=kreal) ::                                               &
    gauss1d1(1,1),gauss1d2(1,2),                                     &
    gauss2d1(2,1),gauss2d2(2,4),gauss2d3(2,9),gauss2d4(2,1),         &
    gauss2d5(2,3),gauss2d6(2,4),gauss3d1(3,1),gauss3d2(3,8),         &
    gauss3d3(3,27),gauss3d4(3,1),gauss3d5(3,4),gauss3d6(3,15),       &
    gauss3d7(3,2),gauss3d8(3,9),gauss3d9(3,18),gauss3d10(3,6),       &
    gauss3d12(3,5),    &
    weight1d1(1),weight1d2(2),weight2d1(1),weight2d2(4),             &
    weight2d3(9),weight2d4(1),weight2d5(3),weight2d6(4),             &
    weight3d1(1),weight3d2(8),weight3d3(27),weight3d4(1),            &
    weight3d5(4),weight3d6(15),weight3d7(2),weight3d8(9),            &
    weight3d9(18),weight3d10(6), weight3d12(5)


  data gauss1d1 /0.d0/
  data gauss1d2 /-0.577350269189626d0, 0.577350269189626d0/
  !
  data gauss2d1 /0.d0,0.d0/
  !
  data gauss2d2 /                                                   &
    -0.577350269189626d0,-0.577350269189626d0,                       &
    0.577350269189626d0,-0.577350269189626d0,                        &
    -0.577350269189626d0,0.577350269189626d0,                        &
    0.577350269189626d0,0.577350269189626d0/
  !
  data gauss2d3 /                                                   &
    -0.774596669241483d0,-0.774596669241483d0,                        &
    -0.d0,-0.774596669241483d0,                                       &
    0.774596669241483d0,-0.774596669241483d0,                         &
    -0.774596669241483d0,0.d0,                                        &
    -0.d0,0.d0,                                                       &
    0.774596669241483d0,0.d0,                                         &
    -0.774596669241483d0,0.774596669241483d0,                         &
    -0.d0,0.774596669241483d0,                                        &
    0.774596669241483d0,0.774596669241483d0/
  !
  data gauss2d4 /0.333333333333333d0,0.333333333333333d0/
  !
  data gauss2d5 /                                                   &
    0.166666666666667d0,0.166666666666667d0,                          &
    0.666666666666667d0,0.166666666666667d0,                          &
    0.166666666666667d0,0.666666666666667d0/

  data gauss2d6 /                                                   &
    0.166666666666667d0,0.166666666666667d0,                          &
    0.666666666666667d0,0.166666666666667d0,                          &
    0.166666666666667d0,0.666666666666667d0,                          &
    0.333333333333333d0,0.333333333333333d0/
  !
  data gauss3d1 /0.,0.,0./
  !
  data gauss3d2 /                                                      &
    -0.577350269189626d0,-0.577350269189626d0,-0.577350269189626d0,     &
    0.577350269189626d0,-0.577350269189626d0,-0.577350269189626d0,      &
    -0.577350269189626d0,0.577350269189626d0,-0.577350269189626d0,      &
    0.577350269189626d0,0.577350269189626d0,-0.577350269189626d0,       &
    -0.577350269189626d0,-0.577350269189626d0,0.577350269189626d0,      &
    0.577350269189626d0,-0.577350269189626d0,0.577350269189626d0,       &
    -0.577350269189626d0,0.577350269189626d0,0.577350269189626d0,       &
    0.577350269189626d0,0.577350269189626d0,0.577350269189626d0/
  !
  data gauss3d3 /                                                      &
    -0.774596669241483d0,-0.774596669241483d0,-0.774596669241483d0,      &
    0.d0,-0.774596669241483d0,-0.774596669241483d0,                      &
    0.774596669241483d0,-0.774596669241483d0,-0.774596669241483d0,       &
    -0.774596669241483d0,0.d0,-0.774596669241483d0,                      &
    0.d0,0.d0,-0.774596669241483d0,                                      &
    0.774596669241483d0,0.d0,-0.774596669241483d0,                       &
    -0.774596669241483d0,0.774596669241483d0,-0.774596669241483d0,       &
    0.d0,0.774596669241483d0,-0.774596669241483d0,                       &
    0.774596669241483d0,0.774596669241483d0,-0.774596669241483d0,        &
    -0.774596669241483d0,-0.774596669241483d0,0.d0,                      &
    0.d0,-0.774596669241483d0,0.d0,                                      &
    0.774596669241483d0,-0.774596669241483d0,0.d0,                       &
    -0.774596669241483d0,0.d0,0.d0,                                      &
    0.d0,0.d0,0.d0,                                                      &
    0.774596669241483d0,0.d0,0.d0,                                       &
    -0.774596669241483d0,0.774596669241483d0,0.d0,                       &
    0.d0,0.774596669241483d0,0.d0,                                       &
    0.774596669241483d0,0.774596669241483d0,0.d0,                        &
    -0.774596669241483d0,-0.774596669241483d0,0.774596669241483d0,       &
    0.d0,-0.774596669241483d0,0.774596669241483d0,                       &
    0.774596669241483d0,-0.774596669241483d0,0.774596669241483d0,        &
    -0.774596669241483d0,0.d0,0.774596669241483d0,                       &
    0.d0,0.d0,0.774596669241483d0,                                       &
    0.774596669241483d0,0.d0,0.774596669241483d0,                        &
    -0.774596669241483d0,0.774596669241483d0,0.774596669241483d0,        &
    0.d0,0.774596669241483d0,0.774596669241483d0,                        &
    0.774596669241483d0,0.774596669241483d0,0.774596669241483d0/
  !
  data gauss3d4 /0.25d0,0.25d0,0.25d0/
  !
  data gauss3d5 /                                                      &
    0.138196601125011d0,0.138196601125011d0,0.138196601125011d0,         &
    0.585410196624968d0,0.138196601125011d0,0.138196601125011d0,         &
    0.138196601125011d0,0.585410196624968d0,0.138196601125011d0,         &
    0.138196601125011d0,0.138196601125011d0,0.585410196624968d0/
  !
  data gauss3d6 /                                                      &
    0.25,0.25,0.25d0,                                                    &
    0.091971078052723d0,0.091971078052723d0,0.091971078052723d0,         &
    0.724086765841831d0,0.091971078052723d0,0.091971078052723d0,         &
    0.091971078052723d0,0.724086765841831d0,0.091971078052723d0,         &
    0.091971078052723d0,0.091971078052723d0,0.724086765841831d0,         &
    0.319793627829630d0,0.319793627829630d0,0.319793627829630d0,         &
    0.040619116511110d0,0.319793627829630d0,0.319793627829630d0,         &
    0.319793627829630d0,0.040619116511110d0,0.319793627829630d0,         &
    0.319793627829630d0,0.319793627829630d0,0.040619116511110d0,         &
    0.056350832689629d0,0.056350832689629d0,0.443649167310371d0,         &
    0.443649167310371d0,0.056350832689629d0,0.056350832689629d0,         &
    0.443649167310371d0,0.443649167310371d0,0.056350832689629d0,         &
    0.056350832689629d0,0.443649167310371d0,0.443649167310371d0,         &
    0.056350832689629d0,0.443649167310371d0,0.056350832689629d0,         &
    0.443649167310371d0,0.056350832689629d0,0.443649167310371d0/
  !
  data gauss3d7 /                                                      &
    0.333333333333333d0,0.333333333333333d0,-0.577350269189626d0,        &
    0.333333333333333d0,0.333333333333333d0,0.577350269189626d0/
  !
  data gauss3d8 /                                                      &
    0.166666666666667d0,0.166666666666667d0,-0.774596669241483d0,        &
    0.666666666666667d0,0.166666666666667d0,-0.774596669241483d0,        &
    0.166666666666667d0,0.666666666666667d0,-0.774596669241483d0,        &
    0.166666666666667d0,0.166666666666667d0,0.d0,                        &
    0.666666666666667d0,0.166666666666667d0,0.d0,                        &
    0.166666666666667d0,0.666666666666667d0,0.d0,                        &
    0.166666666666667d0,0.166666666666667d0,0.774596669241483d0,         &
    0.666666666666667d0,0.166666666666667d0,0.774596669241483d0,         &
    0.166666666666667d0,0.666666666666667d0,0.774596669241483d0/
  !
  data gauss3d9 /                                                      &
    0.166666666666667d0,0.166666666666667d0,-0.774596669241483d0,        &
    0.166666666666667d0,0.666666666666667d0,-0.774596669241483d0,        &
    0.666666666666667d0,0.166666666666667d0,-0.774596669241483d0,        &
    0.000000000000000d0,0.500000000000000d0,-0.774596669241483d0,        &
    0.500000000000000d0,0.000000000000000d0,-0.774596669241483d0,        &
    0.500000000000000d0,0.500000000000000d0,-0.774596669241483d0,        &
    0.166666666666667d0,0.166666666666667d0,0.d0,                        &
    0.166666666666667d0,0.666666666666667d0,0.d0,                        &
    0.666666666666667d0,0.166666666666667d0,0.d0,                        &
    0.000000000000000d0,0.500000000000000d0,0.d0,                        &
    0.500000000000000d0,0.000000000000000d0,0.d0,                        &
    0.500000000000000d0,0.500000000000000d0,0.d0,                        &
    0.166666666666667d0,0.166666666666667d0,0.774596669241483d0,         &
    0.166666666666667d0,0.666666666666667d0,0.774596669241483d0,         &
    0.666666666666667d0,0.166666666666667d0,0.774596669241483d0,         &
    0.000000000000000d0,0.500000000000000d0,0.774596669241483d0,         &
    0.500000000000000d0,0.000000000000000d0,0.774596669241483d0,         &
    0.500000000000000d0,0.500000000000000d0,0.774596669241483d0/
  !
  data gauss3d10 /                                                     &
    0.166666666666667d0,0.166666666666667d0,-0.577350269189626d0,        &
    0.666666666666667d0,0.166666666666667d0,-0.577350269189626d0,        &
    0.166666666666667d0,0.666666666666667d0,-0.577350269189626d0,        &
    0.166666666666667d0,0.166666666666667d0,0.577350269189626d0,         &
    0.666666666666667d0,0.166666666666667d0,0.577350269189626d0,         &
    0.166666666666667d0,0.666666666666667d0,0.577350269189626d0/

  !
  data gauss3d12 /                                                     &
    0.25d0,0.25d0,0.25d0,                                                &
    0.5d0 ,0.166666666666667d0,0.166666666666667d0,                      &
    0.166666666666667d0,0.5d0,0.166666666666667d0,                       &
    0.166666666666667d0,0.166666666666667d0,0.5d0,                       &
    0.166666666666667d0,0.666666666666667d0,0.166666666666667d0/

  !
  data weight1d1 /2.d0/
  data weight1d2 /1.d0,1.d0/
  !
  data weight2d1 /4.d0/
  !
  data weight2d2 /1.d0,1.d0,1.d0,1.d0/
  !
  data weight2d3 /                                                     &
    0.308641975308642d0,0.493827160493827d0,0.308641975308642d0,        &
    0.493827160493827d0,0.790123456790123d0,0.493827160493827d0,        &
    0.308641975308642d0,0.493827160493827d0,0.308641975308642d0/
  !
  data weight2d4 /0.5d0/
  !
  data weight2d5 /                                                     &
    0.166666666666666d0,0.166666666666666d0,0.166666666666666d0/

  data weight2d6 /                                                     &
    0.5d0,0.5d0,0.5d0,0.5d0/
  !
  data weight3d1 /8.d0/
  !
  data weight3d2 /1.d0,1.d0,1.d0,1.d0,1.d0,1.d0,1.d0,1.d0/
  !
  data weight3d3 /                                                     &
    0.171467764060357d0,0.274348422496571d0,0.171467764060357d0,        &
    0.274348422496571d0,0.438957475994513d0,0.274348422496571d0,        &
    0.171467764060357d0,0.274348422496571d0,0.171467764060357d0,        &
    0.274348422496571d0,0.438957475994513d0,0.274348422496571d0,        &
    0.438957475994513d0,0.702331961591221d0,0.438957475994513d0,        &
    0.274348422496571d0,0.438957475994513d0,0.274348422496571d0,        &
    0.171467764060357d0,0.274348422496571d0,0.171467764060357d0,        &
    0.274348422496571d0,0.438957475994513d0,0.274348422496571d0,        &
    0.171467764060357d0,0.274348422496571d0,0.171467764060357d0/
  !
  data weight3d4 /0.166666666666667d0/
  !
  data weight3d5 /                                                     &
    0.041666666666667d0,0.041666666666667d0,0.041666666666667d0,        &
    0.041666666666667d0/
  !
  data weight3d6 /                                                     &
    0.019753086419753d0,0.011989513963170d0,0.011989513963170d0,        &
    0.011989513963170d0,0.011989513963170d0,0.011511367871045d0,        &
    0.011511367871045d0,0.011511367871045d0,0.011511367871045d0,        &
    0.008818342151675d0,0.008818342151675d0,0.008818342151675d0,        &
    0.008818342151675d0,0.008818342151675d0,0.008818342151675d0/
  !
  data weight3d7 /0.5d0,0.5d0/
  !
  data weight3d8 /                                                     &
    0.092592592592593d0,0.092592592592593d0,0.092592592592593d0,        &
    0.148148148148148d0,0.148148148148148d0,0.148148148148148d0,        &
    0.092592592592593d0,0.092592592592593d0,0.092592592592593d0/
  !
  data weight3d9 /                                                     &
    0.083333333333333d0,0.083333333333333d0,0.083333333333333d0,        &
    0.009259259259259d0,0.009259259259259d0,0.009259259259259d0,        &
    0.133333333333333d0,0.133333333333333d0,0.133333333333333d0,        &
    0.014814814814815d0,0.014814814814815d0,0.014814814814815d0,        &
    0.083333333333333d0,0.083333333333333d0,0.083333333333333d0,        &
    0.009259259259259d0,0.009259259259259d0,0.009259259259259d0/
  !
  data weight3d10 /                                                    &
    0.166666666666666d0,0.166666666666666d0,0.166666666666666d0,        &
    0.166666666666666d0,0.166666666666666d0,0.166666666666666d0/

  data weight3d12 /                                                    &
    -0.80000000000000d0,0.450000000000000d0,0.450000000000000d0,        &
    0.450000000000000d0,0.450000000000000d0/

end module


