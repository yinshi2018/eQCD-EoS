subroutine Fnb(x,T,nb)
  !boson Distribution function
  implicit none

  real(16) x, T
  real(16) nb
  real(16) over

  over=x/T
  if(over>60.Q+0)then
    nb=0.Q+0
  else if(over<1.Q-9)then
    nb=1.Q+0/over
  else
    nb=1.Q+0/(exp(over)-1.Q+0)
  end if
end

subroutine Fnf012(x,T,l,lb,nf0,nf1,nf2)
  !fermion Distribution function

  implicit none

  real(16) x,T,l,lb
  real(16) nf0,nf1,nf2
  real(16) over

  over=x/T
  if(over > 60.Q+0)then
    nf0=0.Q+0
    nf1=0.Q+0
    nf2=0.Q+0
  else
    nf0=1.Q+0/(1.Q+0+3.Q+0*lb*exp(x/T)+3.Q+0*l*exp(2.Q+0*x/T)+exp(3.Q+0*x/T))
    nf1=(2*exp(x/T))/(1.Q+0+3.Q+0*lb*exp(x/T)+3.Q+0*l*exp(2.Q+0*x/T)+exp(3.Q+0*x/T))
    nf2=(exp(2.Q+0*x/T))/(1.Q+0+3.Q+0*lb*exp(x/T)+3.Q+0*l*exp(2.Q+0*x/T)+exp(3.Q+0*x/T))
  end if
end

function etaA_unqQCD_T0_fun(k)
  !gluon anomalous Dimension for unquencheD QCD at vacuum
  implicit none

  real(16) k,x
  real(16) etaA_unqQCD_T0_fun
  real(16) pi,hc
  parameter(pi=3.141592653589793238462643383279Q+0)
  parameter(hc=197.33Q+0)


  x=k*hc*1.Q-3 !GeV

  etaA_unqQCD_T0_fun=(x*((-65.62755837247998Q+0*x**3*(1/(0.6297755306057824Q+0 + x**2))** &
          1.0010352178943276Q+0)/(1.9599999999999997Q+0 + x**2)**3 +                  &
      (32.81377918623999Q+0*x*(1/(0.6297755306057824Q+0 + x**2))**                    &
          1.0010352178943276Q+0)/(1.9599999999999997Q+0 + x**2)**2 -                  &
      (32.8477485976341Q+0*x**3*(1/(0.6297755306057824Q+0 + x**2))**                  &
          2.0010352178943274Q+0)/(1.9599999999999997Q+0 + x**2)**2 -                  &
      (1.7296886276050616Q+0*(1 - exp(-4.*x**2))*x*                                &
         (x**2/(1.9599999999999997Q+0 + x**2))**0.7241215270425517Q+0)/               &
       ((1 + 0.5102040816326532Q+0*x**2)*                                          &
         Log(1 + 0.5102040816326532Q+0*x**2)**1.5344827586206897Q+0) +                &
      (25.37174234659914Q+0*x*(x**2/(1.9599999999999997Q+0 + x**2))**                 &
          0.7241215270425517Q+0)/                                                  &
       (exp(4.Q+0*x**2)*Log(1 + 0.5102040816326532*x**2)**0.5344827586206896Q+0)      &
+ (2.2965281014686934Q+0*(1 - exp(-4.*x**2))*                                      &
         ((-2*x**3)/(1.9599999999999997Q+0 + x**2)**2 +                            &
           (2*x)/(1.9599999999999997Q+0 + x**2)))/                                 &
       ((x**2/(1.9599999999999997Q+0 + x**2))**0.2758784729574483Q+0*                 &
         Log(1 + 0.5102040816326532Q+0*x**2)**0.5344827586206896Q+0)))/               &
  ((16.406889593119995Q+0*x**2*(1/(0.6297755306057824Q+0 + x**2))**                   &
        1.0010352178943276Q+0)/(1.9599999999999997Q+0 + x**2)**2 +                    &
    (3.1714677933248927Q+0*(1 - exp(-4.Q+0*x**2))*                                    &
       (x**2/(1.9599999999999997Q+0 + x**2))**0.7241215270425517Q+0)/                 &
     Log(1 + 0.5102040816326532Q+0*x**2)**0.5344827586206896Q+0)                      


end

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

function etac_YM_T0_fun(k)
  !ghost anomalous Dimension for YM at vacuum
  implicit none

  real(16) k,x
  real(16) etac_YM_T0_fun
  real(16) pi,hc
  parameter(pi=3.141592653589793238462643383279Q+0)
  parameter(hc=197.33Q+0)

  x=k*hc*1.Q-3 !GeV

  if(x<5.Q-3)then
    x=5.Q-3
  else if(x>36.Q+0)then
    x=36.Q+0
  end if

  etac_YM_T0_fun=-((x*((0.3127303503976901Q+0/x - (0.0724652792322399Q+0*Log(x))/x -       &
           (0.16731405622777723Q+0*Log(x)**2)/x +                                &
           (0.03971883306482317Q+0*Log(x)**3)/x +                                &
           (0.05039718111094147Q+0*Log(x)**4)/x -                                &
           (0.006193799496094736Q+0*Log(x)**5)/x -                               &
           (0.007783953881032825Q+0*Log(x)**6)/x +                               &
           (0.00015000633566750036Q+0*Log(x)**7)/x +                             &
           (0.000576899049459662Q+0*Log(x)**8)/x +                               &
           (0.00003324669759307337Q+0*Log(x)**9)/x -                             &
           (0.000016232565030691018Q+0*Log(x)**10)/x -                           &
           (1.8240289937541614D-6*Log(x)**11)/x)/(1 + x**(-10)) +               &
        (10*(0.514469336450356Q+0 + 0.3127303503976901Q+0*Log(x) -                &
             0.03623263961611995Q+0*Log(x)**2 -                                  &
             0.05577135207592574Q+0*Log(x)**3 +                                  &
             0.009929708266205792Q+0*Log(x)**4 +                                 &
             0.010079436222188294Q+0*Log(x)**5 -                                 &
             0.0010322999160157895Q+0*Log(x)**6 -                                &
             0.001111993411576118Q+0*Log(x)**7 +                                 &
             0.000018750791958437545Q+0*Log(x)**8 +                              &
             0.00006409989438440689Q+0*Log(x)**9 +                               &
             3.324669759307337D-6*Log(x)**10 -                                  &
             1.4756877300628199D-6*Log(x)**11 -                                 &
             1.520024161461801D-7*Log(x)**12))/((1 + x**(-10))**2*x**11) -      &
        ((1 - 1/(1 + x**(-10)))*                                                &
           (-1.321194817029039Q+0/x + (1.882463932771217Q+0*Log(x))/x -           &
             (0.6680132436026764Q+0*Log(x)**2)/x +                               &
             (0.12856701193223205Q+0*Log(x)**3)/x -                              &
             (0.2940599308234803Q+0*Log(x)**4)/x +                               &
             (0.07542393136550152Q+0*Log(x)**5)/x +                              &
             (0.044788385284017365Q+0*Log(x)**6)/x -                             &
             (0.006227007833860103Q+0*Log(x)**7)/x -                             &
             (0.0035927586282748815Q+0*Log(x)**8)/x -                            &
             (0.00004407598937946612Q+0*Log(x)**9)/x +                           &
             (0.00011759685411763281Q+0*Log(x)**10)/x +                          &
             (0.000012000150597545888Q+0*Log(x)**11)/x))/                        &
         (1.9407506326007926Q+0 - 1.321194817029039Q+0*Log(x) +                   &
            0.9412319663856085Q+0*Log(x)**2 -                                    &
            0.22267108120089213Q+0*Log(x)**3 +                                   &
            0.03214175298305801Q+0*Log(x)**4 -                                   &
            0.058811986164696066Q+0*Log(x)**5 +                                  &
            0.012570655227583586Q+0*Log(x)**6 +                                  &
            0.006398340754859623Q+0*Log(x)**7 -                                  &
            0.0007783759792325129Q+0*Log(x)**8 -                                 &
            0.0003991954031416535Q+0*Log(x)**9 -                                 &
            4.407598937946612D-6*Log(x)**10 +                                   &
            0.000010690623101602983Q+0*Log(x)**11 +                              &
            1.0000125497954906D-6*Log(x)**12)**2 -                              &
        10/((1 + x**(-10))**2*x**11*                                            &
           (1.9407506326007926Q+0 - 1.321194817029039Q+0*Log(x) +                 &
             0.9412319663856085Q+0*Log(x)**2 - 0.22267108120089213Q+0*Log(x)**3 + &
             0.03214175298305801Q+0*Log(x)**4 -                                  &
             0.058811986164696066Q+0*Log(x)**5 +                                 &
             0.012570655227583586Q+0*Log(x)**6 +                                 &
             0.006398340754859623Q+0*Log(x)**7 -                                 &
             0.0007783759792325129Q+0*Log(x)**8 -                                &
             0.0003991954031416535Q+0*Log(x)**9 -                                &
             4.407598937946612D-6*Log(x)**10 +                                  &
             0.000010690623101602983Q+0*Log(x)**11 +                             &
             1.0000125497954906D-6*Log(x)**12))))/                              &
    ((0.514469336450356Q+0 + 0.3127303503976901Q+0*Log(x) -                       &
         0.03623263961611995Q+0*Log(x)**2 - 0.05577135207592574Q+0*Log(x)**3 +    &
         0.009929708266205792Q+0*Log(x)**4 + 0.010079436222188294Q+0*Log(x)**5 -  &
         0.0010322999160157895Q+0*Log(x)**6 -                                    &
         0.001111993411576118Q+0*Log(x)**7 +                                     &
         0.000018750791958437545Q+0*Log(x)**8 +                                  &
         0.00006409989438440689Q+0*Log(x)**9 +                                   &
         3.324669759307337D-6*Log(x)**10 -                                      &
         1.4756877300628199D-6*Log(x)**11 - 1.520024161461801D-7*Log(x)**12     &
)/(1 + x**(-10)) + (1 - 1/(1 + x**(-10)))/                                      &
       (1.9407506326007926Q+0 - 1.321194817029039Q+0*Log(x) +                     &
         0.9412319663856085Q+0*Log(x)**2 - 0.22267108120089213Q+0*Log(x)**3 +     &
         0.03214175298305801Q+0*Log(x)**4 - 0.058811986164696066Q+0*Log(x)**5 +   &
         0.012570655227583586Q+0*Log(x)**6 + 0.006398340754859623Q+0*Log(x)**7 -  &
         0.0007783759792325129Q+0*Log(x)**8 - 0.0003991954031416535Q+0*Log(x)**9 - &
         4.407598937946612D-6*Log(x)**10 +                                      &
         0.000010690623101602983Q+0*Log(x)**11 +                                 &
         1.0000125497954906D-6*Log(x)**12)))

end

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

function g3A_T0_fun(k)         !ghost anomalous Dimension for YM at vacuum
  implicit none

  real(16) k,kGeV
  real(16) g3A_T0_fun
  real(16) pi,hc
  parameter(pi=3.141592653589793238462643383279Q+0)
  parameter(hc=197.33Q+0)

  kGeV=k*hc*1.Q-3 !GeV

  if(kGeV<1.Q-5)then
    kGeV=1.Q-5
  else if(kGeV>20.Q+0)then
    kGeV=20.Q+0
  end if

  g3A_T0_fun=1.4301941682969Q+0/(1 + (0.007574889082066456Q+0*(-20.Q+0+ kGeV))/         &
    (1 + (0.03161243554102817Q+0*(-19.965979664292Q+0 + kGeV))/                       &
      (1 - (1.8253213661902241Q+0*(-19.931071498401Q+0 + kGeV))/                      &
        (1 - (15.757508597067632Q+0*(-19.881817769336003Q+0 + kGeV))/                 &
          (1 + (0.7463623536471903Q+0*(-19.801933291542Q+0 + kGeV))/                  &
            (1 + (1.7917078489247664Q+0*(-19.695537576440998Q+0 + kGeV))/             &
              (1 - (19.412116577211872Q+0*(-19.561552015605002Q+0 + kGeV))/           &
                (1 + (18.590744870711877Q+0*(-19.374198426422Q+0 + kGeV))/            &
                  (1 - (0.9018540649916331Q+0*(-19.152222003705Q+0 + kGeV))/          &
                    (1 - (0.5914242823685079Q+0*(-18.837357073593Q+0 + kGeV))/        &
                      (1 + (0.11472904062984154Q+0*(-18.39985662245Q+0 + kGeV))/      &
                        (1 - (3.360759575156113Q+0*(-17.692237735048998Q+0 + kGeV))/  &
                          (1 + (3.0501493201325554Q+0*(-16.533923742981Q+0 + kGeV))/  &
                          (1 - (0.07381396053066633Q+0*(-15.102905307695Q+0 +         &
                          kGeV))/(1 - (0.29874284865313366Q+0*                     &
                          (-12.699288225794Q+0 + kGeV))/(1 +                       &
                          (0.06766186239336484Q+0*(-9.846082930809601Q+0 + kGeV))/    &
                          (1 + (0.07939850104699399Q+0*(-7.429531502752701Q+0 +       &
                          kGeV))/(1 - (0.0683996003633171Q+0*(-5.560718954614Q+0 +    &
                          kGeV))/(1 - (0.12682971332295845Q+0*(                    &
                          -4.1363303001109Q+0 + kGeV))/(1 - (2.9430720403093016Q+0*   &
                          (-3.1216390531213003Q+0 + kGeV))/(1 +                    &
                          (3.270333591324713Q+0*(-2.3612679334619Q+0 + kGeV))/(1 -    &
                          (0.10231990011181942Q+0*(-1.8316181029058Q+0 + kGeV))/      &
                          (1 - (0.5831682017324378Q+0*(-1.4563494056145Q+0 + kGeV))/  &
                          (1 + (1.20677177683038Q+0*(-1.1962907700855998Q+0 +         &
                          kGeV))/(1 - (0.7033515018209979Q+0*(                     &
                          -0.98429015040965Q+0 + kGeV))/(1 + (0.7773389858154518Q+0*  &
                          (-0.80791164395972Q+0 + kGeV))/(1 - (                    &
                          1.6145629077667243Q+0*(-0.64676390724292Q+0 + kGeV))/(1 -   &
                          (2.4145115492411136Q+0*(-0.50284141061018Q+0 + kGeV))/      &
                          (1 + (37.140484400128834Q+0*(-0.39948780894114Q+0 +         &
                          kGeV))/(1 - (27.946691025255884Q+0*(                     &
                          -0.36067903075386Q+0 + kGeV))/(1 - (0.8638631108540914*  &
                          (-0.26981727337862Q+0 + kGeV))/(1 - (                    &
                          1.6693280866917566Q+0*(-0.14766742681975Q+0 + kGeV))/(1 -   &
                          (0.17291290499659998Q+0*(-0.024768705418980002Q+0 +         &
                          kGeV))/(1 + (39.804705721941524Q+0*(                     &
                          -0.0031442165673692003Q+0 + kGeV))/(1 + (                &
                          109.18588689920564Q+0*(-0.00033834252074887Q+0 + kGeV))/    &
                          (1 + (1681.9415732706054Q+0*(-0.000039570151618155Q+0 +     &
                          kGeV))/(1 + 3811.7690369916145Q+0*(                      &
                          -0.000015603983308123Q+0 +                               &
                          kGeV))))))))))))))))))))))))))))))))))))))

end
