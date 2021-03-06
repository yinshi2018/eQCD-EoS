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
chi2_250057=np.loadtxt('data/chi2_250.dat')
chi4_250057=np.loadtxt('data/chi4_250.dat')
chi6_250057=np.loadtxt('data/chi6_250.dat')
chi2_2p1=np.loadtxt('2p1EQCD_250057/chi2.dat')
chi4_2p1=np.loadtxt('2p1EQCD_250057/chi4.dat')
chi6_2p1=np.loadtxt('2p1EQCD_250057/chi6.dat')
chi2_2p1270=np.loadtxt('2p1EQCD_270057/chi2.dat')
chi4_2p1270=np.loadtxt('2p1EQCD_270057/chi4.dat')
chi6_2p1270=np.loadtxt('2p1EQCD_270057/chi6.dat')
chi2Z=np.loadtxt('Z250057/chi2.dat')
chi4Z=np.loadtxt('Z250057/chi4.dat')
chi6Z=np.loadtxt('Z250057/chi6.dat')
chi2Zn=np.loadtxt('Z250057n/chi2.dat')
chi4Zn=np.loadtxt('Z250057n/chi4.dat')
chi6Zn=np.loadtxt('Z250057n/chi6.dat')
hotQCDR42=np.loadtxt('data/hotQCD_R42.dat')
WBT=np.loadtxt('../data1/WB_chix.dat')
WBR42=np.loadtxt('../data1/WB_R42.dat')
WBchi2=np.loadtxt('../data1/WB_chi2.dat')
WBchi6=np.loadtxt('../data1/WB_chi6.dat')
WBchi6err=np.loadtxt('../data1/WB_chi6erro.dat')
WBR62=WBchi6/WBchi2
hotQCDR62=np.loadtxt('data/hotQCD_R62.dat')
hotQCDb=np.loadtxt('data/hotQCDR62_b.dat')
hotQCDg=np.loadtxt('data/hotQCDR62_g.dat')

R42_2p1=chi4_2p1/chi2_2p1
R62_2p1=chi6_2p1/chi2_2p1
R42_2p1270=chi4_2p1270/chi2_2p1270
R62_2p1270=chi6_2p1270/chi2_2p1270
R42_250057=chi4_250057/chi2_250057
R62_250057=chi6_250057/chi2_250057
R42Z=chi4Zn/chi2Zn
R62Z=chi6Zn/chi2Zn
#T1=T/177
# Create figure
fig=plt.figure(figsize=(9., 3.5))
#fig=plt.figure()
ax1=fig.add_subplot(121)

#ax1.plot(T,R42_250057,'k-',linewidth=2,markersize=5,label=r'$FRG,Tc=250,\alpha=0.57$')
ax1.plot(T,R42Z,'r-',linewidth=2,markersize=5,label=r'$FRG,Tc=250,\alpha=0.57$')
ax1.plot(T,R42_2p1,'m-',linewidth=2,markersize=5,label=r'$FRG2p1,Tc=250,\alpha=0.57$')
ax1.plot(T,R42_2p1270,'k-',linewidth=2,markersize=5,label=r'$FRG2p1,Tc=250,\alpha=0.57$')
ax1.fill_between(hotQCDR42[:,0],hotQCDR42[:,1]+hotQCDR42[:,2],hotQCDR42[:,1]-hotQCDR42[:,2],alpha=0.25,facecolor='green',edgecolor='',label=r'HotQCD')
ax1.errorbar(WBR42[:,0],WBR42[:,1],yerr=WBR42[:,2],color='blue',marker='o',linestyle='',linewidth=2,markersize=5,fillstyle='none',alpha=1,label=r'Wuppertal-Budaspest')
ax1.axis([100,200,-0.1,1.2])

ax1.set_xlabel('$T [\mathrm{MeV}]$', fontsize=14, color='black')
ax1.set_ylabel('$\chi^B_4/\chi^B_2$', fontsize=14, color='black')

ax1.legend(loc=0,fontsize='x-small',frameon=True,shadow=True,handlelength=3.,borderpad=0.5,borderaxespad=1,numpoints=1)

for label in ax1.xaxis.get_ticklabels():
    label.set_fontsize(10)
for label in ax1.yaxis.get_ticklabels():
    label.set_fontsize(10)

ax2=fig.add_subplot(122)

#ax2.plot(T,R62_250057,'k-',linewidth=2,markersize=5,label=r'$FRG$')
ax2.plot(T,R62Z,'r-',linewidth=2,markersize=5,label=r'$FRG$')
ax2.plot(T,R62_2p1,'m-',linewidth=2,markersize=5,label=r'$FRG,2p1$')
ax2.plot(T,R62_2p1270,'k-',linewidth=2,markersize=5)
ax2.fill_between(hotQCDR62[:,0],hotQCDR62[:,1],hotQCDR62[:,2],alpha=0.4,facecolor='gray',edgecolor='',label=r'HotQCD cont. est')
ax2.errorbar(WBT,WBR62,yerr=WBchi6err/WBchi2,color='blue',marker='o',linestyle='',linewidth=2,markersize=5,fillstyle='none',alpha=1,label=r'Wuppertal-Budaspest')
#ax2.errorbar(hotQCDb[:,0],hotQCDb[:,1],yerr=hotQCDb[:,2],color='blue',marker='s',linestyle='',linewidth=2,markersize=5,alpha=1,label=r'$N_\tau=8$')
#ax2.errorbar(hotQCDg[:,0],hotQCDg[:,1],yerr=hotQCDg[:,2],color='green',marker='^',linestyle='',linewidth=2,markersize=5,alpha=1,label=r'$N_\tau=6$')
ax2.axis([100,220,-2,3.5])
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
