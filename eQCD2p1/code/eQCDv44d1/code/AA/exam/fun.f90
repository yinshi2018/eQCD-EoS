function Fnb(x,T)          !boson distribution function
  implicit none

  real(8) x, T
  real(8) Fnb
  real(8) over

  over=x/T
  if(over>60.d0)then
    Fnb=0.d0
  else if(over<1.d-9)then
    Fnb=1.d0/over
  else
    Fnb=1.d0/(exp(over)-1.d0)
  end if

  return
end function Fnb

function Fnf(x,T)              !fermion distribution function without Polyakov loop
  implicit none

  real(8) x, T
  real(8) Fnf
  real(8) over

  over=x/T
  if(over>60.d0)then
    Fnf=0.d0
  else
    Fnf=1.d0/(exp(over)+1.d0)
  end if

  return
end function Fnf

function Fnf0(x,T,l,lb)         !fermion distribution function

  implicit none

  real(8) x,T,l,lb
  real(8) Fnf0
  real(8) over

  over=x/T
  if(over > 60.)then
    Fnf0=0.
  else
    Fnf0=1./(1.+3.*lb*exp(x/T)+3.*l*exp(2.*x/T)+exp(3.*x/T))
  end if

  return
end function Fnf0


function Fnf1(x,T,l,lb)         !fermion distribution function
  implicit none

  real(8) x,T,l,lb
  real(8) Fnf1
  real(8) over

  over=x/T
  if(over > 60.)then
    Fnf1=0.
  else
    Fnf1=(2*exp(x/T))/(1.+3.*lb*exp(x/T)+3.*l*exp(2.*x/T)+exp(3.*x/T))
  end if

  return
end function Fnf1

function Fnf2(x,T,l,lb)         !fermion distribution function
  implicit none

  real(8) x,T,l,lb
  real(8) Fnf2
  real(8) over

  over=x/T
  if(over > 60.)then
    Fnf2=0.
  else
    Fnf2=(exp(2.*x/T))/(1.+3.*lb*exp(x/T)+3.*l*exp(2.*x/T)+exp(3.*x/T))
  end if

  return
end function Fnf2

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

function etaAYM_fun(k)         !gluon anomalous dimension for YM
  implicit none

  real(8) k,x
  real(8) etaAYM_fun
  real(8) pi,hc
  parameter(pi=3.1415926)
  parameter(hc=197.33)


  x=k*hc*1.e-3 !GeV

  if(x>20.d0)then
    x=20.
  end if

  if(x<1.1742262255454918d0)then

    etaAYM_fun=2.0017315731553222d0 + 0.02535729083323711d0*x + 16.097541779065406d0*x**2 - &
  302.7494821464171d0*x**3 + 2288.749425727516d0*x**4 - 9788.535004744776d0*x**5 + &
  26149.518185698584d0*x**6 - 45554.37601004513d0*x**7 +                        &
  52373.85072903301d0*x**8 - 39298.192581323245d0*x**9 +                        &
  18479.424497364293d0*x**10 - 4937.994141138742d0*x**11 +                      &
  571.7617098901799d0*x**12
  else
    if(x<2.623963837466931d0)then
      etaAYM_fun=-367.6580502496352d0 + 2730.1062042728113d0*x - 8797.881298844117d0*x**2 + &
  16533.62401348252d0*x**3 - 20378.8477338948d0*x**4 + 17455.20730300257d0*x**5 - &
  10691.452105958986d0*x**6 + 4729.559744141716d0*x**7 -                        &
  1502.1888931295957d0*x**8 + 334.5067997645728d0*x**9 -                        &
  49.62043753490649d0*x**10 + 4.406176245215392d0*x**11 -                       &
  0.17724823740148732d0*x**12
    else
      etaAYM_fun=-2.7898588241948037d0 + 3.1503289235848633d0*x - 1.9808330589913137d0*x**2 + &
  0.7578660648023684d0*x**3 - 0.19038142703264263d0*x**4 +                      &
  0.03280873680172623d0*x**5 - 0.003972312654438533d0*x**6 +                    &
  0.00034088954852291213d0*x**7 - 0.000020622711689815282d0*x**8 +              &
  8.597605474830839d-7*x**9 - 2.35012846810413d-8*x**10 +                       &
  3.7901834033497795d-10*x**11 - 2.7329769854623207d-12*x**12
    end if
  end if

end

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

function etaA_unqQCD_T0_fun(k)         !gluon anomalous dimension for unquenched QCD at vacuum
  implicit none

  real(8) k,x
  real(8) etaA_unqQCD_T0_fun
  real(8) pi,hc
  parameter(pi=3.1415926)
  parameter(hc=197.33)


  x=k*hc*1.e-3 !GeV

  etaA_unqQCD_T0_fun=(x*((-65.62755837247998*x**3*(1/(0.6297755306057824 + x**2))** &
          1.0010352178943276)/(1.9599999999999997 + x**2)**3 +                  &
      (32.81377918623999*x*(1/(0.6297755306057824 + x**2))**                    &
          1.0010352178943276)/(1.9599999999999997 + x**2)**2 -                  &
      (32.8477485976341*x**3*(1/(0.6297755306057824 + x**2))**                  &
          2.0010352178943274)/(1.9599999999999997 + x**2)**2 -                  &
      (1.7296886276050616*(1 - exp(-4.*x**2))*x*                                &
         (x**2/(1.9599999999999997 + x**2))**0.7241215270425517)/               &
       ((1 + 0.5102040816326532*x**2)*                                          &
         Log(1 + 0.5102040816326532*x**2)**1.5344827586206897) +                &
      (25.37174234659914*x*(x**2/(1.9599999999999997 + x**2))**                 &
          0.7241215270425517)/                                                  &
       (exp(4.*x**2)*Log(1 + 0.5102040816326532*x**2)**0.5344827586206896)      &
+ (2.2965281014686934*(1 - exp(-4.*x**2))*                                      &
         ((-2*x**3)/(1.9599999999999997 + x**2)**2 +                            &
           (2*x)/(1.9599999999999997 + x**2)))/                                 &
       ((x**2/(1.9599999999999997 + x**2))**0.2758784729574483*                 &
         Log(1 + 0.5102040816326532*x**2)**0.5344827586206896)))/               &
  ((16.406889593119995*x**2*(1/(0.6297755306057824 + x**2))**                   &
        1.0010352178943276)/(1.9599999999999997 + x**2)**2 +                    &
    (3.1714677933248927*(1 - exp(-4.*x**2))*                                    &
       (x**2/(1.9599999999999997 + x**2))**0.7241215270425517)/                 &
     Log(1 + 0.5102040816326532*x**2)**0.5344827586206896)                      


end

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

function etac_YM_T0_fun(k)         !ghost anomalous dimension for YM at vacuum
  implicit none

  real(8) k,x
  real(8) etac_YM_T0_fun
  real(8) pi,hc
  parameter(pi=3.1415926)
  parameter(hc=197.33)

  x=k*hc*1.e-3 !GeV

  if(x<5.d-3)then
    x=5.d-3
  else if(x>36.d0)then
    x=36.d0
  end if

  etac_YM_T0_fun=-((x*((0.3127303503976901d0/x - (0.0724652792322399d0*Log(x))/x -       &
           (0.16731405622777723d0*Log(x)**2)/x +                                &
           (0.03971883306482317d0*Log(x)**3)/x +                                &
           (0.05039718111094147d0*Log(x)**4)/x -                                &
           (0.006193799496094736d0*Log(x)**5)/x -                               &
           (0.007783953881032825d0*Log(x)**6)/x +                               &
           (0.00015000633566750036d0*Log(x)**7)/x +                             &
           (0.000576899049459662d0*Log(x)**8)/x +                               &
           (0.00003324669759307337d0*Log(x)**9)/x -                             &
           (0.000016232565030691018d0*Log(x)**10)/x -                           &
           (1.8240289937541614d-6*Log(x)**11)/x)/(1 + x**(-10)) +               &
        (10*(0.514469336450356d0 + 0.3127303503976901d0*Log(x) -                &
             0.03623263961611995d0*Log(x)**2 -                                  &
             0.05577135207592574d0*Log(x)**3 +                                  &
             0.009929708266205792d0*Log(x)**4 +                                 &
             0.010079436222188294d0*Log(x)**5 -                                 &
             0.0010322999160157895d0*Log(x)**6 -                                &
             0.001111993411576118d0*Log(x)**7 +                                 &
             0.000018750791958437545d0*Log(x)**8 +                              &
             0.00006409989438440689d0*Log(x)**9 +                               &
             3.324669759307337d-6*Log(x)**10 -                                  &
             1.4756877300628199d-6*Log(x)**11 -                                 &
             1.520024161461801d-7*Log(x)**12))/((1 + x**(-10))**2*x**11) -      &
        ((1 - 1/(1 + x**(-10)))*                                                &
           (-1.321194817029039d0/x + (1.882463932771217d0*Log(x))/x -           &
             (0.6680132436026764d0*Log(x)**2)/x +                               &
             (0.12856701193223205d0*Log(x)**3)/x -                              &
             (0.2940599308234803d0*Log(x)**4)/x +                               &
             (0.07542393136550152d0*Log(x)**5)/x +                              &
             (0.044788385284017365d0*Log(x)**6)/x -                             &
             (0.006227007833860103d0*Log(x)**7)/x -                             &
             (0.0035927586282748815d0*Log(x)**8)/x -                            &
             (0.00004407598937946612d0*Log(x)**9)/x +                           &
             (0.00011759685411763281d0*Log(x)**10)/x +                          &
             (0.000012000150597545888d0*Log(x)**11)/x))/                        &
         (1.9407506326007926d0 - 1.321194817029039d0*Log(x) +                   &
            0.9412319663856085d0*Log(x)**2 -                                    &
            0.22267108120089213d0*Log(x)**3 +                                   &
            0.03214175298305801d0*Log(x)**4 -                                   &
            0.058811986164696066d0*Log(x)**5 +                                  &
            0.012570655227583586d0*Log(x)**6 +                                  &
            0.006398340754859623d0*Log(x)**7 -                                  &
            0.0007783759792325129d0*Log(x)**8 -                                 &
            0.0003991954031416535d0*Log(x)**9 -                                 &
            4.407598937946612d-6*Log(x)**10 +                                   &
            0.000010690623101602983d0*Log(x)**11 +                              &
            1.0000125497954906d-6*Log(x)**12)**2 -                              &
        10/((1 + x**(-10))**2*x**11*                                            &
           (1.9407506326007926d0 - 1.321194817029039d0*Log(x) +                 &
             0.9412319663856085d0*Log(x)**2 - 0.22267108120089213d0*Log(x)**3 + &
             0.03214175298305801d0*Log(x)**4 -                                  &
             0.058811986164696066d0*Log(x)**5 +                                 &
             0.012570655227583586d0*Log(x)**6 +                                 &
             0.006398340754859623d0*Log(x)**7 -                                 &
             0.0007783759792325129d0*Log(x)**8 -                                &
             0.0003991954031416535d0*Log(x)**9 -                                &
             4.407598937946612d-6*Log(x)**10 +                                  &
             0.000010690623101602983d0*Log(x)**11 +                             &
             1.0000125497954906d-6*Log(x)**12))))/                              &
    ((0.514469336450356d0 + 0.3127303503976901d0*Log(x) -                       &
         0.03623263961611995d0*Log(x)**2 - 0.05577135207592574d0*Log(x)**3 +    &
         0.009929708266205792d0*Log(x)**4 + 0.010079436222188294d0*Log(x)**5 -  &
         0.0010322999160157895d0*Log(x)**6 -                                    &
         0.001111993411576118d0*Log(x)**7 +                                     &
         0.000018750791958437545d0*Log(x)**8 +                                  &
         0.00006409989438440689d0*Log(x)**9 +                                   &
         3.324669759307337d-6*Log(x)**10 -                                      &
         1.4756877300628199d-6*Log(x)**11 - 1.520024161461801d-7*Log(x)**12     &
)/(1 + x**(-10)) + (1 - 1/(1 + x**(-10)))/                                      &
       (1.9407506326007926d0 - 1.321194817029039d0*Log(x) +                     &
         0.9412319663856085d0*Log(x)**2 - 0.22267108120089213d0*Log(x)**3 +     &
         0.03214175298305801d0*Log(x)**4 - 0.058811986164696066d0*Log(x)**5 +   &
         0.012570655227583586d0*Log(x)**6 + 0.006398340754859623d0*Log(x)**7 -  &
         0.0007783759792325129d0*Log(x)**8 - 0.0003991954031416535d0*Log(x)**9 - &
         4.407598937946612d-6*Log(x)**10 +                                      &
         0.000010690623101602983d0*Log(x)**11 +                                 &
         1.0000125497954906d-6*Log(x)**12)))

end

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

function g3A_T0_fun(k)         !ghost anomalous dimension for YM at vacuum
  implicit none

  real(8) k,kGeV
  real(8) g3A_T0_fun
  real(8) pi,hc
  parameter(pi=3.1415926)
  parameter(hc=197.33)

  kGeV=k*hc*1.e-3 !GeV

  if(kGeV<1.d-5)then
    kGeV=1.d-5
  else if(kGeV>20.d0)then
    kGeV=20.d0
  end if

  g3A_T0_fun=1.4301941682969/(1 + (0.007574889082066456*(-20. + kGeV))/         &
    (1 + (0.03161243554102817*(-19.965979664292 + kGeV))/                       &
      (1 - (1.8253213661902241*(-19.931071498401 + kGeV))/                      &
        (1 - (15.757508597067632*(-19.881817769336003 + kGeV))/                 &
          (1 + (0.7463623536471903*(-19.801933291542 + kGeV))/                  &
            (1 + (1.7917078489247664*(-19.695537576440998 + kGeV))/             &
              (1 - (19.412116577211872*(-19.561552015605002 + kGeV))/           &
                (1 + (18.590744870711877*(-19.374198426422 + kGeV))/            &
                  (1 - (0.9018540649916331*(-19.152222003705 + kGeV))/          &
                    (1 - (0.5914242823685079*(-18.837357073593 + kGeV))/        &
                      (1 + (0.11472904062984154*(-18.39985662245 + kGeV))/      &
                        (1 - (3.360759575156113*(-17.692237735048998 + kGeV))/  &
                          (1 + (3.0501493201325554*(-16.533923742981 + kGeV))/  &
                          (1 - (0.07381396053066633*(-15.102905307695 +         &
                          kGeV))/(1 - (0.29874284865313366*                     &
                          (-12.699288225794 + kGeV))/(1 +                       &
                          (0.06766186239336484*(-9.846082930809601 + kGeV))/    &
                          (1 + (0.07939850104699399*(-7.429531502752701 +       &
                          kGeV))/(1 - (0.0683996003633171*(-5.560718954614 +    &
                          kGeV))/(1 - (0.12682971332295845*(                    &
                          -4.1363303001109 + kGeV))/(1 - (2.9430720403093016*   &
                          (-3.1216390531213003 + kGeV))/(1 +                    &
                          (3.270333591324713*(-2.3612679334619 + kGeV))/(1 -    &
                          (0.10231990011181942*(-1.8316181029058 + kGeV))/      &
                          (1 - (0.5831682017324378*(-1.4563494056145 + kGeV))/  &
                          (1 + (1.20677177683038*(-1.1962907700855998 +         &
                          kGeV))/(1 - (0.7033515018209979*(                     &
                          -0.98429015040965 + kGeV))/(1 + (0.7773389858154518*  &
                          (-0.80791164395972 + kGeV))/(1 - (                    &
                          1.6145629077667243*(-0.64676390724292 + kGeV))/(1 -   &
                          (2.4145115492411136*(-0.50284141061018 + kGeV))/      &
                          (1 + (37.140484400128834*(-0.39948780894114 +         &
                          kGeV))/(1 - (27.946691025255884*(                     &
                          -0.36067903075386 + kGeV))/(1 - (0.8638631108540914*  &
                          (-0.26981727337862 + kGeV))/(1 - (                    &
                          1.6693280866917566*(-0.14766742681975 + kGeV))/(1 -   &
                          (0.17291290499659998*(-0.024768705418980002 +         &
                          kGeV))/(1 + (39.804705721941524*(                     &
                          -0.0031442165673692003 + kGeV))/(1 + (                &
                          109.18588689920564*(-0.00033834252074887 + kGeV))/    &
                          (1 + (1681.9415732706054*(-0.000039570151618155 +     &
                          kGeV))/(1 + 3811.7690369916145*(                      &
                          -0.000015603983308123 +                               &
                          kGeV))))))))))))))))))))))))))))))))))))))

end
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

function etaAYM_T_fun(T,k)         !gluon anomalous dimension for unquenched QCD at vacuum
  implicit none

  real(8) k
  real(8) a0,a1,a2,a3,a4,bT,cT,LA,CC,alpha,q,TGeV,aT
  real(8) etaAYM_T_fun
  real(8) pi,hc
  real(8) T
  parameter(pi=3.1415926)
  parameter(hc=197.33)




  a0=2.8368807863522187d0
  a1=0.3357844365021648d0
  a2=2.0618124930602604d0
  a3=0.2d0
!  a3=0.27d0
  a4=0.04d0

  bT=2.240069170414936d0
  cT=1.0238292301925451d0

  LA=1.2

  CC=13.471446715357022d0
  alpha=0.145



  q=k*hc*1.d-3 !GeV
  TGeV=T*hc*1.d-3 !GeV

!  aT=a0*exp((TGeV/a1)**a2)
  aT=a0*(1 + (-1 + exp((TGeV/a1)**a2))/(1 + exp(-(-a3 + TGeV)/a4)))
!  aT=a0

  etaAYM_T_fun=(q*((-4*LA**2*q**3*(CC/(aT*LA**2 + q**2))**bT)/(LA**2 + q**2)**3 + &
      (2*LA**2*q*(CC/(aT*LA**2 + q**2))**bT)/(LA**2 + q**2)**2 -                 &
      (2*bT*CC*LA**2*q**3*(CC/(aT*LA**2 + q**2))**(-1 + bT))/                    &
       ((LA**2 + q**2)**2*(aT*LA**2 + q**2)**2) -                                &
      (26*2**0.18181818181818182d0*alpha*(1 - exp(-4.*q**2))*                    &
         (Pi/11.)**0.5909090909090909d0*q*(q**2/(LA**2 + q**2))**cT)/            &
       (11.*LA**2*(1 + q**2/LA**2)*                                              &
         (alpha*Log(1 + q**2/LA**2))**1.5909090909090908d0) +                    &
      (8.654753112312644d0*q*(q**2/(LA**2 + q**2))**cT)/                         &
       (exp(4.*q**2)*(alpha*Log(1 + q**2/LA**2))**0.5909090909090909d0) +        &
      (2*2**0.18181818181818182d0*cT*(1 - exp(-4.*q**2))*                        &
         (Pi/11.)**0.5909090909090909d0*(q**2/(LA**2 + q**2))**(-1 + cT)*        &
         ((-2*q**3)/(LA**2 + q**2)**2 + (2*q)/(LA**2 + q**2)))/                  &
       (alpha*Log(1 + q**2/LA**2))**0.5909090909090909d0))/                      &
  ((LA**2*q**2*(CC/(aT*LA**2 + q**2))**bT)/(LA**2 + q**2)**2 +                   &
    (2*2**0.18181818181818182d0*(1 - exp(-4.*q**2))*                             &
       (Pi/11.)**0.5909090909090909d0*(q**2/(LA**2 + q**2))**cT)/                &
     (alpha*Log(1 + q**2/LA**2))**0.5909090909090909d0)

end

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

function etaAmass_fun(k)         !gluon anomalous dimension for YM
  implicit none

  real(8) k,kMeV
  real(8) etaAmass_fun
  real(8) pi,hc
  parameter(pi=3.1415926)
  parameter(hc=197.33)


  kMeV=k*hc !MeV

  if(kMeV>20.d3)then
    kMeV=20.d3
  end if

  if(kMeV<388.4788439177958d0)then
    etaAmass_fun=-4.029608669360847d-7 + 2.2324290030608884d-6*kMeV -           &
  4.2371942508246794d-7*kMeV**2 + 2.6779730366394013d-8*kMeV**3 -               &
  8.190252529904835d-10*kMeV**4 + 1.425823411922083d-11*kMeV**5 -               &
  1.5400033658506283d-13*kMeV**6 + 1.063862257591779d-15*kMeV**7 -              &
  4.843670510278515d-18*kMeV**8 + 1.4475884134746943d-20*kMeV**9 -              &
  2.729800316756703d-23*kMeV**10 + 2.9410586776235836d-26*kMeV**11 -            &
  1.3770289320616755d-29*kMeV**12
  else
    if(kMeV<997.774287852435d0)then
      etaAmass_fun=-1086.7247959895412d0 + 20.762871740760094d0*kMeV -          &
  0.17873196404200065d0*kMeV**2 + 0.0009177376874115285d0*kMeV**3 -             &
  3.13361737411496d-6*kMeV**4 + 7.501050917847856d-9*kMeV**5 -                  &
  1.2915197512965856d-11*kMeV**6 + 1.6124900022594103d-14*kMeV**7 -             &
  1.449575770301952d-17*kMeV**8 + 9.15460263971702d-21*kMeV**9 -                &
  3.85699655811501d-24*kMeV**10 + 9.738035830303228d-28*kMeV**11 -              &
  1.1147055252595669d-31*kMeV**12
    else
      if(kMeV<2185.049589750526d0)then
        etaAmass_fun=252.32261701093452d0 - 1.773030345534716d0*kMeV            &
         + 0.005612453723006424d0*kMeV**2 -                                     &
  0.000010683523189719544d0*kMeV**3 + 1.3663307000468649d-8*kMeV**4 -           &
  1.238223070628457d-11*kMeV**5 + 8.156078495034618d-15*kMeV**6 -               &
  3.9344314114635426d-18*kMeV**7 + 1.3792733126206985d-21*kMeV**8 -             &
  3.426068958585556d-25*kMeV**9 + 5.722370926627943d-29*kMeV**10 -              &
  5.768947200542173d-33*kMeV**11 + 2.65416533081593d-37*kMeV**12
      else
        etaAmass_fun=-1.287949014533037d0 + 0.0018234858064253442d0*kMeV -      &
  1.2323169138183733d-6*kMeV**2 + 4.873948956623224d-10*kMeV**3 -               &
  1.2477877940147307d-13*kMeV**4 + 2.1777089074324704d-17*kMeV**5 -             &
  2.6613010120879722d-21*kMeV**6 + 2.3002027229192606d-25*kMeV**7 -             &
  1.3992481202394527d-29*kMeV**8 + 5.857906998153624d-34*kMeV**9 -              &
  1.6061034234406415d-38*kMeV**10 + 2.5955090249500165d-43*kMeV**11 -           &
  1.8736763018355028d-48*kMeV**12
      end if
    end if
  end if

end
