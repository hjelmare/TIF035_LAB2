import pickle
import matplotlib.pyplot as plt
point_names = ['W', 'L', '\Gamma', 'X', 'W', 'K']
x, X, e_kn = pickle.load(open('eigenvalues_mol_1Al.pckl'))
e_kn -= e_kn[:, :8].max()
emin = e_kn.min() - 1
emax = 1
plt.figure(figsize=(6, 4))
for n in range(8):
  plt.plot(x, e_kn[:, n])
for p in X:
  plt.plot([p, p], [emin, emax], 'k-')

plt.xticks(X, ['$%s$' % n for n in point_names])
plt.axis(min=0, xmax=X[-1], ymin=emin, ymax=emax)
plt.xlabel('k-vector')
plt.ylabel('Energy (eV)')
plt.title('PBE bandstructure of $Mg_{0.75}Al_{0.25}S$')
plt.savefig('bandStructure_MgAlS.png')
plt.axis(min=0,xmax=X[-1], ymin=-0.09, ymax=0.005)
plt.savefig('bandStructure_MgAlS_top.png')
plt.axis(min=0,xmax=X[-1], ymin=-33.22,  ymax=-33.185)
plt.savefig('bandStructure_MgAlS_bot.png')

plt.show()


