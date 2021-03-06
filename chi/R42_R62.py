#!/usr/bin/env python
# -*- coding: utf-8 -*-
# sphinx_gallery_thumbnail_number = 3

import matplotlib.pyplot as plt
import numpy as np
from matplotlib.ticker import NullFormatter  # useful for `logit` scale
import matplotlib.ticker as ticker
import matplotlib as mpl

mpl.style.use('classic')

# Data for plotting
T=np.loadtxt('data/TMeV.dat')
chi2=np.loadtxt('data/chi2.dat')
chi4=np.loadtxt('data/chi4.dat')
chi6=np.loadtxt('data/chi6.dat')
chi2_250=np.loadtxt('data/chi2_250.dat')
chi4_250=np.loadtxt('data/chi4_250.dat')
chi6_250=np.loadtxt('data/chi6_250.dat')
chi2_250052=np.loadtxt('data/chi2_250052.dat')
chi4_250052=np.loadtxt('data/chi4_250052.dat')
chi6_250052=np.loadtxt('data/chi6_250052.dat')
chi2_250062=np.loadtxt('data/chi2_250062.dat')
chi4_250062=np.loadtxt('data/chi4_250062.dat')
chi6_250062=np.loadtxt('data/chi6_250062.dat')
chi2e=np.loadtxt('data/chi2e.dat')
chi4e=np.loadtxt('data/chi4e.dat')
chi6e=np.loadtxt('data/chi6e.dat')
chi2_225062=np.loadtxt('data/chi2225062.dat')
chi4_225062=np.loadtxt('data/chi4225062.dat')
chi6_225062=np.loadtxt('data/chi6225062.dat')
hotQCDR42=np.loadtxt('data/hotQCD_R42.dat')
WBR42=np.loadtxt('data/WB_R42.dat')
hotQCDR62=np.loadtxt('data/hotQCD_R62.dat')
hotQCDb=np.loadtxt('data/hotQCDR62_b.dat')
hotQCDg=np.loadtxt('data/hotQCDR62_g.dat')

R42=chi4/chi2
R62=chi6/chi2
R42_250=chi4_250/chi2_250
R62_250=chi6_250/chi2_250
R42_250052=chi4_250052/chi2_250052
R62_250052=chi6_250052/chi2_250052
R42_250062=chi4_250062/chi2_250062
R62_250062=chi6_250062/chi2_250062
R42_225062=chi4_225062/chi2_225062
R62_225062=chi6_225062/chi2_225062
R42e=chi4e/chi2e
R62e=chi6e/chi2e
#T1=T/177
# Create figure
fig=plt.figure(figsize=(9., 3.5))
#fig=plt.figure()
ax1=fig.add_subplot(121)

ax1.plot(T,R42,'k-',linewidth=2,markersize=5,label=r'$FRG,Tc=225,\alpha=0.57$')
ax1.plot(T,R42_250,'c--',linewidth=2,markersize=5,label=r'$FRG,Tc=250,\alpha=0.57$')
ax1.plot(T,R42_250052,'g--',linewidth=2,markersize=5,label=r'$FRG,Tc=250,\alpha=0.52$')
ax1.plot(T,R42_250062,'k--',linewidth=2,markersize=5,label=r'$FRG,Tc=250,\alpha=0.62$')
ax1.plot(T,R42_225062,'y-',linewidth=2,markersize=5,label=r'$FRG,Tc=225,\alpha=0.62$')
ax1.plot(T,R42e,'m-',linewidth=2,markersize=5,label=r'$FRG,poly$')
ax1.fill_between(hotQCDR42[:,0],hotQCDR42[:,1]+hotQCDR42[:,2],hotQCDR42[:,1]-hotQCDR42[:,2],alpha=0.25,facecolor='green',edgecolor='',label=r'HotQCD')
ax1.errorbar(WBR42[:,0],WBR42[:,1],yerr=WBR42[:,2],color='blue',marker='o',linestyle='',linewidth=2,markersize=5,fillstyle='none',alpha=1,label=r'Wuppertal-Budaspest')
ax1.axis([100,200,-0.6,1.2])

ax1.set_xlabel('$T [\mathrm{MeV}]$', fontsize=14, color='black')
ax1.set_ylabel('$\chi^B_4/\chi^B_2$', fontsize=14, color='black')

ax1.legend(loc=0,fontsize='x-small',frameon=True,shadow=True,handlelength=3.,borderpad=0.5,borderaxespad=1,numpoints=1)

for label in ax1.xaxis.get_ticklabels():
    label.set_fontsize(10)
for label in ax1.yaxis.get_ticklabels():
    label.set_fontsize(10)

ax2=fig.add_subplot(122)

ax2.plot(T,R62,'k-',linewidth=2,markersize=5,label=r'$FRG,Tc=225$')
ax2.plot(T,R62_250,'c-',linewidth=2,markersize=5,label=r'$FRG,Tc=250$')
ax2.fill_between(hotQCDR62[:,0],hotQCDR62[:,1],hotQCDR62[:,2],alpha=0.4,facecolor='gray',edgecolor='',label=r'HotQCD cont. est')
ax2.errorbar(hotQCDb[:,0],hotQCDb[:,1],yerr=hotQCDb[:,2],color='blue',marker='s',linestyle='',linewidth=2,markersize=5,alpha=1,label=r'$N_\tau=8$')
ax2.errorbar(hotQCDg[:,0],hotQCDg[:,1],yerr=hotQCDg[:,2],color='green',marker='^',linestyle='',linewidth=2,markersize=5,alpha=1,label=r'$N_\tau=6$')
ax2.axis([100,200,-2,3.5])
#ax1.set_xscale('log')
#ax2.text(110, 0.025, r'$\mu_S=\mu_Q=0$',fontsize=14, color='k')

ax2.set_xlabel('$T [\mathrm{MeV}]$', fontsize=14, color='black')
ax2.set_ylabel('$\chi^B_6/\chi^B_2$', fontsize=14, color='black')

ax2.legend(loc=1,fontsize='x-small',frameon=True,shadow=True,handlelength=3.,borderpad=0.5,borderaxespad=1,numpoints=1)


for label in ax2.xaxis.get_ticklabels():
    label.set_fontsize(10)
for label in ax2.yaxis.get_ticklabels():
    label.set_fontsize(10)

fig.subplots_adjust(top=0.9, bottom=0.17, left=0.10, right=0.95, hspace=0.35,
                    wspace=0.35)

fig.savefig("R42R62.pdf")
